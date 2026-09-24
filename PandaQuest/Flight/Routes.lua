-- Flight/Routes.lua: how long a flight takes, measured by flying it.
--
-- The player asked for a time beside each destination at the flight master, and for a bar while
-- the flight runs. There is exactly one honest way to produce that number on this client, and it
-- is to fly the route and time it. This file is the measuring half; Flight/Tooltip.lua and
-- UI/FlightBar.lua are the two screens that read it.
--
-- **Why there is nothing to show before the first flight.** TaxiNodePosition and
-- TaxiGetSrcX/SrcY/DestX/DestY answer normalised positions on the taxi map TEXTURE, not on any
-- world map: Blizzard multiplies them by TAXI_MAP_WIDTH/TAXI_MAP_HEIGHT (580x580) and flips y as
-- 1.0-y purely to place a 16 px button (Blizzard_UIPanels_Game/Shared/TaxiFrame.lua:66-68), and
-- the vanilla frame uses a different texture size for the same world. Turning those into yards
-- means choosing a scale nobody measured, and there is no taxi speed constant anywhere in either
-- reference tree to divide it by. So a route that has never been flown shows nothing at all --
-- not an approximation, not a dash with a question mark. An empty line is the true one.
--
-- **The key is a pair of numeric node ids, never a name.** C_TaxiMap.GetAllTaxiNodes(uiMapID)
-- returns TaxiNodeInfo records carrying both `nodeID` -- stable and language independent -- and
-- `slotIndex`, which is the index space NumTaxiNodes / TaxiNodeName / TaxiNodeCost / TakeTaxiNode
-- all speak (Blizzard_APIDocumentationGenerated/TaxiMapDocumentation.lua:100-113). slotIndex is
-- the bridge; nodeID is what goes in the file. Keying by TaxiNodeName would give a Finnish client
-- and an English one two different stores for one flight, and would break the moment Blizzard
-- retitles a node.
--
-- **The two node surfaces are never mixed.** TaxiNodeGetType answers one of five strings and
-- "DISTANT" is one of them; Enum.FlightPathState has three values and no DISTANT at all
-- (TaxiMapDocumentation.lua:88-99). Reading reachability from `state` would call every distant
-- node reachable. So reachability, and which node the player is standing at, are read from
-- TaxiNodeGetType and from nothing else; C_TaxiMap is asked only for nodeID and slotIndex.
--
-- **Both of those calls are guarded.** GetTaxiMapID has no call site anywhere in
-- _reference/wow-ui-source-classic, and neither has C_TaxiMap.GetAllTaxiNodes. If either answers
-- nothing usable the whole feature draws nothing and says nothing -- no fallback to names, no
-- guessing a map id.
--
-- **The route is read when the map opens, not when the button is clicked.** TAXIMAP_OPENED carries
-- the map system, compared against Enum.UIMapSystem.Taxi the way Mists' own UIParent compares it
-- (Blizzard_UIParent/Mists/UIParent.lua:1355-1359). Nothing says the node list is still live once
-- TakeTaxiNode has returned -- it closes the frame -- so the click hook only looks up what the
-- open already cached.
--
-- **The flight itself is timed between two confirmed edges.** UnitOnTaxi("player") is the
-- authority that a flight is happening. PLAYER_CONTROL_LOST and PLAYER_CONTROL_GAINED supply the
-- timestamps and nothing else: they also fire for stuns, cinematics and vehicles, and nothing in
-- their payload ties them to a taxi. Blizzard's own UIParent separates the two cases with exactly
-- this test (Mists/UIParent.lua:848-850). So a takeoff is PLAYER_CONTROL_LOST *with*
-- UnitOnTaxi true, and a landing is PLAYER_CONTROL_GAINED *with* UnitOnTaxi false. Anything else
-- is discarded, and a discarded flight is a flight that produces no number.
--
-- Deliberately NOT measured, because each would record a duration that is not the route's:
--   * an early landing (TaxiRequestEarlyLanding), which ends the flight somewhere else entirely;
--   * a reload or a disconnect in the air -- the measurement lives in memory only, so a session
--     that ends mid-flight simply loses it, and PLAYER_ENTERING_WORLD drops any leftover;
--   * a control event with no taxi under it;
--   * a click whose destination this open did not cache;
--   * a takeoff that no recent click explains -- a click the server refused, or a taxi boarded
--     from a quest script with no flight master in it. See CLICK_WINDOW.
--
-- **Nothing runs per frame here.** Like Nodes/Respawn.lua, this file is entirely event driven; the
-- arithmetic is done when a screen asks for it. UI/FlightBar.lua has the only OnUpdate, and only
-- while it is on screen.
--
-- Verified against 5.5.4 rather than assumed:
--   * TAXIMAP_OPENED, TAXIMAP_CLOSED, PLAYER_CONTROL_LOST, PLAYER_CONTROL_GAINED,
--     PLAYER_ENTERING_WORLD: all present in _reference/misc/ketho/Events_classic.lua.
--   * C_TaxiMap.GetAllTaxiNodes, TaxiGetNodeSlot, TaxiNodeGetType, TaxiRequestEarlyLanding:
--     present in _reference/misc/ketho/GlobalAPI_classic.lua.
--   * Shared/TaxiFrame.lua is the file this client loads -- Blizzard_UIPanels_Game_Classic.toc:75
--     lists it "[AllowLoadGameType cata, mists]" -- and that addon is LoadFirst, not
--     load-on-demand, so its globals exist before this one runs.
local _, ns = ...

