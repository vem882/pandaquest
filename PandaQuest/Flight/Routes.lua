-- Flight/Routes.lua: how long a flight takes and what it costs, measured by flying it.
--
-- The player asked for a time beside each destination at the flight master, and for a bar while
-- the flight runs. There is exactly one honest way to produce that number on this client, and it
-- is to fly the route and time it. This file is the measuring half; Flight/Tooltip.lua and
-- UI/FlightBar.lua are the two screens that read it. Every flight it can name is also handed to
-- the PandaQuest site through PandaQuestSync.flights (see "The upload outbox" below), so the site
-- can show routes, their times and their prices.
--
-- **Why there is nothing to show before the first flight.** TaxiNodePosition and
-- TaxiGetSrcX/SrcY/DestX/DestY answer normalised positions on the taxi map TEXTURE, not on any
-- world map: Blizzard multiplies them by TAXI_MAP_WIDTH/TAXI_MAP_HEIGHT (580x580) and flips y as
-- 1.0-y purely to place a 16 px button (Blizzard_UIPanels_Game/Shared/TaxiFrame.lua:68-69), and
-- the vanilla frame uses a different texture size for the same world. Turning those into yards
-- means choosing a scale nobody measured, and there is no taxi speed constant anywhere in either
-- reference tree to divide it by. So a route that has never been flown shows nothing at all --
-- not an approximation, not a dash with a question mark. An empty line is the true one.
--
-- **The key is a pair of numeric node ids, never a name.** C_TaxiMap.GetAllTaxiNodes(uiMapID)
-- returns TaxiNodeInfo records carrying both `nodeID` -- stable and language independent -- and
-- `slotIndex`, which is the index space NumTaxiNodes / TaxiNodeName / TaxiNodeCost / TakeTaxiNode
-- all speak (Blizzard_APIDocumentationGenerated/TaxiMapDocumentation.lua:111-122). slotIndex is
-- the bridge; nodeID is what goes in the file. Keying by TaxiNodeName would give a Finnish client
-- and an English one two different stores for one flight, and would break the moment Blizzard
-- retitles a node.
--
-- **The two node surfaces are never mixed.** TaxiNodeGetType answers one of five strings and
-- "DISTANT" is one of them; Enum.FlightPathState has three values and no DISTANT at all
-- (TaxiMapDocumentation.lua:83-95). Reading reachability from `state` would call every distant
-- node reachable. So reachability, and which node the player is standing at, are read from
-- TaxiNodeGetType and from nothing else; C_TaxiMap is asked only for nodeID and slotIndex.
--
-- **Both of those calls are guarded.** GetTaxiMapID has no call site anywhere in
-- _reference/wow-ui-source-classic, and neither has C_TaxiMap.GetAllTaxiNodes. If either answers
-- nothing usable the whole feature draws nothing and says nothing -- no fallback to names, no
-- guessing a map id. And because nothing in that tree exercises them, the bridge between the two
-- index spaces is checked rather than trusted: see Capture(), which compares the two surfaces'
-- own words for the node the player is standing at and stands the feature down when they differ.
--
-- **The route is read when the map opens, not when the button is clicked.** TAXIMAP_OPENED carries
-- the map system, compared against Enum.UIMapSystem.Taxi the way Mists' own UIParent compares it
-- (Blizzard_UIParent/Mists/UIParent.lua:1355-1359). Nothing says the node list is still live once
-- TakeTaxiNode has returned -- it closes the frame -- so the click hook only looks up what the
-- open already cached, the price included.
--
-- **The click.** On 5.5.4 the flight master's map is Shared/TaxiFrame.lua (there is no
-- Blizzard_FlightMap in the Mists tree), and its destination buttons do exactly one thing:
-- `TakeTaxiNode(self:GetID())`, a global looked up at click time (Shared/TaxiFrame.xml:15-17). A
-- hooksecurefunc on that global therefore sees every click, and nothing else on this client starts
-- a taxi from a map.
--
-- **Takeoff and landing are read from UnitOnTaxi("player") itself, not from control events.**
-- Earlier versions started a measurement only inside PLAYER_CONTROL_LOST, and only when
-- UnitOnTaxi was already true at that instant; any control loss that failed the test also threw
-- the click away. In the game that never matched -- no flight was ever measured and the bar never
-- appeared. The taxi flag is not set the moment the click is made: InFlight, which does work on
-- this client, says so in its own words ("check if actually in flight after take off (doesn't
-- happen immediately)") and never listens to PLAYER_CONTROL_LOST at all; it polls UnitOnTaxi for a
-- few seconds after TakeTaxiNode instead. Its landing check carries an "event bug fix" for the
-- same reason: PLAYER_CONTROL_GAINED is not a reliable landing signal either. Our test harness had
-- hidden all of this by setting UnitOnTaxi before firing PLAYER_CONTROL_LOST -- the order this
-- file needed rather than the order the client produces.
--
-- So, the approach InFlight proved (reimplemented here, not copied):
--   * a click starts a cheap AceTimer that asks UnitOnTaxi every POLL seconds, for at most
--     CLICK_WINDOW seconds, and stops the moment it answers; the takeoff is the moment it turned
--     true. PLAYER_CONTROL_LOST and UNIT_FLAGS only make that check happen sooner;
--   * a landing is UnitOnTaxi turning false: PLAYER_CONTROL_GAINED and UNIT_FLAGS ask at once, and
--     a slow AceTimer (FLIGHT_POLL) asks while the player is in the air, in case neither arrives;
--   * a taxi nobody clicked for -- a quest script -- is still noticed (a control loss or a unit
--     flag change with UnitOnTaxi true) and drawn by the bar, but it has no route, so it is never
--     filed and never uploaded.
--
-- **A reload in the air keeps the flight.** The flight in progress is written to the character's
-- saved variables at takeoff (PandaQuestDB.char.flightInAir) with the server's clock, so a /reload
-- -- the taxi keeps flying while the interface reloads -- resumes the same measurement. A login
-- that finds the player on a taxi (a disconnect) does not: the time spent logged out is not time
-- anyone saw in the air, so that flight is drawn but not filed.
--
-- Deliberately NOT measured, because each would record a duration that is not the route's:
--   * an early landing (TaxiRequestEarlyLanding), a summon, a battleground or dungeon port taken in
--     the air -- each ends the flight somewhere else entirely;
--   * a loading screen in the air that is not a /reload;
--   * a control event with no taxi under it;
--   * a click whose destination this open did not cache;
--   * a takeoff that no recent click explains -- a click the server refused, or a taxi boarded
--     from a quest script with no flight master in it. See CLICK_WINDOW.
--
-- **Nothing runs per frame here.** The two timers above run only while a click waits for its
-- takeoff and while a flight is in the air; the rest is event driven. UI/FlightBar.lua has the only
-- OnUpdate, and only while it is on screen.
--
-- Verified against 5.5.4 rather than assumed:
--   * TAXIMAP_OPENED, TAXIMAP_CLOSED, PLAYER_CONTROL_LOST, PLAYER_CONTROL_GAINED, UNIT_FLAGS,
--     PLAYER_MONEY, UI_ERROR_MESSAGE, LFG_PROPOSAL_SUCCEEDED, PLAYER_ENTERING_WORLD (with
--     isInitialLogin and isReloadingUi, SystemDocumentation.lua): all present in
--     _reference/misc/ketho/Events_classic.lua.
--   * C_TaxiMap.GetAllTaxiNodes, TaxiGetNodeSlot, TaxiNodeGetType, TaxiNodeCost,
--     TaxiRequestEarlyLanding, GetMoney, GetServerTime: present in
--     _reference/misc/ketho/GlobalAPI_classic.lua.
--   * Shared/TaxiFrame.lua is the file this client loads -- Blizzard_UIPanels_Game_Classic.toc:75
--     lists it "[AllowLoadGameType cata, mists]" -- and that addon is LoadFirst, not
--     load-on-demand, so its globals exist before this one runs.
local _, ns = ...

