-- Flight/Eta.lua: how long a flight is expected to take, before anybody on this account flew it.
--
-- Flight/Routes.lua measures the player's own flights, and a route this account has flown twice is
-- still answered from those measurements first. Before then the bar used to show only the time in
-- the air, which the owner reported as "it doesn't show how long the flight takes". So the expected
-- duration now comes from the best source there is, in this order:
--
--   1. "own"        the median of this account's own flights of the route, from MIN_SAMPLES of them;
--   2. "measured"   the median ALL players measured, from the portal (Database/Overrides/Flights.lua):
--                   the chain the taxi flies when the portal has it, else the sum of its legs when
--                   every leg was measured;
--   3. "estimated"  the sum of the legs from the same file, where a leg nobody measured is its path
--                   length (read from the client's TaxiPath tables on the portal) over the taxi speed;
--   4. "own1"       one flight of this account's own, which is a measurement but not a median;
--   5. "straight"   the straight line between the flight masters (C_TaxiMap positions on the taxi
--                   map, which is a UI map, turned into yards by HereBeDragons) times DETOUR, over the
--                   taxi speed.
--
-- Only 1 and 2 are called measured on screen; 3 to 5 say "estimated". Flights.lua may be missing
-- (an addon tree from before the portal wrote it) or empty: every lookup below then answers nil and
-- the next source is tried.
--
-- **Ride Like the Wind.** Routes.lua stores its own samples without the perk and multiplies them back
-- (SpeedFactor). The portal's measured medians are what players really spent in the air, with or
-- without the perk, so they are shown as they are. The estimates are the base taxi speed, so they get
-- this character's factor like the own samples do.
local _, ns = ...

local M = {}
ns.FlightEta = M

local type, tonumber, pairs, pcall, concat = type, tonumber, pairs, pcall, table.concat
local sqrt = math.sqrt

--- Yards per second when Flights.lua does not say: pandaquest_hub.flightplan.DEFAULT_SPEED.
M.DEFAULT_SPEED = 32
--- How much longer a taxi path is than the straight line between its two flight masters: the median
-- over the 1,624 direct legs of MoP's TaxiPathNode table (wago.tools DB2, build 5.5.4.70032), path
-- length over chord, both in continent coordinates. The middle 80% lies between 1.05 and 1.65.
M.DETOUR = 1.22

local function exported()
    local overrides = ns.Overrides
    local flights = overrides and overrides.flights
    if type(flights) ~= "table" or type(flights.legs) ~= "table" then return nil end
    return flights
end
M.Exported = exported

local function speed()
    local flights = exported()
    local value = flights and tonumber(flights.speed)
    if value and value > 0 then return value end
    return M.DEFAULT_SPEED
end

local function speedFactor()
    local Routes = ns.FlightRoutes
    if Routes and type(Routes.SpeedFactor) == "function" then
        local ok, factor = pcall(Routes.SpeedFactor)
        if ok and tonumber(factor) then return factor end
    end
    return 1
end

--- Leg(src, dst) -> seconds, measured, samples | nil. One direct flight from Flights.lua, as stored
-- (no speed factor applied).
function M.Leg(src, dst)
    local flights = exported()
    local row = flights and flights.legs[tonumber(src)]
    local value = type(row) == "table" and row[tonumber(dst)] or nil
    if type(value) == "number" and value > 0 then return value, false, 0 end
    if type(value) == "table" and tonumber(value[1]) and value[1] > 0 then
        return value[1], true, tonumber(value[2]) or 0
    end
    return nil
end

--- Chain(hops) -> seconds, samples | nil: the measured median of a whole multi-hop flight.
function M.Chain(hops)
    local flights = exported()
    if not (flights and type(flights.chains) == "table" and type(hops) == "table" and #hops > 2) then return nil end
    local value = flights.chains[concat(hops, "-")]
    if type(value) == "table" and tonumber(value[1]) and value[1] > 0 then return value[1], tonumber(value[2]) or 0 end
    return nil
end

--- FromExport(src, dst, hops) -> seconds, source, samples | nil. Sources 2 and 3 of the header.
-- `hops` is the chain of node ids src..dst when the flight master's map could be read; without it
-- the flight is taken as the direct leg src -> dst.
function M.FromExport(src, dst, hops)
    if not exported() then return nil end
    if type(hops) ~= "table" or #hops < 2 then hops = { src, dst } end
    local chainSeconds, chainSamples = M.Chain(hops)
    if chainSeconds then return chainSeconds, "measured", chainSamples end
    local measured, estimated, fewest, allMeasured = 0, 0, nil, true
    for i = 1, #hops - 1 do
        local seconds, isMeasured, samples = M.Leg(hops[i], hops[i + 1])
        if not seconds then return nil end
        if isMeasured then
            measured = measured + seconds
            if not fewest or samples < fewest then fewest = samples end
        else
            estimated = estimated + seconds
            allMeasured = false
        end
    end
    if allMeasured then return measured, "measured", fewest or 0 end
    return measured + estimated * speedFactor(), "estimated", 0
end

--- Straight(hops) -> seconds | nil. Source 5: the chain's straight lines in yards, times DETOUR.
-- Positions come from Flight/Routes.lua, which keeps C_TaxiMap's node positions while the map is open.
function M.Straight(hops)
    local Routes = ns.FlightRoutes
    local HBD = LibStub and LibStub("HereBeDragons-2.0", true)
    if not (HBD and Routes and type(Routes.GetNodePosition) == "function" and type(hops) == "table" and #hops >= 2) then
        return nil
    end
    local yards, lastX, lastY, lastInstance = 0, nil, nil, nil
    for i = 1, #hops do
        local x, y, mapID = Routes.GetNodePosition(hops[i])
        if not (x and y and mapID) then return nil end
        local ok, wx, wy, instance = pcall(HBD.GetWorldCoordinatesFromZone, HBD, x, y, mapID)
        if not (ok and wx and wy) then return nil end
        if lastX then
            if instance ~= lastInstance then return nil end
            local dx, dy = wx - lastX, wy - lastY
            yards = yards + sqrt(dx * dx + dy * dy)
        end
        lastX, lastY, lastInstance = wx, wy, instance
    end
    if yards <= 0 then return nil end
    return yards * M.DETOUR / speed() * speedFactor()
end

--- Expected(src, dst, hops) -> seconds, source, samples | nil.
-- The whole precedence of the header. `source` is "own", "measured", "estimated", "own1" or
-- "straight"; `samples` is how many flights the figure rests on (0 for an estimate).
function M.Expected(src, dst, hops)
    src, dst = tonumber(src), tonumber(dst)
    if not (src and dst) then return nil end
    local Routes = ns.FlightRoutes
    local own, ownSamples
    if Routes and type(Routes.GetEstimate) == "function" then
        own, ownSamples = Routes.GetEstimate(src, dst)
        ownSamples = tonumber(ownSamples) or 0
        local minimum = tonumber(Routes.MIN_SAMPLES) or 2
        if own and ownSamples >= minimum then return own, "own", ownSamples end
    end
    local seconds, source, samples = M.FromExport(src, dst, hops)
    if seconds then return seconds, source, samples end
    if own and ownSamples > 0 then return own, "own1", ownSamples end
    seconds = M.Straight((type(hops) == "table" and #hops >= 2) and hops or { src, dst })
    if seconds then return seconds, "straight", 0 end
    return nil
end

--- IsMeasured(source) -> true for the two sources that are medians of measured flights.
function M.IsMeasured(source)
    return source == "own" or source == "measured"
end

--- Count() -> legs, chains in Flights.lua (for /pq status and the tests).
function M.Count()
    local flights = exported()
    if not flights then return 0, 0 end
    local legs, chains = 0, 0
    for _, row in pairs(flights.legs) do
        if type(row) == "table" then for _ in pairs(row) do legs = legs + 1 end end
    end
    for _ in pairs(type(flights.chains) == "table" and flights.chains or {}) do chains = chains + 1 end
    return legs, chains
end
