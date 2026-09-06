-- Sync/Telemetry.lua: records what the player did while questing into the SavedVariable
-- PandaQuestSync (docs/06 section 13). The companion tool uploads it, the hub analyses it and
-- writes the result back into Database/Overrides/Community.lua, which Sync/Community.lua reads.
--
-- Three rules shape this file:
--   * Nothing is recorded unless global.telemetry.enabled is true. `active` is the single switch:
--     when it is false Record() returns on its first line, the combat-log frame is unregistered
--     and the breadcrumb OnUpdate frame is hidden, so the recorder costs literally nothing.
--   * Privacy: only the fields listed in the contract ever reach the saved variable. No chat text,
--     no player or NPC names, no group members. Coordinates come from Player.GetPosition(), which
--     is nil inside instances, so instance positions are never written.
--   * Cheap: one table per recorded event and nothing else. The caller builds that table and hands
--     ownership to Record(); the per-frame breadcrumb driver only adds up `elapsed`.
local _, ns = ...

local M = {}
ns.Telemetry = M

local Const, Util, Log, Compat = ns.Const, ns.Util, ns.Log, ns.Compat

local type, tonumber, tostring, pairs = type, tonumber, tostring, pairs
local format, floor = string.format, math.floor
local tremove = table.remove
local wipe = wipe or table.wipe

local L = ns.L

-- Event codes (docs/06 section 13). Exposed so tests and the companion share one spelling.
local CODES = {
    ACCEPT = "QA", TURNIN = "QT", REMOVED = "QR", OBJECTIVE = "OBJ", COMPLETE = "QC",
    KILL = "KILL", LOOT = "LOOT", POS = "POS", LEVEL = "LVL", ZONE = "ZONE", DIE = "DIE",
    ARRIVED = "ARR", NAVTARGET = "NAV",
}
M.CODES = CODES

local SYNC_VERSION = 1
local MAX_DROP_NPCS = 64        -- how many "drops from" NPCs one quest item may contribute
local KILL_DEDUPE = 2           -- s; PARTY_KILL and UNIT_DIED can both fire for one corpse
local TURNIN_MEMORY = 5         -- s; QUEST_REMOVED right after QUEST_TURNED_IN is not an abandon

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local store                     -- PandaQuestSync
local session                   -- the session table inside store.sessions, or nil
local active = false            -- master switch, mirrors global.telemetry.enabled
local recordedCount = 0         -- events recorded during this session (trimmed ones included)
local droppedCount = 0          -- events thrown away by the maxEventsPerSession cap

local questNpcs = {}            -- npcID -> questID   (only NPCs an active quest cares about)
local questItems = {}           -- itemID -> questID
local objSnapshot = {}          -- questID -> { [objectiveIndex] = numFulfilled, complete = bool }
local turnedInAt = {}           -- questID -> GetTime(), so QR is not recorded after a turn-in
local lastKillGuid, lastKillAt  -- kill de-duplication
local lastZoneMap               -- last uiMapID written as a ZONE event
local breadcrumbAccum = 0
local lastPosX, lastPosY, lastPosMap

local combatFrame, breadcrumbFrame
local lootPatterns              -- { { pattern = "...", count = bool }, ... }

-- Own AceEvent/AceTimer object: AceEvent keys its registry by target, so registering
-- QUEST_TURNED_IN on ns.PQ would collide with Quest/Player.lua (see Quest/Player.lua).
local listener = {}
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
    local AceTimer = LibStub and LibStub("AceTimer-3.0", true)
    if AceTimer then AceTimer:Embed(listener) end
end
M.listener = listener

---------------------------------------------------------------------------
-- Settings and the saved variable
---------------------------------------------------------------------------

local DEFAULT_CFG = ns.DEFAULTS.global.telemetry

--- Settings() -> the global.telemetry table, or the defaults before AceDB exists.
local function settings()
    local PQ = ns.PQ
    local global = PQ and PQ.db and PQ.db.global
    local cfg = global and global.telemetry
    if type(cfg) == "table" then return cfg end
    return DEFAULT_CFG
end
M.GetSettings = settings

local function numberSetting(key)
    local value = tonumber(settings()[key])
    if not value or value <= 0 then value = tonumber(DEFAULT_CFG[key]) or 1 end
    return value
end

