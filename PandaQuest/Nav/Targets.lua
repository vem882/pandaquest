-- Nav/Targets.lua: collects every place the player could usefully walk to (docs/06 section 9.2).
--
-- The list is assembled in a ns.Thread coroutine because a full rebuild touches every quest in the
-- log plus every available quest, and each of those hits the database. Nothing here talks to the
-- Blizzard quest log directly: Quest/QuestLog owns that, Quest/Objectives turns a quest into
-- Target tables (docs/06 section 9.1) and Quest/Availability decides what is pickable.
--
-- Rebuild triggers: PQ_QUESTLOG_CHANGED, PQ_AVAILABLE_UPDATED, PQ_DB_READY, PQ_PLAYER_ZONE_CHANGED.
-- Result: PQ_TARGETS_UPDATED with the new array. Router is the only consumer that matters for the
-- arrow; Map/Pins draws the same tables.
local _, ns = ...
local L = ns.L

local M = {}
ns.Targets = M

local Const, Log, Thread = ns.Const, ns.Log, ns.Thread

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

local type, pairs, tonumber, tostring, pcall = type, pairs, tonumber, tostring, pcall
local abs, huge, floor = math.abs, math.huge, math.floor
local sort, tremove = table.sort, table.remove
local format = string.format
local wipe = wipe or table.wipe

local CLUSTER_BOX = 5           -- pfQuest getcluster: +-5 % of the zone map counts as one cluster
local MAX_SPAWNS = 60           -- Target.spawns is capped (docs/06 section 9.1)
local REBUILD_DELAY = 0.25      -- debounce: several messages in one frame produce one rebuild

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local targets = {}              -- ordered array of Target (published through GetAll)
local byKey = {}                -- key -> Target
local byQuest = {}              -- questID -> { Target... }

local job                       -- running Thread handle
local pendingReason             -- reason for the queued rebuild
local rebuildTimer              -- AceTimer handle for the debounce
local customSeq = 0             -- running number for custom:<n> keys

local HBD

local function hbd()
    if HBD == nil then
        HBD = (LibStub and LibStub("HereBeDragons-2.0", true)) or false
    end
    return HBD or nil
end

local function profile()
    local PQ = ns.PQ
    return (PQ and PQ.db and PQ.db.profile) or ns.DEFAULTS.profile
end

local function charDB()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.char or nil
end

---------------------------------------------------------------------------
-- World coordinates
---------------------------------------------------------------------------

--- Fills target.worldX / worldY / instanceID from uiMapID + x,y (0..100). Returns true on success.
-- Router needs world yards; the zone percentages alone cannot be compared across maps.
function M.ResolveWorld(target)
    if not target then return false end
    if target.worldX and target.worldY and target.instanceID then return true end
    local lib = hbd()
    if not lib then return false end
    local uiMapID = target.uiMapID
    if not uiMapID and target.areaID and ns.Zones and ns.Zones.GetUiMapIdByAreaId then
        uiMapID = ns.Zones.GetUiMapIdByAreaId(target.areaID)
        target.uiMapID = uiMapID
    end
    if not uiMapID or type(target.x) ~= "number" or type(target.y) ~= "number" then return false end
    local wx, wy, instanceID = lib:GetWorldCoordinatesFromZone(target.x / 100, target.y / 100, uiMapID)
    if not wx then return false end
    target.worldX, target.worldY, target.instanceID = wx, wy, instanceID
    return true
end

---------------------------------------------------------------------------
-- Clustering (pfQuest getcluster)
---------------------------------------------------------------------------

-- Distance from the player to a spawn, in yards; huge when it cannot be computed. Only used to
-- break ties between equally large clusters, so a rough answer is good enough.
local function spawnDistance(areaID, uiMapID, x, y)
    local lib = hbd()
    local Player = ns.Player
    if not lib or not Player or not Player.GetPosition then return huge end
    local pos = Player.GetPosition()
    if not pos or not pos.worldX then return huge end
    if not uiMapID and areaID and ns.Zones and ns.Zones.GetUiMapIdByAreaId then
        uiMapID = ns.Zones.GetUiMapIdByAreaId(areaID)
    end
    if not uiMapID then return huge end
    local wx, wy, instanceID = lib:GetWorldCoordinatesFromZone(x / 100, y / 100, uiMapID)
    if not wx or instanceID ~= pos.instanceID then return huge end
    local d = lib:GetWorldDistance(instanceID, pos.worldX, pos.worldY, wx, wy)
    if not d then return huge end
    return d
