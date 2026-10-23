-- Nav/Waypoint.lua: waypoints in the game world, as far as Mists of Pandaria Classic lets an addon.
--
-- WHAT THE CLIENT CAN DO. Putting a marker ON a place in the 3D world needs the client to project
-- that place to the screen. Retail hands addons that projection through C_Navigation.GetFrame() (the
-- frame its super-tracked waypoint is drawn on), with C_Map.SetUserWaypoint and C_SuperTrack to choose
-- the place. The 5.5.4 client has none of them: its generated API documentation (Gethe/wow-ui-source,
-- branch "classic", 5.5.4 builds 69585 and 70469) has no InGameNavigation or SuperTrackManager
-- system, C_Map has no user waypoint, and the global list (Ketho's BlizzardInterfaceResources,
-- "classic", 5.5.4.69155) agrees -- only GetSuperTrackedQuestID/SetSuperTrackedQuestID are there,
-- and they choose which quest the map and minimap highlight. The camera's position, pitch and field
-- of view cannot be read either, so a projection cannot be computed by hand.
--
-- What the client does keep on screen over a place in the world is a NAMEPLATE. So:
--   * Pinpoint: when the waypoint is an NPC -- the quest's hand-in NPC, or its giver -- and that
--     NPC's nameplate is up, the quest's name and what to do there ("Ready for turn-in") float over
--     it in a framed label with chevrons pointing down at it. It is anchored to the nameplate: the
--     client moves it, nothing here runs per frame to place it.
--   * Beam: a column of light rising from the same nameplate while the NPC is further away than the
--     Pinpoint distance, with the badge and the distance at its foot. ONLY there. A beam at a map
--     coordinate would have to be guessed from the player's facing, and a beam in the wrong place is
--     worse than none.
--   * Card: the badge, the distance and the travel time, riding on the arrow (ns.Arrow) -- the part
--     of "show the way" that needs no projection.
--   * /way [zone] x y [label], TomTom's syntax, registered only when no other addon owns /way. With
--     TomTom installed, /way stays TomTom's and the waypoint its arrow follows is shown here instead.
--
-- Friendly NPCs have nameplates only when the player has them switched on (nameplateShowFriendlyNpcs),
-- and they reach addons outdoors; the options say so and offer a button. Nothing here changes a CVar on
-- its own, nothing touches a protected frame, and nothing waits for or avoids combat: these are plain
-- textures and font strings.
--
-- Animations are AnimationGroups (the client plays them; no Lua runs per frame for them) and are left
-- out when the player switched motion off (UI/Motion.lua). The two OnUpdate scripts belong to frames
-- that are only shown while there is a waypoint to show, and they redraw text at most five times a
-- second.
--
-- Saved data: profile.waypoint (the options) and char.waypoint (the point or quest the player asked
-- for). Both are new keys; nothing that was saved before is moved or rewritten.
local _, ns = ...
local L = ns.L

local Util, Log, Compat = ns.Util, ns.Log, ns.Compat

local type, tonumber, tostring, pairs, ipairs, pcall = type, tonumber, tostring, pairs, ipairs, pcall
local floor, huge = math.floor, math.huge
local format = string.format
local tconcat, tsort = table.concat, table.sort

---------------------------------------------------------------------------
-- Defaults: new keys only
---------------------------------------------------------------------------

ns.DEFAULTS.profile.waypoint = ns.DEFAULTS.profile.waypoint or {
    enabled = true,
    auto = true,                -- follow the super-tracked quest, else the arrow's target
    objectives = false,         -- also mark an unfinished quest's objective area
    followTomTom = true,        -- with TomTom installed, show the waypoint its arrow follows
    card = true,                -- badge + distance + time on the arrow
    pinpoint = true,            -- framed label + chevrons over the NPC's nameplate
    pinpointDistance = 20,      -- yards: closer than this the beam gives way to the label
    beam = true,                -- light column over the NPC's nameplate (never anywhere else)
    beamColor = { r = 1, g = 0.82, b = 0.32 },
    scale = 1,
    clearOnArrival = true,      -- a /way point is forgotten once you walk up to it
}
-- char.waypoint = { point = {uiMapID, x, y, label}, questID, customKey, pinnedKey, previousPin }, all
-- optional.
ns.DEFAULTS.char.waypoint = ns.DEFAULTS.char.waypoint or {}

---------------------------------------------------------------------------
-- The module
---------------------------------------------------------------------------

local PQ = ns.PQ
local M = (PQ.GetModule and PQ:GetModule("Waypoint", true))
    or PQ:NewModule("Waypoint", "AceEvent-3.0", "AceTimer-3.0", "AceConsole-3.0")
if not M.RegisterChatCommand then
    local AceConsole = LibStub("AceConsole-3.0", true)
    if AceConsole then AceConsole:Embed(M) end
end
ns.Waypoint = M

local TEX = "Interface\\AddOns\\PandaQuest\\Textures\\"
local WP_TEX = TEX .. "Waypoint\\"

local TEXT_INTERVAL = 0.2           -- distance and time text: at most 5 times a second
local RESOLVE_DELAY = 0.1           -- a burst of messages becomes one resolve
local REFRESH_INTERVAL = 1.0        -- while a waypoint exists: taxi/instance, nearest spawn, TomTom
local PINPOINT_HYSTERESIS = 2       -- yards; the label does not flicker on the threshold
local BEAM_FADE_RANGE = 15          -- yards past the threshold over which the beam fades in
local MAX_NAMEPLATES = 40
local WAY_COMMAND = "way"
local GOLD = { 1, 0.82, 0.3 }
local READY = { 0.45, 1, 0.45 }

M.TEXT_INTERVAL = TEXT_INTERVAL
M.stats = { card = 0, marker = 0, resolves = 0 }    -- redraw counters, read by the tests

local function profile()
    local p = ns.PQ and ns.PQ.db and ns.PQ.db.profile
    return (p and p.waypoint) or ns.DEFAULTS.profile.waypoint
end

local function charStore()
    local c = ns.PQ and ns.PQ.db and ns.PQ.db.char
    if not c then return nil end
    if type(c.waypoint) ~= "table" then c.waypoint = {} end
    return c.waypoint
end

local HBD
local function hbd()
    if HBD == nil then HBD = (LibStub and LibStub("HereBeDragons-2.0", true)) or false end
    return HBD or nil
end

local function motionOn()
    return ns.Motion == nil or ns.Motion.IsEnabled()
end

---------------------------------------------------------------------------
-- Small pure helpers (the tests call these directly)
---------------------------------------------------------------------------

--- FormatCoords(x, y) -> "X: 35.0, Y: 79.0" (x, y in 0..100)
function M.FormatCoords(x, y)
    return format(L["X: %.1f, Y: %.1f"], tonumber(x) or 0, tonumber(y) or 0)
end

--- NpcIdFromGuid(guid) -> npcID|nil
function M.NpcIdFromGuid(guid)
    if (Compat and Compat.IsSecret and Compat.IsSecret(guid)) or type(guid) ~= "string" then return nil end
    return Util.NpcIdFromGuid(guid)
end

--- IsPinpoint(distance, threshold, wasPinpoint) -> bool. Inside the threshold the label shows; once
-- it shows, it stays until PINPOINT_HYSTERESIS yards further out. No distance (the nameplate is up but
-- the player has no map position) means close: a nameplate is never far away.
function M.IsPinpoint(distance, threshold, wasPinpoint)
    threshold = tonumber(threshold) or 20
    if type(distance) ~= "number" then return true end
    if wasPinpoint then return distance <= threshold + PINPOINT_HYSTERESIS end
    return distance <= threshold
end

--- BeamAlpha(distance, threshold) -> 0.3..1: the beam fades as the player closes in on the label.
function M.BeamAlpha(distance, threshold)
    if type(distance) ~= "number" then return 1 end
    return Util.Clamp((distance - (tonumber(threshold) or 20)) / BEAM_FADE_RANGE, 0.3, 1)
end

