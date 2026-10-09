-- Nodes/Respawn.lua: how long a thing takes to come back.
--
-- Three sources answer that question and they are not equally good, so every answer says which
-- one it came from:
--
--   "static"    the pfQuest seed in Database/Data/Seed.lua. Vanilla and TBC ids only -- of our
--               37,875 MoP-era NPC ids it covers two -- so for Pandaria it answers almost nothing.
--   "community" the median the hub computed from everybody's uploads, with its sample count.
--   "observed"  what THIS player measured this session, which is the only source that can also
--               drive a live countdown, because it is the only one that knows when the thing died.
--
-- How a measurement is made: a death is noted with its position, and the next time the same id is
-- seen alive near that position the interval between them is one observation.
--
--   * NPCs die in the combat log (UNIT_DIED and PARTY_KILL, attributed to the player or their pet)
--     and come back on a nameplate, a target or a mouseover. The combat log is read by
--     Sync/Telemetry.lua, which hands the kill over through NoteKill: COMBAT_LOG_EVENT_UNFILTERED
--     is the highest frequency event in the game and one addon has no business asking the client
--     to dispatch it to two frames. With telemetry off nobody registers it at all, and a kill is
--     then noticed from UNIT_HEALTH on the unit the player is actually fighting -- less precise
--     attribution, no extra cost, and the measurement still happens locally.
--   * A gathering node has no death event and no nameplate. Looting it is both halves at once: the
--     loot closes the previous interval and opens the next one, which is why one
--     record serves both C and D.
--
-- Four rules shape the file:
--
-- **The median, never the mean.** One observation made while the player was away for ten minutes
-- must not stretch the estimate. Observations are kept per spawn point in a small
-- ring and reduced with a median every time they are read.
--
-- **Two spawn points of one creature never contaminate each other.** An observation is keyed by
-- (kind, id, position), matched within MATCH_RADIUS map percent, so killing a Kobold Miner at one
-- end of the mine and meeting another at the other end is not a 3 second respawn.
--
-- **Bounded.** At most MAX_TRACKED_IDS ids *per kind*, MAX_SPAWNS_PER_ID spawn points each and
-- MAX_OBSERVATIONS_PER_SPAWN observations each: a full session of killing cannot grow this. A full
-- budget evicts what it has learned least from rather than refusing the newcomer, so a questing
-- session that opens hundreds of world objects cannot stop the next kill from being measured.
--
-- **Nothing runs per frame.** There is no OnUpdate here at all. The countdown is arithmetic done
-- when somebody asks for it (GetRemaining), and a spawn coming back is announced once, from the
-- event that noticed it, as PQ_RESPAWN_CHANGED.
--
-- Coordinates are 0..100 map percentages, like every Target and every pin in this addon
-- (Nav/Targets.lua); Sync/Telemetry.lua converts to the 0..1 the hub stores.
--
-- Verified against 5.5.4 rather than assumed:
--   * NAME_PLATE_UNIT_ADDED, UPDATE_MOUSEOVER_UNIT, PLAYER_TARGET_CHANGED, UNIT_HEALTH,
--     LOOT_OPENED, LOOT_CLOSED: all present in _reference/misc/ketho/Events_classic.lua.
--   * Frame:RegisterUnitEvent exists on this client (Blizzard's own 5.5.4 UI uses it, e.g.
--     _UI/Blizzard_UnitFrameUtil/Classic_PartyMemberFrame.lua:127).
--   * UnitGUID, UnitIsDead, GetNumLootItems, GetLootSourceInfo: present in
--     _reference/misc/ketho/GlobalAPI_classic.lua (GetLootSourceInfo(lootSlot) -> guid, quantity,
--     confirmed in _reference/misc/WoW-API/WoW-API/Data/Wiki.lua).
local _, ns = ...

local M = {}
ns.Respawn = M

local Util, Log = ns.Util, ns.Log

