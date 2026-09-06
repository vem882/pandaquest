-- Nav/Router.lua: picks the target the arrow points at, and measures the way there (docs/06 9.4).
--
-- Everything is measured in real world yards through HereBeDragons. pfQuest compared zone map
-- percentages with a hard coded 1.5 aspect fudge (route.lua:186) which is wrong by up to a factor
-- of three between zones; GetWorldCoordinatesFromZone gives the true continent yards instead.
--
-- Angles: HBD:GetWorldVector returns `angle, distance` where the angle is 0 at north and grows the
-- same way GetPlayerFacing() does (north 0, west pi/2, south pi, east 3*pi/2). Because both use the
-- same convention, the relative bearing is simply worldAngle - playerFacing; Arrow.lua feeds that
-- straight into Texture:SetRotation.
--
-- Update rate (docs/06 9.4): the ticker runs at 10 Hz, but the body throttles itself to 1 Hz while
-- the player stands still. The list is re-sorted at most once a second and the greedy route is
-- re-planned only when the identity of the nearest target changes, exactly like pfQuest.
local _, ns = ...

local M = {}
ns.Router = M

local Util, Log = ns.Util, ns.Log

-- AceEvent/AceTimer key their registries by object, and CallbackHandler keeps exactly ONE callback
-- per (object, message). Registering on the shared ns.PQ object therefore silently replaces the
-- handler another module installed for the same message, so every module listens through its own
-- embedded object instead (docs/06 section 3 allows a module to use its own frame).
local listener = {}
M.listener = listener
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
    local AceTimer = LibStub and LibStub("AceTimer-3.0", true)
    if AceTimer then AceTimer:Embed(listener) end
end

local type, tonumber, tostring, pairs = type, tonumber, tostring, pairs
local abs, huge, max, pi = math.abs, math.huge, math.max, math.pi
local sort = table.sort
local wipe = wipe or table.wipe

local PI2 = pi * 2

local TICK = 0.1                    -- ticker period
local MOVING_INTERVAL = 0.1         -- 10 Hz while moving
local IDLE_INTERVAL = 1.0           -- 1 Hz while standing still
local SORT_INTERVAL = 1.0           -- re-sort at 1 Hz
local MOVING_SPEED = 0.5            -- yards/s above which the player counts as moving
local CROSS_CONTINENT_PENALTY = 500000
local ROUTE_MAX = 10                -- greedy nearest-neighbour route length
local ETA_SPEED_TAU = 1.5           -- EMA time constant for the speed used by the ETA
local ETA_SNAP_RATIO = 0.35         -- a speed change this large (mount up) resets the EMA at once
local ETA_DEADBAND = 0.02           -- +-2 % hysteresis on the displayed ETA
local ETA_DEADBAND_MIN = 0.5        -- ...but never less than half a second

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local sorted = {}                   -- every target, ordered by weight (reused, never reallocated)
local route = {}                    -- greedy nearest-neighbour plan (reused)
local reached = {}                  -- key -> true, one PQ_TARGET_REACHED per target
local current                       -- Target|nil
local manualKey                     -- pinned target key (mirrored into db.char.manualTargetKey)
local skippedKey                    -- target skipped with Router.Skip until the list changes

local lastUpdate, lastSort = 0, 0
local lastRouteKey                  -- current.key when the route was planned
local ticker

local etaSpeed, etaSpeedAt          -- EMA state for the ETA speed
local etaKey, etaShown              -- hysteresis state for the displayed ETA

local HBD

local function hbd()
    if HBD == nil then
        HBD = (LibStub and LibStub("HereBeDragons-2.0", true)) or false
    end
    return HBD or nil
end

local function now()
    return (GetTime and GetTime()) or 0
end

local function profile()
    local PQ = ns.PQ
    return (PQ and PQ.db and PQ.db.profile) or ns.DEFAULTS.profile
end

local function charDB()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.char or nil
end

