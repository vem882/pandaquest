-- Quest/Catalog.lua: every quest in the database as one flat, filterable, sortable list.
--
-- The quest browser (UI/QuestBrowser.lua) is the only reader. The catalog turns DB rows into small
-- records once, in a background job, and answers filter/sort questions over them without touching the
-- database again. It holds no state about the player's quest log and sends no messages.
--
-- What a record carries (all plain values, so a few hundred thousand of them are cheap):
--   id, name, lower (name for searching), level, minLevel, area (zoneOrSort), races, classes,
--   qflags, sflags, side ("alliance" | "horde" | "both"), kind (see KIND_*), xp
--
-- Which database: whatever DB holds. When the QuestieDB bridge (Database/QuestieDB.lua) is on, its
-- rows are in DB already, so quests PandaQuest did not ship are listed too.
local _, ns = ...

local M = {}
ns.QuestCatalog = M

local Schema, Log = ns.Schema, ns.Log

local type, pairs, ipairs, tostring, tonumber = type, pairs, ipairs, tostring, tonumber
local lower, find = string.lower, string.find
local tsort = table.sort
local band = bit and bit.band

local QF, SF, SORT, RACE = Schema.questFlags, Schema.specialFlags, Schema.sortKeys, Schema.raceKeys

---------------------------------------------------------------------------
-- Classification
---------------------------------------------------------------------------

--- The kinds a quest can be filtered by (a quest has at most one; "normal" matches no kind button).
M.KINDS = { "dungeon", "raid", "group", "pvp", "daily", "event" }

-- Blizzard quest tag ids that PandaQuest's database already uses (DB.GetQuestTagInfo).
local TAG_GROUP, TAG_PVP, TAG_RAID, TAG_DUNGEON = 1, 41, 62, 81

local CLASS_SORTS = {
    [SORT.WARLOCK] = true, [SORT.WARRIOR] = true, [SORT.SHAMAN] = true, [SORT.PALADIN] = true,
    [SORT.MAGE] = true, [SORT.ROGUE] = true, [SORT.HUNTER] = true, [SORT.PRIEST] = true,
    [SORT.DRUID] = true, [SORT.DEATHKNIGHT] = true, [SORT.MONK] = true,
}
local PROFESSION_SORTS = {
    [SORT.HERBALISM] = true, [SORT.FISHING] = true, [SORT.BLACKSMITHING] = true, [SORT.ALCHEMY] = true,
    [SORT.LEATHERWORKING] = true, [SORT.ENGINEERING] = true, [SORT.TAILORING] = true,
    [SORT.COOKING] = true, [SORT.FIRST_AID] = true, [SORT.INSCRIPTION] = true,
    [SORT.JEWELCRAFTING] = true, [SORT.ARCHAEOLOGY] = true,
}

local function hasFlag(value, flag)
    return type(value) == "number" and band and band(value, flag) ~= 0
end

--- sideOf(races) -> "alliance" | "horde" | "both"
-- A quest for no race in particular, or for races of both factions, is "both".
local function sideOf(races)
    if type(races) ~= "number" or races == 0 or not band then return "both" end
    if band(races, RACE.ALL_ALLIANCE) == races then return "alliance" end
    if band(races, RACE.ALL_HORDE) == races then return "horde" end
    return "both"
end
M.SideOf = sideOf

--- The category a negative zoneOrSort belongs to: "classes" | "professions" | "events".
local function sortGroup(sort)
    if sort == SORT.BATTLEGROUNDS then return "battlegrounds" end
    if CLASS_SORTS[sort] then return "classes" end
    if PROFESSION_SORTS[sort] then return "professions" end
    return "events"
end
M.SortGroup = sortGroup

local function kindOf(area, qflags, sflags, tagID, isDaily)
    if hasFlag(qflags, QF.RAID) or tagID == TAG_RAID then return "raid" end
    if tagID == TAG_PVP or area == SORT.BATTLEGROUNDS then return "pvp" end
    local Zones = ns.Zones
    if tagID == TAG_DUNGEON or (type(area) == "number" and area > 0 and Zones and Zones.IsDungeonArea(area)) then
        return "dungeon"
    end
    if tagID == TAG_GROUP then return "group" end
    if isDaily or hasFlag(qflags, QF.WEEKLY) or hasFlag(sflags, SF.REPEATABLE) then return "daily" end
    if type(area) == "number" and area < 0 and sortGroup(area) == "events" then return "event" end
    return "normal"
end

---------------------------------------------------------------------------
-- Building
---------------------------------------------------------------------------

local records, byId = nil, nil
local building, ready = false, false
local generation = 0            -- bumped by Invalidate, so a running build can tell it is stale

local function xpFor(id)
    local Data = ns.Data
    local entry = Data and Data.questXP and Data.questXP[id]
    return type(entry) == "table" and tonumber(entry[2]) or nil
end