local M = {}
ns.FlightRoutes = M

local Util, Log, Compat = ns.Util, ns.Log, ns.Compat

local type, tonumber, pairs, pcall, format = type, tonumber, pairs, pcall, string.format
local floor, sort, wipe = math.floor, table.sort, (wipe or table.wipe)

---------------------------------------------------------------------------
-- Bounds
---------------------------------------------------------------------------

--- Anything shorter than this is not a flight. This is Nodes/Respawn.lua's MIN_INTERVAL taken
-- unchanged, for the reason it gives there: below five seconds a pair of edges is a flicker rather
-- than a measurement -- here, a taxi boarded and refused, or two control events inside one
-- takeoff. Nothing in this repository has measured a real flight shorter than that, so a tighter
-- bound would be a number nobody measured.
local MIN_FLIGHT = 5

--- Anything longer cannot be attributed to one flight. Nodes/Respawn.lua's MAX_INTERVAL, again
-- unchanged, and again because inventing a tighter one would mean inventing the length of the
-- longest flight in the game -- which is exactly the number this whole file exists to measure and
-- does not yet have. It is a backstop and not a filter: both edges are already confirmed against
-- UnitOnTaxi, and a flight left open by a landing whose event never arrived is dropped at the next
-- flight master rather than being closed by this bound.
local MAX_FLIGHT = 2 * 3600

--- Samples kept per route, oldest out first. Nodes/Respawn.lua keeps eight observations per spawn
-- point and reduces them with a median; this is the same store answering the same kind of
-- question, so it keeps the same number.
local MAX_SAMPLES = 8

--- Routes kept at all. Nodes/Respawn.lua bounds its own measurement store at 400 ids per kind;
-- this is that store's shape with a pair of node ids for a key, so it takes the same number rather
-- than a new one. A route only enters the file after somebody has flown it, so this is not a
-- ceiling anyone reaches by playing -- it is the line past which the file stops growing.
local MAX_ROUTES = 400

--- How long a click on a destination stays redeemable by a takeoff. The click and the takeoff are
-- two separate events with nothing in their payloads tying them together, so something has to say
-- when a click has stopped being about the flight that follows -- otherwise a click the server
-- refused (not enough money, in combat, out of range) waits forever and is spent on whatever taxi
-- the player boards next, including a quest-scripted flight taken nowhere near a flight master.
-- That is a real duration filed under a route nobody flew, which is the one thing this file exists
-- not to do.
--
-- Nodes/Professions.lua:111 already fixes this exact shape of bound -- "how long a gathering cast
-- still explains a loot window", GATHER_WINDOW = 8 -- and reads it the same way at :981-986: an
-- action older than the window no longer explains what just happened. This is that question with
-- a taxi click in place of a cast, so it takes that number rather than a new one. Nothing in this
-- repository has measured how long the client takes to lift a taxi off after TakeTaxiNode, and a
-- window that turns out to be too short costs a measurement, not a wrong one -- which is the side
-- this file's header says it wants to err on.
local CLICK_WINDOW = 8

