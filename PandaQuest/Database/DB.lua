-- Database/DB.lua: loader and query API for the generated Questie-derived database (docs/06 section 7).
--
-- Loading (DB.Load) runs as an ns.Thread coroutine job so the client keeps rendering:
--   1. loadstring() each ns.Data.* long string into a positional table, then drop the string (~27 MB saved)
--   2. apply ns.Data.factionFixes for the player's faction / class / race
--   3. apply ns.Overrides.wowhead and then ns.Overrides.community (named fields -> positional)
--   4. build the eager reverse indexes (questStarters / questEnders)
--   5. flip ready and send PQ_DB_READY
-- The job is idempotent: a second Load while running or after ready does nothing.
--
-- Reading: rows stay positional in memory. GetQuestField / GetNpcField are the fast path; GetQuest and
-- friends decode a row into the documented named struct and keep it in a WEAK-VALUED cache, so a struct
-- lives only as long as somebody holds it.
--
-- IMPORTANT: the returned structs (and their nested tables, which are shared with the raw database rows)
-- MUST NOT be mutated by callers. Copy first if you need to change anything.
local _, ns = ...

local DB = {}
ns.DB = DB

local L = ns.L
local Schema, Log, Thread = ns.Schema, ns.Log, ns.Thread

local type, pairs, next, tostring, pcall = type, pairs, next, tostring, pcall
local loadstring, setmetatable, _G = loadstring, setmetatable, _G

local EMPTY = {}

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local quests, npcs, objects, items          -- decoded positional tables (id -> row)
local tables = {}                           -- "quests"/"npcs"/... -> the table above, for the fix appliers
local extras = { quests = {}, npcs = {}, objects = {}, items = {} }  -- override fields that are not Schema keys

local ready = false
local loading = false
local loadHandle
local stats = { loadMs = 0, counts = {} }

local questStarters = { npc = {}, object = {}, item = {} }
local questEnders = { npc = {}, object = {} }

local nameIndex = {}                        -- kind -> { [lowercased name] = {id,...} }
local nameIndexJobs = {}                    -- kind -> Thread handle while the index builds

local questCache = setmetatable({}, { __mode = "v" })
local npcCache = setmetatable({}, { __mode = "v" })
local objectCache = setmetatable({}, { __mode = "v" })
local itemCache = setmetatable({}, { __mode = "v" })
local sourceCache = setmetatable({}, { __mode = "v" })
local tagCache = {}                         -- questID -> {tagID, tagName}; small, kept strong

local OVERRIDE_KEYS = {
    quests = Schema.questKeys, npcs = Schema.npcKeys,
    objects = Schema.objectKeys, items = Schema.itemKeys,
}

---------------------------------------------------------------------------
-- Small helpers
---------------------------------------------------------------------------

local function nowMs()
    local Compat = ns.Compat
    return Compat and Compat.NowMs() or 0
end

local function yield()
    if Thread and Thread.Yield then Thread.Yield() end
end

-- Thread.Yield() is cheap but not free (it reads the millisecond clock), and the index passes below walk
-- ~180 000 rows. Yielding every YIELD_EVERY rows keeps the per-frame chunk far under the 8 ms budget
-- while cutting the number of clock reads by three orders of magnitude.
local YIELD_EVERY = 500
local yieldCounter = 0
local function yieldEvery()
    yieldCounter = yieldCounter + 1
    if yieldCounter >= YIELD_EVERY then
        yieldCounter = 0
        yield()
    end
end

local function countEntries(t)
    local n = 0
    for _ in pairs(t or EMPTY) do n = n + 1 end
    return n
end