local function playerPosition()
    local Player = ns.Player
    if not Player or not Player.GetPosition then return nil end
    return Player.GetPosition()
end

---------------------------------------------------------------------------
-- Geometry
---------------------------------------------------------------------------

-- Fills target.worldX/worldY/instanceID when Targets has not done it yet.
local function worldOf(target)
    if not target then return nil end
    if target.worldX and target.worldY and target.instanceID then
        return target.worldX, target.worldY, target.instanceID
    end
    local Targets = ns.Targets
    if Targets and Targets.ResolveWorld and Targets.ResolveWorld(target) then
        return target.worldX, target.worldY, target.instanceID
    end
    return nil
end

--- GetDistanceTo(target) -> yards|nil. nil when the position is unknown (instance) or the target
-- sits on another continent, where a straight-line yard count would be meaningless.
function M.GetDistanceTo(target)
    local lib = hbd()
    if not lib or not target then return nil end
    local pos = playerPosition()
    if not pos or not pos.worldX then return nil end
    local tx, ty, ti = worldOf(target)
    if not tx or ti ~= pos.instanceID then return nil end
    -- GetWorldDistance returns distance, deltaX, deltaY: only the first value belongs to callers.
    local distance = lib:GetWorldDistance(pos.instanceID, pos.worldX, pos.worldY, tx, ty)
    return distance
end

--- GetAngleTo(target) -> radians|nil, measured like GetPlayerFacing (0 = north, growing westwards).
function M.GetAngleTo(target)
    local lib = hbd()
    if not lib or not target then return nil end
    local pos = playerPosition()
    if not pos or not pos.worldX then return nil end
    local tx, ty, ti = worldOf(target)
    if not tx or ti ~= pos.instanceID then return nil end
    local angle = lib:GetWorldVector(pos.instanceID, pos.worldX, pos.worldY, tx, ty)
    return angle
end

--- GetBearingTo(target) -> radians in (-pi, pi], 0 = straight ahead, positive = to the player's
-- left. This is the value Arrow.lua hands to Texture:SetRotation.
function M.GetBearingTo(target)
    local angle = M.GetAngleTo(target)
    if not angle then return nil end
    local Compat = ns.Compat
    local facing = Compat and Compat.GetPlayerFacing and Compat.GetPlayerFacing()
    if not facing then return nil end
    local bearing = angle - facing
    while bearing > pi do bearing = bearing - PI2 end
    while bearing <= -pi do bearing = bearing + PI2 end
    return bearing
end

--- Distance between two targets, used by the greedy route planner. nil across continents.
local function targetDistance(a, b)
    local lib = hbd()
    if not lib then return nil end
    local ax, ay, ai = worldOf(a)
    local bx, by, bi = worldOf(b)
    if not ax or not bx or ai ~= bi then return nil end
    local distance = lib:GetWorldDistance(ai, ax, ay, bx, by)
    return distance
end

---------------------------------------------------------------------------
-- ETA
---------------------------------------------------------------------------

--- Resets the ETA smoothing; called whenever the target changes so the new number appears at once.
function M.ResetETA()
    etaSpeed, etaSpeedAt = nil, nil
    etaKey, etaShown = nil, nil
end

-- Exponentially smoothed expected travel speed. Player.GetExpectedSpeed already floors the value at
-- the run speed of the current form, so standing still gives 7 (or the mount speed) instead of 0
-- and the ETA stays finite. The EMA kills the frame-to-frame wobble of GetUnitSpeed; a big jump
-- (mounting up, taking off) snaps instead of crawling across 1.5 seconds of wrong numbers.
local function smoothedSpeed()
    local Player = ns.Player
    if not Player or not Player.GetExpectedSpeed then return nil end
    local raw = Player.GetExpectedSpeed()
    if type(raw) ~= "number" or raw <= 0 then return nil end
    local t = now()
    if not etaSpeedAt or not etaSpeed then
        etaSpeed, etaSpeedAt = raw, t
        return etaSpeed
    end
    if abs(raw - etaSpeed) > ETA_SNAP_RATIO * max(raw, etaSpeed) then
        etaSpeed, etaSpeedAt = raw, t
        return etaSpeed
    end
    local dt = t - etaSpeedAt
    etaSpeedAt = t
    if dt <= 0 then return etaSpeed end
    if dt >= ETA_SPEED_TAU then
        etaSpeed = raw
    else
        etaSpeed = etaSpeed + (raw - etaSpeed) * (dt / ETA_SPEED_TAU)
    end
    return etaSpeed