local type, tonumber, pcall = type, tonumber, pcall
local floor, huge = math.floor, math.huge
local sort, remove = table.sort, table.remove
local wipe = wipe or table.wipe

---------------------------------------------------------------------------
-- Constants
---------------------------------------------------------------------------

--- How near two positions have to be, in map percent, to count as the same spawn point.
-- A death is recorded at the player's position rather than the creature's -- the client offers no
-- position for another unit outside a party -- so the tolerance has to cover the distance a player
-- stands from what they are hitting. On a large zone map one percent is roughly forty yards.
local MATCH_RADIUS = 2.0

--- Anything shorter is not a respawn: a corpse's nameplate flickering, a target being re-acquired,
-- a second loot window on the same node.
local MIN_INTERVAL = 5

--- Anything longer cannot be attributed. The player left, did something else and came back; the
-- thing may have respawned five times in between.
local MAX_INTERVAL = 2 * 3600

local MAX_OBSERVATIONS_PER_SPAWN = 8
local MAX_SPAWNS_PER_ID = 24

--- Ids tracked per kind, NOT in total. Looting world objects (every quest crate, every chest) and
-- killing creatures are two different streams with two different lifetimes, and one budget shared
-- between them meant a few hundred opened crates could stop every creature kill for the rest of
-- the session from being measured at all.
local MAX_TRACKED_IDS = 400

--- Own observations only take priority over the community median once there are two of them: one
-- interval is a single measurement of a random variable, and the seed or the hub is a better guess
-- than that. Two agreeing observations of the spawn in front of the player beat both.
local MIN_OWN_OBSERVATIONS = 2

local KINDS = { npc = true, object = true }

-- Own AceEvent object: AceEvent keys its registry by target, so registering
-- PLAYER_TARGET_CHANGED on ns.PQ would collide with whichever other module wants it
-- (see the same note in Sync/Telemetry.lua and Quest/Player.lua).
local listener = {}
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
end
M.listener = listener

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

-- tracked[kind][id] = { spawn, spawn, ... }, newest first is not maintained: the list is short and
-- scanned linearly, which is cheaper than keeping it sorted.
-- spawn = { map = uiMapID, x = , y = , key = "map:x:y", diedAt = GetTime()|nil, n = , [1..n] = dt }
local tracked = { npc = {}, object = {} }
local trackedIds = { npc = 0, object = 0 }

local unitFrame
local pendingLoot = {}          -- object ids seen in the loot window, cleared on LOOT_CLOSED

-- The creatures the player has actually engaged: guid -> the last time it was seen alive as the
-- player's own target (see seenUnit). Declared here so Reset can drop it with everything else.
local engaged = {}
local engagedCount = 0

local function now()
    return (GetTime and GetTime()) or 0
end

---------------------------------------------------------------------------
-- Spawn bookkeeping
---------------------------------------------------------------------------

local function validKind(kind)
    return type(kind) == "string" and KINDS[kind] == true
end

local function validId(id)
    return type(id) == "number" and id > 0
end

--- Squared distance in map percent, or nil when the two are not on the same map.
-- `nil` on either side matches anything: a node whose map we never learned is still worth pairing.
local function nearness(spawn, map, x, y)
    if spawn.map and map and spawn.map ~= map then return nil end
    local dx, dy = spawn.x - x, spawn.y - y
    return dx * dx + dy * dy
end

--- A spawn key's map read as an areaID, or nil. Guarded because ns.Zones needs the generated zone
-- tables and a caller may be running before they are loaded.
local function uiMapIdFromArea(mapID)
    local Zones = ns.Zones
    if not (Zones and type(Zones.GetUiMapIdByAreaId) == "function") then return nil end
    local ok, uiMapID = pcall(Zones.GetUiMapIdByAreaId, mapID)
    if ok and type(uiMapID) == "number" then return uiMapID end
    return nil
end

