-- Sync/Community.lua: reads the guide the PandaQuest hub produced from everybody's telemetry
-- The companion tool overwrites Database/Overrides/Community.lua, which sets
--
--   ns.Overrides.community = { generated = "2026-09-06T12:00:00Z", version = 1,
--                              ackUploadedThrough = 1725600000, quests = { [questID] = {...} } }
--
-- That file is machine written and may be absent, truncated or from a newer format, so every
-- accessor here validates the shape it is about to read and returns nil instead of erroring.
--
-- The module also closes the upload loop: the hub puts the timestamp it has already accepted into
-- `ackUploadedThrough`, and on load we copy it into PandaQuestSync and drop the sessions it covers.
local _, ns = ...

local M = {}
ns.Community = M

local Log = ns.Log
local L = ns.L

local type, tonumber, tostring, pairs = type, tonumber, tostring, pairs
local format = string.format

---------------------------------------------------------------------------
-- Access to the generated table
---------------------------------------------------------------------------

--- data() -> the community table, or nil when the override file is missing or malformed.
local function data()
    local overrides = ns.Overrides
    local community = overrides and overrides.community
    if type(community) ~= "table" then return nil end
    return community
end

--- IsAvailable() -> true when there is at least one quest in the community data.
function M.IsAvailable()
    local community = data()
    local quests = community and community.quests
    if type(quests) ~= "table" then return false end
    return next(quests) ~= nil
end

--- GetVersion() -> number|nil, the format version the companion wrote.
function M.GetVersion()
    local community = data()
    return community and tonumber(community.version) or nil
end

--- GetGeneratedDate() -> "2026-09-06"|nil. The stamp is ISO 8601; only the date part is shown.
function M.GetGeneratedDate()
    local community = data()
    local generated = community and community.generated
    if type(generated) ~= "string" or generated == "" then return nil end
    local day = generated:match("^(%d%d%d%d%-%d%d%-%d%d)")
    return day or generated
end

--- GetFreshnessText() -> "Community data from 2026-09-06" | "No community data yet."
function M.GetFreshnessText()
    local day = M.GetGeneratedDate()
    if not day then return L["No community data yet."] end
    return format(L["Community data from %s"], day)
end

--- GetQuestCount() -> how many quests the guide covers.
function M.GetQuestCount()
    local community = data()
    local quests = community and community.quests
    if type(quests) ~= "table" then return 0 end
    local n = 0
    for _ in pairs(quests) do n = n + 1 end
    return n
end

---------------------------------------------------------------------------
-- Quest lookups
---------------------------------------------------------------------------

--- GetQuestStats(questID) -> { runs, avgSeconds, medianSeconds, objectives, turnIn, pickup, deaths, tips }|nil
-- The table is the shared generated one: read it, never write into it.
function M.GetQuestStats(questID)
    if type(questID) ~= "number" then return nil end
    local community = data()
    local quests = community and community.quests
    if type(quests) ~= "table" then return nil end
    local stats = quests[questID]
    if type(stats) ~= "table" then return nil end
    return stats
end

--- GetAvgSeconds(questID) -> seconds|nil, what Nav/Arrow shows as "Community: avg 4 min".
function M.GetAvgSeconds(questID)
    local stats = M.GetQuestStats(questID)
    if not stats then return nil end
    local avg = tonumber(stats.avgSeconds) or tonumber(stats.medianSeconds)
    if not avg or avg <= 0 then return nil end
    return avg
end

--- GetRuns(questID) -> how many recorded runs the average is based on (0 when unknown).
function M.GetRuns(questID)
    local stats = M.GetQuestStats(questID)
    return (stats and tonumber(stats.runs)) or 0
end

local function objectiveEntry(questID, objectiveIndex)
    local stats = M.GetQuestStats(questID)
    if not stats then return nil end
    local objectives = stats.objectives
    if type(objectives) ~= "table" then return nil end
    local entry = objectives[objectiveIndex or 1]
    if type(entry) ~= "table" then return nil end
    return entry
end

--- GetHotspots(questID, objectiveIndex) -> { {m=,x=,y=,w=}, ... }|nil (generated order).
function M.GetHotspots(questID, objectiveIndex)
    local entry = objectiveEntry(questID, objectiveIndex)
    local hotspots = entry and entry.hotspots
    if type(hotspots) ~= "table" or #hotspots == 0 then return nil end
    return hotspots
end

--- GetHotspot(questID, objectiveIndex) -> { m, x, y, w }|nil
-- The heaviest weight wins; Nav/Targets uses it to pick the representative point of a spawn cluster.
-- Entries without usable numeric coordinates are skipped, so half-written data cannot poison a target.
function M.GetHotspot(questID, objectiveIndex)
    local hotspots = M.GetHotspots(questID, objectiveIndex)
    if not hotspots then return nil end
    local best, bestWeight
    for i = 1, #hotspots do
        local spot = hotspots[i]
        if type(spot) == "table" then
            local x, y = tonumber(spot.x), tonumber(spot.y)
            local m = tonumber(spot.m)
            if x and y and m and x >= 0 and x <= 1 and y >= 0 and y <= 1 then
                local weight = tonumber(spot.w) or 0
                if not best or weight > bestWeight then best, bestWeight = spot, weight end
            end
        end
    end
    return best