end

M.GetSmoothedSpeed = smoothedSpeed

--- GetETA(target) -> seconds|nil. distance / Player.GetExpectedSpeed(), smoothed twice: an EMA on
-- the speed and a small deadband on the result, so the arrow does not flicker between "1 min 19 s"
-- and "1 min 21 s" every frame. nil when the speed is unknown or the target is on another continent.
function M.GetETA(target)
    target = target or current
    if not target then return nil end
    local distance = M.GetDistanceTo(target)
    if not distance then return nil end
    local speed = smoothedSpeed()
    if not speed or speed <= 0 then return nil end
    local raw = distance / speed
    if etaKey == target.key and etaShown then
        local band = etaShown * ETA_DEADBAND
        if band < ETA_DEADBAND_MIN then band = ETA_DEADBAND_MIN end
        if abs(raw - etaShown) < band then return etaShown end
    end
    etaKey, etaShown = target.key, raw
    return raw
end

---------------------------------------------------------------------------
-- Weighting and sorting
---------------------------------------------------------------------------

-- docs/06 9.4: auto weight = priority * 100 + distance; a target on another continent is pushed
-- past everything else. HBD cannot measure across continents, so the penalty replaces the distance
-- term rather than scaling it (see the deviation note in the agent report).
local function weightOf(target, mode)
    local distance = target.distance
    if mode == "nearest" then
        return distance or (CROSS_CONTINENT_PENALTY + (target.priority or 10))
    end
    local priority = target.priority or 10
    if not distance then
        return CROSS_CONTINENT_PENALTY + priority * 100
    end
    return priority * 100 + distance
end

local function focusQuestID()
    local nav = profile().nav or {}
    local questID = tonumber(nav.focusQuestID)
    if questID then return questID end
    if GetSuperTrackedQuestID then
        local tracked = GetSuperTrackedQuestID()
        if type(tracked) == "number" and tracked > 0 then return tracked end
    end
    return nil
end

local function passesMode(target, mode, focus)
    if mode ~= "quest" then return true end
    if not focus then return true end
    return target.questID == focus
end

local function byWeight(a, b)
    if a.__weight == b.__weight then
        return tostring(a.key) < tostring(b.key)
    end
    return a.__weight < b.__weight
end

-- Refreshes target.distance for every known target. Pure arithmetic; no allocation.
local function refreshDistances()
    local all = ns.Targets and ns.Targets.GetAll and ns.Targets.GetAll() or nil
    if not all then return 0 end
    for i = 1, #all do
        all[i].distance = M.GetDistanceTo(all[i])
    end
    return #all
end