local M = {}
ns.FlightRoutes = M

local Util, Log, Compat = ns.Util, ns.Log, ns.Compat

local type, tonumber, tostring, pairs, ipairs, pcall, format = type, tonumber, tostring, pairs, ipairs, pcall,
    string.format
local floor, sort, tremove, wipe = math.floor, table.sort, table.remove, (wipe or table.wipe)

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
-- UnitOnTaxi, and a flight left open by a landing nobody saw is dropped at the next flight master
-- rather than being closed by this bound.
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

--- How long a click on a destination stays redeemable by a takeoff, and so how long the takeoff
-- check runs after a click. The click and the takeoff are two separate things with nothing tying
-- them together, so something has to say when a click has stopped being about the flight that
-- follows -- otherwise a click the server refused (not enough money, in combat, mounted) waits
-- forever and is spent on whatever taxi the player boards next, including a quest-scripted flight
-- taken nowhere near a flight master. That is a real duration filed under a route nobody flew,
-- which is the one thing this file exists not to do. A refusal the client words as a taxi error
-- (UI_ERROR_MESSAGE with one of the ERR_TAXI* strings) drops the click at once.
--
-- InFlight gives the taxi five seconds after the click to show up in UnitOnTaxi before it hides
-- its bar, and it measures flights on this client with that; this window is twice as long, so a
-- slow server answer costs nothing, and a window that is still too short costs a measurement, not
-- a wrong one -- the side this file's header says it wants to err on.
local CLICK_WINDOW = 10

--- How often the takeoff is checked while a click waits for it. One UnitOnTaxi call; the check
-- stops the moment the taxi is there or the window has run out.
local POLL = 0.1

--- How often the landing is checked while the player is in the air, in case neither
-- PLAYER_CONTROL_GAINED nor UNIT_FLAGS arrives. Half a second against flights of minutes.
local FLIGHT_POLL = 0.5

--- How long after the takeoff a drop in the player's money is still the fare. The server takes the
-- fare as the taxi starts; PLAYER_MONEY can arrive a moment after UnitOnTaxi turns true.
local FARE_WINDOW = 30

--- How long a /reload may take and still pick up the flight it interrupted (see persist()).
local RELOAD_GAP = 300

--- Newest flights kept in PandaQuestSync.flights waiting for the PandaQuest site to take them.
local OUTBOX_MAX = 300

--- Below this the median of the samples is the samples. The portal fixes its
-- minimum at 2 samples for exactly this reason -- "a median of one is that measurement" --
-- and Nodes/Respawn.lua's MIN_OWN_OBSERVATIONS is the same 2. Neither screen hides a one-sample
-- figure, but both have to say it rests on one flight, and UI/FlightBar.lua draws no fill below
-- this count: a printed number can carry its sample count beside it, a bar's fill cannot.
M.MIN_SAMPLES = 2
M.CLICK_WINDOW = CLICK_WINDOW
M.OUTBOX_MAX = OUTBOX_MAX


--- The Mists perk that makes every flight path 25% faster, and the factor that takes it back out.
--
-- "Ride Like the Wind" (spell 117983) is trained in Pandaria and is not a buff a player can see on
-- themselves: it simply makes taxi flights quicker from then on. Two characters on one account can
-- therefore fly the same route in visibly different times -- and until now this module filed both
-- under one key and took a median of the mixture, which is a number that describes neither of them.
--
-- The factor is 0.8 rather than 1/1.25 written out because that is what it is: the spell says
-- "increases flight path speed by 25%", and the *slow* flight is 1.25 times the fast one, so a fast
-- flight is 0.8 of a slow one. A sample is divided by this before it is stored and multiplied by it
-- again when it is shown, so the store holds one thing -- the time without the perk -- and every
-- character reads back the time it will actually experience.
--
-- This is the shape InFlight uses, and its comment for the same spell says the same thing: "Stored
-- times are always without speed boosts, while measured times include them."
local RIDE_LIKE_THE_WIND = 117983
local RIDE_LIKE_THE_WIND_FACTOR = 0.8