-- Adds questID to index[sourceID], skipping duplicates. The lists are a handful of entries at most,
-- so a linear scan is cheaper than keeping a second set table around.
local function indexAdd(index, sourceID, questID)
    if type(sourceID) ~= "number" or type(questID) ~= "number" then return end
    local list = index[sourceID]
    if not list then
        index[sourceID] = { questID }
        return
    end
    for i = 1, #list do
        if list[i] == questID then return end
    end
    list[#list + 1] = questID
end

local function indexAddList(index, sourceIDs, questID)
    if type(sourceIDs) ~= "table" then return end
    for i = 1, #sourceIDs do
        indexAdd(index, sourceIDs[i], questID)
    end
end

---------------------------------------------------------------------------
-- Load steps
---------------------------------------------------------------------------

-- Turns one ns.Data.<name> long string into a table and frees the string. Never raises.
local function decodeTable(name)
    local Data = ns.Data
    local src = Data and Data[name]
    if type(src) == "table" then
        return src                          -- already decoded (a hand-written test fixture, for instance)
    end
    if type(src) ~= "string" then
        Log.Error("DB", "ns.Data.%s is missing; PandaQuest has no %s data", name, name)
        return {}
    end
    local chunk, err = loadstring(src, "@PandaQuest-" .. name)
    if not chunk then
        Log.Error("DB", "cannot compile ns.Data.%s: %s", name, tostring(err))
        return {}
    end
    local ok, result = pcall(chunk)
    if not ok or type(result) ~= "table" then
        Log.Error("DB", "cannot decode ns.Data.%s: %s", name, tostring(result))
        return {}
    end
    Data[name] = nil                        -- free the raw string: it is several megabytes
    return result
end

-- Questie ships faction-dependent overrides that are applied at runtime instead of being baked in,
-- because one database serves both factions. ns.Data.factionFixes[faction][table][id] = {[key] = value}.
local function applyFactionFixes()
    local Data = ns.Data
    local fixes = Data and Data.factionFixes
    if type(fixes) ~= "table" then return 0 end

    local faction = "Alliance"
    if UnitFactionGroup then
        local group = UnitFactionGroup("player")
        if group == "Horde" then faction = "Horde" end
    end

    local applied = 0
    local set = fixes[faction]
    if type(set) == "table" then
        for tableName, byId in pairs(set) do
            local target = tables[tableName]
            if type(byId) == "table" and target then
                for id, fields in pairs(byId) do
                    local row = target[id]
                    if row and type(fields) == "table" then
                        for key, value in pairs(fields) do
                            row[key] = value
                            applied = applied + 1
                        end
                    end
                end
                yield()
            end
        end
    end

    -- Conditional fixes additionally depend on the player's class file and race file.
    local classFile = UnitClassBase and UnitClassBase("player") or nil
    local raceFile
    if UnitRace then
        local _, file = UnitRace("player")
        raceFile = file
    end
    local conditional = fixes.conditional
    if type(conditional) == "table" then
        for i = 1, #conditional do
            local cond = conditional[i]
            if cond.faction == faction
                and (cond.class == nil or cond.class == classFile)
                and (cond.race == nil or cond.race == raceFile) then
                local target = tables[cond.table]
                local row = target and target[cond.id]
                if row and cond.key then
                    row[cond.key] = cond.value
                    applied = applied + 1
                end
            end
        end
    end

    Data.factionFixes = nil                 -- applied once; nothing else reads it
    return applied
end

-- Overrides use Schema key NAMES; unknown names are kept aside in `extras` so community payloads can
-- carry extra information (hotspots and the like) without corrupting a positional row.
local function applyOverrides(set, label)
    if type(set) ~= "table" then return 0 end
    local applied = 0
    for tableName, keys in pairs(OVERRIDE_KEYS) do
        local byId = set[tableName]
        local target = tables[tableName]
        if type(byId) == "table" and target then
            for id, fields in pairs(byId) do
                if type(fields) == "table" then
                    local row = target[id]
                    for name, value in pairs(fields) do
                        local index = keys[name]
                        if index then
                            -- A row is only created for an unknown id when there is real schema data
                            -- to put in it: a community guide entry (runs/avgSeconds/hotspots) must
                            -- not conjure an empty, nameless quest into the database.
                            if not row then
                                row = {}
                                target[id] = row
                            end
                            row[index] = value
                            applied = applied + 1
                        else
                            local bucket = extras[tableName][id]
                            if not bucket then
                                bucket = {}
                                extras[tableName][id] = bucket
                            end
                            bucket[name] = value
                            Log.Debug("DB", "%s override %s %s: non-schema field '%s' stored as extra",
                                label, tableName, tostring(id), tostring(name))
                        end
                    end
                end
            end
            yield()
        end
    end
    return applied
end

-- Reverse indexes: "which quests does this npc/object/item start or end?". The generated npc/object/item
-- rows already carry questStarts/questEnds, and the quest rows carry startedBy/finishedBy; the two are
-- merged so a one-sided entry is still found.
local function buildReverseIndexes()
    questStarters = { npc = {}, object = {}, item = {} }
    questEnders = { npc = {}, object = {} }

    local startedByIndex, finishedByIndex = Schema.questKeys.startedBy, Schema.questKeys.finishedBy
    for questID, row in pairs(quests) do
        local startedBy = row[startedByIndex]
        if startedBy then
            indexAddList(questStarters.npc, startedBy[1], questID)
            indexAddList(questStarters.object, startedBy[2], questID)
            indexAddList(questStarters.item, startedBy[3], questID)
        end
        local finishedBy = row[finishedByIndex]
        if finishedBy then
            indexAddList(questEnders.npc, finishedBy[1], questID)
            indexAddList(questEnders.object, finishedBy[2], questID)
        end
        yieldEvery()
    end

    local npcStarts, npcEnds = Schema.npcKeys.questStarts, Schema.npcKeys.questEnds
    for npcID, row in pairs(npcs) do
        local starts = row[npcStarts]
        if starts then
            for i = 1, #starts do indexAdd(questStarters.npc, npcID, starts[i]) end
        end
        local ends = row[npcEnds]
        if ends then
            for i = 1, #ends do indexAdd(questEnders.npc, npcID, ends[i]) end
        end
        yieldEvery()
    end

    local objStarts, objEnds = Schema.objectKeys.questStarts, Schema.objectKeys.questEnds
    for objectID, row in pairs(objects) do
        local starts = row[objStarts]
        if starts then
            for i = 1, #starts do indexAdd(questStarters.object, objectID, starts[i]) end
        end
        local ends = row[objEnds]
        if ends then
            for i = 1, #ends do indexAdd(questEnders.object, objectID, ends[i]) end
        end
        yieldEvery()
    end

    local startQuest = Schema.itemKeys.startQuest
    for itemID, row in pairs(items) do
        local questID = row[startQuest]
        if questID then indexAdd(questStarters.item, itemID, questID) end
        yieldEvery()
    end
end

local function runLoad()
    local startedAt = nowMs()

    quests = decodeTable("quests");  yield()
    npcs = decodeTable("npcs");      yield()
    objects = decodeTable("objects"); yield()
    items = decodeTable("items");    yield()

    tables.quests, tables.npcs, tables.objects, tables.items = quests, npcs, objects, items

    applyFactionFixes(); yield()

    local Overrides = ns.Overrides
    if Overrides then
        applyOverrides(Overrides.wowhead, "wowhead")
        applyOverrides(Overrides.community, "community")
    end
    yield()

    buildReverseIndexes()

    stats.counts = {
        quests = countEntries(quests), npcs = countEntries(npcs),
        objects = countEntries(objects), items = countEntries(items),
    }
    stats.loadMs = nowMs() - startedAt

    ready = true
    loading = false
    loadHandle = nil

    Log.Info("DB", L["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."],
        stats.counts.quests, stats.counts.npcs, stats.counts.objects, stats.counts.items, stats.loadMs)

    local PQ = ns.PQ
    if PQ and PQ.SendMessage then
        PQ:SendMessage("PQ_DB_READY")
    end
end

--- DB.Load() -> bool started
-- Idempotent: returns true immediately when the database is already loaded, false when it cannot load.
function DB.Load()
    if ready then return true end
    if loading then return true end

    local Data = ns.Data
    if type(Data) ~= "table" or (Data.quests == nil and Data.npcs == nil) then
        Log.Error("DB", L["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."])
        ready = false
        return false
    end

    loading = true
    local ok, handle = pcall(Thread.Run, runLoad, { name = "DB.Load", pauseInCombat = false })
    if not ok then
        loading = false
        Log.Error("DB", "cannot start the database loader: %s", tostring(handle))
        return false
    end
    loadHandle = handle
    -- Thread.Run runs synchronously when there is no frame support (plain Lua), so `ready` may
    -- already be true here; either way the caller only needs to know that loading started.
    return true
end

function DB.IsReady()
    return ready
end

function DB.IsLoading()
    return loading
end

--- DB.GetStats() -> { loadMs, counts = {quests, npcs, objects, items} }
function DB.GetStats()
    return stats
end

--- DB.GetMeta() -> ns.Data.meta|nil (build source, timestamp, schemaVersion)
function DB.GetMeta()
    local Data = ns.Data
    return Data and Data.meta or nil
end

---------------------------------------------------------------------------
-- Raw field access (no decoding, no allocation)
---------------------------------------------------------------------------

local function rawField(store, keys, id, key)
    if not store or type(id) ~= "number" then return nil end
    local row = store[id]
    if not row then return nil end
    local index = key
    if type(key) ~= "number" then
        index = keys[key]
    end
    if not index then return nil end
    return row[index]
end

function DB.GetQuestField(id, key) return rawField(quests, Schema.questKeys, id, key) end
function DB.GetNpcField(id, key) return rawField(npcs, Schema.npcKeys, id, key) end
function DB.GetObjectField(id, key) return rawField(objects, Schema.objectKeys, id, key) end
function DB.GetItemField(id, key) return rawField(items, Schema.itemKeys, id, key) end

function DB.GetQuestName(id) return rawField(quests, Schema.questKeys, id, 1) end
function DB.GetNpcName(id) return rawField(npcs, Schema.npcKeys, id, 1) end
function DB.GetObjectName(id) return rawField(objects, Schema.objectKeys, id, 1) end
function DB.GetItemName(id) return rawField(items, Schema.itemKeys, id, 1) end

function DB.HasQuest(id) return quests ~= nil and quests[id] ~= nil end
function DB.HasNpc(id) return npcs ~= nil and npcs[id] ~= nil end
function DB.HasObject(id) return objects ~= nil and objects[id] ~= nil end
function DB.HasItem(id) return items ~= nil and items[id] ~= nil end

--- DB.GetExtra(kind, id, field) -> value|nil. Non-schema fields carried by community overrides.
function DB.GetExtra(kind, id, field)
    local bucket = extras[kind] and extras[kind][id]
    if not bucket then return nil end
    if field == nil then return bucket end
    return bucket[field]
end

---------------------------------------------------------------------------
-- Iterators. They walk the raw tables, so never store the row you get.
---------------------------------------------------------------------------

local function iterate(store)
    local t = store or EMPTY
    local key
    return function()
        local row
        key, row = next(t, key)
        return key, row
    end
end

function DB.IterateQuestIDs() return iterate(quests) end
function DB.IterateNpcIDs() return iterate(npcs) end
function DB.IterateObjectIDs() return iterate(objects) end
function DB.IterateItemIDs() return iterate(items) end

---------------------------------------------------------------------------
-- Quest tags and blacklists
---------------------------------------------------------------------------

--- DB.GetQuestTagInfo(questID) -> tagID|nil, tagName|nil
-- ns.Data.questTagCorrections wins over the engine, exactly as Questie does: the engine only knows
-- about quests the player can currently see, and it lies about elite/dungeon tags for old content.
function DB.GetQuestTagInfo(questID)
    if type(questID) ~= "number" then return nil, nil end
    local cached = tagCache[questID]
    if cached then return cached[1], cached[2] end

    local Data = ns.Data
    local corrections = Data and Data.questTagCorrections
    local correction = corrections and corrections[questID]
    if correction then
        tagCache[questID] = correction
        return correction[1], correction[2]
    end

    local api = _G and _G.GetQuestTagInfo
    if api then
        local ok, tagID, tagName = pcall(api, questID)
        if ok and tagID then
            tagCache[questID] = { tagID, tagName }
            return tagID, tagName
        end
    end
    return nil, nil
end

--- DB.IsQuestHidden(questID) -> bool. Questie's blacklist: the quest does not exist for the player.
function DB.IsQuestHidden(questID)
    local Data = ns.Data
    local hidden = Data and Data.hiddenQuests
    return (hidden and hidden[questID]) and true or false
end

--- DB.IsQuestHiddenOnMap(questID) -> bool. Available, but no map icons (Questie HIDE_ON_MAP).
function DB.IsQuestHiddenOnMap(questID)
    local Data = ns.Data
    local hidden = Data and Data.hideOnMapQuests
    return (hidden and hidden[questID]) and true or false
end

function DB.IsNpcHidden(npcID)
    local Data = ns.Data
    local hidden = Data and Data.hiddenNpcs
    return (hidden and hidden[npcID]) and true or false
end

function DB.IsItemHidden(itemID)
    local Data = ns.Data
    local hidden = Data and Data.hiddenItems
    return (hidden and hidden[itemID]) and true or false
end

---------------------------------------------------------------------------
-- Decoding: positional row -> named struct (docs/06 section 7)
---------------------------------------------------------------------------

-- {{id, text, icon}, ...} -> { {id=, text=, icon=}, ... }
local function decodeTriples(list, out)
    if type(list) ~= "table" then return out end
    for i = 1, #list do
        local entry = list[i]
        if type(entry) == "table" then
            out[#out + 1] = { id = entry[1], text = entry[2], icon = entry[3] }
        end
    end
    return out
end

local function decodeObjectives(raw)
    local out = { creatures = {}, objects = {}, items = {}, killCredits = {}, spells = {} }
    if type(raw) ~= "table" then return out end

    decodeTriples(raw[1], out.creatures)
    decodeTriples(raw[2], out.objects)
    decodeTriples(raw[3], out.items)

    local reputation = raw[4]
    if type(reputation) == "table" and reputation[1] then
        out.reputation = { faction = reputation[1], value = reputation[2] }
    end

    local killCredits = raw[5]
    if type(killCredits) == "table" then
        for i = 1, #killCredits do
            local entry = killCredits[i]
            if type(entry) == "table" then
                out.killCredits[#out.killCredits + 1] =
                    { ids = entry[1], baseId = entry[2], text = entry[3], icon = entry[4] }
            end
        end
    end

    local spells = raw[6]
    if type(spells) == "table" then
        for i = 1, #spells do
            local entry = spells[i]
            if type(entry) == "table" then
                out.spells[#out.spells + 1] = { spellId = entry[1], text = entry[2], itemId = entry[3] }
            end
        end
    end
    return out
end

local HasFlag = Schema.HasFlag
local QF, SF = Schema.questFlags, Schema.specialFlags

local function decodeQuest(id, row)
    local startedBy, finishedBy, triggerEnd = row[2], row[3], row[9]
    local questFlags, specialFlags = row[23], row[24]

    local quest = {
        id = id,
        name = row[1],
        startedBy = {
            npcs = startedBy and startedBy[1] or nil,
            objects = startedBy and startedBy[2] or nil,
            items = startedBy and startedBy[3] or nil,
        },
        finishedBy = {
            npcs = finishedBy and finishedBy[1] or nil,
            objects = finishedBy and finishedBy[2] or nil,
        },
        requiredLevel = row[4],
        questLevel = row[5],
        requiredRaces = row[6],
        requiredClasses = row[7],
        objectivesText = row[8],
        objectives = decodeObjectives(row[10]),
        sourceItemId = row[11],
        preQuestGroup = row[12],
        preQuestSingle = row[13],
        childQuests = row[14],
        inGroupWith = row[15],
        exclusiveTo = row[16],
        zoneOrSort = row[17],
        requiredSkill = row[18],
        requiredMinRep = row[19],
        requiredMaxRep = row[20],
        requiredSourceItems = row[21],
        nextQuestInChain = row[22],
        questFlags = questFlags,
        specialFlags = specialFlags,
        parentQuest = row[25],
        reputationReward = row[26],
        breadcrumbForQuestId = row[27],
        breadcrumbs = row[28],
        extraObjectives = row[29],
        requiredSpell = row[30],
        requiredSpecialization = row[31],
        requiredMaxLevel = row[32],
        availableUntilCompleted = row[33],
        availableStartingWith = row[34],
        requiredRanks = row[35],
        disabledByQuest = row[36],
    }

    if type(triggerEnd) == "table" then
        quest.triggerEnd = { text = triggerEnd[1], coords = triggerEnd[2] }
    end

    quest.isRepeatable = HasFlag(specialFlags, SF.REPEATABLE)
    quest.isDaily = HasFlag(questFlags, QF.DAILY)
    quest.isWeekly = HasFlag(questFlags, QF.WEEKLY)
    quest.isMonthly = HasFlag(questFlags, QF.MONTHLY)
    quest.tagID, quest.tagName = DB.GetQuestTagInfo(id)

    return quest
end

local function decodeNpc(id, row)
    return {
        id = id,
        name = row[1],
        minLevelHealth = row[2],
        maxLevelHealth = row[3],
        minLevel = row[4],
        maxLevel = row[5],
        rank = row[6],
        spawns = row[7],
        waypoints = row[8],
        zoneID = row[9],
        questStarts = row[10],
        questEnds = row[11],
        factionID = row[12],
        friendlyToFaction = row[13],
        subName = row[14],
        npcFlags = row[15],
    }
end

local function decodeObject(id, row)
    return {
        id = id,
        name = row[1],
        questStarts = row[2],
        questEnds = row[3],
        spawns = row[4],
        zoneID = row[5],
        factionID = row[6],
        waypoints = row[7],
    }
end

local function decodeItem(id, row)
    return {
        id = id,
        name = row[1],
        npcDrops = row[2],
        objectDrops = row[3],
        itemDrops = row[4],
        startQuest = row[5],
        questRewards = row[6],
        flags = row[7],
        foodType = row[8],
        itemLevel = row[9],
        requiredLevel = row[10],
        ammoType = row[11],
        class = row[12],
        subClass = row[13],
        vendors = row[14],
        relatedQuests = row[15],
        teachesSpell = row[16],
    }
end

local function getDecoded(store, cache, decoder, id)
    if not store or type(id) ~= "number" then return nil end
    local cached = cache[id]
    if cached then return cached end
    local row = store[id]
    if not row then return nil end
    local decoded = decoder(id, row)
    cache[id] = decoded
    return decoded
end

--- DB.GetQuest(id) -> Quest|nil. The result is cached and SHARED: never mutate it.
function DB.GetQuest(id) return getDecoded(quests, questCache, decodeQuest, id) end
function DB.GetNpc(id) return getDecoded(npcs, npcCache, decodeNpc, id) end
function DB.GetObject(id) return getDecoded(objects, objectCache, decodeObject, id) end
function DB.GetItem(id) return getDecoded(items, itemCache, decodeItem, id) end

---------------------------------------------------------------------------
-- Relations
---------------------------------------------------------------------------

--- DB.GetQuestsStartedBy(kind, id) -> {questID,...}  kind = "npc"|"object"|"item"
-- The list is the shared index entry; do not mutate it.
function DB.GetQuestsStartedBy(kind, id)
    local index = questStarters[kind]
    if not index then return EMPTY end
    return index[id] or EMPTY
end

--- DB.GetQuestsEndedBy(kind, id) -> {questID,...}  kind = "npc"|"object"
function DB.GetQuestsEndedBy(kind, id)
    local index = questEnders[kind]
    if not index then return EMPTY end
    return index[id] or EMPTY
end

--- DB.GetItemSources(itemID) -> { npcs = {}, objects = {}, items = {}, vendors = {} }
-- Always returns a table; the four lists are the shared raw rows.
function DB.GetItemSources(itemID)
    if not items or type(itemID) ~= "number" then
        return { npcs = EMPTY, objects = EMPTY, items = EMPTY, vendors = EMPTY }
    end
    local cached = sourceCache[itemID]
    if cached then return cached end
    local row = items[itemID]
    local sources = {
        npcs = (row and row[2]) or EMPTY,
        objects = (row and row[3]) or EMPTY,
        items = (row and row[4]) or EMPTY,
        vendors = (row and row[14]) or EMPTY,
    }
    sourceCache[itemID] = sources
    return sources
end

---------------------------------------------------------------------------
-- Name index (lazy, per kind, built in a Thread job)
---------------------------------------------------------------------------

local NAME_STORES = { quest = "quests", npc = "npcs", object = "objects", item = "items" }

local function storeForKind(kind)
    local field = NAME_STORES[kind]
    if not field then return nil end
    return tables[field]
end

--- DB.BuildNameIndex(kind, onDone) -> bool started
-- The item table alone has 80 000 names, so an index is only built for the kinds that are asked for.
function DB.BuildNameIndex(kind, onDone)
    if nameIndex[kind] then
        if onDone then onDone(true) end
        return true
    end
    if nameIndexJobs[kind] then return true end
    local store = storeForKind(kind)
    if not store then return false end

    nameIndexJobs[kind] = Thread.Run(function()
        local index = {}
        local n = 0
        for id, row in pairs(store) do
            local name = row[1]
            if type(name) == "string" then
                local key = name:lower()
                local list = index[key]
                if list then
                    list[#list + 1] = id
                else
                    index[key] = { id }
                end
                n = n + 1
            end
            yieldEvery()
        end
        -- Duplicate names are common (phased copies of the same NPC); sort so callers get a stable order.
        for _, list in pairs(index) do
            if #list > 1 then table.sort(list) end
            yieldEvery()
        end
        nameIndex[kind] = index
        nameIndexJobs[kind] = nil
        Log.Debug("DB", "name index for '%s' built (%d entries)", tostring(kind), n)
        if onDone then onDone(true) end
    end, { name = "DB.NameIndex." .. tostring(kind), pauseInCombat = true })
    return true
end

--- DB.IsNameIndexReady(kind) -> bool
function DB.IsNameIndexReady(kind)
    return nameIndex[kind] ~= nil
end

--- DB.FindByName(kind, name) -> {id,...}
-- Returns an empty list while the index is still building; the build starts on the first call.
function DB.FindByName(kind, name)
    if type(name) ~= "string" or not NAME_STORES[kind] then return EMPTY end
    local index = nameIndex[kind]
    if not index then
        DB.BuildNameIndex(kind)
        return EMPTY
    end
    return index[name:lower()] or EMPTY
end

---------------------------------------------------------------------------
-- Test/debug support: drop everything so the next Load starts from scratch.
---------------------------------------------------------------------------

function DB.Unload()
    if loadHandle and Thread.Cancel then Thread.Cancel(loadHandle) end
    loadHandle = nil
    ready, loading = false, false
    quests, npcs, objects, items = nil, nil, nil, nil
    tables.quests, tables.npcs, tables.objects, tables.items = nil, nil, nil, nil
    questStarters = { npc = {}, object = {}, item = {} }
    questEnders = { npc = {}, object = {} }
    for k in pairs(nameIndex) do nameIndex[k] = nil end
    for k in pairs(nameIndexJobs) do nameIndexJobs[k] = nil end
    for k in pairs(tagCache) do tagCache[k] = nil end
    for _, bucket in pairs(extras) do
        for k in pairs(bucket) do bucket[k] = nil end
    end
end