--- The tracked spawn of (kind, id) nearest to (map, x, y) within MATCH_RADIUS, or nil.
local function findSpawn(list, map, x, y)
    local best, bestDistance = nil, MATCH_RADIUS * MATCH_RADIUS
    for i = 1, #list do
        local spawn = list[i]
        local distance = nearness(spawn, map, x, y)
        if distance and distance <= bestDistance then
            best, bestDistance = spawn, distance
        end
    end
    return best
end

--- How much one tracked id is still worth keeping. Observations are the whole point, so they
-- dominate; an interval that is still open and could still be closed is worth something; an entry
-- with neither -- a crate looted once, two hours ago -- is worth nothing and scores zero.
local function entryWeight(list, t)
    local weight = 0
    for i = 1, #list do
        local spawn = list[i]
        weight = weight + (spawn.n or 0) * 100
        if spawn.diedAt and (t - spawn.diedAt) <= MAX_INTERVAL then weight = weight + 10 end
    end
    return weight
end

--- Drops the least useful id of one kind. Returns true when something was freed.
--
-- Evicting rather than refusing is the point: the budget exists to bound memory, and the entries
-- filling it are not necessarily the ones that have taught us anything. An entry that can no
-- longer close an interval and never closed one goes first (weight 0, and the loop stops there),
-- then the entry with the fewest observations -- the same rule addSpawn already uses inside a list.
local function evictOne(kind)
    local byId = tracked[kind]
    local t = now()
    local worstId, worst
    for id, list in pairs(byId) do
        local weight = entryWeight(list, t)
        if not worst or weight < worst then
            worstId, worst = id, weight
            if weight == 0 then break end
        end
    end
    if worstId == nil then return false end
    byId[worstId] = nil
    trackedIds[kind] = trackedIds[kind] - 1
    return true
end

--- The list for (kind, id), created on demand. Each kind has its own MAX_TRACKED_IDS budget and
-- makes room for a newcomer rather than turning it away.
local function listFor(kind, id, create)
    local byId = tracked[kind]
    local list = byId[id]
    if list then return list end
    if not create then return nil end
    if trackedIds[kind] >= MAX_TRACKED_IDS and not evictOne(kind) then return nil end
    list = {}
    byId[id] = list
    trackedIds[kind] = trackedIds[kind] + 1
    return list
end