--- Below this the median of the samples is the samples. platform/server/pandaquest_hub/respawn.py
-- :69-71 fixes MIN_SAMPLES = 2 for exactly this reason -- "a median of one is that measurement" --
-- and Nodes/Respawn.lua's MIN_OWN_OBSERVATIONS is the same 2. Neither screen hides a one-sample
-- figure, but both have to say it rests on one flight, and UI/FlightBar.lua draws no fill below
-- this count: a printed number can carry its sample count beside it, a bar's fill cannot.
M.MIN_SAMPLES = 2

---------------------------------------------------------------------------
-- State (all of it session state; only `routes` is saved)
---------------------------------------------------------------------------

-- captured[slotIndex] = { nodeID = , name = , hops = { slot, ... }|nil }
-- Refilled on every TAXIMAP_OPENED and read by the click hook and by the tooltip.
local captured = {}
local currentSlot, currentNodeID

--- Which value of TaxiGetNodeSlot's third argument means "the source of this leg": true, false, or
-- nil when this map could not settle it. See resolvePolarity.
local slotPolarity

-- The click the player made on this map open, waiting for a takeoff to confirm it.
local pending

-- The flight being measured: { src, dst, name, startedAt, discarded }.
local flight

local hooked = false

-- Own AceEvent object. AceEvent keys its registry by target, so registering
-- PLAYER_ENTERING_WORLD on ns.PQ would collide with whichever other module wants it (the same
-- note is in Nodes/Respawn.lua, Sync/Telemetry.lua and Quest/Player.lua).
local listener = {}
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
end
M.listener = listener

local function now()
    return (GetTime and GetTime()) or 0
end

--- Throw away whatever the last flight master's map said. Called from every path that must not
-- leave a stale cache behind: a capture that is about to be rebuilt, a capture that will not
-- happen at all, and Reset(). A stale entry is not a display bug -- the click hook reads this
-- table to key a measurement, so a leftover from another flight master would file a real flight
-- under the wrong pair of node ids.
local function forgetCapture()
    wipe(captured)
    currentSlot, currentNodeID, slotPolarity = nil, nil, nil
end

local function settings()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return (profile and profile.flight) or ns.DEFAULTS.profile.flight
end

---------------------------------------------------------------------------
-- The store
---------------------------------------------------------------------------

--- RouteKey(srcNodeID, dstNodeID) -> "src-dst", or nil when either id is not a number.
-- Ordered: Gadgetzan to Orgrimmar and Orgrimmar to Gadgetzan are two routes, because they are two
-- flights over two paths and there is no reason to assume they take the same time.
function M.RouteKey(srcNodeID, dstNodeID)
    local src, dst = tonumber(srcNodeID), tonumber(dstNodeID)
    if not (src and dst) then return nil end
    return format("%d-%d", src, dst)
end

--- SplitRouteKey(key) -> srcNodeID, dstNodeID, or nil.
function M.SplitRouteKey(key)
    if type(key) ~= "string" then return nil end
    local src, dst = key:match("^(%-?%d+)%-(%-?%d+)$")
    if not src then return nil end
    return tonumber(src), tonumber(dst)
end

--- GetRoutes() -> the saved table, routeKey -> { n = , [1..n] = seconds, t = unix time }.
-- nil before AceDB exists; every caller treats that as "nothing measured yet".
function M.GetRoutes()
    local PQ = ns.PQ
    local global = PQ and PQ.db and PQ.db.global
    if type(global) ~= "table" then return nil end
    if type(global.flight) ~= "table" then global.flight = {} end
    if type(global.flight.routes) ~= "table" then global.flight.routes = {} end
    return global.flight.routes
end

--- Count() -> how many routes have been measured at all.
function M.Count()
    local routes = M.GetRoutes()
    if not routes then return 0 end
    local count = 0
    for _ in pairs(routes) do count = count + 1 end
    return count
end