--- SpeedFactor() -> what this character's flights are multiplied by against a stored time.
--
-- 1 for a character without the perk, RIDE_LIKE_THE_WIND_FACTOR for one with it. Wrapped in pcall
-- like every other client call in this file: IsSpellKnown is present on this client
-- (_reference/misc/ketho/GlobalAPI_classic.lua) but a refusal here must cost the measurement, not
-- the session.
function M.SpeedFactor()
    -- C_SpellBook.IsSpellKnown is what this client declares; the bare IsSpellKnown is not in its
    -- API list at all (the lint globals list puts the name under C_SpellBook, and luacheck
    -- refuses the global). InFlight calls the bare one and works, so it evidently still answers --
    -- but a name the client does not declare is not one this addon leans on, so the namespaced
    -- call is tried first and the old global only if it is somehow the one that exists.
    local known
    if C_SpellBook and type(C_SpellBook.IsSpellKnown) == "function" then
        local ok, answer = pcall(C_SpellBook.IsSpellKnown, RIDE_LIKE_THE_WIND)
        if ok then known = answer end
    end
    if known == nil then
        local legacy = _G["IsSpellKnown"]
        if type(legacy) == "function" then
            local ok, answer = pcall(legacy, RIDE_LIKE_THE_WIND)
            if ok then known = answer end
        end
    end
    if known then return RIDE_LIKE_THE_WIND_FACTOR end
    return 1
end


---------------------------------------------------------------------------
-- State (session state, except the flight in the air: see "Saved across a reload")
---------------------------------------------------------------------------

-- captured[slotIndex] = { nodeID = , name = , hops = { slot, ... }|nil, nodeHops = { nodeID, ... }|nil,
--                         cost = copper|nil }
-- Refilled on every TAXIMAP_OPENED and read by the click hook and by the tooltip.
local captured = {}
local currentSlot, currentNodeID
-- Every slot's nodeID on the map that is open now, reachable or not: a hop chain passes through
-- nodes the player cannot fly to directly.
local nodeIdBySlot = {}

--- Which value of TaxiGetNodeSlot's third argument means "the source of this leg": true, false, or
-- nil when this map could not settle it. See resolvePolarity.
local slotPolarity

-- What the takeoff check is waiting for: { at = GetTime(), click = {...}|nil, resume = {...}|nil }.
-- `click` is the destination the player clicked; `resume` a flight a /reload interrupted. Neither
-- means a control loss or a unit flag change the player did not click for.
local waiting
local waitTimer

-- The flight being measured: { src, dst, name, legs, hops, startedAt, takeoff, money, cost, paid,
-- discarded, identified }.
local flight
local flightTimer

local hooked = false

-- Own AceEvent/AceTimer object. AceEvent keys its registry by target, so registering
-- PLAYER_ENTERING_WORLD on ns.PQ would collide with whichever other module wants it (the same
-- note is in Nodes/Respawn.lua, Sync/Telemetry.lua and Quest/Player.lua).
local listener = {}
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
    local AceTimer = LibStub and LibStub("AceTimer-3.0", true)
    if AceTimer then AceTimer:Embed(listener) end
end
M.listener = listener

local function now()
    return (GetTime and GetTime()) or 0
end

--- The server's clock, which the PandaQuest site reads and which survives a /reload; GetTime()
-- starts again from the client's uptime and is only good inside one session.
local function serverNow()
    if GetServerTime then
        local ok, value = pcall(GetServerTime)
        if ok and tonumber(value) then return tonumber(value) end
    end
    return Util.UnixNow()
end

local function money()
    if type(GetMoney) ~= "function" then return nil end
    local ok, value = pcall(GetMoney)
    return ok and tonumber(value) or nil
end

local function onTaxi()
    return Compat.UnitOnTaxi("player")
end

--- Throw away whatever the last flight master's map said. Called from every path that must not
-- leave a stale cache behind: a capture that is about to be rebuilt, a capture that will not
-- happen at all, and Reset(). A stale entry is not a display bug -- the click hook reads this
-- table to key a measurement, so a leftover from another flight master would file a real flight
-- under the wrong pair of node ids.
local function forgetCapture()
    wipe(captured)
    wipe(nodeIdBySlot)
    currentSlot, currentNodeID, slotPolarity = nil, nil, nil
end

local function settings()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return (profile and profile.flight) or ns.DEFAULTS.profile.flight
end

local function send(message, ...)
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then PQ:SendMessage(message, ...) end
end

---------------------------------------------------------------------------
-- The store
---------------------------------------------------------------------------

--- RouteKey(srcNodeID, dstNodeID) -> "src-dst", or nil when either id is not a number.
-- Ordered: Gadgetzan to Orgrimmar and Orgrimmar to Gadgetzan are two routes, because they are two
-- flights over two paths and there is no reason to assume they take the same time.
--
-- The pair of node ids is the whole key, and that is a known limit rather than a claim about the
-- game. A flight from A to B is not one path: Capture() reads a hop chain per destination, and
-- which intermediate points a character flies through depends on which of them that character has
-- discovered. So if the chain for a pair changes, the ring mixes samples of two paths under one
-- median until it has turned over. The sample count is printed beside every figure, the leg count
-- goes to the log on every landing, and this is said out loud. What is NOT claimed
-- anywhere is that a route takes the same time on every character: nothing here measured that.
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
    -- Multiplied back on the way out: the store holds the time without the perk, and what a caller
    -- wants is the time THIS character will actually spend in the air.
    return medianOf(scratch, kept) * M.SpeedFactor(), kept
end