local function addSpawn(list, map, x, y)
    if #list >= MAX_SPAWNS_PER_ID then
        -- Drop the spawn with the fewest observations; it is the one that has told us least.
        local worst, worstIndex = huge, 1
        for i = 1, #list do
            local count = list[i].n or 0
            if count < worst then worst, worstIndex = count, i end
        end
        remove(list, worstIndex)
    end
    -- The key is rounded so it reads like a coordinate; matching is done on the stored x/y, so
    -- the rounding can never merge two spawn points that the radius kept apart.
    local spawn = {
        map = map, x = x, y = y, n = 0,
        key = Util.SpawnKey(map or 0, floor(x * 10 + 0.5) / 10, floor(y * 10 + 0.5) / 10),
    }
    list[#list + 1] = spawn
    return spawn
end

--- Adds one interval to a spawn's ring, oldest out first. Returns the new sample count.
local function addObservation(spawn, seconds)
    local count = spawn.n or 0
    if count < MAX_OBSERVATIONS_PER_SPAWN then
        count = count + 1
        spawn[count] = seconds
    else
        for i = 1, MAX_OBSERVATIONS_PER_SPAWN - 1 do
            spawn[i] = spawn[i + 1]
        end
        spawn[MAX_OBSERVATIONS_PER_SPAWN] = seconds
    end
    spawn.n = count
    return count
end

-- One scratch table, refilled: Get() is called from tooltip code and must not allocate per call.
local scratch = {}

--- The median of `values[1..count]`. Sorts the scratch copy, never the caller's table.
local function medianOf(values, count)
    if count <= 0 then return nil end
    if count == 1 then return values[1] end
    -- Plain table.sort: a comparator would be a closure allocated on every tooltip refresh.
    sort(values)
    local middle = floor(count / 2)
    if count % 2 == 1 then return values[middle + 1] end
    return (values[middle] + values[middle + 1]) / 2
end

---------------------------------------------------------------------------
-- The three sources
---------------------------------------------------------------------------

--- ownEstimate(kind, id) -> seconds|nil, sampleCount
-- Every observation of every spawn point of this id, reduced with one median. The spawn points are
-- kept apart while an interval is being *measured*; once measured they are all evidence about the
-- same creature, which is the same thing the pfQuest seed does over its coordinate list.
local function ownEstimate(kind, id)
    local list = tracked[kind] and tracked[kind][id]
    if not list then return nil, 0 end
    local count = 0
    for i = 1, #list do
        local spawn = list[i]
        for j = 1, (spawn.n or 0) do
            count = count + 1
            scratch[count] = spawn[j]
        end
    end
    for i = count + 1, #scratch do scratch[i] = nil end
    if count == 0 then return nil, 0 end
    return medianOf(scratch, count), count
end

--- communityEstimate(kind, id) -> seconds|nil, samples|nil
-- Reads the hub's export straight out of the generated override file. The table is machine written
-- and may be absent, truncated or from a newer format, so every level is checked.
local function communityEstimate(kind, id)
    local overrides = ns.Overrides
    local community = overrides and overrides.community
    local respawn = type(community) == "table" and community.respawn or nil
    if type(respawn) ~= "table" then return nil end
    local byKind = respawn[kind]
    if type(byKind) ~= "table" then return nil end
    local entry = byKind[id]
    if type(entry) ~= "table" then return nil end
    local seconds = tonumber(entry.s)
    if not seconds or seconds <= 0 then return nil end
    local samples = tonumber(entry.n)
    return seconds, (samples and samples > 0) and samples or nil
end

--- staticEstimate(kind, id) -> seconds|nil, from Database/Data/Seed.lua.
local function staticEstimate(kind, id)
    local data = ns.Data
    local respawn = data and data.respawn
    if type(respawn) ~= "table" then return nil end
    local byKind = respawn[kind]
    if type(byKind) ~= "table" then return nil end
    local seconds = tonumber(byKind[id])
    if not seconds or seconds <= 0 then return nil end
    return seconds
end

--- Respawn.Get(kind, id) -> seconds|nil, source, sampleCount|nil
-- source is "static", "community" or "observed". nil means we do not know, and the tooltip then
-- leaves the tooltip line out entirely rather than printing a question mark or a zero.
function M.Get(kind, id)
    if not (validKind(kind) and validId(id)) then return nil end

    local seconds, samples = ownEstimate(kind, id)
    if seconds and samples >= MIN_OWN_OBSERVATIONS then
        return seconds, "observed", samples
    end

    local communitySeconds, communitySamples = communityEstimate(kind, id)
    if communitySeconds then
        return communitySeconds, "community", communitySamples
    end

    -- A single own observation still beats having nothing at all, but only after the seed: the
    -- seed is somebody's measured median, one observation is one sample.
    local staticSeconds = staticEstimate(kind, id)
    if staticSeconds then
        return staticSeconds, "static", nil
    end
    if seconds then
        return seconds, "observed", samples
    end
    return nil
end

---------------------------------------------------------------------------
-- The live countdown
---------------------------------------------------------------------------

--- Respawn.GetRemaining(kind, id, spawnKey) -> seconds|nil
-- What is left of the estimate for a spawn this session watched die. `spawnKey` is the string
-- Util.SpawnKey builds (Map/NodeTooltip.lua hands us the node's own); it is matched by position
-- rather than by string equality, because the node's coordinate is the database's and the death was
-- recorded at the player's. Without a key the soonest of this id's pending respawns is returned:
-- the caller is asking "how long until one of these is available again", so the spawn that died
-- *first* is the one that answers it. Taking the newest death instead would report a wait while
-- an earlier spawn of the same creature was already standing there, which is worse than useless.
--
-- The key's first field is normally a uiMapID (Map/NodeTooltip.lua converts a node that only
-- carried an areaID before it builds one), but a key from an older caller may still be in areaID
-- space. So the map is matched as it stands and, only if that finds nothing, once more through
-- ns.Zones.GetUiMapIdByAreaId. What is deliberately NOT done is falling back to the position
-- alone: two percent of one map is two percent of every other map as well, and a creature killed
-- at (46, 50) in the Jade Forest would otherwise count down a pin at (46, 50) in the Valley of the
-- Four Winds -- a live mob drawn faint with an invented timer.
function M.GetRemaining(kind, id, spawnKey)
    if not (validKind(kind) and validId(id)) then return nil end
    local list = tracked[kind][id]
    if not list or #list == 0 then return nil end

    local estimate = M.Get(kind, id)
    if not estimate then return nil end

    local elapsedSince
    if type(spawnKey) == "string" then
        local map, x, y = Util.SplitAreaSpawnKey(spawnKey)
        if not map then return nil end
        local spawn = findSpawn(list, map, x, y)
        if not spawn then
            local translated = uiMapIdFromArea(map)
            if translated and translated ~= map then spawn = findSpawn(list, translated, x, y) end
        end
        if not spawn or not spawn.diedAt then return nil end
        elapsedSince = now() - spawn.diedAt
    else
        -- The oldest death, not the newest: the estimate is the same for every spawn point of this
        -- id, so the longest elapsed is the shortest remaining. If that one has already run out the
        -- answer is nil -- something is back -- even while a later kill is still counting down.
        local oldest
        for i = 1, #list do
            local spawn = list[i]
            if spawn.diedAt and (not oldest or spawn.diedAt < oldest) then oldest = spawn.diedAt end
        end
        if not oldest then return nil end
        elapsedSince = now() - oldest
    end

    local remaining = estimate - elapsedSince
    if remaining <= 0 then return nil end
    return remaining
end

--- Respawn.IsPending(kind, id, spawnKey) -> true while GetRemaining would answer.
-- The pin drawing code wants a boolean and not a number, and asking for one should not make it do the arithmetic twice.
function M.IsPending(kind, id, spawnKey)
    return M.GetRemaining(kind, id, spawnKey) ~= nil
end

---------------------------------------------------------------------------
-- Recording what happened
---------------------------------------------------------------------------

local function announce(kind, id, spawnKey, event)
    -- Only announce what somebody can see. PQ_RESPAWN_CHANGED costs Map/Pins a whole spec rebuild,
    -- and Sync/Telemetry hands this module every creature the player or their pet kills -- not only
    -- quest mobs. Without an estimate there is no countdown and no fade, so for the overwhelming
    -- majority of MoP kills the rebuild would redraw the zone to change nothing at all.
    if not M.Get(kind, id) then return end
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then
        PQ:SendMessage("PQ_RESPAWN_CHANGED", kind, id, spawnKey, event)
    end
end

--- Respawn.NoteDeath(kind, id, uiMapID, x, y)
-- "This died / was gathered here, now." Starts the countdown and opens an interval.
function M.NoteDeath(kind, id, uiMapID, x, y)
    if not (validKind(kind) and validId(id)) then return nil end
    if type(x) ~= "number" or type(y) ~= "number" then return nil end
    local list = listFor(kind, id, true)
    if not list then return nil end
    local spawn = findSpawn(list, uiMapID, x, y) or addSpawn(list, uiMapID, x, y)
    spawn.diedAt = now()
    announce(kind, id, spawn.key, "died")
    return spawn.key
end

--- Respawn.NoteSeen(kind, id, uiMapID, x, y) -> seconds|nil
-- "This is here, alive, now." Closes an open interval when there is one and the gap is credible;
-- returns the observation in seconds when one was made, and nil otherwise -- one value, because
-- the contract says one and a caller writing `local dt = NoteSeen(...)` must not silently pick up
-- a second.
function M.NoteSeen(kind, id, uiMapID, x, y)
    if not (validKind(kind) and validId(id)) then return nil end
    if type(x) ~= "number" or type(y) ~= "number" then return nil end
    local list = tracked[kind][id]
    if not list then return nil end
    local spawn = findSpawn(list, uiMapID, x, y)
    if not spawn or not spawn.diedAt then return nil end

    local interval = now() - spawn.diedAt
    if interval < MIN_INTERVAL then
        -- Too soon to be a respawn. The death record is kept: this is the corpse, not the next one.
        return nil
    end
    spawn.diedAt = nil
    if interval > MAX_INTERVAL then
        -- Not attributable. The interval is discarded but the spawn stops counting down, so the
        -- pin goes back to normal instead of staying faded forever.
        announce(kind, id, spawn.key, "back")
        return nil
    end

    local seconds = floor(interval * 10 + 0.5) / 10
    local samples = addObservation(spawn, seconds)
    announce(kind, id, spawn.key, "back")

    local Telemetry = ns.Telemetry
    if Telemetry and Telemetry.RecordRespawn then
        -- The consent gate lives in Telemetry.Record: with telemetry off this writes nothing and
        -- the observation stays local.
        Telemetry.RecordRespawn(kind, id, spawn.map, spawn.x, spawn.y, seconds, samples)
    end

    Log.Debug("Respawn", "%s %d respawned in %.1f s at %s (sample %d)",
        kind, id, seconds, tostring(spawn.key), samples)
    return seconds
end

--- Respawn.GetObservations(kind, id) -> { seconds, ... }, spawnCount. For tests and /pq debug.
function M.GetObservations(kind, id)
    local out, spawns = {}, 0
    local list = validKind(kind) and validId(id) and tracked[kind][id] or nil
    if not list then return out, 0 end
    for i = 1, #list do
        local spawn = list[i]
        spawns = spawns + 1
        for j = 1, (spawn.n or 0) do out[#out + 1] = spawn[j] end
    end
    return out, spawns
end

--- Respawn.Reset(): forget everything measured this session (profile switch, tests).
function M.Reset()
    wipe(tracked.npc)
    wipe(tracked.object)
    wipe(pendingLoot)
    wipe(engaged)
    trackedIds.npc, trackedIds.object = 0, 0
    engagedCount = 0
end

---------------------------------------------------------------------------
-- Where the observations come from
---------------------------------------------------------------------------

--- The player's position as (uiMapID, x, y) in 0..100, or nil outside a world map.
-- Player.GetPosition is 0..1 and is nil inside instances, which is also the right answer here:
-- an instance spawn is not something anybody else's data can be pooled with.
local function playerPosition()
    local Player = ns.Player
    if not (Player and Player.GetPosition) then return nil end
    local pos = Player.GetPosition()
    if not pos or not pos.uiMapID or type(pos.x) ~= "number" then return nil end
    return pos.uiMapID, pos.x * 100, pos.y * 100
end

--- Respawn.NoteKill(npcID) -> spawnKey|nil
-- "The combat log says the player (or their pet) killed this." Called by Sync/Telemetry.lua's
-- combat log handler after it has done the attribution -- PARTY_KILL by the player or the pet, or
-- UNIT_DIED for what the player had targeted.
--
-- Why this module does not read the combat log itself: COMBAT_LOG_EVENT_UNFILTERED is the highest
-- frequency event in the game, and there is no reason for one addon to ask the client to dispatch
-- it to two frames. Telemetry already resolves the payload function (the bare
-- CombatLogGetCurrentEventInfo of Retail does not exist on 5.5.4) and already applies exactly the
-- filter this wants, so with telemetry on the kill arrives here for free -- and with telemetry off
-- nothing registers the event at all and `seenUnit` below is what notices the kill instead.
function M.NoteKill(npcID)
    if type(npcID) ~= "number" or npcID <= 0 then return nil end
    local uiMapID, x, y = playerPosition()
    if not uiMapID then return nil end
    return M.NoteDeath("npc", npcID, uiMapID, x, y)
end

-- The creatures the player has actually engaged: guid -> the last time it was seen alive as the
-- player's own target. A creature that dies while it is in here was killed by the player, near
-- enough: it is the same "it was what I had targeted" attribution Sync/Telemetry.lua makes for
-- UNIT_DIED, and it is what keeps this off every corpse somebody else left lying in the zone.
--
-- A set rather than one variable per event source, because there is no such thing as "the" unit
-- the player is fighting: a nameplate appearing for another moth used to overwrite the guid of the
-- moth actually being killed, and with telemetry off (no combat log frame at all) that silently
-- threw the measurement away for every kill made near anything else alive.
--
-- Only the target slot writes here. A nameplate is evidence that a creature is alive, not evidence
-- that anybody is hitting it, and a mouseover is the cursor crossing something -- if it were
-- engagement, mousing over a corpse somebody else made would be recorded as the player's own kill,
-- at the time they looked rather than the time it died, and uploaded as a genuine RESP sample.
local MAX_ENGAGED = 12
local ENGAGED_TTL = 60          -- s since the unit was last seen alive as the target

local function rememberEngaged(guid)
    local t = now()
    if engaged[guid] then
        engaged[guid] = t
        return
    end
    if engagedCount >= MAX_ENGAGED then
        local oldestGuid, oldest
        for other, at in pairs(engaged) do
            if t - at > ENGAGED_TTL then
                engaged[other] = nil
                engagedCount = engagedCount - 1
            elseif not oldest or at < oldest then
                oldestGuid, oldest = other, at
            end
        end
        if engagedCount >= MAX_ENGAGED and oldestGuid then
            engaged[oldestGuid] = nil
            engagedCount = engagedCount - 1
        end
    end
    engaged[guid] = t
    engagedCount = engagedCount + 1
end

--- Consumes the engagement for one guid. True when the player really was fighting it recently.
local function takeEngaged(guid)
    local at = engaged[guid]
    if at == nil then return false end
    engaged[guid] = nil
    engagedCount = engagedCount - 1
    return (now() - at) <= ENGAGED_TTL
end

--- A unit token worth reading. Alive: remember it and close any interval that was open here.
-- Dead: if the player had it alive a moment ago, that is the kill.
local function seenUnit(unit, slot)
    if type(unit) ~= "string" then return end
    if not (UnitGUID and UnitExists and UnitExists(unit)) then return end
    if UnitIsUnit and UnitIsUnit(unit, "player") then return end
    local guid = UnitGUID(unit)
    local npcID = Util.NpcIdFromGuid(guid)
    if not npcID then return end

    if UnitIsDead and UnitIsDead(unit) then
        -- A corpse first seen already dead is discarded, not recorded: it is not ours to time.
        if not takeEngaged(guid) then return end
        local uiMapID, x, y = playerPosition()
        if not uiMapID then return end
        M.NoteDeath("npc", npcID, uiMapID, x, y)
        return
    end

    if slot == "target" then rememberEngaged(guid) end

    -- Only ids this session actually watched die: everything else is a lookup that would allocate
    -- a tracking entry for every creature the player's cursor ever crossed.
    if not tracked.npc[npcID] then return end
    local uiMapID, x, y = playerPosition()
    if not uiMapID then return end
    M.NoteSeen("npc", npcID, uiMapID, x, y)
end

local function onNameplateAdded(_, unit) seenUnit(unit, "nameplate") end
local function onMouseover() seenUnit("mouseover", "mouseover") end
local function onTargetChanged() seenUnit("target", "target") end

--- UNIT_HEALTH, filtered by the client to "target" and "mouseover" (RegisterUnitEvent), is how a
-- creature that dies while the player is looking at it is noticed. Nothing else fires: the corpse
-- stays targeted, so PLAYER_TARGET_CHANGED does not come, and with telemetry off there is no
-- combat log frame. The handler costs one UnitIsDead call for a unit the player already has up.
local function onUnitHealth(_, event, unit)
    if unit == "mouseover" then
        seenUnit("mouseover", "mouseover")
    elseif unit == "target" then
        seenUnit("target", "target")
    end
end

--- LOOT_OPENED over a game object: the one event that is both halves of a gathering interval
-- GetLootSourceInfo gives the GUID of what is being looted, which is how the object
-- id is recovered -- there is no "target" for a herb.
--
-- Every looted object opens an interval, not only the ones ns.Professions can classify as a
-- gathering node: a quest crate has a respawn timer too, and Map/Pins fades its pin and
-- Map/NodeTooltip counts it down through exactly this record. What used to make that a problem was
-- the shared id budget -- a few hundred crates and no creature kill was ever tracked again -- and
-- that is fixed where it was broken (listFor): the kinds have separate budgets, and an entry that
-- closed no interval and can close none any more is the first thing evicted.
local function onLootOpened()
    if not (GetNumLootItems and GetLootSourceInfo) then return end
    local uiMapID, x, y = playerPosition()
    if not uiMapID then return end
    local slots = GetNumLootItems() or 0
    if slots <= 0 then return end
    for slot = 1, slots do
        local ok, guid = pcall(GetLootSourceInfo, slot)
        local objectID = ok and Util.ObjectIdFromGuid(guid) or nil
        if objectID and not pendingLoot[objectID] then
            pendingLoot[objectID] = true
            -- Seen first, then died: this loot closes the interval that the previous loot of the
            -- same node opened, and immediately opens the next one.
            M.NoteSeen("object", objectID, uiMapID, x, y)
            M.NoteDeath("object", objectID, uiMapID, x, y)
        end
    end
end

local function onLootClosed()
    wipe(pendingLoot)
end

-- Exposed so the tests can drive the handlers without a nameplate frame.
M.OnLootOpened = onLootOpened
M.SeenUnit = seenUnit

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Enable()
    if not listener.RegisterEvent then return end

    if CreateFrame then
        -- A bare frame rather than an AceEvent registration, because RegisterUnitEvent is a frame
        -- method: it asks the *client* to filter UNIT_HEALTH down to the two units the player can
        -- be fighting, so the handler is never called for the other forty in the camp. AceEvent
        -- has no equivalent and would deliver every one of them.
        unitFrame = CreateFrame("Frame")
        unitFrame:SetScript("OnEvent", onUnitHealth)
        if unitFrame.RegisterUnitEvent then
            unitFrame:RegisterUnitEvent("UNIT_HEALTH", "target", "mouseover")
        end
    end

    listener:RegisterEvent("NAME_PLATE_UNIT_ADDED", onNameplateAdded)
    listener:RegisterEvent("UPDATE_MOUSEOVER_UNIT", onMouseover)
    listener:RegisterEvent("PLAYER_TARGET_CHANGED", onTargetChanged)
    listener:RegisterEvent("LOOT_OPENED", onLootOpened)
    listener:RegisterEvent("LOOT_CLOSED", onLootClosed)

    Log.Debug("Respawn", "watching for deaths and returns")
end

function M.OnProfileChanged()
    -- Measurements are about the world, not about the profile, so they survive a profile switch.
    -- Only the loot de-duplication is per-window state and it is cheap to drop.
    wipe(pendingLoot)
end