local function makeRecord(DB, id)
    local name = DB.GetQuestField(id, "name")
    if type(name) ~= "string" or name == "" then return nil end
    local area = DB.GetQuestField(id, "zoneOrSort")
    local races = DB.GetQuestField(id, "requiredRaces")
    local qflags = DB.GetQuestField(id, "questFlags")
    local sflags = DB.GetQuestField(id, "specialFlags")
    local tagID = DB.GetQuestTagInfo(id)
    return {
        id = id,
        name = name,
        lower = lower(name),
        level = DB.GetQuestField(id, "questLevel") or 0,
        minLevel = DB.GetQuestField(id, "requiredLevel") or 0,
        area = type(area) == "number" and area or 0,
        races = races or 0,
        classes = DB.GetQuestField(id, "requiredClasses") or 0,
        qflags = qflags or 0,
        sflags = sflags or 0,
        side = sideOf(races),
        kind = kindOf(area, qflags, sflags, tagID, hasFlag(qflags, QF.DAILY)),
        xp = xpFor(id),
    }
end

local function runBuild(token)
    local DB = ns.DB
    local list, index, n = {}, {}, 0
    local Thread = ns.Thread
    local count = 0
    for id in DB.IterateQuestIDs() do
        local record = makeRecord(DB, id)
        if record then
            n = n + 1
            list[n] = record
            index[id] = record
        end
        count = count + 1
        if count % 400 == 0 and Thread and Thread.Yield then
            Thread.Yield()
            if token ~= generation then return end      -- invalidated while we were yielding
        end
    end
    tsort(list, function(a, b) return a.id < b.id end)
    records, byId = list, index
    building, ready = false, true
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then PQ:SendMessage("PQ_CATALOG_READY") end
end

--- Build() -> bool started. Idempotent; the work runs as a ns.Thread job (or inline without frames).
function M.Build()
    if ready or building then return true end
    local DB = ns.DB
    if not (DB and DB.IsReady and DB.IsReady() and DB.IterateQuestIDs) then return false end
    building = true
    local token = generation
    local Thread = ns.Thread
    if Thread and Thread.Run then
        local ok, err = pcall(Thread.Run, function() runBuild(token) end, { name = "QuestCatalog", pauseInCombat = false })
        if not ok then
            building = false
            Log.Error("Catalog", "cannot start the catalog build: %s", tostring(err))
            return false
        end
    else
        runBuild(token)
    end
    return true
end

function M.IsReady() return ready end
function M.IsBuilding() return building end

--- Invalidate(): drop the list (the database changed under us). The next Build() starts over.
function M.Invalidate()
    generation = generation + 1
    records, byId, ready, building = nil, nil, false, false
    M.areaCache = nil
end

--- Get(questID) -> record|nil
function M.Get(questID)
    return byId and byId[questID] or nil
end

--- Count() -> number of quests listed
function M.Count()
    return records and #records or 0
end

---------------------------------------------------------------------------
-- Categories (the tree on the left)
---------------------------------------------------------------------------

local continentOf = {}          -- areaID -> continent uiMapID | false

local function resolveContinent(area)
    local cached = continentOf[area]
    if cached ~= nil then return cached or nil end
    local result = false
    local Zones = ns.Zones
    local uiMapID = Zones and Zones.GetUiMapIdByAreaId and Zones.GetUiMapIdByAreaId(area)
    local hops = 0
    while uiMapID and hops < 8 and C_Map and C_Map.GetMapInfo do
        local info = C_Map.GetMapInfo(uiMapID)
        if not info then break end
        if info.mapType == 2 then       -- Enum.UIMapType.Continent
            result = uiMapID
            break
        end
        uiMapID = info.parentMapID
        hops = hops + 1
    end
    continentOf[area] = result
    return result or nil
end

local function mapName(uiMapID)
    local info = C_Map and C_Map.GetMapInfo and C_Map.GetMapInfo(uiMapID)
    return info and info.name or tostring(uiMapID)
end

--- CategoryOf(record) -> categoryKey, zoneKey|nil
-- categoryKey is "continent:<uiMapID>", "dungeons", "raids", "battlegrounds", "classes",
-- "professions", "events" or "other".
function M.CategoryOf(record)
    local area = record.area
    if area < 0 then
        local group = sortGroup(area)
        return group, area
    end
    if record.kind == "raid" then return "raids", area end
    if record.kind == "dungeon" then return "dungeons", area end
    if area == 0 then return "other", nil end
    local continent = resolveContinent(area)
    if continent then return "continent:" .. continent, area end
    return "other", area
end

local TOP_ORDER = { "dungeons", "raids", "battlegrounds", "classes", "professions", "events", "other" }
local TOP_NAMES = {
    dungeons = "Dungeons", raids = "Raids", battlegrounds = "Battlegrounds", classes = "Classes",
    professions = "Professions", events = "Events and more", other = "Other",
}

