-- Nav/TomTom.lua: optional TomTom integration.
--
-- TomTom's modern API is `TomTom:AddWaypoint(uiMapID, x, y, opts)` with x/y in 0..1, so a Target
-- (0..100) is divided by 100. `crazy = true` asks TomTom for its own crazy-taxi arrow, which is
-- what a user who has TomTom installed expects to see.
--
-- Exactly one PandaQuest waypoint exists at a time: adding a new one removes the previous. The uid
-- TomTom hands back is a table, so it cannot survive a reload inside SavedVariables; what is stored
-- in `db.char.tomtomWaypoint` is a plain description of the point (and the live uid is kept in a
-- module local). On login a stale description is simply dropped.
local _, ns = ...
local L = ns.L

local M = {}
ns.TomTomBridge = M

local Log, Compat = ns.Log, ns.Compat

-- AceEvent/AceTimer key their registries by object, and CallbackHandler keeps exactly ONE callback
-- per (object, message). Registering on the shared ns.PQ object therefore silently replaces the
-- handler another module installed for the same message, so every module listens through its own
-- embedded object instead.
local listener = {}
M.listener = listener
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
    local AceTimer = LibStub and LibStub("AceTimer-3.0", true)
    if AceTimer then AceTimer:Embed(listener) end
end

local type, tonumber, tostring = type, tonumber, tostring

local liveUID                       -- the uid returned by TomTom:AddWaypoint (a table)

local function charDB()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.char or nil
end

local function tomtom()
    local addon = _G and _G.TomTom
    if type(addon) ~= "table" then return nil end
    if type(addon.AddWaypoint) ~= "function" then return nil end
    return addon
end

--- IsAvailable() -> bool: TomTom is loaded and exposes the waypoint API.
function M.IsAvailable()
    if not Compat.IsAddOnLoaded("TomTom") then
        -- The addon table can exist before the TOC reports it loaded; trust the table too.
        return tomtom() ~= nil
    end
    return tomtom() ~= nil
end

--- Clear(): removes the waypoint PandaQuest owns, if any.
function M.Clear()
    local addon = tomtom()
    if addon and liveUID and type(addon.RemoveWaypoint) == "function" then
        pcall(addon.RemoveWaypoint, addon, liveUID)
    end
    liveUID = nil
    local db = charDB()
    if db then db.tomtomWaypoint = nil end
end

--- SetWaypoint(target) -> uid|nil. Replaces the previous PandaQuest waypoint.
function M.SetWaypoint(target)
    local addon = tomtom()
    if not addon then
        Log.Print(L["TomTom is not loaded."])
        return nil
    end
    if type(target) ~= "table" then return nil end
    local uiMapID = tonumber(target.uiMapID)
    local x, y = tonumber(target.x), tonumber(target.y)
    if not uiMapID or not x or not y then
        Log.Debug("TomTom", "target %s has no map coordinates", tostring(target.key))
        return nil
    end

    M.Clear()

    local title = target.questTitle or target.text or L["Custom target"]
    local ok, uid = pcall(addon.AddWaypoint, addon, uiMapID, x / 100, y / 100, {
        title = title,
        crazy = true,
        persistent = false,
        minimap = true,
        world = true,
    })
    if not ok or not uid then
        Log.Debug("TomTom", "AddWaypoint failed: %s", tostring(uid))
        return nil
    end
    liveUID = uid
    local db = charDB()
    if db then
        db.tomtomWaypoint = { uiMapID = uiMapID, x = x, y = y, title = title, key = target.key }
    end
    Log.Debug("TomTom", "waypoint set for %s (%s %.1f, %.1f)", tostring(target.key), tostring(uiMapID), x, y)
    return uid
end

--- GetWaypoint() -> the stored description (not the uid).
function M.GetWaypoint()
    local db = charDB()
    return db and db.tomtomWaypoint or nil
end