--- Drops the route that has taught us least: fewest samples first, and among equals the one
-- nobody has flown for longest. Evicting rather than refusing is Nodes/Respawn.lua's rule and its
-- reason holds here too -- the entries filling the budget are not necessarily the informative
-- ones, and a full file must not stop the flight in front of the player from being measured.
local function evictOne(routes)
    local worstKey, worstSamples, worstAt
    for key, entry in pairs(routes) do
        local samples = (type(entry) == "table" and tonumber(entry.n)) or 0
        local at = (type(entry) == "table" and tonumber(entry.t)) or 0
        if not worstKey or samples < worstSamples or (samples == worstSamples and at < worstAt) then
            worstKey, worstSamples, worstAt = key, samples, at
        end
    end
    if not worstKey then return false end
    routes[worstKey] = nil
    return true
end

--- One more measurement into a route's ring, oldest out first. Returns the new sample count.
local function addSample(entry, seconds)
    local count = entry.n or 0
    if count < MAX_SAMPLES then
        count = count + 1
        entry[count] = seconds
    else
        for i = 1, MAX_SAMPLES - 1 do
            entry[i] = entry[i + 1]
        end
        entry[MAX_SAMPLES] = seconds
    end
    entry.n = count
    return count
end

-- One scratch table, refilled: GetEstimate is called from tooltip code and from the bar's
-- OnUpdate, and neither may allocate per call.
local scratch = {}

--- The median of values[1..count]. Sorts the scratch copy, never a caller's table.
local function medianOf(values, count)
    if count <= 0 then return nil end
    if count == 1 then return values[1] end
    sort(values)
    local middle = floor(count / 2)
    if count % 2 == 1 then return values[middle + 1] end
    return (values[middle] + values[middle + 1]) / 2
end

--- GetEstimate(srcNodeID, dstNodeID) -> seconds|nil, samples
-- The median of what this account has measured on that route, and how many flights it rests on.
-- nil means nobody has flown it, and both screens then say nothing at all rather than printing a
-- placeholder. The median and not the mean, for Nodes/Respawn.lua's reason: one flight taken while
-- the client was stuttering would drag an average for good.
function M.GetEstimate(srcNodeID, dstNodeID)
    local key = M.RouteKey(srcNodeID, dstNodeID)
    if not key then return nil, 0 end
    local routes = M.GetRoutes()
    local entry = routes and routes[key]
    if type(entry) ~= "table" then return nil, 0 end
    local count = tonumber(entry.n) or 0
    if count <= 0 then return nil, 0 end
    local kept = 0
    for i = 1, count do
        local value = tonumber(entry[i])
        if value then
            kept = kept + 1
            scratch[kept] = value
        end
    end
    for i = kept + 1, #scratch do scratch[i] = nil end
    if kept == 0 then return nil, 0 end
    return medianOf(scratch, kept), kept
end

--- Record(srcNodeID, dstNodeID, seconds) -> samples|nil. Public so a test can put a measurement in
-- without flying it; the flight path itself goes through here too, so there is one set of bounds.
function M.Record(srcNodeID, dstNodeID, seconds)
    local key = M.RouteKey(srcNodeID, dstNodeID)
    if not key then return nil end
    local value = tonumber(seconds)
    -- The NaN check is the `value ~= value` one Core/Util.lua uses: a subtraction of two clocks
    -- that disagreed can produce one, and it would sort into the middle of the median.
    if not value or value ~= value then return nil end
    if value < MIN_FLIGHT or value > MAX_FLIGHT then
        Log.Debug("Flight", "discarded %s: %.1f s is outside %d..%d", key, value, MIN_FLIGHT, MAX_FLIGHT)
        return nil
    end
    local routes = M.GetRoutes()
    if not routes then return nil end
    local entry = routes[key]
    if not entry then
        if M.Count() >= MAX_ROUTES and not evictOne(routes) then return nil end
        entry = { n = 0 }
        routes[key] = entry
    end
    local count = addSample(entry, value)
    entry.t = Util.UnixNow()
    Log.Debug("Flight", "%s measured at %.1f s (%d samples)", key, value, count)
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then PQ:SendMessage("PQ_FLIGHT_MEASURED", srcNodeID, dstNodeID, value, count) end
    return count
end

--- Reset(): forget every measurement. `/pq reset` does not call this -- a measurement is data, not
-- a window position -- but the tests and a future options button need one door to it.
function M.Reset()
    local routes = M.GetRoutes()
    if routes then wipe(routes) end
    forgetCapture()
    pending, flight = nil, nil
end

---------------------------------------------------------------------------
-- Reading the flight master's map
---------------------------------------------------------------------------