local function prettySort(sort)
    local names = M.sortNames
    if not names then
        names = {}
        for key, value in pairs(SORT) do names[value] = key end
        M.sortNames = names
    end
    local key = names[sort]
    if not key then return tostring(sort) end
    local words = {}
    for word in key:gmatch("[^_]+") do
        words[#words + 1] = word:sub(1, 1) .. lower(word:sub(2))
    end
    return table.concat(words, " ")
end

local function zoneLabel(categoryKey, zone)
    if type(zone) ~= "number" or zone == 0 then return nil end
    if zone < 0 then return prettySort(zone) end
    local Zones = ns.Zones
    return Zones and Zones.GetAreaName(zone) or tostring(zone)
end
M.ZoneLabel = zoneLabel

--- GetTree(visible) -> { { key =, name =, count =, zones = { { key=, name=, count= }, ... } }, ... }
-- `visible(record)` decides what is counted, so the tree shows what the other filters leave.
function M.GetTree(visible)
    if not records then return {} end
    local top, zonesOf = {}, {}
    for _, record in ipairs(records) do
        if not visible or visible(record) then
            local key, zone = M.CategoryOf(record)
            local entry = top[key]
            if not entry then
                entry = { key = key, count = 0 }
                top[key] = entry
                zonesOf[key] = {}
            end
            entry.count = entry.count + 1
            if zone then
                local z = zonesOf[key][zone]
                if not z then
                    z = { key = zone, count = 0, name = zoneLabel(key, zone) }
                    zonesOf[key][zone] = z
                end
                z.count = z.count + 1
            end
        end
    end

    local out = {}
    local continents = {}
    for key, entry in pairs(top) do
        local uiMapID = key:match("^continent:(%d+)$")
        if uiMapID then
            entry.name = mapName(tonumber(uiMapID))
            continents[#continents + 1] = entry
        end
    end
    tsort(continents, function(a, b) return a.name < b.name end)
    for _, entry in ipairs(continents) do out[#out + 1] = entry end
    for _, key in ipairs(TOP_ORDER) do
        local entry = top[key]
        if entry then
            entry.name = TOP_NAMES[key]
            out[#out + 1] = entry
        end
    end
    for _, entry in ipairs(out) do
        local zones = {}
        for _, z in pairs(zonesOf[entry.key]) do zones[#zones + 1] = z end
        tsort(zones, function(a, b) return (a.name or "") < (b.name or "") end)
        entry.zones = zones
    end
    return out
end

---------------------------------------------------------------------------
-- Querying
---------------------------------------------------------------------------

--- Matches(record, filter) -> bool
-- filter = { text, minLevel, maxLevel, side = "alliance"|"horde"|"both"|nil (any),
--            kinds = { dungeon = true, ... } | nil, category = key|nil, zone = areaID|nil,
--            playerLevel = n|nil (only quests the player can already take), classMask = n|nil }
function M.Matches(record, filter)
    if filter.text and filter.text ~= "" and not find(record.lower, filter.text, 1, true) then return false end
    if filter.minLevel and record.level < filter.minLevel then return false end
    if filter.maxLevel and record.level > filter.maxLevel then return false end
    if filter.side then
        -- "alliance" shows Alliance and neutral quests; "horde" Horde and neutral ones.
        if record.side ~= "both" and record.side ~= filter.side then return false end
    end
    if filter.kinds and next(filter.kinds) ~= nil and not filter.kinds[record.kind] then return false end
    if filter.playerLevel and record.minLevel > filter.playerLevel then return false end
    if filter.classMask and record.classes ~= 0 and band and band(record.classes, filter.classMask) == 0 then
        return false
    end
    if filter.category then
        local key, zone = M.CategoryOf(record)
        if key ~= filter.category then return false end
        if filter.zone and zone ~= filter.zone then return false end
    end
    return true
end

local function byName(a, b)
    if a.lower ~= b.lower then return a.lower < b.lower end
    return a.id < b.id
end
local function byLevel(a, b)
    if a.level ~= b.level then return a.level < b.level end
    return byName(a, b)
end
local function byMinLevel(a, b)
    if a.minLevel ~= b.minLevel then return a.minLevel < b.minLevel end
    return byName(a, b)
end
local function byXp(a, b)
    local ax, bx = a.xp or -1, b.xp or -1
    if ax ~= bx then return ax < bx end
    return byName(a, b)
end
local function byZone(a, b)
    local az, bz = zoneLabel(nil, a.area) or "", zoneLabel(nil, b.area) or ""
    if az ~= bz then return az < bz end
    return byName(a, b)
end
M.SORT_COLUMNS = { "name", "zone", "level", "minLevel", "xp" }
local COMPARATORS = { name = byName, zone = byZone, level = byLevel, minLevel = byMinLevel, xp = byXp }

--- Query(filter, sortKey, descending) -> array of records (a new array; the records are shared)
function M.Query(filter, sortKey, descending)
    local out = {}
    if not records then return out end
    filter = filter or {}
    for _, record in ipairs(records) do
        if M.Matches(record, filter) then out[#out + 1] = record end
    end
    local compare = COMPARATORS[sortKey] or byLevel
    if descending then
        tsort(out, function(a, b) return compare(b, a) end)
    else
        tsort(out, compare)
    end
    return out
end

--- Players "side" filter default: the player's faction, or nil (any) for a neutral Pandaren.
function M.PlayerSide()
    local Player = ns.Player
    local faction = Player and Player.GetFaction and Player.GetFaction()
    if faction == "Alliance" then return "alliance" end
    if faction == "Horde" then return "horde" end
    return nil
end

return M
