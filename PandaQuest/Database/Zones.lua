-- Database/Zones.lua: areaID <-> uiMapID translation and dungeon entrances (docs/06 section 7).
-- The database stores coordinates as areaID + x,y in 0..100; every map-facing module needs a uiMapID,
-- so this is the single place that bridges the two id spaces.
--
-- Data comes from Database/ZoneData.lua (ns.Data.areaIdToUiMapId, uiMapIdToAreaId, subZoneToParentZone,
-- dungeons, instanceIdToAreaId, zoneNames, zoneIds). Lookups are cached; ids that cannot be resolved are
-- logged once each at debug level so a broken zone shows up in /pq debug 3 without spamming the chat.
local _, ns = ...

local Zones = {}
ns.Zones = Zones

local Log = ns.Log

local type, tostring, pairs, ipairs, next = type, tostring, pairs, ipairs, next

local MAX_PARENT_HOPS = 8           -- guards against a cycle in subZoneToParentZone

local uiMapCache = {}               -- areaID -> uiMapID | false (false = resolved to "nothing")
local areaCache = {}                -- uiMapID -> areaID | false
local entranceCache = {}            -- areaID -> {areaID=, x=, y=} | false
local unmappedLogged = {}           -- areaID/uiMapID -> true, one debug line per id
local altToDungeon                  -- alternativeAreaId -> dungeon areaID, built on first use
local nameToAreaId                  -- lowercased zone name -> areaID, built on first use
local lastFaction                   -- "Alliance"|"Horde" the entrance cache was built for