--- Which value of TaxiGetNodeSlot's third argument means "source".
--
-- The argument is undocumented: _reference/misc/WoW-API/WoW-API/Data/Wiki.lua:9410 declares
-- TaxiGetNodeSlot with no parameters at all, and the only evidence for its meaning is two of
-- Blizzard's own call sites naming the results srcSlot and dstSlot (Shared/TaxiFrame.lua:175-178,
-- :243-246). That is a reading, not a contract, and this file refuses to depend on it.
--
-- There is a free discriminator on every taxi map. A direct flight has exactly one leg, and that
-- leg runs from the node the player is standing at to the node they are hovering: so whichever
-- third argument answers the CURRENT slot is the one that means source. A leg whose two ends are
-- the same slot settles nothing and is skipped.
--
-- Returns true, false, or nil when no direct flight on this map could settle it -- and nil is an
-- answer: the hop chains are then left unread rather than read the wrong way round.
local function resolvePolarity(count)
    if not (currentSlot and type(TaxiGetNodeSlot) == "function" and type(GetNumRoutes) == "function") then
        return nil
    end
    for index = 1, count do
        if TaxiNodeGetType(index) == "REACHABLE" and GetNumRoutes(index) == 1 and index ~= currentSlot then
            local ok, a, b = pcall(function()
                return TaxiGetNodeSlot(index, 1, true), TaxiGetNodeSlot(index, 1, false)
            end)
            if ok and a ~= b then
                if a == currentSlot and b == index then return true end
                if b == currentSlot and a == index then return false end
            end
        end
    end
    return nil
end