local function resort()
    local all = ns.Targets and ns.Targets.GetAll and ns.Targets.GetAll() or nil
    wipe(sorted)
    if not all then return end
    local mode = (profile().nav or {}).mode or "auto"
    local focus = (mode == "quest") and focusQuestID() or nil
    for i = 1, #all do
        local target = all[i]
        if passesMode(target, mode, focus) then
            target.__weight = weightOf(target, mode)
            sorted[#sorted + 1] = target
        end
    end
    sort(sorted, byWeight)
end

---------------------------------------------------------------------------
-- Route planning (greedy nearest neighbour, pfQuest route.lua:246)
---------------------------------------------------------------------------

local used = {}

local function planRoute(start)
    wipe(route)
    wipe(used)
    if not start then return end
    route[1] = start
    used[start] = true

    -- ITEMUSE dedup: N identical "use the quest item here" objects add nothing to a route.
    local itemUseSeen = {}
    if start.kind == "ITEMUSE" and start.questID then itemUseSeen[start.questID] = true end

    local from = start
    while #route < ROUTE_MAX do
        local best, bestDistance = nil, huge
        for i = 1, #sorted do
            local candidate = sorted[i]
            if not used[candidate] and candidate.instanceID == from.instanceID then
                local skip = candidate.kind == "ITEMUSE" and candidate.questID and itemUseSeen[candidate.questID]
                if not skip then
                    local d = targetDistance(from, candidate)
                    if d and d < bestDistance then
                        best, bestDistance = candidate, d
                    end
                end
            end
        end
        if not best then break end
        route[#route + 1] = best
        used[best] = true
        if best.kind == "ITEMUSE" and best.questID then itemUseSeen[best.questID] = true end
        from = best
    end
end

---------------------------------------------------------------------------
-- Current target
---------------------------------------------------------------------------

local function setCurrent(target)
    if target == current then return end
    local previous = current
    current = target
    lastRouteKey = nil
    M.ResetETA()
    Log.Debug("Router", "current target -> %s", target and tostring(target.key) or "nil")
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then
        PQ:SendMessage("PQ_CURRENT_TARGET_CHANGED", target, previous)
    end
    local nav = profile().nav or {}
    if nav.tomtomMode == "mirror" and ns.TomTomBridge and ns.TomTomBridge.SetWaypoint then
        if target then ns.TomTomBridge.SetWaypoint(target)
        elseif ns.TomTomBridge.Clear then ns.TomTomBridge.Clear() end
    end
end

local function pickCurrent()
    local manual = M.GetManualTarget()
    if manual then return manual end
    for i = 1, #sorted do
        local target = sorted[i]
        if target.key ~= skippedKey then return target end
    end
    return nil
end

--- Arrival radius in yards: docs/06 9.4 clamp(count,1,20)/10*10 + arriveRadius. A big spawn cluster
-- gets a bigger circle, because "you are in the right place" is a wider area there.
function M.GetArriveRadius(target)
    local base = tonumber((profile().nav or {}).arriveRadius) or 15
    local count = tonumber(target and target.count) or 1
    return Util.Clamp(count, 1, 20) / 10 * 10 + base
end

local function checkArrival(target)
    if not target or not target.key then return end
    if reached[target.key] then return end
    local distance = target.distance
    if not distance then return end
    if distance >= M.GetArriveRadius(target) then return end
    reached[target.key] = true
    Log.Debug("Router", "reached %s (%.1f yd)", tostring(target.key), distance)
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then
        PQ:SendMessage("PQ_TARGET_REACHED", target)
    end
end

---------------------------------------------------------------------------
-- Update loop
---------------------------------------------------------------------------

--- Update(force): the whole navigation step. Called at TICK by the ticker and directly by tests,
-- slash commands and message handlers that need an immediate answer.
function M.Update(force)
    local t = now()
    local Player = ns.Player
    local pos = playerPosition()
    if not pos then
        -- Inside an instance UnitPosition() and C_Map both go dark: stop navigating (docs/06 9.4).
        wipe(sorted)
        wipe(route)
        setCurrent(nil)
        return
    end

    local speed = (Player and Player.GetSpeed and Player.GetSpeed()) or 0
    local interval = (speed > MOVING_SPEED) and MOVING_INTERVAL or IDLE_INTERVAL
    if not force and (t - lastUpdate) < interval then return end
    lastUpdate = t

    refreshDistances()

    if force or (t - lastSort) >= SORT_INTERVAL or #sorted == 0 then
        resort()
        lastSort = t
    end

    setCurrent(pickCurrent())

    if current then
        if lastRouteKey ~= current.key then
            planRoute(current)
            lastRouteKey = current.key
        end
        checkArrival(current)
    elseif #route > 0 then
        wipe(route)
    end
end

---------------------------------------------------------------------------
-- Public API
---------------------------------------------------------------------------

function M.GetCurrent()
    return current
end

--- GetRoute() -> { Target... } starting with the current target. Shared array; do not mutate.
function M.GetRoute()
    return route
end

function M.GetSorted()
    return sorted
end

--- SetManualTarget(target|nil): pins the arrow to one target until it is cleared.
function M.SetManualTarget(target)
    local key = type(target) == "table" and target.key or target
    manualKey = key or nil
    local db = charDB()
    if db then db.manualTargetKey = manualKey end
    skippedKey = nil
    M.Update(true)
    return manualKey
end

function M.GetManualTarget()
    if not manualKey then return nil end
    local Targets = ns.Targets
    local target = Targets and Targets.GetByKey and Targets.GetByKey(manualKey) or nil
    if not target then
        -- The pinned target disappeared (quest turned in, objective done): drop the pin - but only
        -- once the target list actually holds something. At login the first rebuild is still
        -- pending (debounced, spread over frames) and every key misses; clearing then would make
        -- db.char.manualTargetKey write-only and no pin would ever survive a reload.
        local all = Targets and Targets.GetAll and Targets.GetAll() or nil
        if type(all) == "table" and #all > 0 then
            manualKey = nil
            local db = charDB()
            if db then db.manualTargetKey = nil end
        end
    end
    return target
end

--- Skip(): ignore the current target until the target list changes.
function M.Skip()
    if manualKey then
        M.SetManualTarget(nil)
        return
    end
    skippedKey = current and current.key or nil
    Log.Debug("Router", "skipping %s", tostring(skippedKey))
    M.Update(true)
end

function M.GetSkipped()
    return skippedKey
end

--- IsReached(target) -> bool: has PQ_TARGET_REACHED already fired for this target?
function M.IsReached(target)
    local key = type(target) == "table" and target.key or target
    return key ~= nil and reached[key] == true
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

local function onTargetsUpdated()
    local Targets = ns.Targets
    local getByKey = Targets and Targets.GetByKey or nil
    -- PQ_TARGETS_UPDATED arrives on every objective tick (a rebuild follows PQ_QUESTLOG_CHANGED),
    -- so wiping the state here would re-fire PQ_TARGET_REACHED for a target the player is still
    -- standing on - docs/06 9.4 says once per target - and would undo an explicit Skip within a
    -- second. Both are instead reconciled against the new list: only keys that really disappeared
    -- are forgotten.
    if getByKey then
        for key in pairs(reached) do
            if not getByKey(key) then reached[key] = nil end
        end
        if skippedKey and not getByKey(skippedKey) then skippedKey = nil end
    else
        wipe(reached)
        skippedKey = nil
    end
    lastRouteKey = nil
    -- The current target table was thrown away by the rebuild; re-resolve it by key.
    if current then
        current = (getByKey and getByKey(current.key)) or nil
    end
    M.Update(true)
end

function M.Init()
    local db = charDB()
    manualKey = db and db.manualTargetKey or nil
end

function M.Enable()
    if listener.RegisterMessage then
        listener:RegisterMessage("PQ_TARGETS_UPDATED", onTargetsUpdated)
    end
    if listener.RegisterEvent then
        listener:RegisterEvent("PLAYER_ENTERING_WORLD", function() M.Update(true) end)
        listener:RegisterEvent("ZONE_CHANGED_NEW_AREA", function() M.Update(true) end)
    end
    if listener.ScheduleRepeatingTimer and not ticker then
        ticker = listener:ScheduleRepeatingTimer(M.Update, TICK)
    end
end

function M.OnProfileChanged()
    M.ResetETA()
    lastSort = 0
    M.Update(true)
end

--- Test/debug helper: forgets every cached decision without touching the target list.
function M.Reset()
    wipe(sorted)
    wipe(route)
    wipe(reached)
    current, skippedKey, lastRouteKey = nil, nil, nil
    lastUpdate, lastSort = 0, 0
    M.ResetETA()
end