end

--- GetObjectiveOrder(questID) -> { objectiveIndex, ... } sorted by the `order` the hub derived.
function M.GetObjectiveOrder(questID)
    local stats = M.GetQuestStats(questID)
    local objectives = stats and stats.objectives
    if type(objectives) ~= "table" then return nil end
    local list = {}
    for index, entry in pairs(objectives) do
        if type(index) == "number" and type(entry) == "table" then
            list[#list + 1] = { index = index, order = tonumber(entry.order) or index }
        end
    end
    if #list == 0 then return nil end
    table.sort(list, function(a, b)
        if a.order == b.order then return a.index < b.index end
        return a.order < b.order
    end)
    local out = {}
    for i = 1, #list do out[i] = list[i].index end
    return out
end

local function point(stats, key)
    local spot = stats and stats[key]
    if type(spot) ~= "table" then return nil end
    local m, x, y = tonumber(spot.m), tonumber(spot.x), tonumber(spot.y)
    if not (m and x and y) then return nil end
    return spot
end

--- GetTurnIn(questID) / GetPickup(questID) -> { m, x, y }|nil, where players actually hand in / pick up.
function M.GetTurnIn(questID) return point(M.GetQuestStats(questID), "turnIn") end
function M.GetPickup(questID) return point(M.GetQuestStats(questID), "pickup") end

--- GetTips(questID) -> { "Most players do objective 2 first", ... }|nil
function M.GetTips(questID)
    local stats = M.GetQuestStats(questID)
    local tips = stats and stats.tips
    if type(tips) ~= "table" or #tips == 0 then return nil end
    return tips
end

--- ApplyToTarget(target): fills the community fields of a Target.
-- Returns true when anything was attached.
function M.ApplyToTarget(target)
    if type(target) ~= "table" or type(target.questID) ~= "number" then return false end
    local avg = M.GetAvgSeconds(target.questID)
    local hotspot = M.GetHotspot(target.questID, target.objectiveIndex)
    target.communityAvgTime = avg
    target.communityHotspot = hotspot
    return (avg ~= nil) or (hotspot ~= nil)
end

---------------------------------------------------------------------------
-- Upload acknowledgement
---------------------------------------------------------------------------

local function syncStore()
    local sync = ns.Sync or _G.PandaQuestSync
    if type(sync) ~= "table" then return nil end
    return sync
end

--- PruneUploadedSessions(ack) -> number removed
-- Drops every finished session that ended at or before `ack`: the hub already has it. The session
-- still being written is never touched, and neither is one that has no `end` stamp yet.
function M.PruneUploadedSessions(ack)
    ack = tonumber(ack)
    if not ack or ack <= 0 then return 0 end
    local sync = syncStore()
    local sessions = sync and sync.sessions
    if type(sessions) ~= "table" then return 0 end

    local Telemetry = ns.Telemetry
    local current = Telemetry and Telemetry.GetSession and Telemetry.GetSession() or nil

    local n = #sessions
    local kept, removed = 0, 0
    for i = 1, n do
        local entry = sessions[i]
        local keep = true
        if type(entry) ~= "table" then
            keep = false
        elseif entry ~= current then
            -- A session that was never closed (client crash) is judged by its start stamp, so it
            -- cannot linger in the saved variable forever once the server has moved past it.
            local finished = tonumber(entry["end"]) or tonumber(entry.start)
            if finished and finished <= ack then keep = false end
        end
        if keep then
            kept = kept + 1
            sessions[kept] = entry
        else
            removed = removed + 1
        end
    end
    for i = kept + 1, n do sessions[i] = nil end
    return removed
end

--- SyncAck() -> ack|nil, removed
-- Copies `ackUploadedThrough` from the generated file into PandaQuestSync (never backwards) and
-- prunes the sessions it covers. Safe to call repeatedly.
function M.SyncAck()
    local community = data()
    local ack = community and tonumber(community.ackUploadedThrough)
    local sync = syncStore()
    if not ack or ack <= 0 or not sync then return nil, 0 end

    local previous = tonumber(sync.ackUploadedThrough) or 0
    if ack > previous then
        sync.ackUploadedThrough = ack
    else
        ack = previous
    end

    local removed = M.PruneUploadedSessions(ack)
    if removed > 0 then
        Log.Debug("Community", "server acknowledged %s, pruned %d uploaded session(s)", tostring(ack), removed)
    end
    return ack, removed
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    -- The override file has already run (it loads before Sync/ in the TOC), so the ack can be
    -- applied as soon as the saved variable exists. Never let bad generated data break the login.
    local ok, err = pcall(M.SyncAck)
    if not ok then
        Log.Warn("Community", "community data is unusable: %s", tostring(err))
    end
end

function M.Enable()
    if M.IsAvailable() then
        Log.Info("Community", L["Community data from %s"], tostring(M.GetGeneratedDate() or "?"))
    end
end
