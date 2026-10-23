-- Flight/Tooltip.lua: one line in the flight master's tooltip, and only when it was measured.
--
-- **Why the tooltip and not a label on the map.** This client loads Shared/TaxiFrame.lua
-- (Blizzard_UIPanels_Game_Classic.toc:75, "[AllowLoadGameType cata, mists]"), which has no
-- destination list at all -- only TaxiButton<i> pins on the map texture, 16x16, shoved apart to a
-- minimum TAXI_BUTTON_MIN_DIST of 18 px (Shared/TaxiFrame.lua:32, :83-89). A time written beside
-- a pin would land on top of its neighbour on any crowded continent. The tooltip is the one place
-- with room, and it is already the place the player reads the destination's name and its price.
--
-- **Why a post-hook is reliable here.** The button's OnEnter body is `TaxiNodeOnButtonEnter(self,
-- motion)` (Shared/TaxiFrame.xml:9-11) -- a global lookup performed at call time, so replacing the
-- global is enough; and Blizzard's own last statement in that function is GameTooltip:Show()
-- (Shared/TaxiFrame.lua:204), so appending a line and calling Show() again is exactly the
-- sequence the frame is built to resize under.
--
-- **What it prints, and what it refuses to print.** One double line, in the shape
-- Map/NodeTooltip.lua already uses for every number this addon measured rather than read:
--
--     Flight time:            ~2 min 5 s (3 flights)
--
-- The tilde and the grey are that file's own (`RespawnText`, :211-222): they mean "this is an
-- estimate and here is how many samples it rests on". The word "flights" is the one addition --
-- on a node tooltip a bare "(12)" sits under a row of labelled rows that explain it, and on a taxi
-- tooltip it would sit alone under a price.
--
-- **Since Flight/Eta.lua** a route this account never flew still gets a line when anything is
-- known about it: "X (5 flights, all players)" from the portal's measured median, or
-- "~X (estimated)" from the path's length or the straight line. The player's own median still comes
-- first (Eta's precedence). What follows is the rule for when nothing at all is known.
--
-- On a route nobody has flown there is no line. Not a dash, not a question mark, not a guess from
-- the distance between two pins -- Flight/Routes.lua's header says why that distance cannot become
-- a time. An absent line is the true one, and the player loses nothing they had before.
local _, ns = ...
local L = ns.L

local M = {}
ns.FlightTooltip = M

local Util, Log = ns.Util, ns.Log

local type, tonumber, pcall, format = type, tonumber, pcall, string.format
local floor = math.floor

--- The grey Map/NodeTooltip.lua paints every measured estimate (:43 COLOR_ESTIMATE), and the white
-- it paints a label (:41 COLOR_LABEL). Copied rather than chosen: two tooltips in one addon
-- printing the same kind of number in two different colours would be saying they are two kinds.
local COLOR_LABEL = { 1, 1, 1 }
local COLOR_ESTIMATE = { 0.75, 0.75, 0.75 }

local hooked = false

local function settings()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return (profile and profile.flight) or ns.DEFAULTS.profile.flight
end

---------------------------------------------------------------------------
-- The line
---------------------------------------------------------------------------

--- Text(srcNodeID, dstNodeID[, hops]) -> text|nil. "~2 min 5 s (3 flights)" from the player's own
-- flights, "2 min 5 s (4 flights, all players)" from the portal, "~2 min 5 s (estimated)", or nil
-- when nothing is known. `hops` is the chain of node ids the taxi will fly, when the map gave it.
-- Public because a test can read a string and cannot read a screen.
function M.Text(srcNodeID, dstNodeID, hops)
    local seconds, source, samples
    local Eta = ns.FlightEta
    if Eta and type(Eta.Expected) == "function" then
        local ok, a, b, c = pcall(Eta.Expected, srcNodeID, dstNodeID, hops)
        if ok then seconds, source, samples = a, b, c end
    else
        local Routes = ns.FlightRoutes
        if not (Routes and type(Routes.GetEstimate) == "function") then return nil end
        local ok, a, b = pcall(Routes.GetEstimate, srcNodeID, dstNodeID)
        if ok and a then seconds, source, samples = a, "own", b end
    end
    if type(seconds) ~= "number" or seconds <= 0 then return nil end
    local text = Util.FormatTime(floor(seconds + 0.5))
    if not text or text == "--" then return nil end
    local count = tonumber(samples) or 0
    if source == "own" or source == "own1" then
        if count <= 0 then return nil end
        local pattern = count == 1 and L["~%s (%d flight)"] or L["~%s (%d flights)"]
        return format(pattern, text, count)
    end
    if source == "measured" then return format(L["%s (%d flights, all players)"], text, count) end
    return format(L["~%s (estimated)"], text)
end

--- LineFor(slotIndex) -> label, value|nil for a destination on the map that is open now.
-- Reachability is read from TaxiNodeGetType and nowhere else, which is also what keeps this from
-- firing on the node the player is standing at and on the distant nodes Blizzard draws as nubs.
function M.LineFor(slotIndex)
    local Routes = ns.FlightRoutes
    if not Routes then return nil end
    local slot = tonumber(slotIndex)
    if not slot then return nil end
    if type(TaxiNodeGetType) ~= "function" or TaxiNodeGetType(slot) ~= "REACHABLE" then return nil end
    local entry = Routes.GetCaptured(slot)
    local source = Routes.GetCurrentNodeID()
    if not (entry and source) then return nil end
    local value = M.Text(source, entry.nodeID, entry.nodeHops)
    if not value then return nil end
    return L["Flight time:"], value
end

local function appendLine(button)
    if settings().tooltipETA == false then return end
    if not (GameTooltip and GameTooltip.AddDoubleLine) then return end
    if type(button) ~= "table" or type(button.GetID) ~= "function" then return end
    -- Only the tooltip Blizzard just pointed at this button. A tooltip that has since been taken
    -- over by something else is not ours to write in.
    if GameTooltip.IsOwned and not GameTooltip:IsOwned(button) then return end

    local label, value = M.LineFor(button:GetID())
    if not value then return end

    GameTooltip:AddDoubleLine(label, value,
        COLOR_LABEL[1], COLOR_LABEL[2], COLOR_LABEL[3],
        COLOR_ESTIMATE[1], COLOR_ESTIMATE[2], COLOR_ESTIMATE[3])
    -- Blizzard's own function ends on this call for the same reason: the frame has to be told to
    -- measure itself again now that it is a line taller.
    GameTooltip:Show()
end

---------------------------------------------------------------------------
-- Module lifecycle
---------------------------------------------------------------------------

local function hookTooltip()
    if hooked then return end
    if type(_G.TaxiNodeOnButtonEnter) ~= "function" then return end
    hooked = true
    -- The body runs inside Blizzard's OnEnter, so an error raised here would be an error raised on
    -- every hover of every flight master. One pcall, created once, buys the whole feature the
    -- right to fail quietly and leave the flight master working.
    hooksecurefunc("TaxiNodeOnButtonEnter", function(button)
        local ok, err = pcall(appendLine, button)
        if not ok then Log.Error("Flight", "taxi tooltip line failed: %s", tostring(err)) end
    end)
end

function M.Init()
    hookTooltip()
end

function M.Enable()
    hookTooltip()
end