--- Record(srcNodeID, dstNodeID, seconds) -> samples|nil. Public so a test can put a measurement in
-- without flying it; the flight path itself goes through here too, so there is one set of bounds.
function M.Record(srcNodeID, dstNodeID, seconds)
    local key = M.RouteKey(srcNodeID, dstNodeID)
    if not key then return nil end
    -- Divided by this character's speed factor before anything else touches it, so the store holds
    -- one comparable thing: the time a character without Ride Like the Wind would fly. The bounds
    -- below then judge that same normalised figure, which is what MIN_FLIGHT and MAX_FLIGHT were
    -- written against.
    local measured = tonumber(seconds)
    local value = measured and (measured / M.SpeedFactor()) or nil
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
    Log.Debug("Flight", "%s measured at %.1f s, stored as %.1f s without the perk (%d samples)",
        key, measured, value, count)
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then PQ:SendMessage("PQ_FLIGHT_MEASURED", srcNodeID, dstNodeID, value, count) end
    return count
end


---------------------------------------------------------------------------
-- Reading the flight master's map
---------------------------------------------------------------------------

--- Which value of TaxiGetNodeSlot's third argument means "source".
--
-- The argument is undocumented: _reference/misc/WoW-API/WoW-API/Data/Wiki.lua:9410 declares
-- TaxiGetNodeSlot with no parameters at all, and the only evidence for its meaning is two of
-- Blizzard's own call sites naming the results srcSlot and dstSlot (Shared/TaxiFrame.lua:172-177,
-- :240-245). That is a reading, not a contract, and this file refuses to depend on it.
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
    local legs = GetNumRoutes and GetNumRoutes(index)
    if type(legs) ~= "number" or legs < 1 then return nil end
    -- One leg is a direct flight, and a direct flight runs from where the player stands to the
    -- destination whichever way round TaxiGetNodeSlot speaks: there is nothing to settle.
    if legs == 1 and currentSlot and index ~= currentSlot then return { currentSlot, index } end
    if slotPolarity == nil then return nil end
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

--- The same chain as node ids, in flight order -- what the PandaQuest site is given -- or nil when
-- any slot on it has no node id: half a chain would draw a route nobody flew.
local function nodeChain(slots)
    if not slots then return nil end
    local out = {}
    for i = 1, #slots do
        local nodeID = nodeIdBySlot[slots[i]]
        if not nodeID then return nil end
        out[i] = nodeID
    end
    return out
end

--- The price the flight master's own tooltip shows for a slot (Shared/TaxiFrame.lua:39), read
-- while the map is open; nil when the client does not say.
local function slotCost(index)
    if type(TaxiNodeCost) ~= "function" then return nil end
    local ok, value = pcall(TaxiNodeCost, index)
    value = ok and tonumber(value) or nil
    if not value or value < 0 then return nil end
    return floor(value)
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

    -- nodeID, slotIndex and the name are what this file needs. `state` is kept for one purpose
    -- only -- confirming, below, that slotIndex really indexes the taxi frame's slot space -- and
    -- is never consulted about whether a node can be flown to. That reading is TaxiNodeGetType's
    -- alone (see the header).
    local nameBySlot, stateBySlot = {}, {}
    for i = 1, #infos do
        local info = infos[i]
        if type(info) == "table" then
            local slot, nodeID = tonumber(info.slotIndex), tonumber(info.nodeID)
            if slot and nodeID then
                nodeIdBySlot[slot] = nodeID
                stateBySlot[slot] = info.state
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

    -- **Check the bridge before anything is keyed across it.** Every route in the file rests on
    -- info.slotIndex being an index into the space NumTaxiNodes / TaxiNodeName / TaxiNodeGetType /
    -- TakeTaxiNode speak. Nothing in _reference/wow-ui-source-classic exercises that, because
    -- C_TaxiMap.GetAllTaxiNodes has no call site there at all -- so it is a reading of
    -- TaxiMapDocumentation.lua:111-122, not something this box has seen happen. If the two spaces
    -- are offset by even one, the feature does not fail: it keys every route to the wrong pair of
    -- node ids, silently, and later prints a measured time against a destination the player never
    -- flew to.
    --
    -- There are two free checks, and the bridge only has to pass one of them, because a client
    -- that fails both is a client whose two surfaces disagree about the node under the player's
    -- feet. The slot TaxiNodeGetType calls "CURRENT" and the C_TaxiMap record claiming that
    -- slotIndex have to be the same node, so:
    --   * they must agree on its name. Both strings come from the same client, so the comparison
    --     is language-neutral -- and this is a name compared with a name, never a name used as a
    --     key, which is what the header forbids.
    --   * or that record must say Enum.FlightPathState.Current. Reading `state` to ask "is this
    --     the same node" is not reading it for reachability, which is the mixing the header
    --     forbids: no destination is called flyable or not flyable from anything here.
    -- Either alone would stand the feature down on a client that merely spells a name differently
    -- on the two surfaces, which nothing here can rule out; both failing is the offset itself.
    local mappedName, slotName = nameBySlot[currentSlot], nil
    if type(TaxiNodeName) == "function" then
        local okName, value = pcall(TaxiNodeName, currentSlot)
        if okName and type(value) == "string" and value ~= "" then slotName = value end
    end
    local namesAgree = mappedName ~= nil and slotName ~= nil and mappedName == slotName
    local stateAgrees = false
    local currentState = Enum and Enum.FlightPathState and Enum.FlightPathState.Current
    if currentState ~= nil then stateAgrees = stateBySlot[currentSlot] == currentState end
    if not (namesAgree or stateAgrees) then
        Log.Debug("Flight", "C_TaxiMap slot %d is %s but the taxi frame calls it %s; " ..
            "the two index spaces do not line up and nothing will be keyed here",
            currentSlot, tostring(mappedName), tostring(slotName))
        forgetCapture()
        return nil
    end

    slotPolarity = resolvePolarity(count)

    -- Two counts, because they answer two questions and only one of them is "how many places can
    -- the player fly to from here". A REACHABLE slot that C_TaxiMap did not name cannot be keyed,
    -- so it is a destination this file will show nothing for -- and a log line that folded it into
    -- the reachable count would hide the one thing a reader chasing an empty tooltip needs.
    local reachable, cached = 0, 0
    for index = 1, count do
        if TaxiNodeGetType(index) == "REACHABLE" then
            reachable = reachable + 1
            local nodeID = nodeIdBySlot[index]
            if nodeID then
                -- The name is cached for the bar to print and for nothing else. Keying by it is
                -- what the header forbids; showing the player the word their own client used is
                -- the opposite of a guess.
                local hops = readHops(index)
                captured[index] = { nodeID = nodeID, name = nameBySlot[index], hops = hops,
                                    nodeHops = nodeChain(hops), cost = slotCost(index) }
                cached = cached + 1
            end
        end
    end
    Log.Debug("Flight", "taxi map %d: %d reachable destinations, %d of them keyed, polarity %s",
        mapID, reachable, cached, tostring(slotPolarity))
    return cached