end

--- Cluster(spawns) -> representative, count
-- spawns = { { areaID = , x = , y = , uiMapID = }, ... } (x,y in 0..100).
-- Picks the spawn with the most neighbours inside a +-CLUSTER_BOX box in the same area; ties go to
-- the cluster closest to the player, then to the first spawn, so the result is deterministic.
function M.Cluster(spawns)
    local n = spawns and #spawns or 0
    if n == 0 then return nil, 0 end
    if n == 1 then return spawns[1], 1 end

    local bestIndex, bestCount, bestDistance = 1, 0, huge
    for i = 1, n do
        local a = spawns[i]
        local count = 0
        for j = 1, n do
            local b = spawns[j]
            if a.areaID == b.areaID and abs(a.x - b.x) <= CLUSTER_BOX and abs(a.y - b.y) <= CLUSTER_BOX then
                count = count + 1
            end
        end
        if count > bestCount then
            bestIndex, bestCount = i, count
            bestDistance = spawnDistance(a.areaID, a.uiMapID, a.x, a.y)
        elseif count == bestCount then
            local d = spawnDistance(a.areaID, a.uiMapID, a.x, a.y)
            if d < bestDistance then
                bestIndex, bestDistance = i, d
            end
        end
        Thread.Yield()
    end
    return spawns[bestIndex], bestCount
end