--- NearestSpawn(spawns, pos) -> spawn, yards | nil
-- spawns = { {areaID=, x=, y= [, uiMapID=]}, ... } (x, y in 0..100), pos = Player.GetPosition().
-- A spawn in the zone the player stands in beats any other; among equals the nearest wins. Spawns on
-- another continent are never chosen (no straight line to them means nothing to measure).
function M.NearestSpawn(spawns, pos)
    local lib = hbd()
    if type(spawns) ~= "table" or not lib or type(pos) ~= "table" or not pos.worldX then return nil end
    local Zones = ns.Zones
    local best, bestDistance, bestLocal
    for i = 1, #spawns do
        local spawn = spawns[i]
        if type(spawn) == "table" and type(spawn.x) == "number" and type(spawn.y) == "number" then
            local uiMapID = spawn.uiMapID
            if not uiMapID and spawn.areaID and Zones and Zones.GetUiMapIdByAreaId then
                uiMapID = Zones.GetUiMapIdByAreaId(spawn.areaID)
            end
            local wx, wy, instanceID
            if uiMapID then wx, wy, instanceID = lib:GetWorldCoordinatesFromZone(spawn.x / 100, spawn.y / 100, uiMapID) end
            if wx and instanceID == pos.instanceID then
                local distance = lib:GetWorldDistance(instanceID, pos.worldX, pos.worldY, wx, wy)
                local isLocal = (uiMapID == pos.uiMapID) or (spawn.areaID ~= nil and spawn.areaID == pos.areaID)
                if distance and (not best or (isLocal and not bestLocal)
                        or (isLocal == bestLocal and distance < bestDistance)) then
                    best, bestDistance, bestLocal = spawn, distance, isLocal
                end
            end
        end
    end
    return best, bestDistance
end

---------------------------------------------------------------------------
-- What the waypoint is
---------------------------------------------------------------------------
-- A waypoint is a description of our own, never one of the Target tables Nav/Targets shares:
--   { key, kind = "turnin"|"pickup"|"objective"|"point", source, questID, title, state, icon,
--     uiMapID, x, y (0..100), areaID, npcID, objectID, targetKey }

local function questLog() return ns.QuestLog end

local function inLog(questID)
    local QuestLog = questLog()
    if not QuestLog then return false end
    if QuestLog.GetQuest and QuestLog.GetQuest(questID) then return true end
    return QuestLog.IsOnQuest ~= nil and QuestLog.IsOnQuest(questID) == true
end

-- The same rule Nav/Targets uses: Blizzard's flag, or every objective finished (or none at all).
local function isComplete(questID)
    local QuestLog = questLog()
    if not QuestLog then return false end
    if QuestLog.IsComplete and QuestLog.IsComplete(questID) then return true end
    local entry = QuestLog.GetQuest and QuestLog.GetQuest(questID)
    local objectives = entry and entry.objectives
    if type(objectives) ~= "table" then return false end
    for i = 1, #objectives do
        if not objectives[i].finished then return false end
    end
    return true
end

local function turnedIn(questID)
    local Player = ns.Player
    return Player ~= nil and Player.IsQuestCompleted ~= nil and Player.IsQuestCompleted(questID) == true
end

local function questTargets(questID)
    local Targets = ns.Targets
    return (Targets and Targets.GetForQuest and Targets.GetForQuest(questID)) or {}
end

local function distanceTo(target)
    local Router = ns.Router
    return Router and Router.GetDistanceTo and Router.GetDistanceTo(target) or nil
end

local function targetOfKind(questID, kind)
    for _, target in ipairs(questTargets(questID)) do
        if target.kind == kind then return target end
    end
    return nil
end

local function turnInTarget(questID)
    local target = targetOfKind(questID, "TURNIN")
    if target then return target end
    local Objectives = ns.Objectives
    return Objectives and Objectives.BuildTurnIn and Objectives.BuildTurnIn(questID) or nil
end

local function pickupTarget(questID)
    local target = targetOfKind(questID, "PICKUP")
    if target then return target end
    local Objectives = ns.Objectives
    return Objectives and Objectives.BuildPickup and Objectives.BuildPickup(questID) or nil
end