--- The SavedVariable, created and shaped on demand. Core/Init.lua puts the raw table on ns.Sync.
local function ensureStore()
    local sync = ns.Sync or _G.PandaQuestSync
    if type(sync) ~= "table" then
        sync = {}
        _G.PandaQuestSync = sync
        ns.Sync = sync
    end
    if type(sync.version) ~= "number" then sync.version = SYNC_VERSION end
    if type(sync.characters) ~= "table" then sync.characters = {} end
    if type(sync.sessions) ~= "table" then sync.sessions = {} end
    store = sync
    return sync
end

--- GetStore() -> PandaQuestSync (created if needed).
function M.GetStore()
    return store or ensureStore()
end

--- GetSession() -> the session currently being written, or nil.
function M.GetSession()
    return session
end

--- IsEnabled() -> bool. The one place that decides whether anything is recorded at all.
function M.IsEnabled()
    return settings().enabled ~= false
end

---------------------------------------------------------------------------
-- Small helpers
---------------------------------------------------------------------------

local function unixNow()
    return (time and time()) or 0
end

local function clock()
    return (GetTime and GetTime()) or 0
end

local function round3(v)
    return floor(v * 1000 + 0.5) / 1000
end

--- Position of the player as (uiMapID, x, y) with 3 decimals, or nil.
-- Player.GetPosition() is nil inside instances and on maps without coordinates, which is exactly
-- the privacy rule we want: instance positions never enter the saved variable.
local function playerPosition()
    local Player = ns.Player
    if not (Player and Player.GetPosition) then return nil end
    if Player.IsInInstance and Player.IsInInstance() then return nil end
    local pos = Player.GetPosition()
    if not pos or not pos.uiMapID or not pos.x then return nil end
    return pos.uiMapID, round3(pos.x), round3(pos.y)
end

--- Adds m/x/y to an event table in place and returns it (so it can wrap a table constructor).
local function withPos(fields)
    local uiMapID, x, y = playerPosition()
    if uiMapID then
        fields.m = uiMapID
        fields.x = x
        fields.y = y
    end
    return fields
end

local function playerLevel()
    local Player = ns.Player
    if Player and Player.GetLevel then return Player.GetLevel() end
    return (UnitLevel and UnitLevel("player")) or 0
end

--- "Name-Realm" with the realm spaces removed, matching the hub's /characters/{name}-{realm} route.
local function characterKey()
    local name = (UnitName and UnitName("player")) or "Unknown"
    local realm
    if GetNormalizedRealmName then realm = GetNormalizedRealmName() end
    if not realm or realm == "" then
        realm = (GetRealmName and GetRealmName()) or "Unknown"
        realm = realm:gsub("[%s%-]", "")
    end
    return name .. "-" .. realm, name, realm
end

local function clientBuild()
    if not GetBuildInfo then return "unknown" end
    local version, build = GetBuildInfo()
    if not version then return "unknown" end
    if not build or build == "" then return version end
    return version .. "." .. build
end

--- Writes/refreshes the character row. Only the fields the contract lists (no guild, no spec).
local function updateCharacter(key, name, realm)
    local characters = M.GetStore().characters
    local row = characters[key]
    if type(row) ~= "table" then
        row = {}
        characters[key] = row
    end
    row.name = name
    row.realm = realm
    row.region = (GetCurrentRegionName and GetCurrentRegionName()) or nil
    if UnitClass then
        local _, classFile = UnitClass("player")
        row.class = classFile
    end
    if UnitRace then
        local _, raceFile = UnitRace("player")
        row.race = raceFile
    end
    row.faction = (ns.Player and ns.Player.GetFaction and ns.Player.GetFaction())
        or (UnitFactionGroup and UnitFactionGroup("player")) or nil
    row.level = playerLevel()
    row.lastSeen = unixNow()
    return row
end

---------------------------------------------------------------------------
-- Session lifecycle
---------------------------------------------------------------------------

--- Drops the oldest sessions until at most `maxSessions` remain. The newest one is never touched.
local function trimSessions()
    local sessions = M.GetStore().sessions
    local maxSessions = numberSetting("maxSessions")
    while #sessions > maxSessions do
        tremove(sessions, 1)
    end
end