---------------------------------------------------------------------------
-- Data access helpers. ns.Data may be missing entirely (Data/*.lua not installed).
---------------------------------------------------------------------------

local EMPTY = {}

local function data(name)
    local d = ns.Data
    local t = d and d[name]
    if type(t) == "table" then return t end
    return EMPTY
end

-- Dungeon entry layout: { name, alternativeAreaIds|nil, parentAreaId, {{areaId,x,y}...} Alliance, [5] Horde }
local function dungeons()
    return data("dungeons")
end

local function buildAltMap()
    if altToDungeon then return altToDungeon end
    altToDungeon = {}
    for areaID, entry in pairs(dungeons()) do
        local alternatives = entry[2]
        if type(alternatives) == "table" then
            for _, altID in ipairs(alternatives) do
                altToDungeon[altID] = areaID
            end
        end
    end
    return altToDungeon
end

local function logUnmapped(kind, id)
    local key = kind .. tostring(id)
    if unmappedLogged[key] then return end
    unmappedLogged[key] = true
    if Log and Log.Debug then
        Log.Debug("Zones", "no %s found for %s %s", kind == "area" and "uiMapID" or "areaID", kind, tostring(id))
    end
end

local function playerFaction()
    if UnitFactionGroup then
        local faction = UnitFactionGroup("player")
        if faction == "Horde" or faction == "Alliance" then return faction end
    end
    return "Alliance"
end

---------------------------------------------------------------------------
-- Lifecycle (Core/Init.lua CallModules). Only clears caches; the data tables are already loaded.
---------------------------------------------------------------------------

function Zones.Init()
    Zones.ResetCache()
end

function Zones.ResetCache()
    for k in pairs(uiMapCache) do uiMapCache[k] = nil end
    for k in pairs(areaCache) do areaCache[k] = nil end
    for k in pairs(entranceCache) do entranceCache[k] = nil end
    for k in pairs(unmappedLogged) do unmappedLogged[k] = nil end
    altToDungeon = nil
    nameToAreaId = nil
    lastFaction = nil
end

---------------------------------------------------------------------------
-- areaID -> uiMapID
---------------------------------------------------------------------------

-- Walks C_Map's parent chain from a uiMapID until a map we know about is found. Micro-dungeon maps
-- (mapType 4/5) have no entry in uiMapIdToAreaId, but their parent world map does.
local function ascendUiMapParents(uiMapID)
    if not (C_Map and C_Map.GetMapInfo) then return nil end
    local known = data("uiMapIdToAreaId")
    local id, hops = uiMapID, 0
    while id and hops < MAX_PARENT_HOPS do
        local info = C_Map.GetMapInfo(id)
        if not info then return nil end
        if known[id] then return id end
        id = info.parentMapID
        if not id or id == 0 then return nil end
        hops = hops + 1
    end
    return nil
end

--- Zones.GetUiMapIdByAreaId(areaID) -> uiMapID|nil
-- Resolution order: direct table, dungeon alias/parent, subZoneToParentZone chain, C_Map parent chain.
function Zones.GetUiMapIdByAreaId(areaID)
    if type(areaID) ~= "number" then return nil end
    local cached = uiMapCache[areaID]
    if cached ~= nil then
        if cached == false then return nil end
        return cached
    end

    local direct = data("areaIdToUiMapId")
    local uiMapID = direct[areaID]

    if not uiMapID then
        -- A dungeon's alternative areaID (e.g. the individual Scarlet Monastery wings) maps to the
        -- dungeon itself, and the dungeon in turn sits inside a world zone.
        local dungeonID = buildAltMap()[areaID]
        local entry = dungeons()[dungeonID or areaID]
        if entry then
            uiMapID = direct[dungeonID or areaID] or direct[entry[3]]
        end
    end

    if not uiMapID then
        -- Sub zones (inns, camps, caves) are not map ids of their own; climb to the parent zone.
        local subZones = data("subZoneToParentZone")
        local current, hops = areaID, 0
        while not uiMapID and hops < MAX_PARENT_HOPS do
            local parent = subZones[current]
            if not parent or parent == current then break end
            uiMapID = direct[parent]
            current = parent
            hops = hops + 1
        end
    end

    if not uiMapID then
        -- Last resort: a handful of MoP scenario/instance areas reuse their uiMapID as the areaID.
        uiMapID = ascendUiMapParents(areaID)
    end

    if not uiMapID then
        uiMapCache[areaID] = false
        logUnmapped("area", areaID)
        return nil
    end
    uiMapCache[areaID] = uiMapID
    return uiMapID
end

---------------------------------------------------------------------------
-- uiMapID -> areaID
---------------------------------------------------------------------------

local function buildNameIndex()
    if nameToAreaId then return nameToAreaId end
    nameToAreaId = {}
    for areaID, name in pairs(data("zoneNames")) do
        if type(name) == "string" then
            local key = name:lower()
            -- Sub areas share their zone's name; the zone always has the lower id, so keep that one.
            local existing = nameToAreaId[key]
            if not existing or areaID < existing then nameToAreaId[key] = areaID end
        end
    end
    return nameToAreaId
end

--- Zones.GetAreaIdByUiMapId(uiMapID) -> areaID|nil
function Zones.GetAreaIdByUiMapId(uiMapID)
    if type(uiMapID) ~= "number" then return nil end
    local cached = areaCache[uiMapID]
    if cached ~= nil then
        if cached == false then return nil end
        return cached
    end

    local areaID = data("uiMapIdToAreaId")[uiMapID]

    if not areaID and C_Map and C_Map.GetMapInfo then
        -- Match by name against the shipped enUS names instead of scanning
        -- C_Map.GetAreaInfo for every known areaID (that is thousands of API calls).
        local info = C_Map.GetMapInfo(uiMapID)
        if info and type(info.name) == "string" then
            areaID = buildNameIndex()[info.name:lower()]
        end
        if not areaID and info and info.parentMapID and info.parentMapID ~= 0 then
            areaID = data("uiMapIdToAreaId")[info.parentMapID]
        end
    end

    if not areaID then
        areaCache[uiMapID] = false
        logUnmapped("uiMap", uiMapID)
        return nil
    end
    areaCache[uiMapID] = areaID
    return areaID
end

---------------------------------------------------------------------------
-- Parents and dungeons
---------------------------------------------------------------------------

--- Zones.GetParentAreaId(areaID) -> areaID|nil
function Zones.GetParentAreaId(areaID)
    if type(areaID) ~= "number" then return nil end
    local dungeonID = buildAltMap()[areaID]
    if dungeonID then return dungeonID end
    local parent = data("subZoneToParentZone")[areaID]
    if parent then return parent end
    local entry = dungeons()[areaID]
    if entry then return entry[3] end
    return nil
end

--- Zones.IsDungeonArea(areaID) -> bool
function Zones.IsDungeonArea(areaID)
    if type(areaID) ~= "number" then return false end
    return dungeons()[areaID] ~= nil or buildAltMap()[areaID] ~= nil
end

--- Zones.GetDungeonEntrance(areaID) -> {areaID=, x=, y=}|nil
-- Resolves a {-1,-1} spawn: the NPC is inside an instance, so point at the instance portal instead.
-- Entry field 4 holds the Alliance entrances and field 5 the Horde ones when they differ
-- (Alterac Valley, Warsong Gulch, Arathi Basin); everything else shares field 4.
function Zones.GetDungeonEntrance(areaID)
    if type(areaID) ~= "number" then return nil end
    local faction = playerFaction()
    if faction ~= lastFaction then
        -- Faction can only change between characters, but the cache must not survive a /reload-less swap.
        for k in pairs(entranceCache) do entranceCache[k] = nil end
        lastFaction = faction
    end
    local cached = entranceCache[areaID]
    if cached ~= nil then
        if cached == false then return nil end
        return cached
    end

    local dungeonID = dungeons()[areaID] and areaID or buildAltMap()[areaID]
    local entry = dungeonID and dungeons()[dungeonID]
    if not entry then
        entranceCache[areaID] = false
        return nil
    end

    local list = (faction == "Horde" and entry[5]) or entry[4]
    local spot = list and list[1]
    if not spot then
        entranceCache[areaID] = false
        return nil
    end

    local result = { areaID = spot[1], x = spot[2], y = spot[3] }
    entranceCache[areaID] = result
    return result
end

--- Zones.ResolveSpawn(areaID, x, y) -> areaID, x, y | nil
-- Database coordinates use {-1,-1} for "inside this instance". Callers that need a point on a world
-- map run every spawn through this: an instance spawn becomes the instance portal, everything else
-- passes through unchanged. Returns nil when the instance has no known entrance.
function Zones.ResolveSpawn(areaID, x, y)
    if x == -1 and y == -1 then
        local entrance = Zones.GetDungeonEntrance(areaID)
        if not entrance then return nil end
        return entrance.areaID, entrance.x, entrance.y
    end
    return areaID, x, y
end

--- Zones.GetDungeonEntrances(areaID) -> {{areaID=, x=, y=},...}|nil
-- Some instances have two portals (Blackrock Mountain); Map/Pins draws all of them.
function Zones.GetDungeonEntrances(areaID)
    if type(areaID) ~= "number" then return nil end
    local dungeonID = dungeons()[areaID] and areaID or buildAltMap()[areaID]
    local entry = dungeonID and dungeons()[dungeonID]
    if not entry then return nil end
    local list = (playerFaction() == "Horde" and entry[5]) or entry[4]
    if not list then return nil end
    local out = {}
    for i = 1, #list do
        local spot = list[i]
        out[i] = { areaID = spot[1], x = spot[2], y = spot[3] }
    end
    return out
end

---------------------------------------------------------------------------
-- Names and the player's position
---------------------------------------------------------------------------

--- Zones.GetAreaName(areaID) -> string
-- Prefers the client's localized name; falls back to the dungeon table and then the shipped enUS names.
function Zones.GetAreaName(areaID)
    if type(areaID) ~= "number" then return tostring(areaID) end
    if C_Map and C_Map.GetAreaInfo then
        local name = C_Map.GetAreaInfo(areaID)
        if type(name) == "string" and name ~= "" then return name end
    end
    local entry = dungeons()[areaID]
    if entry and type(entry[1]) == "string" then return entry[1] end
    local name = data("zoneNames")[areaID]
    if type(name) == "string" then return name end
    return tostring(areaID)
end

--- Zones.GetPlayerAreaId() -> areaID|nil
function Zones.GetPlayerAreaId()
    if not (C_Map and C_Map.GetBestMapForUnit) then return nil end
    local uiMapID = C_Map.GetBestMapForUnit("player")
    if not uiMapID then return nil end
    return Zones.GetAreaIdByUiMapId(uiMapID)
end

--- Zones.GetAreaIdByInstanceId(instanceID) -> areaID|nil  (GetInstanceInfo() 8th return)
function Zones.GetAreaIdByInstanceId(instanceID)
    if type(instanceID) ~= "number" then return nil end
    return data("instanceIdToAreaId")[instanceID] or nil
end

--- Zones.GetZoneId(name) -> areaID|nil  ("THE_JADE_FOREST" style constants from ns.Data.zoneIds)
function Zones.GetZoneId(constant)
    if type(constant) ~= "string" then return nil end
    return data("zoneIds")[constant]
end

--- Zones.HasData() -> bool. False when Database/ZoneData.lua was not installed.
function Zones.HasData()
    return next(data("areaIdToUiMapId")) ~= nil
end
