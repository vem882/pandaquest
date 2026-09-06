-- Nav/TomTom.lua: optional TomTom integration (docs/06 section 9.6).
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
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    -- A waypoint description from the previous session has no live uid behind it any more.
    local db = charDB()
    if db then db.tomtomWaypoint = nil end
end

function M.Enable()
    local PQ = ns.PQ
    if not PQ or not PQ.RegisterMessage then return end
    -- "mirror" keeps TomTom pointed at whatever PandaQuest points at. Router calls SetWaypoint
    -- directly on a change; this handler covers the case where the setting is flipped later.
    PQ:RegisterMessage("PQ_SETTING_CHANGED", function(_, path)
        if path ~= "nav.tomtomMode" then return end
        local nav = PQ.db.profile.nav
        if nav.tomtomMode ~= "mirror" then
            M.Clear()
        elseif ns.Router and ns.Router.GetCurrent then
            local target = ns.Router.GetCurrent()
            if target then M.SetWaypoint(target) end
        end
    end)
end