--- StartSession() -> session|nil. Idempotent: the running session is returned unchanged.
function M.StartSession()
    if not M.IsEnabled() then return nil end
    if session then return session end

    ensureStore()
    local key, name, realm = characterKey()
    updateCharacter(key, name, realm)

    local started = unixNow()
    session = {
        id = key .. "-" .. started,
        character = key,
        start = started,
        ["end"] = nil,
        clientBuild = clientBuild(),
        addonVersion = Const.VERSION,
        events = {},
    }
    recordedCount, droppedCount = 0, 0

    local sessions = store.sessions
    sessions[#sessions + 1] = session
    trimSessions()

    Log.Debug("Telemetry", "session %s started", session.id)
    return session
end

--- EndSession(): stamps `end` and detaches. Called on PLAYER_LOGOUT and when telemetry is disabled.
function M.EndSession()
    if not session then return end
    session["end"] = unixNow()
    if session.character and store and store.characters and store.characters[session.character] then
        store.characters[session.character].lastSeen = session["end"]
    end
    Log.Debug("Telemetry", "session %s ended with %d events (%d dropped)",
        tostring(session.id), #session.events, droppedCount)
    session = nil
end

-- Wall-clock reference for the relative event timestamps. GetTime() is monotonic within a session;
-- unix time() only has one-second resolution, which is too coarse for objective ordering.
local sessionClock = 0

---------------------------------------------------------------------------
-- Recording
---------------------------------------------------------------------------

--- Removes the oldest events once the session is over the cap. A whole chunk goes at once so the
-- shift is amortised O(1) per event instead of O(n) for every single one past the cap.
local function trimEvents(events, cap)
    local n = #events
    if n <= cap then return end
    local drop = n - cap
    local burst = floor(cap * 0.05)
    if burst < 1 then burst = 1 end
    if drop < burst then drop = burst end
    if drop > n then drop = n end
    for i = 1, n - drop do
        events[i] = events[i + drop]
    end
    for i = n - drop + 1, n do
        events[i] = nil
    end
    droppedCount = droppedCount + drop
end

--- Record(code, fields) -> event|nil
-- `fields` becomes the event: Record takes ownership, stamps `e` and `t` into it and stores it.
-- Returns nil (and touches nothing) whenever telemetry is off.
function M.Record(code, fields)
    if not active then return nil end
    if type(code) ~= "string" then return nil end

    local current = session or M.StartSession()
    if not current then return nil end

    local event = fields or {}
    event.e = code
    event.t = floor((clock() - sessionClock) * 10 + 0.5) / 10
    if event.t < 0 then event.t = 0 end

    local events = current.events
    events[#events + 1] = event
    recordedCount = recordedCount + 1

    local cap = numberSetting("maxEventsPerSession")
    if #events > cap then trimEvents(events, cap) end

    return event
end

local Record = M.Record

---------------------------------------------------------------------------
-- Quest relevance: which NPCs and items belong to a quest in the log
---------------------------------------------------------------------------

local function addNpc(id, questID)
    if type(id) == "number" and id > 0 and questNpcs[id] == nil then
        questNpcs[id] = questID
    end
end

local function addItem(id, questID)
    if type(id) == "number" and id > 0 and questItems[id] == nil then
        questItems[id] = questID
    end
end

--- Rebuilds questNpcs/questItems from the quests currently in the log. Bounded work: at most 25
-- quests, and at most MAX_DROP_NPCS "drops from" NPCs per quest item.
local function rebuildRelevance()
    wipe(questNpcs)
    wipe(questItems)

    local DB, QuestLog = ns.DB, ns.QuestLog
    if not (DB and DB.GetQuest and QuestLog and QuestLog.GetAll) then return end
    if DB.IsReady and not DB.IsReady() then return end

    for questID in pairs(QuestLog.GetAll()) do
        local quest = DB.GetQuest(questID)
        local objectives = quest and quest.objectives
        if objectives then
            local creatures = objectives.creatures
            if creatures then
                for i = 1, #creatures do addNpc(creatures[i].id, questID) end
            end

            local credits = objectives.killCredits
            if credits then
                for i = 1, #credits do
                    local entry = credits[i]
                    addNpc(entry.baseId, questID)
                    local ids = entry.ids
                    if type(ids) == "table" then
                        for j = 1, #ids do addNpc(ids[j], questID) end
                    end
                end
            end

            local items = objectives.items
            if items then
                for i = 1, #items do
                    local itemID = items[i].id
                    addItem(itemID, questID)
                    local item = (type(itemID) == "number") and DB.GetItem and DB.GetItem(itemID) or nil
                    local drops = item and item.npcDrops
                    if type(drops) == "table" then
                        local n = #drops
                        if n > MAX_DROP_NPCS then n = MAX_DROP_NPCS end
                        for j = 1, n do addNpc(drops[j], questID) end
                    end
                end
            end
        end
        if quest then
            addItem(quest.sourceItemId, questID)
        end
    end
end
M.RebuildRelevance = rebuildRelevance

--- IsQuestNpc(npcID) -> questID|nil, IsQuestItem(itemID) -> questID|nil (for tests and the UI).
function M.GetQuestForNpc(npcID) return questNpcs[npcID] end
function M.GetQuestForItem(itemID) return questItems[itemID] end

---------------------------------------------------------------------------
-- Quest log: OBJ and QC
---------------------------------------------------------------------------

local function snapshotQuest(questID, entry)
    if not entry then
        objSnapshot[questID] = nil
        return
    end
    local snap = objSnapshot[questID]
    if not snap then
        snap = {}
        objSnapshot[questID] = snap
    else
        wipe(snap)
    end
    local objectives = entry.objectives
    if objectives then
        for i = 1, #objectives do
            snap[i] = objectives[i].numFulfilled or 0
        end
    end
    snap.complete = entry.isComplete == 1
    return snap
end

local function diffQuest(questID, entry)
    if not entry then return end
    local snap = objSnapshot[questID]
    if not snap then
        snapshotQuest(questID, entry)
        return
    end

    local objectives = entry.objectives
    if objectives then
        for i = 1, #objectives do
            local objective = objectives[i]
            local have = objective.numFulfilled or 0
            if snap[i] ~= have then
                snap[i] = have
                Record(CODES.OBJECTIVE, withPos({ q = questID, i = i, n = have, r = objective.numRequired or 1 }))
            end
        end
    end

    local complete = entry.isComplete == 1
    if complete and not snap.complete then
        Record(CODES.COMPLETE, withPos({ q = questID }))
    end
    snap.complete = complete
end

local function onQuestLogChanged(_, changes)
    if not active or type(changes) ~= "table" then return end
    local QuestLog = ns.QuestLog
    if not (QuestLog and QuestLog.GetQuest) then return end

    local accepted, updated = changes.accepted, changes.updated
    local removed, turnedIn = changes.removed, changes.turnedIn

    -- Accepted quests are only snapshotted: QA is recorded from QUEST_ACCEPTED, which fires at the
    -- moment of the accept and therefore carries the right position.
    if accepted then
        for i = 1, #accepted do snapshotQuest(accepted[i], QuestLog.GetQuest(accepted[i])) end
    end
    if updated then
        for i = 1, #updated do diffQuest(updated[i], QuestLog.GetQuest(updated[i])) end
    end
    if removed then
        for i = 1, #removed do objSnapshot[removed[i]] = nil end
    end
    if turnedIn then
        for i = 1, #turnedIn do objSnapshot[turnedIn[i]] = nil end
    end

    if changes.initial or (accepted and #accepted > 0) or (removed and #removed > 0)
        or (turnedIn and #turnedIn > 0) then
        rebuildRelevance()
    end
end

---------------------------------------------------------------------------
-- Quest events
---------------------------------------------------------------------------

local function onQuestAccepted(_, a, b)
    if not active then return end
    -- Classic signature is QUEST_ACCEPTED(logIndex, questID); modern is (questID).
    local questID = (type(b) == "number" and b) or (type(a) == "number" and a) or nil
    if not questID or questID <= 0 then return end
    Record(CODES.ACCEPT, withPos({ q = questID, lvl = playerLevel() }))
end

local function onQuestTurnedIn(_, questID, xp, money)
    if not active then return end
    if type(questID) ~= "number" then return end
    turnedInAt[questID] = clock()
    objSnapshot[questID] = nil
    Record(CODES.TURNIN, withPos({
        q = questID,
        xp = tonumber(xp) or 0,
        money = tonumber(money) or 0,
        lvl = playerLevel(),
        mo = (Compat.IsMounted and Compat.IsMounted()) and 1 or nil,
    }))
end

local function onQuestRemoved(_, questID)
    if not active then return end
    if type(questID) ~= "number" then return end
    objSnapshot[questID] = nil
    -- QUEST_REMOVED also fires straight after a turn-in; that is not an abandon.
    local stamp = turnedInAt[questID]
    if stamp and (clock() - stamp) < TURNIN_MEMORY then
        turnedInAt[questID] = nil
        return
    end
    Record(CODES.REMOVED, { q = questID })
end

---------------------------------------------------------------------------
-- Kills
---------------------------------------------------------------------------

local function isOwnKill(sourceGUID)
    if not sourceGUID or not UnitGUID then return false end
    if sourceGUID == UnitGUID("player") then return true end
    return sourceGUID == UnitGUID("pet")
end

-- 5.5.4 exposes the combat log payload only as C_CombatLog.GetCurrentEventInfo; the bare
-- CombatLogGetCurrentEventInfo global of Retail does not exist here (it is absent from Ketho's
-- 5.5.4 dump). Resolved once: without it there is nothing to read, and ApplySettings then skips
-- registering COMBAT_LOG_EVENT_UNFILTERED entirely instead of paying for every combat log line.
local function combatLogInfoFunc()
    local C = _G.C_CombatLog
    if C and C.GetCurrentEventInfo then return C.GetCurrentEventInfo end
    return _G.CombatLogGetCurrentEventInfo
end
M.GetCombatLogInfoFunc = combatLogInfoFunc

local function onCombatLogEvent()
    if not active then return end
    local info = combatLogInfoFunc()
    if not info then return end

    local _, subevent, _, sourceGUID, _, _, _, destGUID = info()
    if subevent ~= "PARTY_KILL" and subevent ~= "UNIT_DIED" then return end
    if type(destGUID) ~= "string" then return end

    if subevent == "PARTY_KILL" then
        if not isOwnKill(sourceGUID) then return end
    else
        -- UNIT_DIED has no source. The best cheap attribution is "it was what I had targeted".
        if not (UnitGUID and destGUID == UnitGUID("target")) then return end
    end

    local npcID = Util.NpcIdFromGuid(destGUID)
    if not npcID then return end

    -- Only NPCs a quest in the log actually cares about (docs/06 section 13).
    local questID = questNpcs[npcID]
    if not questID then return end

    local now = clock()
    if lastKillGuid == destGUID and lastKillAt and (now - lastKillAt) < KILL_DEDUPE then return end
    lastKillGuid, lastKillAt = destGUID, now

    Record(CODES.KILL, withPos({ npc = npcID, q = questID }))
end

---------------------------------------------------------------------------
-- Loot
---------------------------------------------------------------------------

local function escapePattern(text)
    return (text:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1"))
end

--- Turns the "You receive loot: %sx%d." global strings into Lua patterns. Only the *_SELF variants
-- are used, so another player's loot is never even looked at.
local function buildLootPatterns()
    lootPatterns = {}
    local sources = {
        { _G.LOOT_ITEM_SELF_MULTIPLE, true },
        { _G.LOOT_ITEM_PUSHED_SELF_MULTIPLE, true },
        { _G.LOOT_ITEM_CREATED_SELF_MULTIPLE, true },
        { _G.LOOT_ITEM_SELF, false },
        { _G.LOOT_ITEM_PUSHED_SELF, false },
        { _G.LOOT_ITEM_CREATED_SELF, false },
    }
    for i = 1, #sources do
        local text, hasCount = sources[i][1], sources[i][2]
        if type(text) == "string" and text ~= "" then
            local pattern = escapePattern(text)
            pattern = pattern:gsub("%%%%s", "(.+)")
            pattern = pattern:gsub("%%%%d", "(%%d+)")
            lootPatterns[#lootPatterns + 1] = { pattern = "^" .. pattern .. "$", count = hasCount }
        end
    end
end

--- ParseLootMessage(message) -> itemID|nil, count. Exposed for the tests.
function M.ParseLootMessage(message)
    if type(message) ~= "string" then return nil end
    if not lootPatterns then buildLootPatterns() end
    for i = 1, #lootPatterns do
        local entry = lootPatterns[i]
        local link, count = message:match(entry.pattern)
        if link then
            local itemID = tonumber(link:match("item:(%d+)"))
            if itemID then
                if entry.count then
                    return itemID, tonumber(count) or 1
                end
                return itemID, 1
            end
        end
    end
    return nil
end

local function onChatMsgLoot(_, message)
    if not active then return end
    local itemID, count = M.ParseLootMessage(message)
    if not itemID then return end
    -- Only the numeric item id and the count are stored; the chat line itself is discarded.
    Record(CODES.LOOT, { item = itemID, count = count, q = questItems[itemID] })
end

---------------------------------------------------------------------------
-- Level, zone, death, navigation
---------------------------------------------------------------------------

local function onLevelUp(_, level)
    if not active then return end
    level = tonumber(level) or playerLevel()
    Record(CODES.LEVEL, { l = level })
    local key = session and session.character
    local row = key and store and store.characters and store.characters[key]
    if row then row.level = level end
end

local function onZoneChanged(_, uiMapID)
    if not active then return end
    if type(uiMapID) ~= "number" then
        uiMapID = playerPosition()
    end
    if not uiMapID or uiMapID == lastZoneMap then return end
    lastZoneMap = uiMapID
    Record(CODES.ZONE, { m = uiMapID })
end

local function onPlayerDead()
    if not active then return end
    Record(CODES.DIE, withPos({}))
end

local function onCurrentTargetChanged(_, target)
    if not active or type(target) ~= "table" then return end
    Record(CODES.NAVTARGET, { key = target.key, q = target.questID })
end

local function onTargetReached(_, target)
    if not active or type(target) ~= "table" then return end
    Record(CODES.ARRIVED, withPos({ key = target.key, q = target.questID }))
end

---------------------------------------------------------------------------
-- Breadcrumbs
---------------------------------------------------------------------------

--- One POS sample every `breadcrumbInterval` seconds while the player is moving and has quests.
-- The OnUpdate body allocates nothing: it adds up `elapsed` and leaves immediately.
local function onBreadcrumbUpdate(_, elapsed)
    breadcrumbAccum = breadcrumbAccum + elapsed
    if breadcrumbAccum < numberSetting("breadcrumbInterval") then return end
    breadcrumbAccum = 0
    if not active or settings().breadcrumbs == false then return end

    local QuestLog = ns.QuestLog
    if not (QuestLog and QuestLog.GetCount) or QuestLog.GetCount() <= 0 then return end

    local speed = Compat.UnitSpeed and Compat.UnitSpeed("player") or 0
    if not speed or speed <= 0 then return end

    local uiMapID, x, y = playerPosition()
    if not uiMapID then return end
    if uiMapID == lastPosMap and x == lastPosX and y == lastPosY then return end
    lastPosMap, lastPosX, lastPosY = uiMapID, x, y

    Record(CODES.POS, {
        m = uiMapID, x = x, y = y,
        mo = (Compat.IsMounted and Compat.IsMounted()) and 1 or nil,
    })
end

---------------------------------------------------------------------------
-- The master switch
---------------------------------------------------------------------------

--- ApplySettings(): the single place where telemetry turns on and off. Everything downstream reads
-- `active`, and the two frames that would otherwise cost CPU are detached when it is false.
function M.ApplySettings()
    local wanted = M.IsEnabled()
    if wanted == active then
        -- The interval or the breadcrumb toggle may still have changed.
        if breadcrumbFrame then
            if active and settings().breadcrumbs ~= false then breadcrumbFrame:Show() else breadcrumbFrame:Hide() end
        end
        return active
    end

    active = wanted

    if combatFrame then
        -- COMBAT_LOG_EVENT_UNFILTERED is the highest-frequency event in the game: only ask the
        -- client to dispatch it when there is an API to read the payload with.
        if active and combatLogInfoFunc() then
            combatFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        else
            combatFrame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        end
    end
    if breadcrumbFrame then
        if active and settings().breadcrumbs ~= false then breadcrumbFrame:Show() else breadcrumbFrame:Hide() end
    end

    if active then
        ensureStore()
        sessionClock = clock()
        M.StartSession()
        rebuildRelevance()
        Log.Debug("Telemetry", "recording enabled")
    else
        M.EndSession()
        wipe(questNpcs)
        wipe(questItems)
        wipe(objSnapshot)
        Log.Debug("Telemetry", "recording disabled")
    end
    return active
end

--- SetEnabled(bool): writes the setting and applies it (used by /pq and the options panel).
function M.SetEnabled(enabled)
    settings().enabled = enabled and true or false
    M.ApplySettings()
    return active
end

---------------------------------------------------------------------------
-- Status output for /pq sync
---------------------------------------------------------------------------

--- GetCounts() -> recorded, dropped (events since the current session started).
function M.GetCounts()
    return recordedCount, droppedCount
end

--- GetPendingSessionCount() -> how many stored sessions the server has not acknowledged yet.
function M.GetPendingSessionCount()
    local sessions = store and store.sessions
    if type(sessions) ~= "table" then return 0 end
    local ack = tonumber(store.ackUploadedThrough) or 0
    local pending = 0
    for i = 1, #sessions do
        local entry = sessions[i]
        if type(entry) == "table" then
            local finished = tonumber(entry["end"]) or tonumber(entry.start)
            if not finished or finished > ack then pending = pending + 1 end
        end
    end
    return pending
end

local function formatStamp(unix)
    if not unix or unix <= 0 then return nil end
    if date then
        local ok, text = pcall(date, "%Y-%m-%d %H:%M", unix)
        if ok and type(text) == "string" then return text end
    end
    return tostring(unix)
end

--- GetStatusLines() -> { string, ... } for the `/pq sync` slash command.
function M.GetStatusLines()
    local lines = {}
    ensureStore()

    lines[#lines + 1] = format(L["Telemetry: %s"], M.IsEnabled() and L["Enabled"] or L["Disabled"])
    if not M.IsEnabled() then
        lines[#lines + 1] = L["Nothing is recorded while telemetry is off. Re-enable it in /pq options."]
    end

    lines[#lines + 1] = format(L["Events recorded this session: %d (%d dropped)"], recordedCount, droppedCount)
    lines[#lines + 1] = format(L["Sessions stored: %d, waiting for upload: %d"],
        #store.sessions, M.GetPendingSessionCount())

    local ack = formatStamp(tonumber(store.ackUploadedThrough))
    lines[#lines + 1] = format(L["Last upload confirmed: %s"], ack or L["never"])

    local Community = ns.Community
    lines[#lines + 1] = (Community and Community.GetFreshnessText and Community.GetFreshnessText())
        or L["No community data yet."]

    return lines
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    buildLootPatterns()
    ensureStore()
end

function M.Enable()
    if not listener.RegisterEvent then return end

    if CreateFrame then
        combatFrame = CreateFrame("Frame")
        combatFrame:SetScript("OnEvent", onCombatLogEvent)

        breadcrumbFrame = CreateFrame("Frame")
        breadcrumbFrame:SetScript("OnUpdate", onBreadcrumbUpdate)
        breadcrumbFrame:Hide()
    end

    listener:RegisterEvent("QUEST_ACCEPTED", onQuestAccepted)
    listener:RegisterEvent("QUEST_TURNED_IN", onQuestTurnedIn)
    listener:RegisterEvent("QUEST_REMOVED", onQuestRemoved)
    listener:RegisterEvent("PLAYER_LEVEL_UP", onLevelUp)
    listener:RegisterEvent("PLAYER_DEAD", onPlayerDead)
    listener:RegisterEvent("CHAT_MSG_LOOT", onChatMsgLoot)
    listener:RegisterEvent("PLAYER_LOGOUT", function() M.EndSession() end)

    listener:RegisterMessage("PQ_QUESTLOG_CHANGED", onQuestLogChanged)
    listener:RegisterMessage("PQ_PLAYER_ZONE_CHANGED", onZoneChanged)
    listener:RegisterMessage("PQ_CURRENT_TARGET_CHANGED", onCurrentTargetChanged)
    listener:RegisterMessage("PQ_TARGET_REACHED", onTargetReached)
    listener:RegisterMessage("PQ_SETTING_CHANGED", function(_, path)
        if type(path) == "string" and path:sub(1, 16) == "global.telemetry" then
            M.ApplySettings()
        end
    end)

    sessionClock = clock()
    M.ApplySettings()
end

function M.OnDataReady()
    if not active then return end
    rebuildRelevance()
    -- The log was scanned before the database was ready, so seed the objective snapshots now.
    local QuestLog = ns.QuestLog
    if QuestLog and QuestLog.GetAll then
        for questID, entry in pairs(QuestLog.GetAll()) do
            if not objSnapshot[questID] then snapshotQuest(questID, entry) end
        end
    end
end

function M.OnProfileChanged()
    M.ApplySettings()
end