end

--- GetCaptured(slotIndex) -> { nodeID, name, hops, nodeHops, cost }|nil for a destination this
-- open cached. `hops` are slots, `nodeHops` the same chain as node ids.
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
-- The upload outbox
---------------------------------------------------------------------------
--
-- The companion app reads only PandaQuestSync, so a flight reaches the PandaQuest site as one more
-- list in it:
--
--   PandaQuestSync.flights = { { id = , src = , dst = , hops = { src, ..., dst }, s = seconds,
--                                cost = copper|nil, t = unix landing, char = , build = ,
--                                speed = 0.8|nil }, ... }
--
-- `speed` is there only for a character with Ride Like the Wind, whose flights run at that factor
-- (see SpeedFactor): `s` is what the character really spent in the air, and the site needs the
-- factor to put a fast and a slow flight of one route on one scale.
--
-- Only flights this file can name go in -- never a quest taxi, never an early landing -- and only
-- while the player has agreed to share data (global.telemetry.enabled, the same switch the rest of
-- PandaQuestSync obeys: a flight with a character name and a landing time is a movement record).
-- The list keeps the newest OUTBOX_MAX. The site writes `flightsAckedAt` into the community file
-- once it has the flights up to that landing time, and SyncFlightAck below drops them -- the
-- pattern Sync/Community.lua follows for sessions with `ackUploadedThrough`.

local function syncStore()
    local sync = ns.Sync or _G.PandaQuestSync
    if type(sync) ~= "table" then return nil end
    return sync
end