--- The chain of slots a flight to `index` passes through, current node first and `index` last, or
-- nil when it cannot be read whole. A chain whose first leg does not start where the player is
-- standing, or whose legs do not join end to end, is not a chain we understood, and half a chain
-- is worth nothing.
local function readHops(index)
    if slotPolarity == nil then return nil end
    local legs = GetNumRoutes and GetNumRoutes(index)
    if type(legs) ~= "number" or legs < 1 then return nil end
    local chain, previous = {}, nil
    for leg = 1, legs do
        local src = TaxiGetNodeSlot(index, leg, slotPolarity)
        local dst = TaxiGetNodeSlot(index, leg, not slotPolarity)
        if type(src) ~= "number" or type(dst) ~= "number" then return nil end
        if leg == 1 then
            if src ~= currentSlot then return nil end
            chain[1] = src
        elseif src ~= previous then
            return nil
        end
        chain[#chain + 1] = dst
        previous = dst
    end
    if chain[#chain] ~= index then return nil end
    return chain
end

--- Capture() -> how many reachable destinations were cached, or nil when the client gave us
-- nothing we could use. nil is the whole feature standing down for this flight master: no names,
-- no guesses, no partly filled cache.
function M.Capture()
    forgetCapture()

    if type(GetTaxiMapID) ~= "function" then return nil end
    local ok, mapID = pcall(GetTaxiMapID)
    if not ok or type(mapID) ~= "number" then
        Log.Debug("Flight", "GetTaxiMapID gave nothing; showing no flight times here")
        return nil
    end
    if not (C_TaxiMap and type(C_TaxiMap.GetAllTaxiNodes) == "function") then return nil end
    local gotNodes, infos = pcall(C_TaxiMap.GetAllTaxiNodes, mapID)
    if not gotNodes or type(infos) ~= "table" or #infos == 0 then
        Log.Debug("Flight", "C_TaxiMap.GetAllTaxiNodes(%d) gave nothing; showing no flight times here", mapID)
        return nil
    end

    -- slotIndex is the only thing C_TaxiMap is asked for besides nodeID and the name: `state` is
    -- deliberately not read (see the header).
    local nodeIdBySlot, nameBySlot = {}, {}
    for i = 1, #infos do
        local info = infos[i]
        if type(info) == "table" then
            local slot, nodeID = tonumber(info.slotIndex), tonumber(info.nodeID)
            if slot and nodeID then
                nodeIdBySlot[slot] = nodeID
                if type(info.name) == "string" and info.name ~= "" then nameBySlot[slot] = info.name end
            end
        end
    end

    local count = (type(NumTaxiNodes) == "function" and NumTaxiNodes()) or 0
    if type(TaxiNodeGetType) ~= "function" or count < 1 then return nil end
    for index = 1, count do
        if TaxiNodeGetType(index) == "CURRENT" then
            currentSlot = index
            break
        end
    end
    if not currentSlot then
        Log.Debug("Flight", "no CURRENT node on this taxi map; nothing can be keyed from here")
        return nil
    end
    currentNodeID = nodeIdBySlot[currentSlot]
    if not currentNodeID then
        currentSlot = nil
        return nil
    end

    slotPolarity = resolvePolarity(count)

    local cached = 0
    for index = 1, count do
        if TaxiNodeGetType(index) == "REACHABLE" then
            local nodeID = nodeIdBySlot[index]
            if nodeID then
                -- The name is cached for the bar to print and for nothing else. Keying by it is
                -- what the header forbids; showing the player the word their own client used is
                -- the opposite of a guess.
                captured[index] = { nodeID = nodeID, name = nameBySlot[index], hops = readHops(index) }
                cached = cached + 1
            end
        end
    end
    Log.Debug("Flight", "taxi map %d: %d reachable destinations, polarity %s",
        mapID, cached, tostring(slotPolarity))
    return cached
end

--- GetCaptured(slotIndex) -> { nodeID, name, hops }|nil for a destination this open cached.
function M.GetCaptured(slotIndex)
    local slot = tonumber(slotIndex)
    return slot and captured[slot] or nil
end

--- GetCurrentNodeID() -> the nodeID of the flight master the player is standing at, or nil.
function M.GetCurrentNodeID()
    return currentNodeID
end

--- GetCurrentSlot() -> its slot index, read from TaxiNodeGetType alone.
function M.GetCurrentSlot()
    return currentSlot
end

--- GetSlotPolarity() -> true, false or nil: what TaxiGetNodeSlot's third argument has to be to
-- answer the source of a leg on the map that is open now.
function M.GetSlotPolarity()
    return slotPolarity
end

---------------------------------------------------------------------------
-- Measuring one flight
---------------------------------------------------------------------------

--- The hook on TakeTaxiNode. It looks nothing up in the client: the frame is closing and nothing
-- promises the node list outlives it, so the only source is what TAXIMAP_OPENED cached.
local function onTakeTaxiNode(index)
    pending = nil
    local slot = tonumber(index)
    if not slot then return end
    local entry = captured[slot]
    if not (entry and currentNodeID) then
        Log.Debug("Flight", "taxi slot %s was not cached; this flight will not be measured", tostring(index))
        return
    end
    pending = { src = currentNodeID, dst = entry.nodeID, name = entry.name, at = now() }
end

--- The takeoff edge. UnitOnTaxi is the authority; the event only says when.
--
-- The click is taken off the table first and whatever happens next, because a control loss the
-- player did not get from this click has already made the click stale: they were stunned, they
-- watched a cinematic, they stepped into a vehicle. Leaving it standing would hand it to the next
-- taxi they board instead. A click spent on a control loss that turns out not to be a taxi costs
-- one measurement; a click kept costs a wrong number on a route nobody flew.
local function onControlLost()
    local click = pending
    pending = nil
    if not Compat.UnitOnTaxi("player") then return end       -- a stun, a cinematic, a vehicle
    if not click then return end                              -- boarded from something we never saw
    -- And a click that has been waiting longer than the client could plausibly have taken to lift
    -- this taxi off is not this taxi's click either. See CLICK_WINDOW.
    local waited = now() - (tonumber(click.at) or 0)
    if waited < 0 or waited > CLICK_WINDOW then
        Log.Debug("Flight", "a click %.0f s old is not this takeoff; nothing measured", waited)
        return
    end
    flight = { src = click.src, dst = click.dst, name = click.name,
               startedAt = now(), discarded = false }
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then PQ:SendMessage("PQ_FLIGHT_STARTED", flight.src, flight.dst) end
    Log.Debug("Flight", "measuring %d-%d", flight.src, flight.dst)
end

--- The landing edge. Control can come back while the player is still on the taxi -- that is not a
-- landing, and closing the measurement there would record the wrong duration.
local function onControlGained()
    local f = flight
    if not f then return end
    if Compat.UnitOnTaxi("player") then return end
    flight = nil
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then PQ:SendMessage("PQ_FLIGHT_ENDED", f.src, f.dst) end
    if f.discarded then
        Log.Debug("Flight", "%d-%d landed early; nothing recorded", f.src, f.dst)
        return
    end
    return M.Record(f.src, f.dst, now() - f.startedAt)
end

--- A reload, a disconnect or a loading screen with a measurement open. The measurement lives in
-- memory only, so a session that ends in the air loses it by itself; this is the case where the
-- session survives and the flight did not, and the answer is the same -- drop it. A taxi that
-- somehow crossed a loading screen would be dropped here too, which is the conservative side: no
-- number at all beats a number that is missing the part before the screen.
local function onEnteringWorld()
    if flight then
        Log.Debug("Flight", "loading screen with a flight open; nothing recorded")
    end
    flight, pending = nil, nil
end

--- GetFlight() -> { src, dst, name, startedAt, elapsed, seconds, samples }|nil
-- What is being measured right now, with the route's own estimate beside it so a screen does not
-- have to ask twice. `seconds` and `samples` are nil on a route nobody has flown, and UI/FlightBar
-- .lua then shows elapsed time and no fraction.
function M.GetFlight()
    if not flight then return nil end
    local seconds, samples = M.GetEstimate(flight.src, flight.dst)
    return {
        src = flight.src, dst = flight.dst, name = flight.name,
        startedAt = flight.startedAt, elapsed = now() - flight.startedAt,
        discarded = flight.discarded, seconds = seconds, samples = samples or 0,
    }
end

--- IsMeasuring() -> true while a flight is being timed.
function M.IsMeasuring()
    return flight ~= nil
end

---------------------------------------------------------------------------
-- Module lifecycle
---------------------------------------------------------------------------

local function hookTaxiGlobals()
    if hooked then return end
    if type(_G.TakeTaxiNode) ~= "function" then return end
    hooked = true
    hooksecurefunc("TakeTaxiNode", onTakeTaxiNode)
    -- The player pressing "land here" on the possess bar (Blizzard_ActionBar/
    -- Classic_PossessActionBar.lua:65 is the call site). What happens after it is not the route.
    if type(_G.TaxiRequestEarlyLanding) == "function" then
        hooksecurefunc("TaxiRequestEarlyLanding", function()
            if flight then flight.discarded = true end
        end)
    end
end

function M.Enable()
    if not listener.RegisterEvent then return end
    hookTaxiGlobals()

    listener:RegisterEvent("TAXIMAP_OPENED", function(_, system)
        -- A map opening ends whatever the last flight master started: a click that never became a
        -- flight, and a flight whose landing event never arrived. Neither can still be true. This
        -- runs before the system id is looked at, because a map system this addon does not read is
        -- still a map system that replaced the one it did: returning with the last flight master's
        -- table standing would let the click hook key the next flight from it.
        pending, flight = nil, nil
        -- Blizzard's own Mists UIParent compares this payload against Enum.UIMapSystem.Taxi before
        -- it shows the frame (Mists/UIParent.lua:1355-1359). A client that sends no system id at
        -- all is taken at its word: this event has no other sender.
        local taxi = Enum and Enum.UIMapSystem and Enum.UIMapSystem.Taxi
        if taxi ~= nil and system ~= nil and system ~= taxi then
            forgetCapture()
            return
        end
        if settings().tooltipETA == false and settings().bar == false then
            -- Nothing on screen wants a route, so none is read. The cache is still cleared: the
            -- click hook keys a measurement from it, and the last flight master's entries would
            -- otherwise file this flight under the wrong pair of node ids.
            forgetCapture()
            return
        end
        M.Capture()
    end)

    listener:RegisterEvent("PLAYER_CONTROL_LOST", onControlLost)
    listener:RegisterEvent("PLAYER_CONTROL_GAINED", onControlGained)
    listener:RegisterEvent("PLAYER_ENTERING_WORLD", onEnteringWorld)
end

--- Init(): the hook is tried here as well as in Enable, because Blizzard_UIPanels_Game is
-- LoadFirst rather than load-on-demand (Blizzard_UIPanels_Game_Classic.toc:5) and its globals are
-- therefore already in place -- but an addon that cannot hook is one that measures nothing, so it
-- gets two chances rather than one.
function M.Init()
    hookTaxiGlobals()
end