-- The nearest place of an unfinished objective of that quest.
local function objectiveTarget(questID)
    local list = {}
    for _, target in ipairs(questTargets(questID)) do
        if target.kind ~= "TURNIN" and target.kind ~= "PICKUP" then list[#list + 1] = target end
    end
    if #list == 0 then
        local Objectives = ns.Objectives
        local built = Objectives and Objectives.BuildForQuest and Objectives.BuildForQuest(questID)
        if type(built) == "table" then list = built end
    end
    local best, bestDistance = nil, huge
    for _, target in ipairs(list) do
        local distance = distanceTo(target) or (huge / 2)
        if not best or distance < bestDistance then best, bestDistance = target, distance end
    end
    return best
end

local STATE = {
    turnin = function() return L["Ready for turn-in"] end,
    pickup = function() return L["Quest available"] end,
}

local function zoneName(uiMapID)
    local info = C_Map and C_Map.GetMapInfo and uiMapID and C_Map.GetMapInfo(uiMapID)
    return info and info.name or nil
end

local function describePoint(point, source)
    local uiMapID, x, y = tonumber(point.uiMapID), tonumber(point.x), tonumber(point.y)
    if not uiMapID or not x or not y then return nil end
    local label = type(point.label) == "string" and point.label ~= "" and point.label or nil
    return {
        key = format("point:%s:%d:%.1f:%.1f", tostring(source), uiMapID, x, y),
        kind = "point", source = source,
        title = label or zoneName(uiMapID) or L["Waypoint"],
        state = M.FormatCoords(x, y),
        icon = "custom",
        uiMapID = uiMapID, x = x, y = y,
        targetKey = point.targetKey,
    }
end

local function describeTarget(kind, target, questID, source)
    if type(target) ~= "table" or not target.uiMapID or not target.x or not target.y then return nil end
    questID = questID or target.questID
    local d = {
        kind = kind, source = source, questID = questID,
        title = target.questTitle or target.text or L["Waypoint"],
        icon = (kind == "turnin" and (target.icon == "complete_repeatable" and target.icon or "complete"))
            or (kind == "pickup" and (target.icon or "available"))
            or target.icon or "event",
        uiMapID = target.uiMapID, x = target.x, y = target.y, areaID = target.areaID,
        targetKey = target.key,
    }
    if target.entityType == "npc" then d.npcID = target.entityID
    elseif target.entityType == "object" then d.objectID = target.entityID end
    d.entityName = target.entityName
    -- The hand-in NPC (or giver) may stand in several places: take the one in this zone, nearest.
    if (kind == "turnin" or kind == "pickup") and type(target.spawns) == "table" and ns.Player and ns.Player.GetPosition then
        local spawn = M.NearestSpawn(target.spawns, ns.Player.GetPosition())
        if spawn then
            local Zones = ns.Zones
            d.uiMapID = spawn.uiMapID or (Zones and Zones.GetUiMapIdByAreaId and Zones.GetUiMapIdByAreaId(spawn.areaID)) or d.uiMapID
            d.x, d.y, d.areaID = spawn.x, spawn.y, spawn.areaID
        end
    end
    d.state = STATE[kind] and STATE[kind]() or target.text or target.objectiveText or ""
    d.key = format("%s:%s:%s:%d:%d", kind, tostring(questID or target.key), tostring(d.uiMapID),
        floor(d.x * 10 + 0.5), floor(d.y * 10 + 0.5))
    return d
end

--- QuestWaypoint(questID, explicit) -> description|nil
-- In the log and complete: the hand-in. In the log and not complete: the nearest objective, when the
-- player asked for this quest (explicit) or switched objectives on. Not in the log: the giver, but
-- only when asked for, and never for a quest already turned in.
function M.QuestWaypoint(questID, explicit)
    questID = tonumber(questID)
    if not questID then return nil end
    if inLog(questID) then
        if isComplete(questID) then
            return describeTarget("turnin", turnInTarget(questID), questID, explicit and "quest" or "auto")
        end
        if explicit or profile().objectives then
            return describeTarget("objective", objectiveTarget(questID), questID, explicit and "quest" or "auto")
        end
        return nil
    end
    if explicit and not turnedIn(questID) then
        return describeTarget("pickup", pickupTarget(questID), questID, "quest")
    end
    return nil
end

--- FromTarget(target) -> description|nil: the arrow's current target as a waypoint.
function M.FromTarget(target)
    if type(target) ~= "table" then return nil end
    local kind = target.kind
    if kind == "TURNIN" then return describeTarget("turnin", target, nil, "arrow") end
    if kind == "PICKUP" then return describeTarget("pickup", target, nil, "arrow") end
    if kind == "CUSTOM" then
        return describePoint({ uiMapID = target.uiMapID, x = target.x, y = target.y, label = target.text,
            targetKey = target.key }, "arrow")
    end
    if profile().objectives then return describeTarget("objective", target, nil, "arrow") end
    return nil
end

local function superTrackedQuest()
    return Compat.GetSuperTrackedQuestID()
end

local function tomtomPoint()
    local bridge = ns.TomTomBridge
    if not (bridge and bridge.GetCrazyArrowPoint) then return nil end
    return bridge.GetCrazyArrowPoint()
end

--- Resolve() -> description|nil. First that answers: the point the player set (/way, SetPoint), the
-- quest the player chose (SetQuest), TomTom's arrow, then -- automatic -- the super-tracked quest and
-- the arrow's own target.
function M.Resolve()
    M.stats.resolves = M.stats.resolves + 1
    local store = charStore()
    local p = profile()
    if store and type(store.point) == "table" then
        local point = store.point
        local d = describePoint({ uiMapID = point.uiMapID, x = point.x, y = point.y, label = point.label,
            targetKey = store.customKey }, "way")
        if d then return d end
    end
    if store and store.questID then
        local d = M.QuestWaypoint(store.questID, true)
        if d then return d end
        if turnedIn(store.questID) then
            -- Done: the quest the player chose is history. What we pinned for it goes too.
            M.Release()
        end
    end
    if p.followTomTom then
        local point = tomtomPoint()
        local d = point and describePoint(point, "tomtom")
        if d then return d end
    end
    if p.auto then
        local questID = superTrackedQuest()
        local d = questID and M.QuestWaypoint(questID, false)
        if d then return d end
        local Router = ns.Router
        local target = Router and Router.GetCurrent and Router.GetCurrent()
        d = target and M.FromTarget(target)
        if d then return d end
    end
    return nil
end

---------------------------------------------------------------------------
-- /way: TomTom's syntax
---------------------------------------------------------------------------

local zoneIndex                     -- normalised name -> { uiMapID, ... }, built on first use

local function normalise(text)
    return (tostring(text or ""):lower():gsub("[%s%p]", ""))
end

local MAP_TYPE_RANK = { [3] = 1, [5] = 2, [4] = 3, [6] = 4, [2] = 5 }   -- zone first, continent last

local function rankOf(uiMapID)
    local info = C_Map and C_Map.GetMapInfo and C_Map.GetMapInfo(uiMapID)
    return (info and MAP_TYPE_RANK[info.mapType]) or 9
end

local function addName(index, name, uiMapID)
    if type(name) ~= "string" or name == "" or not uiMapID then return end
    local key = normalise(name)
    if key == "" then return end
    local list = index[key]
    if not list then
        list = {}
        index[key] = list
    end
    for i = 1, #list do
        if list[i] == uiMapID then return end
    end
    list[#list + 1] = uiMapID
end

-- Every map the zone tables know, by the client's (localised) name and by the shipped English name,
-- so "/way Eversong Woods 35 79" works in every language the client speaks.
local function buildZoneIndex()
    local index = {}
    local Data, Zones = ns.Data or {}, ns.Zones
    local seen = {}
    local ids = {}
    for uiMapID in pairs(Data.uiMapIdToAreaId or {}) do
        if type(uiMapID) == "number" and not seen[uiMapID] then seen[uiMapID] = true; ids[#ids + 1] = uiMapID end
    end
    for _, uiMapID in pairs(Data.areaIdToUiMapId or {}) do
        if type(uiMapID) == "number" and uiMapID > 0 and not seen[uiMapID] then seen[uiMapID] = true; ids[#ids + 1] = uiMapID end
    end
    tsort(ids)
    for _, uiMapID in ipairs(ids) do addName(index, zoneName(uiMapID), uiMapID) end
    if Zones and Zones.GetUiMapIdByAreaId then
        for areaID, name in pairs(Data.zoneNames or {}) do
            local uiMapID = Zones.GetUiMapIdByAreaId(areaID)
            if uiMapID then addName(index, name, uiMapID) end
        end
    end
    for _, list in pairs(index) do
        tsort(list, function(a, b)
            local ra, rb = rankOf(a), rankOf(b)
            if ra ~= rb then return ra < rb end
            return a < b
        end)
    end
    return index
end

--- ResetZoneIndex(): forget the zone names (tests; a language switch).
function M.ResetZoneIndex() zoneIndex = nil end

--- ResolveZone(text) -> uiMapID | nil, { candidate names } -- "#371" is a uiMapID; otherwise a name,
-- matched without case, spaces or punctuation: whole name first, then the start of exactly one name.
function M.ResolveZone(text)
    if type(text) ~= "string" then return nil, {} end
    local id = text:match("^#(%d+)$")
    if id then return tonumber(id), {} end
    zoneIndex = zoneIndex or buildZoneIndex()
    local key = normalise(text)
    if key == "" then return nil, {} end
    local exact = zoneIndex[key]
    if exact then return exact[1], {} end
    local found, names = {}, {}
    for name, list in pairs(zoneIndex) do
        if name:sub(1, #key) == key then
            found[#found + 1] = list[1]
            names[#names + 1] = zoneName(list[1]) or name
        end
    end
    if #found == 1 then return found[1], {} end
    tsort(names)
    return nil, names
end

-- "35,5" is a decimal comma (TomTom reads it the same way); "35, 79" and "35. 79" are two numbers.
local function number(token)
    if type(token) ~= "string" then return nil end
    token = token:gsub(",$", "")
    return tonumber((token:gsub("(%d),(%d)", "%1.%2")))
end

--- ParseWay(text) -> { action = "set", zone = text|nil, x, y, label|nil } | { action = "clear" }
--  | { action = "show" } | nil, errorMessage
function M.ParseWay(text)
    text = tostring(text or ""):gsub("^%s+", ""):gsub("%s+$", "")
    if text == "" then return { action = "show" } end
    text = text:gsub("(%d)[%.,]%s+(%d)", "%1 %2")
    local tokens = {}
    for token in text:gmatch("%S+") do tokens[#tokens + 1] = token end
    local first = tokens[1]:lower()
    if #tokens == 1 and (first == "clear" or first == "reset" or first == "off" or first == "remove") then
        return { action = "clear" }
    end
    for i = 1, #tokens - 1 do
        local x, y = number(tokens[i]), number(tokens[i + 1])
        if x and y then
            if x < 0 or x > 100 or y < 0 or y > 100 then return nil, L["Coordinates must be between 0 and 100."] end
            local zone = i > 1 and tconcat(tokens, " ", 1, i - 1) or nil
            local label = (i + 2 <= #tokens) and tconcat(tokens, " ", i + 2, #tokens) or nil
            return { action = "set", zone = zone, x = x, y = y, label = label }
        end
    end
    return nil, L["Usage: /way [zone] x y [label]"]
end

--- WayOwner() -> the SlashCmdList key of another addon that owns /way, or nil. TomTom counts even
-- before its slash command is found (it is the one players expect to have /way).
function M.WayOwner()
    local list = _G.SlashCmdList
    if type(list) == "table" then
        for key in pairs(list) do
            if not (M.wayRegistered and key == "ACECONSOLE_WAY") then
                for i = 1, 20 do
                    local alias = _G["SLASH_" .. tostring(key) .. i]
                    if alias == nil then break end
                    if type(alias) == "string" and alias:lower() == "/" .. WAY_COMMAND then return key end
                end
            end
        end
    end
    local bridge = ns.TomTomBridge
    if bridge and bridge.IsAvailable and bridge.IsAvailable() then return "TOMTOM" end
    return nil
end

local function printCurrent()
    local d = M.current
    if d then
        Log.Print(L["Current waypoint: %s"], format("%s (%s)", d.title or "?", d.state or ""))
    else
        Log.Print(L["No waypoint."])
    end
end

--- OnWayCommand(text): the /way handler.
function M:OnWayCommand(text)
    local parsed, err = M.ParseWay(text)
    if not parsed then
        Log.Print("%s", err or L["Usage: /way [zone] x y [label]"])
        return false
    end
    if parsed.action == "show" then
        Log.Print("%s", L["Usage: /way [zone] x y [label]"])
        printCurrent()
        return true
    end
    if parsed.action == "clear" then
        M:Clear()
        Log.Print("%s", L["Waypoint cleared."])
        return true
    end
    local uiMapID
    if parsed.zone then
        local candidates
        uiMapID, candidates = M.ResolveZone(parsed.zone)
        if not uiMapID then
            Log.Print(L["Unknown zone: %s"], parsed.zone)
            if candidates and #candidates > 0 then
                local shown = {}
                for i = 1, math.min(#candidates, 6) do shown[i] = candidates[i] end
                Log.Print(L["Did you mean: %s"], tconcat(shown, ", "))
            end
            return false
        end
    else
        uiMapID = C_Map and C_Map.GetBestMapForUnit and C_Map.GetBestMapForUnit("player")
        if not uiMapID then
            Log.Print("%s", L["You are not on a map with coordinates. Name the zone: /way <zone> x y"])
            return false
        end
    end
    if not M:SetPoint(uiMapID, parsed.x, parsed.y, parsed.label) then return false end
    local where = zoneName(uiMapID) or ("#" .. uiMapID)
    Log.Print(L["Waypoint set: %s"], format("%s - %s, %s", parsed.label or where, M.FormatCoords(parsed.x, parsed.y), where))
    return true
end

---------------------------------------------------------------------------
-- Public API: what the quest browser and the options call
---------------------------------------------------------------------------

local function manualKey()
    local c = ns.PQ and ns.PQ.db and ns.PQ.db.char
    return c and c.manualTargetKey or nil
end

-- Pins the arrow to `key`. A pin the player had made themselves (a quest from the tracker, a flag on
-- the map) is remembered in store.previousPin and given back when this module lets go.
local function pinArrow(store, key)
    local Router = ns.Router
    if not (key and Router and Router.SetManualTarget) then return nil end
    local before = manualKey()
    if store and before and before ~= key and before ~= store.pinnedKey and store.previousPin == nil then
        store.previousPin = before
    end
    Router.SetManualTarget(key)
    return key
end

-- Lets go of what this module put on the arrow and the map. The player's choice (point, questID)
-- is not touched here.
local function releaseOwned(store)
    if not store then return end
    local Targets, Router = ns.Targets, ns.Router
    -- The pin first: once the flag is gone the router drops a pin to it on its own, and the player's
    -- previous pin would then not be given back.
    if store.pinnedKey and manualKey() == store.pinnedKey and Router and Router.SetManualTarget then
        Router.SetManualTarget(store.previousPin)
    end
    if store.customKey and Targets and Targets.RemoveCustom then Targets.RemoveCustom(store.customKey) end
    store.customKey, store.pinnedKey, store.previousPin = nil, nil, nil
end

-- A point the player set is a custom target (a flag on the map, the arrow pinned to it), exactly as
-- if it had been placed by hand: this is the one place that creates it.
local function ensureCustom(store, uiMapID, x, y, label)
    local c = ns.PQ and ns.PQ.db and ns.PQ.db.char
    if store.customKey and c and type(c.customTargets) == "table" and c.customTargets[store.customKey] then
        return store.customKey
    end
    local Targets = ns.Targets
    local target = Targets and Targets.AddCustom and Targets.AddCustom(uiMapID, x, y, label)
    store.customKey = target and target.key or nil
    return store.customKey
end

local function selfCall(self, ...)
    if self == M then return ... end
    return self, ...
end

--- Waypoint:SetPoint(uiMapID, x, y [, label]) -> bool. x, y in 0..100, like /way and every Target.
function M.SetPoint(...)
    local uiMapID, x, y, label = selfCall(...)
    uiMapID, x, y = tonumber(uiMapID), tonumber(x), tonumber(y)
    if not uiMapID or not x or not y or x < 0 or x > 100 or y < 0 or y > 100 then return false end
    local store = charStore()
    if not store then return false end
    releaseOwned(store)
    store.questID = nil
    label = type(label) == "string" and label ~= "" and label or nil
    store.point = { uiMapID = uiMapID, x = x, y = y, label = label }
    store.pinnedKey = pinArrow(store, ensureCustom(store, uiMapID, x, y, label))
    M.Update()
    return true
end

--- Waypoint:SetQuest(questID) -> bool. The quest's hand-in when it is complete, else its nearest
-- objective, else (not taken yet) its giver. The arrow follows it too.
function M.SetQuest(...)
    local questID = tonumber((selfCall(...)))
    if not questID then return false end
    local store = charStore()
    if not store then return false end
    releaseOwned(store)
    store.point = nil
    store.questID = questID
    local d = M.QuestWaypoint(questID, true)
    if not d then
        store.questID = nil
        Log.Print(L["No target found for quest %d."], questID)
        M.Update()
        return false
    end
    local Targets = ns.Targets
    if d.targetKey and Targets and Targets.GetByKey and Targets.GetByKey(d.targetKey) then
        store.pinnedKey = pinArrow(store, d.targetKey)
    else
        -- Not one of the arrow's targets (a quest not taken yet, far away): a flag of our own.
        store.pinnedKey = pinArrow(store, ensureCustom(store, d.uiMapID, d.x, d.y, d.title))
    end
    M.Update()
    return true
end

-- A quest chosen by hand moves on (taken, its objectives done): the arrow moves with it, unless the
-- player has pinned something else in the meantime.
local function followQuestTarget(d)
    local store = charStore()
    if not (store and d and store.questID and d.questID == store.questID and d.targetKey) then return end
    if store.pinnedKey == d.targetKey then return end
    local pinned = manualKey()
    if pinned ~= nil and pinned ~= store.pinnedKey then return end
    local Targets = ns.Targets
    if not (Targets and Targets.GetByKey and Targets.GetByKey(d.targetKey)) then return end
    releaseOwned(store)
    store.pinnedKey = pinArrow(store, d.targetKey)
end

--- Waypoint:Release(): forget the player's choice and what was pinned for it, without redrawing.
function M.Release()
    local store = charStore()
    if not store then return end
    releaseOwned(store)
    store.point, store.questID = nil, nil
end

--- Waypoint:Clear(): no point, no quest; the waypoint goes back to following the tracked quest.
function M.Clear()
    M.Release()
    M.Update()
end

--- Waypoint:Get() -> the waypoint on display (a description; read it, do not change it) or nil.
function M.Get()
    return M.current
end

---------------------------------------------------------------------------
-- Frames
---------------------------------------------------------------------------

local card, marker                  -- built on first use
local cardOnArrow                   -- where the card is anchored now (true/false/nil = not yet)
local cardAccum, markerAccum = 0, 0
local cardDistanceStep, cardEtaStep, cardKey
local markerDistanceStep, markerKey
local pinpointShown = false
local plateToken                    -- the nameplate unit the marker is anchored to
local watchingPlates = false

local function beamColor()
    local c = profile().beamColor
    if type(c) ~= "table" then c = ns.DEFAULTS.profile.waypoint.beamColor end
    return tonumber(c.r) or 1, tonumber(c.g) or 0.82, tonumber(c.b) or 0.32
end

local function alphaAnimation(group, from, to, duration, delay, order, target)
    local anim = group:CreateAnimation("Alpha")
    if target and anim.SetTarget then anim:SetTarget(target) end
    anim:SetFromAlpha(from)
    anim:SetToAlpha(to)
    anim:SetDuration(duration)
    if delay and delay > 0 then anim:SetStartDelay(delay) end
    if order then anim:SetOrder(order) end
    if anim.SetSmoothing then anim:SetSmoothing("IN_OUT") end
    return anim
end

-- Fade in and settle from a little larger: the "it is here" moment, once per new waypoint.
local function appearGroup(frame)
    local group = frame:CreateAnimationGroup()
    alphaAnimation(group, 0, 1, 0.25)
    local grow = group:CreateAnimation("Scale")
    if grow.SetScaleFrom and grow.SetScaleTo then
        grow:SetScaleFrom(1.12, 1.12)
        grow:SetScaleTo(1, 1)
    elseif grow.SetScale then
        grow:SetScale(1, 1)
    end
    grow:SetDuration(0.25)
    if grow.SetSmoothing then grow:SetSmoothing("OUT") end
    return group
end

local function playAppear(frame)
    if frame and frame.appear and motionOn() then
        frame.appear:Stop()
        frame.appear:Play()
    end
end

local function newBadge(parent, size)
    local badge = CreateFrame("Frame", nil, parent)
    badge:SetSize(size, size)
    local glow = badge:CreateTexture(nil, "BACKGROUND")
    glow:SetTexture(TEX .. "arrow_glow")
    glow:SetPoint("CENTER")
    glow:SetSize(size * 1.9, size * 1.9)
    glow:SetBlendMode("ADD")
    glow:SetAlpha(0.4)
    local fill = badge:CreateTexture(nil, "BORDER")
    fill:SetTexture(WP_TEX .. "diamond")
    fill:SetAllPoints()
    fill:SetVertexColor(0.07, 0.06, 0.05, 0.9)
    local ring = badge:CreateTexture(nil, "ARTWORK")
    ring:SetTexture(WP_TEX .. "diamond_ring")
    ring:SetAllPoints()
    ring:SetVertexColor(GOLD[1], GOLD[2], GOLD[3])
    local icon = badge:CreateTexture(nil, "OVERLAY")
    icon:SetPoint("CENTER")
    icon:SetSize(size * 0.6, size * 0.6)
    badge.glow, badge.fill, badge.ring, badge.icon = glow, fill, ring, icon
    return badge
end

local function setBadgeIcon(badge, d)
    local Icons = ns.Icons
    local path = Icons and Icons.Get and Icons.Get(d and d.icon or "custom") or (TEX .. "pin_custom")
    badge.icon:SetTexture(path)
end

local function distanceText(distance, eta)
    local units = ns.PQ and ns.PQ.db and ns.PQ.db.profile.units
    local text = Util.FormatDistance(distance, units)
    if eta and ns.PQ and ns.PQ.db and ns.PQ.db.profile.arrow and ns.PQ.db.profile.arrow.showETA ~= false then
        text = format("%s  \226\128\162  ~%s", text, Util.FormatTime(eta))
    end
    return text
end

local function etaFor(distance)
    if not distance then return nil end
    local Router = ns.Router
    local speed = Router and Router.GetSmoothedSpeed and Router.GetSmoothedSpeed()
    if type(speed) ~= "number" or speed <= 0 then return nil end
    return distance / speed
end

local function distanceStep(distance)
    if not distance then return -1 end
    if distance < 10 then return floor(distance * 10) end
    return 100 + floor(distance)
end

-- Hidden when the arrow would be: on a taxi, in a pet battle, with no map position (an instance).
local function suppressed()
    if Compat.UnitOnTaxi("player") or Compat.IsInPetBattle() then return true end
    local Player = ns.Player
    return Player ~= nil and Player.GetPosition ~= nil and Player.GetPosition() == nil
end

---------------------------------------------------------------------------
-- The card: badge, distance and time, on the arrow
---------------------------------------------------------------------------

local function anchorCard(force)
    local Arrow = ns.Arrow
    local arrowFrame = Arrow and Arrow.GetFrame and Arrow.GetFrame()
    local onArrow = arrowFrame ~= nil and Arrow.IsShown ~= nil and Arrow.IsShown() == true
    if not force and onArrow == cardOnArrow then return end
    card:ClearAllPoints()
    if onArrow then
        card:SetPoint("BOTTOM", arrowFrame, "TOP", 0, 4)
    else
        card:SetPoint("TOP", UIParent, "TOP", 0, -96)
    end
    cardOnArrow = onArrow
end

local function refreshCard(force)
    if not card then return end
    M.stats.card = M.stats.card + 1
    local d = M.current
    local p = profile()
    if not d or not p.card or suppressed() then
        card:Hide()
        return
    end
    anchorCard(force)
    if force or cardKey ~= d.key then
        cardKey = d.key
        setBadgeIcon(card.badge, d)
        -- The arrow already names its own target; the title is only needed when the card shows
        -- something else, or rides alone at the top of the screen.
        local Router = ns.Router
        local arrowTarget = Router and Router.GetCurrent and Router.GetCurrent()
        local same = cardOnArrow and arrowTarget ~= nil and arrowTarget.key == d.targetKey
        card.title:SetText(same and "" or (d.title or ""))
        card.state:SetText(d.state or "")
        if d.kind == "turnin" then card.state:SetTextColor(READY[1], READY[2], READY[3])
        else card.state:SetTextColor(0.9, 0.9, 0.9) end
        cardDistanceStep, cardEtaStep = nil, nil
    end
    local distance = distanceTo(d)
    local eta = etaFor(distance)
    local dStep, eStep = distanceStep(distance), eta and floor(eta + 0.5) or -1
    if force or dStep ~= cardDistanceStep or eStep ~= cardEtaStep then
        cardDistanceStep, cardEtaStep = dStep, eStep
        card.distance:SetText(distance and distanceText(distance, eta) or L["Distance unknown"])
    end
end

local function onCardUpdate(_, elapsed)
    cardAccum = cardAccum + (elapsed or 0)
    if cardAccum < TEXT_INTERVAL then return end
    cardAccum = 0
    refreshCard(false)
end

local function createCard()
    if card or not CreateFrame then return card end
    card = CreateFrame("Frame", "PandaQuestWaypointCard", UIParent)
    card:SetFrameStrata("MEDIUM")
    card:SetSize(220, 78)
    card:SetClampedToScreen(true)
    card:EnableMouse(false)
    card:Hide()
    card.state = card:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    card.state:SetPoint("BOTTOM", card, "BOTTOM", 0, 0)
    card.distance = card:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    card.distance:SetPoint("BOTTOM", card.state, "TOP", 0, 1)
    card.distance:SetTextColor(1, 1, 1)
    card.title = card:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    card.title:SetPoint("BOTTOM", card.distance, "TOP", 0, 1)
    card.badge = newBadge(card, 28)
    card.badge:SetPoint("BOTTOM", card.title, "TOP", 0, 2)
    card.appear = appearGroup(card)
    card:SetScript("OnUpdate", onCardUpdate)
    card:SetScript("OnHide", function(self) if self.appear then self.appear:Stop() end end)
    M.card = card
    return card
end

---------------------------------------------------------------------------
-- The marker: beam or Pinpoint, anchored to the NPC's nameplate
---------------------------------------------------------------------------

local function chevronGroup(parent)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetSize(26, 46)
    holder.chevrons = {}
    for i = 1, 3 do
        local chevron = holder:CreateTexture(nil, "ARTWORK")
        chevron:SetTexture(WP_TEX .. "chevron")
        chevron:SetSize(24, 24)
        chevron:SetBlendMode("ADD")
        chevron:SetPoint("TOP", holder, "TOP", 0, -(i - 1) * 11)
        holder.chevrons[i] = chevron
    end
    -- A wave running down the three chevrons, over and over: each brightens a beat after the one
    -- above it, while the whole stack bobs towards the NPC.
    local wave = holder:CreateAnimationGroup()
    wave:SetLooping("REPEAT")
    for i = 1, 3 do
        alphaAnimation(wave, 0.25, 1, 0.3, (i - 1) * 0.15, 1, holder.chevrons[i])
        alphaAnimation(wave, 1, 0.25, 0.3, (i - 1) * 0.15, 2, holder.chevrons[i])
    end
    local bob = wave:CreateAnimation("Translation")
    bob:SetOffset(0, -4)
    bob:SetDuration(0.6)
    bob:SetOrder(1)
    if bob.SetSmoothing then bob:SetSmoothing("IN_OUT") end
    local back = wave:CreateAnimation("Translation")
    back:SetOffset(0, 4)
    back:SetDuration(0.6)
    back:SetOrder(2)
    if back.SetSmoothing then back:SetSmoothing("IN_OUT") end
    holder.wave = wave
    holder:SetScript("OnShow", function(self) if motionOn() then self.wave:Play() end end)
    holder:SetScript("OnHide", function(self) self.wave:Stop() end)
    return holder
end

local function createMarker()
    if marker or not CreateFrame then return marker end
    marker = CreateFrame("Frame", "PandaQuestWaypointMarker", UIParent)
    marker:SetFrameStrata("LOW")
    marker:SetSize(40, 40)
    marker:EnableMouse(false)
    marker:Hide()

    -- Beam: the distance at the nameplate, the badge above it, the light rising from the badge.
    local beam = CreateFrame("Frame", nil, marker)
    beam:SetAllPoints(marker)
    beam.distance = beam:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    beam.distance:SetPoint("BOTTOM", marker, "BOTTOM", 0, 0)
    beam.distance:SetTextColor(1, 1, 1)
    beam.badge = newBadge(beam, 28)
    beam.badge:SetPoint("BOTTOM", beam.distance, "TOP", 0, 2)
    beam.halo = beam:CreateTexture(nil, "BACKGROUND")
    beam.halo:SetTexture(WP_TEX .. "beam")
    beam.halo:SetBlendMode("ADD")
    beam.halo:SetSize(84, 300)
    beam.halo:SetPoint("BOTTOM", beam.badge, "CENTER", 0, 0)
    beam.halo:SetAlpha(0.35)
    beam.core = beam:CreateTexture(nil, "BORDER")
    beam.core:SetTexture(WP_TEX .. "beam")
    beam.core:SetBlendMode("ADD")
    beam.core:SetSize(26, 300)
    beam.core:SetPoint("BOTTOM", beam.badge, "CENTER", 0, 0)
    beam.foot = beam:CreateTexture(nil, "BACKGROUND")
    beam.foot:SetTexture(TEX .. "arrow_glow")
    beam.foot:SetBlendMode("ADD")
    beam.foot:SetSize(70, 36)
    beam.foot:SetPoint("CENTER", beam.badge, "CENTER", 0, 0)
    beam.foot:SetAlpha(0.6)
    -- A slow shimmer along the light.
    beam.shimmer = beam:CreateAnimationGroup()
    beam.shimmer:SetLooping("BOUNCE")
    alphaAnimation(beam.shimmer, 1, 0.7, 1.4, 0, 1, beam.core)
    beam.appear = appearGroup(beam)
    beam:SetScript("OnShow", function(self) if motionOn() then self.shimmer:Play() end end)
    beam:SetScript("OnHide", function(self) self.shimmer:Stop(); self.appear:Stop() end)
    beam:Hide()
    marker.beam = beam

    -- Pinpoint: the framed label, the chevrons under it pointing at the NPC.
    local pin = CreateFrame("Frame", nil, marker)
    pin:SetAllPoints(marker)
    pin.chevrons = chevronGroup(pin)
    pin.chevrons:SetPoint("BOTTOM", marker, "BOTTOM", 0, 0)
    pin.label = CreateFrame("Frame", nil, pin)
    pin.label:SetSize(240, 46)
    pin.label:SetPoint("BOTTOM", pin.chevrons, "TOP", 0, 2)
    pin.plate = pin.label:CreateTexture(nil, "BACKGROUND")
    pin.plate:SetTexture(WP_TEX .. "plate")
    pin.plate:SetAllPoints(pin.label)
    pin.plate:SetVertexColor(0, 0, 0, 0.62)
    pin.top = pin.label:CreateTexture(nil, "BORDER")
    pin.top:SetTexture(WP_TEX .. "plate")
    pin.top:SetVertexColor(GOLD[1], GOLD[2], GOLD[3], 0.9)
    pin.top:SetHeight(2)
    pin.top:SetPoint("TOPLEFT", pin.label, "TOPLEFT", 12, 0)
    pin.top:SetPoint("TOPRIGHT", pin.label, "TOPRIGHT", -12, 0)
    pin.bottom = pin.label:CreateTexture(nil, "BORDER")
    pin.bottom:SetTexture(WP_TEX .. "plate")
    pin.bottom:SetVertexColor(GOLD[1], GOLD[2], GOLD[3], 0.9)
    pin.bottom:SetHeight(2)
    pin.bottom:SetPoint("BOTTOMLEFT", pin.label, "BOTTOMLEFT", 12, 0)
    pin.bottom:SetPoint("BOTTOMRIGHT", pin.label, "BOTTOMRIGHT", -12, 0)
    pin.title = pin.label:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    pin.title:SetPoint("TOP", pin.label, "TOP", 0, -7)
    pin.state = pin.label:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    pin.state:SetPoint("TOP", pin.title, "BOTTOM", 0, -3)
    pin.appear = appearGroup(pin)
    pin:SetScript("OnHide", function(self) self.appear:Stop() end)
    pin:Hide()
    marker.pin = pin

    marker:SetScript("OnUpdate", function(_, elapsed)
        markerAccum = markerAccum + (elapsed or 0)
        if markerAccum < TEXT_INTERVAL then return end
        markerAccum = 0
        M.RefreshMarker(false)
    end)
    M.marker = marker
    return marker
end

local function applyLook()
    local p = profile()
    local scale = Util.Clamp(tonumber(p.scale) or 1, 0.5, 2)
    local r, g, b = beamColor()
    if card then card:SetScale(scale) end
    if marker then
        marker:SetScale(scale)
        local beam = marker.beam
        beam.core:SetVertexColor(r, g, b)
        beam.halo:SetVertexColor(r, g, b)
        beam.foot:SetVertexColor(r, g, b)
        for _, chevron in ipairs(marker.pin.chevrons.chevrons) do chevron:SetVertexColor(r, g, b) end
    end
end

local function setPinpointText(d)
    local pin = marker.pin
    pin.title:SetText(d.title or "")
    pin.state:SetText(d.state or "")
    if d.kind == "turnin" then pin.state:SetTextColor(READY[1], READY[2], READY[3])
    else pin.state:SetTextColor(1, 1, 1) end
    local width = math.max(pin.title:GetStringWidth() or 0, pin.state:GetStringWidth() or 0)
    pin.label:SetWidth(Util.Clamp(width + 56, 160, 420))
end

--- RefreshMarker(force): which of beam and Pinpoint shows, how bright, and the distance under the
-- badge. The position is the nameplate's; nothing here moves the frame.
function M.RefreshMarker(force)
    if not marker then return end
    M.stats.marker = M.stats.marker + 1
    local d = M.current
    local p = profile()
    if not d or not plateToken then
        marker:Hide()
        return
    end
    local distance = distanceTo(d)
    local threshold = tonumber(p.pinpointDistance) or 20
    local wantPin = p.pinpoint and M.IsPinpoint(distance, threshold, pinpointShown)
    local wantBeam = not wantPin and p.beam
    if not wantPin and not wantBeam then
        marker.pin:Hide()
        marker.beam:Hide()
        pinpointShown = false
        return
    end
    if force or markerKey ~= d.key then
        markerKey = d.key
        setPinpointText(d)
        setBadgeIcon(marker.beam.badge, d)
        markerDistanceStep = nil
    end
    if wantPin ~= pinpointShown or force or not (marker.pin:IsShown() or marker.beam:IsShown()) then
        marker.pin:SetShown(wantPin)
        marker.beam:SetShown(not wantPin)
        playAppear(wantPin and marker.pin or marker.beam)
        pinpointShown = wantPin
    end
    if not wantPin then
        marker.beam:SetAlpha(M.BeamAlpha(distance, threshold))
        local step = distanceStep(distance)
        if force or step ~= markerDistanceStep then
            markerDistanceStep = step
            marker.beam.distance:SetText(distance and Util.FormatDistance(distance, ns.PQ.db.profile.units) or "")
        end
    end
end

---------------------------------------------------------------------------
-- Nameplates
---------------------------------------------------------------------------

local function wantsPlate()
    local d, p = M.current, profile()
    return d ~= nil and d.npcID ~= nil and (d.kind == "turnin" or d.kind == "pickup")
        and (p.pinpoint or p.beam) and true or false
end

local function plateFor(token)
    local NamePlates = _G.C_NamePlate
    if not (NamePlates and NamePlates.GetNamePlateForUnit) then return nil end
    local ok, plate = pcall(NamePlates.GetNamePlateForUnit, token)
    return ok and plate or nil
end

local function tokenIsTarget(token)
    local d = M.current
    if not d or not d.npcID or type(token) ~= "string" then return false end
    -- NpcIdFromGuid answers nil for no GUID and for a secret one (Forever), so nothing compares a secret.
    local guid = _G.UnitGUID and _G.UnitGUID(token)
    return M.NpcIdFromGuid(guid) == d.npcID
end

local function detach()
    plateToken = nil
    pinpointShown = false
    if marker then
        marker:ClearAllPoints()
        marker:Hide()
        marker.pin:Hide()
        marker.beam:Hide()
    end
end

local function attach(token, plate)
    createMarker()
    applyLook()
    plateToken = token
    marker:ClearAllPoints()
    marker:SetPoint("BOTTOM", plate, "TOP", 0, 2)
    marker:Show()
    markerAccum = 0
    M.RefreshMarker(true)
end

--- ScanNamePlates(): looks for the waypoint's NPC among the nameplates already on screen.
function M.ScanNamePlates()
    detach()
    if not wantsPlate() then return false end
    for i = 1, MAX_NAMEPLATES do
        local token = "nameplate" .. i
        if tokenIsTarget(token) then
            local plate = plateFor(token)
            if plate then
                attach(token, plate)
                return true
            end
        end
    end
    return false
end

local function onPlateAdded(_, token)
    if plateToken or not wantsPlate() or not tokenIsTarget(token) then return end
    local plate = plateFor(token)
    if plate then attach(token, plate) end
end

local function onPlateRemoved(_, token)
    if token ~= plateToken then return end
    -- Another copy of the same NPC may still have a plate up.
    M.ScanNamePlates()
end

local function watchPlates(on)
    if on == watchingPlates then return end
    watchingPlates = on
    if on then
        M:RegisterEvent("NAME_PLATE_UNIT_ADDED", onPlateAdded)
        M:RegisterEvent("NAME_PLATE_UNIT_REMOVED", onPlateRemoved)
    else
        M:UnregisterEvent("NAME_PLATE_UNIT_ADDED")
        M:UnregisterEvent("NAME_PLATE_UNIT_REMOVED")
    end
end

--- IsWatchingNamePlates() -> bool (tests: the events are only registered while they can matter).
function M.IsWatchingNamePlates() return watchingPlates end

--- FriendlyNamePlatesOn() -> bool|nil: nil when the client does not say.
function M.FriendlyNamePlatesOn()
    local cvar = _G.C_CVar
    if cvar and cvar.GetCVarBool then
        local ok, on = pcall(cvar.GetCVarBool, "nameplateShowFriendlyNpcs")
        if ok then return on and true or false end
    end
    return nil
end

--- TurnOnFriendlyNamePlates() -> bool: only ever called by the options button the player pressed.
function M.TurnOnFriendlyNamePlates()
    if Compat.InCombatLockdown() then
        Log.Print("%s", L["Not possible in combat."])
        return false
    end
    local cvar = _G.C_CVar
    if not (cvar and cvar.SetCVar) then return false end
    local ok = pcall(cvar.SetCVar, "nameplateShowFriendlyNpcs", "1")
    return ok and M.FriendlyNamePlatesOn() == true
end

---------------------------------------------------------------------------
-- Update cycle
---------------------------------------------------------------------------

local refreshTimer, pendingTimer
local awayFrom = {}                 -- point key -> true once the player was outside its arrival circle

local function arrivalRadius()
    local Router = ns.Router
    return (Router and Router.GetArriveRadius and Router.GetArriveRadius({ count = 1 })) or 16
end

--- CheckArrival(d) -> bool: a /way point is done once the player, having been further away, comes
-- within the arrow's arrival radius of it. A point set where the player stands is not reached on the
-- spot. On arrival the point is forgotten and one chat line says so.
function M.CheckArrival(d)
    if not d or d.kind ~= "point" or d.source ~= "way" or not profile().clearOnArrival then return false end
    local distance = distanceTo(d)
    if not distance then return false end
    if distance > arrivalRadius() then
        awayFrom[d.key] = true
        return false
    end
    if not awayFrom[d.key] then return false end
    awayFrom[d.key] = nil
    local store = charStore()
    local label = (store and store.point and store.point.label) or d.title
    M.Release()
    Log.Print(L["Arrived at %s."], label)
    return true
end

local function apply(d)
    local previous = M.current
    local changed = (d and d.key) ~= (previous and previous.key)
    M.current = d
    local wantPlates = wantsPlate()
    if changed then
        cardKey, markerKey = nil, nil
        pinpointShown = false
    elseif d and previous then
        -- Same place, maybe new words (an objective counted up).
        if d.state ~= previous.state or d.title ~= previous.title then cardKey, markerKey = nil, nil end
    end
    if changed or wantPlates ~= watchingPlates then
        watchPlates(wantPlates)
        M.ScanNamePlates()
    end
    if changed then M:SendMessage("PQ_WAYPOINT_CHANGED", d, previous) end
    if d then
        if not refreshTimer then refreshTimer = M:ScheduleRepeatingTimer("Refresh", REFRESH_INTERVAL) end
        createCard()
        applyLook()
        if profile().card and not suppressed() then
            if not card:IsShown() then
                card:Show()
                playAppear(card)
            elseif changed then
                playAppear(card)
            end
            cardAccum = 0
            refreshCard(changed)
        else
            card:Hide()
        end
    else
        if refreshTimer then
            M:CancelTimer(refreshTimer)
            refreshTimer = nil
        end
        if card then card:Hide() end
        detach()
        watchPlates(false)
    end
end

--- Update(): resolve the waypoint now and show it.
function M.Update()
    if pendingTimer then
        M:CancelTimer(pendingTimer)
        pendingTimer = nil
    end
    if not M:IsEnabled() or not profile().enabled then
        apply(nil)
        return nil
    end
    local d = M.Resolve()
    if M.CheckArrival(d) then d = M.Resolve() end
    if d and d.source == "quest" then followQuestTarget(d) end
    apply(d)
    return M.current
end

--- RequestUpdate(): Update() a moment later; a burst of messages makes one.
function M.RequestUpdate()
    if pendingTimer or not M:IsEnabled() then return end
    pendingTimer = M:ScheduleTimer(function()
        pendingTimer = nil
        M.Update()
    end, RESOLVE_DELAY)
end

--- Refresh(): the once-a-second check while a waypoint exists -- a better spawn, a taxi, TomTom.
function M:Refresh()
    M.Update()
end

---------------------------------------------------------------------------
-- Options
---------------------------------------------------------------------------

local function optionGet(info)
    return profile()[info.arg]
end

local function optionSet(info, value)
    if info.arg == "enabled" then
        M.SetEnabled(value)
        return
    end
    local Options = ns.Options
    -- Options.Set writes the key and sends PQ_SETTING_CHANGED, which brings it here (onSettingChanged).
    if not (Options and Options.Set and Options.Set("waypoint." .. info.arg, value)) then
        profile()[info.arg] = value
        M.Apply()
    end
end

local function toggle(order, name, desc, key, extra)
    local option = { type = "toggle", order = order, name = name, desc = desc, arg = key,
        get = optionGet, set = optionSet, width = "full" }
    for k, v in pairs(extra or {}) do option[k] = v end
    return option
end

local function disabledWhenOff() return not profile().enabled end

--- BuildOptions() -> the "Waypoints" tab (UI/Options.lua shows it through Options.AddSection).
function M.BuildOptions()
    local off = { disabled = disabledWhenOff }
    return {
        type = "group", order = 3.5, name = L["Waypoints"], args = {
            info = { type = "description", order = 0, fontSize = "medium",
                name = L["Mists of Pandaria Classic gives addons no way to put a marker on a spot in the 3D world."]
                    .. " " .. L["PandaQuest marks the quest NPC itself, over its nameplate, and shows the distance on the arrow."] },
            enabled = toggle(1, L["Show waypoints"], nil, "enabled"),
            targets = { type = "header", order = 10, name = L["What to mark"] },
            auto = toggle(11, L["Follow the tracked quest"],
                L["The quest you track (or else the arrow's target) gets the waypoint: where to hand it in once it is complete."],
                "auto", off),
            objectives = toggle(12, L["Also mark unfinished objectives"],
                L["Without this, only hand-ins, quest givers and points you set get a waypoint."], "objectives", off),
            followTomTom = toggle(13, L["Show TomTom's waypoint"],
                L["With TomTom installed, the waypoint TomTom's arrow follows is shown in PandaQuest's style."],
                "followTomTom", { disabled = function()
                    return disabledWhenOff() or not (ns.TomTomBridge and ns.TomTomBridge.IsAvailable and ns.TomTomBridge.IsAvailable())
                end }),
            look = { type = "header", order = 20, name = L["What to show"] },
            card = toggle(21, L["Distance on the arrow"],
                L["A badge with the distance and the travel time, above the arrow."], "card", off),
            pinpoint = toggle(22, L["Pinpoint over the NPC"],
                L["Up close, the quest and what to do there, framed over the NPC's head with chevrons pointing at it."],
                "pinpoint", off),
            pinpointDistance = { type = "range", order = 23, name = L["Pinpoint distance (yards)"],
                desc = L["Closer than this, the beam gives way to the Pinpoint label."],
                min = 5, max = 40, step = 1, arg = "pinpointDistance", get = optionGet, set = optionSet,
                disabled = disabledWhenOff },
            beam = toggle(24, L["Light beam over the NPC"],
                L["Further out, a column of light over the NPC's nameplate, drawn only where the nameplate really is: no nameplate, no beam."],
                "beam", off),
            beamColor = { type = "color", order = 25, name = L["Beam colour"], disabled = disabledWhenOff,
                get = function()
                    local r, g, b = beamColor()
                    return r, g, b
                end,
                set = function(_, r, g, b)
                    profile().beamColor = { r = r, g = g, b = b }
                    if ns.PQ and ns.PQ.SendMessage then ns.PQ:SendMessage("PQ_SETTING_CHANGED", "waypoint.beamColor") end
                    M.Apply()
                end },
            scale = { type = "range", order = 26, name = L["Size"], min = 0.5, max = 2, step = 0.05, isPercent = true,
                arg = "scale", get = optionGet, set = optionSet, disabled = disabledWhenOff },
            clearOnArrival = toggle(27, L["Remove a /way point when you reach it"], nil, "clearOnArrival", off),
            plates = { type = "header", order = 30, name = L["Nameplates"] },
            platesInfo = { type = "description", order = 31, name = function()
                local on = M.FriendlyNamePlatesOn()
                if on == false then
                    return L["Friendly NPC nameplates are off. The Pinpoint label and the beam need them: turn them on here or in the game's options."]
                end
                return L["Friendly NPC nameplates are on. Inside dungeons the game keeps them from addons, so there the arrow carries on alone."]
            end },
            platesOn = { type = "execute", order = 32, name = L["Turn on friendly NPC nameplates"],
                desc = L["Changes the game's setting nameplateShowFriendlyNpcs, only when you press this."],
                disabled = function() return M.FriendlyNamePlatesOn() ~= false end,
                func = function() M.TurnOnFriendlyNamePlates() end },
            current = { type = "header", order = 40, name = L["Current waypoint"] },
            currentText = { type = "description", order = 41, name = function()
                local d = M.current
                if not d then return L["No waypoint."] end
                return format("%s\n%s", d.title or "", d.state or "")
            end },
            clear = { type = "execute", order = 42, name = L["Clear the waypoint"],
                desc = L["Forgets the point or quest you chose; the waypoint follows the tracked quest again."],
                func = function() M.Clear() end },
            way = { type = "description", order = 43, name = function()
                local owner = M.wayRegistered and nil or M.WayOwner()
                if owner then
                    return format(L["/way belongs to another addon here (%s), so PandaQuest shows that addon's waypoint where it can."], tostring(owner))
                end
                return L["/way [zone] x y [label] sets a waypoint, written the way TomTom writes it."] .. " "
                    .. L["For example /way 35 79, /way Eversong Woods 35.0 79.0 Windrunner Spire or /way #94 35 79. /way clear removes it."]
            end },
        },
    }
end

--- Apply(): re-read the options (size, colour, switches) and show the result.
function M.Apply()
    applyLook()
    cardKey, markerKey = nil, nil
    if M:IsEnabled() then M.Update() end
end

if ns.Options and ns.Options.AddSection then
    ns.Options.AddSection("waypoint", M.BuildOptions)
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

local function onSettingChanged(_, path)
    if type(path) ~= "string" then return end
    if path == "units" or path:sub(1, 9) == "waypoint." or path == "nav.mode" or path == "nav.focusQuestID" then
        M.Apply()
    end
end

local function onTomTomChanged() M.RequestUpdate() end

-- A profile switch may turn the whole module on or off ("Show waypoints" is per profile).
local function onProfile()
    local wanted = profile().enabled ~= false
    if wanted and not M:IsEnabled() then
        M:Enable()
    elseif not wanted and M:IsEnabled() then
        M:Disable()
    else
        M.Apply()
    end
end

function M:OnInitialize()
    charStore()     -- char.waypoint exists from here on; nothing else is touched
    self:SetEnabledState(profile().enabled ~= false)
    local AceDB = ns.PQ and ns.PQ.db
    if AceDB and AceDB.RegisterCallback then
        AceDB.RegisterCallback(M, "OnProfileChanged", onProfile)
        AceDB.RegisterCallback(M, "OnProfileCopied", onProfile)
        AceDB.RegisterCallback(M, "OnProfileReset", onProfile)
    end
end

function M:OnEnable()
    for _, message in ipairs({ "PQ_CURRENT_TARGET_CHANGED", "PQ_TARGETS_UPDATED", "PQ_QUESTLOG_CHANGED",
                               "PQ_DB_READY", "PQ_PLAYER_ZONE_CHANGED" }) do
        self:RegisterMessage(message, M.RequestUpdate)
    end
    self:RegisterMessage("PQ_SETTING_CHANGED", onSettingChanged)
    -- SUPER_TRACKED_QUEST_CHANGED in the classic clients, SUPER_TRACKING_CHANGED in Forever: each one is
    -- registered where the client knows it (Core/Compat.lua).
    for _, event in ipairs({ "PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA", unpack(Compat.SUPER_TRACK_EVENTS) }) do
        Compat.RegisterEvent(self, event, M.RequestUpdate)
    end
    -- /way only when nobody else has it; with TomTom, its waypoint is followed instead.
    M.wayOwner = M.WayOwner()
    if not M.wayOwner and self.RegisterChatCommand then
        self:RegisterChatCommand(WAY_COMMAND, "OnWayCommand")
        M.wayRegistered = true
    end
    local bridge = ns.TomTomBridge
    if bridge and bridge.IsAvailable and bridge.IsAvailable() and bridge.WatchCrazyArrow then
        bridge.WatchCrazyArrow(onTomTomChanged)
    end
    -- A point kept from the last session: its flag and the arrow's pin are still saved; put back
    -- whatever was let go when the module was switched off.
    local store = charStore()
    if store and type(store.point) == "table" and not store.customKey then
        local point = store.point
        store.pinnedKey = pinArrow(store, ensureCustom(store, point.uiMapID, point.x, point.y, point.label))
    end
    M.Update()
end

function M:OnDisable()
    if M.wayRegistered and self.UnregisterChatCommand then
        self:UnregisterChatCommand(WAY_COMMAND)
    end
    M.wayRegistered = false
    local bridge = ns.TomTomBridge
    if bridge and bridge.UnwatchCrazyArrow then bridge.UnwatchCrazyArrow(onTomTomChanged) end
    -- The flag and the arrow's pin go; the point itself stays saved and comes back on enable.
    local store = charStore()
    if store and store.point then releaseOwned(store) end
    if refreshTimer then self:CancelTimer(refreshTimer) end
    if pendingTimer then self:CancelTimer(pendingTimer) end
    refreshTimer, pendingTimer = nil, nil
    watchPlates(false)
    apply(nil)
    M.current = nil
end

--- SetEnabled(on): the "Show waypoints" switch and the module are one thing.
function M.SetEnabled(on)
    profile().enabled = on and true or false
    if on then M:Enable() else M:Disable() end
    if ns.PQ and ns.PQ.SendMessage then ns.PQ:SendMessage("PQ_SETTING_CHANGED", "waypoint.enabled", profile().enabled) end
end
