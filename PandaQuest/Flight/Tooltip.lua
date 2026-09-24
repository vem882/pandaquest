-- Flight/Tooltip.lua: one line in the flight master's tooltip, and only when it was measured.
--
-- **Why the tooltip and not a label on the map.** This client loads Shared/TaxiFrame.lua
-- (Blizzard_UIPanels_Game_Classic.toc:75, "[AllowLoadGameType cata, mists]"), which has no
-- destination list at all -- only TaxiButton<i> pins on the map texture, 16x16, shoved apart to a
-- minimum TAXI_BUTTON_MIN_DIST of 18 px (Shared/TaxiFrame.lua:29, :84-92). A time written beside
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
-- On a route nobody has flown there is no line. Not a dash, not a question mark, not a guess from
-- the distance between two pins -- Flight/Routes.lua's header says why that distance cannot become
-- a time. An absent line is the true one, and the player loses nothing they had before.
local _, ns = ...
local L = ns.L

local M = {}
ns.FlightTooltip = M

local Util, Log = ns.Util, ns.Log

local type, tonumber, pcall, format = type, tonumber, pcall, string.format

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

--- Text(srcNodeID, dstNodeID) -> text|nil. "~2 min 5 s (3 flights)", or nil when this account has
-- never flown the route. Public because a test can read a string and cannot read a screen.
function M.Text(srcNodeID, dstNodeID)
    local Routes = ns.FlightRoutes
    if not (Routes and type(Routes.GetEstimate) == "function") then return nil end
    local ok, seconds, samples = pcall(Routes.GetEstimate, srcNodeID, dstNodeID)
    if not ok or type(seconds) ~= "number" or seconds <= 0 then return nil end
    local count = tonumber(samples) or 0
    if count <= 0 then return nil end
    local text = Util.FormatTime(seconds)
    if not text or text == "--" then return nil end
    local pattern = count == 1 and L["~%s (%d flight)"] or L["~%s (%d flights)"]
    return format(pattern, text, count)
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
    local value = M.Text(source, entry.nodeID)
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