--- CharacterKey() -> "Name-Realm", the key PandaQuestSync.characters and the sessions use
-- (Sync/Telemetry.lua: realm spaces and hyphens removed, matching the hub's /characters route).
function M.CharacterKey()
    local name = (UnitName and UnitName("player")) or "Unknown"
    local realm
    if GetNormalizedRealmName then realm = GetNormalizedRealmName() end
    if not realm or realm == "" then
        realm = (GetRealmName and GetRealmName()) or "Unknown"
        realm = realm:gsub("[%s%-]", "")
    end
    return name .. "-" .. realm
end

--- ClientBuild() -> "5.5.4.70449", the first two returns of GetBuildInfo joined the way the
-- sessions' clientBuild is.
function M.ClientBuild()
    if not GetBuildInfo then return "unknown" end
    local version, build = GetBuildInfo()
    if not version then return "unknown" end
    if not build or build == "" then return version end
    return version .. "." .. build
end

local function sharingAllowed()
    local Telemetry = ns.Telemetry
    -- IsRecording, not IsEnabled: IsEnabled is AceAddon's on every module (Sync/Telemetry.lua).
    if Telemetry and type(Telemetry.IsRecording) == "function" then return Telemetry.IsRecording() and true or false end
    local PQ = ns.PQ
    local global = PQ and PQ.db and PQ.db.global
    local telemetry = global and global.telemetry
    return type(telemetry) == "table" and telemetry.enabled == true
end

--- GetOutbox() -> PandaQuestSync.flights, or nil when nothing was ever put in it.
function M.GetOutbox()
    local sync = syncStore()
    local flights = sync and sync.flights
    if type(flights) ~= "table" then return nil end
    return flights
end

local function copyList(list)
    if type(list) ~= "table" then return nil end
    local out = {}
    for i = 1, #list do out[i] = list[i] end
    return out
end

--- One finished flight into the outbox. Returns the entry, or nil when it was not added.
local function addToOutbox(f, seconds, landedAt)
    if not sharingAllowed() then return nil end
    local sync = syncStore()
    if not sync then return nil end
    if type(sync.flights) ~= "table" then sync.flights = {} end
    local flights = sync.flights
    local char = M.CharacterKey()
    local entry = {
        id = format("%s-%d-%d-%d", char, landedAt, f.src, f.dst),
        src = f.src, dst = f.dst,
        hops = copyList(f.hops),
        s = floor(seconds + 0.5),
        cost = f.paid or f.cost,
        t = landedAt,
        char = char,
        build = M.ClientBuild(),
    }
    local factor = f.speed or 1
    if factor ~= 1 then entry.speed = factor end
    flights[#flights + 1] = entry
    while #flights > OUTBOX_MAX do tremove(flights, 1) end
    return entry
end

--- PruneUploadedFlights(ack) -> number removed. Drops every flight that landed at or before `ack`:
-- the site already has it. Anything that is not a flight record goes too.
function M.PruneUploadedFlights(ack)
    ack = tonumber(ack)
    if not ack or ack <= 0 then return 0 end
    local flights = M.GetOutbox()
    if not flights then return 0 end
    local n = #flights
    local kept, removed = 0, 0
    for i = 1, n do
        local entry = flights[i]
        local keep = type(entry) == "table"
        if keep then
            local landed = tonumber(entry.t)
            if landed and landed <= ack then keep = false end
        end
        if keep then
            kept = kept + 1
            flights[kept] = entry
        else
            removed = removed + 1
        end
    end
    for i = kept + 1, n do flights[i] = nil end
    return removed
end

--- SyncFlightAck() -> ack|nil, removed
-- Copies `flightsAckedAt` from the community file the site generated into PandaQuestSync (never
-- backwards) and prunes the flights it covers -- Sync/Community.lua's SyncAck, for flights. A
-- community file from before the site wrote the field has none, and then nothing happens.
function M.SyncFlightAck()
    local overrides = ns.Overrides
    local community = overrides and overrides.community
    local ack = type(community) == "table" and tonumber(community.flightsAckedAt) or nil
    local sync = syncStore()
    if not ack or ack <= 0 or not sync then return nil, 0 end

    local previous = tonumber(sync.flightsAckedAt) or 0
    if ack > previous then
        sync.flightsAckedAt = ack
    else
        ack = previous
    end
    local removed = M.PruneUploadedFlights(ack)
    if removed > 0 then
        Log.Debug("Flight", "the site has flights up to %s; pruned %d uploaded flight(s)", tostring(ack), removed)
    end
    return ack, removed
end

---------------------------------------------------------------------------
-- Saved across a reload
---------------------------------------------------------------------------

local function charStore()
    local PQ = ns.PQ
    local db = PQ and PQ.db
    local char = db and db.char
    if type(char) ~= "table" then return nil end
    return char
end

--- Writes the flight in the air to PandaQuestDB.char.flightInAir, or clears it. The server's clock
-- goes in, because GetTime() does not survive the reload. PLAYER_LOGOUT -- which a /reload sends
-- too -- stamps `leftAt` on it, and only a reload that follows within RELOAD_GAP picks it up again:
-- a record left behind by a session that ended some other way is never mistaken for today's taxi.
local function persist()
    local char = charStore()
    if not char then return end
    local f = flight
    if not f then
        char.flightInAir = nil
        return
    end
    char.flightInAir = {
        src = f.src, dst = f.dst, name = f.name, legs = f.legs, hops = copyList(f.hops),
        takeoff = f.takeoff, money = f.money, cost = f.cost, paid = f.paid, speed = f.speed,
        identified = f.identified or nil, discarded = f.discarded or nil,
    }
end

---------------------------------------------------------------------------
-- Measuring one flight
---------------------------------------------------------------------------

local function stopWaiting()
    if waitTimer and listener.CancelTimer then listener:CancelTimer(waitTimer) end
    waitTimer, waiting = nil, nil
end

local function stopFlightTimer()
    if flightTimer and listener.CancelTimer then listener:CancelTimer(flightTimer) end
    flightTimer = nil
end

local checkLanding

local function startFlight(f)
    stopWaiting()
    flight = f
    stopFlightTimer()
    if listener.ScheduleRepeatingTimer then
        flightTimer = listener:ScheduleRepeatingTimer(checkLanding, FLIGHT_POLL)
    end
    persist()
    send("PQ_FLIGHT_STARTED", f.src, f.dst)
end

--- The takeoff: UnitOnTaxi has just turned true. `click` is what the player clicked, if anything
-- still explains this taxi.
local function takeOff(click)
    if click then
        local waited = now() - (tonumber(click.at) or 0)
        if waited < 0 or waited > CLICK_WINDOW then
            Log.Debug("Flight", "a click %.0f s old is not this takeoff; timing it unnamed", waited)
            click = nil
        end
    end
    local factor = M.SpeedFactor()
    -- A flight this module could not put a name to is still a flight, and the player is still in
    -- the air watching it happen: a taxi from a quest script, a flight master whose map C_TaxiMap
    -- could not read, a click the takeoff came too late for. It is timed and drawn -- the time in
    -- the air is the one honest number it has -- and `src` and `dst` stay nil, which is what
    -- M.Record and the outbox refuse on, so nothing unnamed is ever filed.
    if not (click and click.src and click.dst) then
        startFlight({ startedAt = now(), takeoff = serverNow(), discarded = false, identified = false,
                      speed = factor })
        Log.Debug("Flight", "measuring an unnamed flight; the bar shows the time in the air only")
        return
    end
    local f = { src = click.src, dst = click.dst, name = click.name, legs = click.legs, hops = click.hops,
                startedAt = now(), takeoff = serverNow(), money = click.money, cost = click.cost,
                discarded = false, identified = true, speed = factor }
    -- The fare: what left the purse between the click and now. PLAYER_MONEY may still be on its
    -- way, and then it is read when it arrives (onMoney).
    local current = money()
    if f.money and current and current < f.money then f.paid = f.money - current end
    startFlight(f)
    Log.Debug("Flight", "measuring %d-%d over %s legs", f.src, f.dst, tostring(f.legs or "an unread number of"))
end

--- Asks UnitOnTaxi whether the taxi has lifted off yet. Runs from the POLL timer while a click (or
-- a reload) waits, and from every event that can mean a taxi.
local function checkTakeoff()
    if flight then
        stopWaiting()
        return
    end
    local w = waiting
    if onTaxi() then
        if w and w.resume then
            local record = w.resume
            stopWaiting()
            -- The same flight, picked up where the reload left it: elapsed time from the server's clock.
            local elapsed = serverNow() - (tonumber(record.takeoff) or serverNow())
            if elapsed < 0 then elapsed = 0 end
            record.startedAt = now() - elapsed
            record.discarded = record.discarded and true or false
            record.identified = record.identified and true or false
            startFlight(record)
            Log.Debug("Flight", "a reload in the air; still measuring after %.0f s", elapsed)
            return
        end
        takeOff(w and w.click)
        return
    end
    if w and now() - w.at > CLICK_WINDOW then
        if w.resume then
            Log.Debug("Flight", "the flight interrupted by the reload ended before it; nothing recorded")
            persist()
        end
        stopWaiting()
    end
end

--- Starts (or restarts) the takeoff check for CLICK_WINDOW seconds.
local function wait(entry)
    stopWaiting()
    waiting = entry
    if listener.ScheduleRepeatingTimer then
        waitTimer = listener:ScheduleRepeatingTimer(checkTakeoff, POLL)
    end
end

--- The landing: UnitOnTaxi is false again. Control can come back while the player is still on the
-- taxi -- that is not a landing, and closing the measurement there would record the wrong duration.
local function land()
    local f = flight
    if not f then return nil end
    stopFlightTimer()
    flight = nil
    persist()
    send("PQ_FLIGHT_ENDED", f.src, f.dst)
    local seconds = now() - (tonumber(f.startedAt) or now())
    if not f.identified then
        -- Timed, shown, and never filed: there is no route to file it under. See takeOff.
        Log.Debug("Flight", "an unnamed flight landed after %.0f s; nothing recorded", seconds)
        return nil
    end
    if f.discarded then
        Log.Debug("Flight", "%d-%d ended somewhere else; nothing recorded", f.src, f.dst)
        return nil
    end
    -- The leg count goes to the log as well as the outbox: two samples of one node-id pair flown
    -- over different hop chains -- because the character has since found an intermediate flight
    -- point -- go into one median in the local store, which has no field to tell them apart.
    Log.Debug("Flight", "%d-%d landed after %s legs", f.src, f.dst, tostring(f.legs or "an unread number of"))
    local count = M.Record(f.src, f.dst, seconds)
    if count then addToOutbox(f, seconds, serverNow()) end
    return count
end

checkLanding = function()
    if flight and not onTaxi() then land() end
end

--- The hook on TakeTaxiNode. It looks nothing up in the client: the frame is closing and nothing
-- promises the node list outlives it, so the only source is what TAXIMAP_OPENED cached -- the
-- price included. The purse is read here, after the call: the fare is taken by the server, so it
-- cannot have left it yet.
local function onTakeTaxiNode(index)
    if flight then return end
    local slot = tonumber(index)
    local entry = slot and captured[slot] or nil
    local click = { at = now(), money = money() }
    if entry and currentNodeID then
        click.src, click.dst, click.name = currentNodeID, entry.nodeID, entry.name
        click.hops, click.cost = entry.nodeHops, entry.cost
        -- A chain of n slots is n-1 legs; nil when it could not be read.
        click.legs = entry.hops and (#entry.hops - 1) or nil
    else
        Log.Debug("Flight", "taxi slot %s was not cached; this flight will not be filed", tostring(index))
    end
    wait({ at = click.at, click = click })
    checkTakeoff()
end

--- Something that can mean a taxi: a control loss, a unit flag change. Never a flight by itself --
-- UnitOnTaxi decides -- but a taxi nobody clicked for (a quest script) is only ever noticed here.
local function onTaxiHint()
    if flight then
        checkLanding()
        return
    end
    if onTaxi() then
        checkTakeoff()
    elseif not waiting then
        -- The flag can trail the control loss here too; give it the same window a click gets.
        wait({ at = now() })
    end
end

local function onUnitFlags(_, unit)
    if unit == "player" then onTaxiHint() end
end

local function onControlGained()
    if flight then checkLanding() end
end

--- PLAYER_MONEY: a fare that arrived after the takeoff was seen.
local function onMoney()
    local f = flight
    if not (f and f.identified and f.paid == nil and f.money) then return end
    if now() - (tonumber(f.startedAt) or 0) > FARE_WINDOW then return end
    local current = money()
    if current and current < f.money then
        f.paid = f.money - current
        persist()
    end
end

--- A refusal from the server, worded as one of the client's taxi errors: the click will not fly.
local TAXI_ERRORS = {
    "ERR_TAXINOTENOUGHMONEY", "ERR_TAXIPLAYERBUSY", "ERR_TAXIPLAYERALREADYMOUNTED",
    "ERR_TAXIPLAYERSHAPESHIFTED", "ERR_TAXIPLAYERMOVING", "ERR_TAXINOSUCHPATH", "ERR_TAXITOOFARAWAY",
    "ERR_TAXIUNSPECIFIEDSERVERERROR", "ERR_TAXISAMENODE", "ERR_TAXINOTVISITED", "ERR_TAXINOVENDORNEARBY",
    "ERR_TAXINOTSTANDING", "ERR_TAXINOPATHS",
}
local function isTaxiError(message)
    if type(message) ~= "string" then return false end
    for _, name in ipairs(TAXI_ERRORS) do
        local text = _G[name]
        if type(text) == "string" and text == message then return true end
    end
    return false
end

local function onErrorMessage(_, _, message)
    if waiting and waiting.click and not flight and isTaxiError(message) then
        Log.Debug("Flight", "the server refused the click: %s", message)
        stopWaiting()
    end
end

--- Something took the player off this flight before its destination: the route's time is not
-- what this flight will measure.
local function discard(why)
    if flight and not flight.discarded then
        flight.discarded = true
        persist()
        Log.Debug("Flight", "%s in the air; this flight will not be filed", why)
    end
end

--- PLAYER_ENTERING_WORLD(isInitialLogin, isReloadingUi).
local function onEnteringWorld(_, isInitialLogin, isReloadingUi)
    if flight then
        -- A loading screen in the air in this same session. A reload never gets here with the
        -- flight in memory in the real client, but the measurement survives one either way. Any
        -- other loading screen is a port, a summon or a teleport: not the route.
        if not isReloadingUi then discard("a loading screen") end
        checkLanding()
        return
    end
    local char = charStore()
    local record = char and char.flightInAir
    if type(record) == "table" and isReloadingUi and not isInitialLogin then
        local age = serverNow() - (tonumber(record.takeoff) or 0)
        local gap = serverNow() - (tonumber(record.leftAt) or 0)
        if age >= 0 and age <= MAX_FLIGHT and gap >= 0 and gap <= RELOAD_GAP then
            -- Picked up by the takeoff check, which also covers a taxi flag that trails the reload.
            wait({ at = now(), resume = record })
            checkTakeoff()
            return
        end
    end
    if record ~= nil and char then
        -- A login, not a reload (a disconnect in the air), or a record too old to be this flight:
        -- the time spent away was not seen in the air. Nothing is filed.
        char.flightInAir = nil
    end
    if onTaxi() then takeOff(nil) end
end

--- GetFlight() -> { src, dst, name, startedAt, elapsed, seconds, samples, discarded, identified }|nil
-- What is being measured right now, with the route's own estimate beside it so a screen does not
-- have to ask twice. `seconds` and `samples` are nil on a route nobody has flown, and UI/FlightBar
-- .lua then shows elapsed time and no fraction.
function M.GetFlight()
    if not flight then return nil end
    local seconds, samples = M.GetEstimate(flight.src, flight.dst)
    return {
        src = flight.src, dst = flight.dst, name = flight.name,
        startedAt = flight.startedAt, elapsed = now() - flight.startedAt,
        discarded = flight.discarded, identified = flight.identified,
        seconds = seconds, samples = samples or 0,
    }
end

--- IsMeasuring() -> true while a flight is being timed.
function M.IsMeasuring()
    return flight ~= nil
end

--- IsWaiting() -> true while a click (or a reload) waits for UnitOnTaxi. The takeoff check runs
-- only then.
function M.IsWaiting()
    return waiting ~= nil
end

--- Reset(): forget every measurement. `/pq reset` does not call this -- a measurement is data, not
-- a window position -- but the tests and a future options button need one door to it. The upload
-- outbox is left alone: what waits for the site is the player's data, not this store's.
function M.Reset()
    local routes = M.GetRoutes()
    if routes then wipe(routes) end
    forgetCapture()
    stopWaiting()
    stopFlightTimer()
    flight = nil
    persist()
end

---------------------------------------------------------------------------
-- Module lifecycle
---------------------------------------------------------------------------

local function hookTaxiGlobals()
    if hooked then return end
    if type(_G.TakeTaxiNode) ~= "function" then return end
    hooked = true
    hooksecurefunc("TakeTaxiNode", onTakeTaxiNode)
    -- The player pressing "land here" on the possess bar. What happens after it is not the route.
    --
    -- This hook is as unverified as the two guarded calls above, and for the same reason:
    -- TaxiRequestEarlyLanding has NO call site anywhere in _reference/wow-ui-source-classic, and
    -- Blizzard_ActionBar is not in that tree at all. The only call site in any reference tree is
    -- _reference/misc/WoW-API/WoW-API/_UI/Blizzard_ActionBar/Classic_PossessActionBar.lua:65 --
    -- whose own first lines say it is an auto-generated LuaLS annotation stub, not shipped 5.5.4
    -- UI code. The function itself is in _reference/misc/ketho/GlobalAPI_classic.lua, so it exists
    -- on this client; whether the cancel button really calls it is on the in-game-only list.
    -- If it does not, an early landing is recorded as a normal flight of the wrong duration, which
    -- is why the type check below is the guard and not the citation.
    if type(_G.TaxiRequestEarlyLanding) == "function" then
        hooksecurefunc("TaxiRequestEarlyLanding", function() discard("an early landing") end)
    end
    -- A summon or a battleground port taken in the air ends the flight somewhere else. InFlight
    -- watches the same two calls on this client for the same reason.
    if type(_G.C_SummonInfo) == "table" and type(_G.C_SummonInfo.ConfirmSummon) == "function" then
        hooksecurefunc(_G.C_SummonInfo, "ConfirmSummon", function() discard("a summon") end)
    end
    if type(_G.AcceptBattlefieldPort) == "function" then
        hooksecurefunc("AcceptBattlefieldPort", function(_, accept)
            if accept then discard("a battleground port") end
        end)
    end
end

function M.Enable()
    if not listener.RegisterEvent then return end
    hookTaxiGlobals()

    listener:RegisterEvent("TAXIMAP_OPENED", function(_, system)
        -- A map opening ends whatever the last flight master started: a click that never became a
        -- flight, and a flight whose landing nobody saw. Neither can still be true. This runs
        -- before the system id is looked at, because a map system this addon does not read is
        -- still a map system that replaced the one it did: returning with the last flight master's
        -- table standing would let the click hook key the next flight from it.
        stopWaiting()
        stopFlightTimer()
        flight = nil
        persist()
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

    listener:RegisterEvent("PLAYER_CONTROL_LOST", onTaxiHint)
    listener:RegisterEvent("UNIT_FLAGS", onUnitFlags)
    listener:RegisterEvent("PLAYER_CONTROL_GAINED", onControlGained)
    listener:RegisterEvent("PLAYER_MONEY", onMoney)
    listener:RegisterEvent("UI_ERROR_MESSAGE", onErrorMessage)
    listener:RegisterEvent("LFG_PROPOSAL_SUCCEEDED", function() discard("a dungeon port") end)
    listener:RegisterEvent("PLAYER_ENTERING_WORLD", onEnteringWorld)
    listener:RegisterEvent("PLAYER_LOGOUT", function()
        local char = charStore()
        if flight and char and type(char.flightInAir) == "table" then char.flightInAir.leftAt = serverNow() end
    end)
end

--- Init(): the hook is tried here as well as in Enable, because Blizzard_UIPanels_Game is
-- LoadFirst rather than load-on-demand (Blizzard_UIPanels_Game_Classic.toc:5) and its globals are
-- therefore already in place -- but an addon that cannot hook is one that measures nothing, so it
-- gets two chances rather than one. The site's acknowledgement is applied here too, as soon as the
-- saved variable exists, the way Sync/Community.lua applies the sessions' one.
function M.Init()
    hookTaxiGlobals()
    local ok, err = pcall(M.SyncFlightAck)
    if not ok then Log.Warn("Flight", "the flight acknowledgement is unusable: %s", tostring(err)) end
end