-- Makes sure a Target has a representative point and a cluster count. Objectives may have done the
-- work already (the contract lets it); then this is a no-op.
local function ensureCluster(target)
    if not target then return end
    local spawns = target.spawns
    if spawns and #spawns > MAX_SPAWNS then
        -- Thin the list down: keep every k-th spawn so the pins stay spread out.
        local step = #spawns / MAX_SPAWNS
        local kept, at = {}, 1
        while #kept < MAX_SPAWNS and floor(at) <= #spawns do
            kept[#kept + 1] = spawns[floor(at)]
            at = at + step
        end
        target.spawns = kept
        spawns = kept
    end
    if target.x and target.y and target.count and target.count > 0 then return end
    if not spawns or #spawns == 0 then
        target.count = target.count or 1
        return
    end
    local rep, count = M.Cluster(spawns)
    if rep then
        target.areaID = target.areaID or rep.areaID
        target.uiMapID = target.uiMapID or rep.uiMapID
        target.x, target.y = rep.x, rep.y
        target.count = count
    end
    target.count = target.count or 1
end

---------------------------------------------------------------------------
-- Target assembly
---------------------------------------------------------------------------

local function isHidden(questID)
    local db = charDB()
    if db and db.hiddenQuests and db.hiddenQuests[questID] then return true end
    if ns.DB and ns.DB.IsQuestHidden and ns.DB.IsQuestHidden(questID) then return true end
    return false
end

local function accept(list, target)
    if type(target) ~= "table" or not target.key then return end
    if list[target.key] ~= nil then return end          -- keyed set doubles as a duplicate guard
    ensureCluster(target)
    M.ResolveWorld(target)
    if not target.priority then
        target.priority = (Const.TARGET_PRIORITY and Const.TARGET_PRIORITY[target.kind]) or 10
    end
    if not target.text and ns.Objectives and ns.Objectives.DescribeTarget then
        local ok, text = pcall(ns.Objectives.DescribeTarget, target)
        if ok and type(text) == "string" then target.text = text end
    end
    -- Community timings/hotspots are optional data; a missing companion file just leaves them nil.
    if ns.Community and ns.Community.ApplyToTarget then
        pcall(ns.Community.ApplyToTarget, target)
    end
    list[target.key] = target
    list[#list + 1] = target
end

-- The Blizzard "complete" flag is authoritative, but a quest whose objectives are all finished (or
-- that has no objectives at all, like a pure delivery) is ready to hand in too - and that is the
-- only sensible thing to navigate to.
local function isQuestComplete(QuestLog, questID, entry)
    if QuestLog.IsComplete and QuestLog.IsComplete(questID) then return true end
    local objectives = entry and entry.objectives
    if not objectives then return false end
    if #objectives == 0 then return true end
    for i = 1, #objectives do
        if not objectives[i].finished then return false end
    end
    return true
end

local function collectQuestLog(list)
    local QuestLog, Objectives = ns.QuestLog, ns.Objectives
    if not QuestLog or not QuestLog.GetAll or not Objectives then return end
    local prof = profile()
    local includeTurnIn = prof.nav and prof.nav.includeTurnIn
    for questID, entry in pairs(QuestLog.GetAll() or {}) do
        if not isHidden(questID) then
            local complete = isQuestComplete(QuestLog, questID, entry)
            local failed = QuestLog.IsFailed and QuestLog.IsFailed(questID)
            if not failed then
                if complete then
                    if includeTurnIn and Objectives.BuildTurnIn then
                        accept(list, Objectives.BuildTurnIn(questID))
                    end
                elseif Objectives.BuildForQuest then
                    local built = Objectives.BuildForQuest(questID)
                    if type(built) == "table" then
                        for i = 1, #built do accept(list, built[i]) end
                    end
                end
            end
        end
        Thread.Yield()
    end
end

-- Sorts the "available quest" candidates nearest first; unknown distances go last.
local function byDistance(a, b)
    local da, db = a.distance or huge, b.distance or huge
    if da == db then return (a.questID or 0) < (b.questID or 0) end
    return da < db
end

local function collectAvailable(list)
    local prof = profile()
    local nav = prof.nav or {}
    if not nav.includeAvailable then return end
    local Availability, Objectives = ns.Availability, ns.Objectives
    if not Availability or not Availability.GetAvailable or not Objectives or not Objectives.BuildPickup then
        return
    end
    local radius = tonumber(nav.availableRadius) or 800
    local maxAvailable = tonumber(nav.maxAvailable) or 5
    if maxAvailable <= 0 then return end

    local candidates = {}
    for questID in pairs(Availability.GetAvailable() or {}) do
        if not isHidden(questID) then
            local target = Objectives.BuildPickup(questID)
            if type(target) == "table" and target.key then
                ensureCluster(target)
                M.ResolveWorld(target)
                target.distance = M.DistanceTo(target)
                if target.distance and target.distance <= radius then
                    candidates[#candidates + 1] = target
                end
            end
        end
        Thread.Yield()
    end
    sort(candidates, byDistance)
    for i = 1, #candidates do
        if i > maxAvailable then break end
        accept(list, candidates[i])
    end
end

local function collectCustom(list)
    local db = charDB()
    local stored = db and db.customTargets
    if type(stored) ~= "table" then return end
    for key, entry in pairs(stored) do
        if type(entry) == "table" and entry.uiMapID then
            local index = tonumber(tostring(key):match("(%d+)$") or "") or 0
            if index > customSeq then customSeq = index end
            accept(list, {
                key = key,
                kind = "CUSTOM",
                uiMapID = entry.uiMapID,
                x = entry.x, y = entry.y,
                areaID = entry.areaID,
                count = 1,
                text = entry.text or L["Custom target"],
                questTitle = entry.text or L["Custom target"],
                icon = "custom",
                priority = (Const.TARGET_PRIORITY and Const.TARGET_PRIORITY.CUSTOM) or 10,
                isCustom = true,
            })
        end
    end
end

--- Publishes `list` (array part) as the new target set and sends PQ_TARGETS_UPDATED.
local function publish(list, reason)
    wipe(targets)
    wipe(byKey)
    for questID in pairs(byQuest) do byQuest[questID] = nil end

    for i = 1, #list do
        local target = list[i]
        targets[i] = target
        byKey[target.key] = target
        local questID = target.questID
        if questID then
            local bucket = byQuest[questID]
            if not bucket then
                bucket = {}
                byQuest[questID] = bucket
            end
            bucket[#bucket + 1] = target
        end
    end

    Log.Debug("Targets", "rebuilt (%s): %d targets", tostring(reason), #targets)
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then
        PQ:SendMessage("PQ_TARGETS_UPDATED", targets)
    end
end

---------------------------------------------------------------------------
-- Public API
---------------------------------------------------------------------------

--- DistanceTo(target) -> yards|nil. Router owns navigation, but Targets needs the same measurement
-- while ranking the available quests, so the primitive lives here too.
function M.DistanceTo(target)
    local lib = hbd()
    local Player = ns.Player
    if not lib or not target or not Player or not Player.GetPosition then return nil end
    local pos = Player.GetPosition()
    if not pos or not pos.worldX then return nil end
    if not M.ResolveWorld(target) then return nil end
    if target.instanceID ~= pos.instanceID then return nil end
    local distance = lib:GetWorldDistance(pos.instanceID, pos.worldX, pos.worldY, target.worldX, target.worldY)
    return distance
end

--- Rebuild(reason): starts (or restarts) the collection coroutine. Returns the Thread handle.
function M.Rebuild(reason)
    if job and Thread.IsRunning(job) then
        Thread.Cancel(job)
    end
    local list = {}
    job = Thread.Run(function()
        collectQuestLog(list)
        Thread.Yield()
        collectAvailable(list)
        Thread.Yield()
        collectCustom(list)
        publish(list, reason)
    end, { name = "Targets.Rebuild", pauseInCombat = false })
    return job
end

--- Coalesces a burst of messages into one rebuild REBUILD_DELAY seconds later.
function M.RequestRebuild(reason)
    pendingReason = reason or pendingReason
    if not listener.ScheduleTimer then
        M.Rebuild(pendingReason)
        pendingReason = nil
        return
    end
    if rebuildTimer then return end
    rebuildTimer = listener:ScheduleTimer(function()
        rebuildTimer = nil
        local why = pendingReason
        pendingReason = nil
        M.Rebuild(why)
    end, REBUILD_DELAY)
end

--- GetAll() -> { Target... }. Shared array: read it, never mutate it.
function M.GetAll()
    return targets
end

function M.GetByKey(key)
    return key and byKey[key] or nil
end

--- GetForQuest(questID) -> { Target... } (empty table when the quest has none).
local EMPTY = {}
function M.GetForQuest(questID)
    return byQuest[questID] or EMPTY
end

function M.GetCount()
    return #targets
end

--- AddCustom(uiMapID, x, y, text) -> Target. x,y are 0..100 like every other Target.
function M.AddCustom(uiMapID, x, y, text)
    uiMapID = tonumber(uiMapID)
    x, y = tonumber(x), tonumber(y)
    if not uiMapID or not x or not y then return nil end
    customSeq = customSeq + 1
    local key = format("custom:%d", customSeq)
    local areaID = ns.Zones and ns.Zones.GetAreaIdByUiMapId and ns.Zones.GetAreaIdByUiMapId(uiMapID) or nil
    local db = charDB()
    if db then
        db.customTargets = db.customTargets or {}
        db.customTargets[key] = { uiMapID = uiMapID, x = x, y = y, areaID = areaID, text = text }
    end
    local target = {
        key = key, kind = "CUSTOM", uiMapID = uiMapID, x = x, y = y, areaID = areaID, count = 1,
        text = text or L["Custom target"], questTitle = text or L["Custom target"], icon = "custom",
        priority = (Const.TARGET_PRIORITY and Const.TARGET_PRIORITY.CUSTOM) or 10, isCustom = true,
    }
    M.ResolveWorld(target)
    -- Publish immediately: a custom pin must be usable before the next full rebuild.
    targets[#targets + 1] = target
    byKey[key] = target
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then PQ:SendMessage("PQ_TARGETS_UPDATED", targets) end
    return target
end

function M.RemoveCustom(key)
    if not key then return false end
    local db = charDB()
    if db and db.customTargets then db.customTargets[key] = nil end
    local removed = false
    for i = #targets, 1, -1 do
        if targets[i].key == key then
            tremove(targets, i)
            removed = true
        end
    end
    byKey[key] = nil
    if removed then
        local PQ = ns.PQ
        if PQ and PQ.SendMessage then PQ:SendMessage("PQ_TARGETS_UPDATED", targets) end
    end
    return removed
end

function M.ClearCustom()
    local db = charDB()
    if db then db.customTargets = {} end
    for i = #targets, 1, -1 do
        if targets[i].isCustom then
            byKey[targets[i].key] = nil
            tremove(targets, i)
        end
    end
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    local db = charDB()
    if db and type(db.customTargets) ~= "table" then db.customTargets = {} end
end

function M.Enable()
    if not listener.RegisterMessage then return end
    listener:RegisterMessage("PQ_QUESTLOG_CHANGED", function() M.RequestRebuild("questlog") end)
    listener:RegisterMessage("PQ_AVAILABLE_UPDATED", function() M.RequestRebuild("available") end)
    listener:RegisterMessage("PQ_PLAYER_ZONE_CHANGED", function() M.RequestRebuild("zone") end)
end

function M.OnDataReady()
    M.RequestRebuild("dbready")
end

function M.OnProfileChanged()
    M.RequestRebuild("profile")
end