---------------------------------------------------------------------------
-- Following TomTom's own arrow (Nav/Waypoint.lua shows that waypoint in PandaQuest's style)
---------------------------------------------------------------------------
-- TomTom keeps the point its arrow follows to itself. What it does expose are the calls that set
-- and end it: TomTom:SetCrazyArrow(uid, arrivalDistance, title), TomTom:ClearCrazyArrowPoint(remove)
-- and TomTom:RemoveWaypoint(uid), plus TomTom:IsCrazyArrowEmpty(). A uid is TomTom's waypoint table,
-- { [1] = uiMapID, [2] = x, [3] = y (0..1), title = ... }. The hooks are post-hooks: TomTom runs
-- exactly as before and PandaQuest only learns where TomTom's arrow points. The waypoint PandaQuest
-- itself handed TomTom (the "mirror" setting) is not followed back.

local crazyUID                      -- the uid TomTom's arrow was last pointed at
local crazyWatchers = {}            -- functions to call when it changes
local crazyHooked = false

--- GetCrazyArrowPoint() -> { uiMapID, x, y (0..100), label } | nil
function M.GetCrazyArrowPoint()
    local addon = tomtom()
    local uid = crazyUID
    if not addon or type(uid) ~= "table" or uid == liveUID then return nil end
    if type(addon.IsCrazyArrowEmpty) == "function" then
        local ok, empty = pcall(addon.IsCrazyArrowEmpty, addon)
        if ok and empty then return nil end
    end
    local uiMapID, x, y = tonumber(uid[1]), tonumber(uid[2]), tonumber(uid[3])
    if not uiMapID or not x or not y then return nil end
    local label = uid.title
    return { uiMapID = uiMapID, x = x * 100, y = y * 100, label = type(label) == "string" and label or nil }
end

local function crazyChanged()
    local point = M.GetCrazyArrowPoint()
    for i = 1, #crazyWatchers do pcall(crazyWatchers[i], point) end
end

--- WatchCrazyArrow(fn) -> bool: fn(point|nil) runs whenever TomTom's arrow changes its waypoint.
-- false when TomTom is not loaded or does not have the calls above.
function M.WatchCrazyArrow(fn)
    if type(fn) == "function" then crazyWatchers[#crazyWatchers + 1] = fn end
    if crazyHooked then return true end
    local addon = tomtom()
    local hook = _G and _G.hooksecurefunc
    if not addon or type(hook) ~= "function" or type(addon.SetCrazyArrow) ~= "function" then return false end
    hook(addon, "SetCrazyArrow", function(_, uid)
        crazyUID = uid
        crazyChanged()
    end)
    if type(addon.ClearCrazyArrowPoint) == "function" then
        hook(addon, "ClearCrazyArrowPoint", function() crazyChanged() end)
    end
    if type(addon.RemoveWaypoint) == "function" then
        hook(addon, "RemoveWaypoint", function(_, uid)
            if uid ~= nil and uid == crazyUID then crazyUID = nil end
            crazyChanged()
        end)
    end
    crazyHooked = true
    return true
end

--- UnwatchCrazyArrow(fn): stops calling fn (the hooks stay; with no watcher they do nothing).
function M.UnwatchCrazyArrow(fn)
    for i = #crazyWatchers, 1, -1 do
        if crazyWatchers[i] == fn then table.remove(crazyWatchers, i) end
    end
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    -- A waypoint description from the previous session has no live uid behind it any more.
    local db = charDB()
    if db then db.tomtomWaypoint = nil end
end

function M.Enable()
    if not listener.RegisterMessage then return end
    -- "mirror" keeps TomTom pointed at whatever PandaQuest points at. Router calls SetWaypoint
    -- directly on a change; this handler covers the case where the setting is flipped later.
    listener:RegisterMessage("PQ_SETTING_CHANGED", function(_, path)
        if path ~= "nav.tomtomMode" then return end
        local PQ = ns.PQ
        if not PQ or not PQ.db then return end
        local nav = PQ.db.profile.nav
        if nav.tomtomMode ~= "mirror" then
            M.Clear()
        elseif ns.Router and ns.Router.GetCurrent then
            local target = ns.Router.GetCurrent()
            if target then M.SetWaypoint(target) end
        end
    end)
end
