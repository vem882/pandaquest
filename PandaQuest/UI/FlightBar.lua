-- UI/FlightBar.lua: the bar that runs while the taxi does.
--
-- The player asked for "a small bar with progress and remaining time" during the flight. There is
-- only one honest way to fill it, and on most routes there is nothing to fill it with yet:
--
--   * with a measured time for the route -- at least ns.FlightRoutes.MIN_SAMPLES flights of it --
--     the bar shows how far along the flight is and how much is left;
--   * without one it shows the time in the air and nothing else. No fill, no remaining. A
--     fraction needs a whole, and an unflown route has no whole; a bar drawn 40% across would be
--     this addon inventing the other 60%.
--
-- **Why one measured flight is not enough to draw a fill.** A median of one sample is that
-- sample. platform/server/pandaquest_hub/respawn.py:69-71 fixes MIN_SAMPLES = 2 in so many words
-- -- "a median of one is that measurement" -- and Nodes/Respawn.lua's MIN_OWN_OBSERVATIONS is the
-- same 2. The flight master's tooltip does print a one-flight figure, because a printed number can
-- carry "(1 flight)" beside it and the player can weigh it; a bar's fill carries no such caption.
-- So below MIN_SAMPLES this bar stays on its elapsed-only face.
--
-- **Why there is no position-based progress bar here.** It was considered: the player's own world
-- position against the route's hop endpoints would be a real fraction of the way flown, needing no
-- timing at all. It cannot be built honestly on this client. The hop endpoints exist only as
-- normalised positions on the taxi map TEXTURE (Blizzard_UIPanels_Game/Shared/TaxiFrame.lua:66-68
-- multiplies them by 580x580 and flips y purely to place a button), while ns.Player.GetPosition()
-- answers a UI map position and world yards (Quest/Player.lua:144-175). Relating the two means
-- choosing a scale between a texture and a world -- exactly the invention Flight/Routes.lua's
-- header refuses -- and the result would be a fill that is confidently wrong rather than absent.
-- Whether the client even updates the player's position during a taxi flight could not be settled
-- from the reference tree either, so the channel would have needed a degradation path for a
-- question it could not answer. It is not built, and this comment is here so the next reader knows
-- it was weighed rather than missed.
--
-- Everything about the frame itself -- its size, its fill, its lock, its drag, its "Bar size"
-- slider and the three settings keys that remember where it was dragged to -- is UI/DigSiteBar
-- .lua's, deliberately unchanged. Two progress bars in one addon that behaved differently would be
-- two answers to one question the player already answered once.
local _, ns = ...
local L = ns.L

local Log, Util = ns.Log, ns.Util

local M = {}
ns.FlightBar = M

local type, tonumber, format = type, tonumber, string.format
local floor, min = math.floor, math.min

--- How often the bar redraws itself. UI/DigSiteBar.lua's LEAVE_CHECK, which is in turn Blizzard's
-- own LEFT_DIGSITE_CHECK_TIME (Cata/ArchaeologyProgressBar.lua:2), taken unchanged: it is this
-- addon's established budget for "the only per-frame work in a bar". The consequence is that the
-- seconds digit can be up to half a second behind the clock, which is why it is floored rather
-- than rounded -- a rounded digit would sometimes show a second the flight has not reached.
local TICK = 0.5

--- How long M.Preview() leaves an empty bar on screen for the player to drag. UI/DigSiteBar.lua's
-- PREVIEW_HOLD, unchanged.
local PREVIEW_HOLD = 20

-- The bar at "Bar size" 1.0, and the same numbers UI/DigSiteBar.lua uses, so the two bars are the
-- same object in two places rather than two objects that look similar.
local BASE_WIDTH, BASE_HEIGHT = 240, 34
local BASE_FILL_HEIGHT = 14

--- The destination name is cut to this many characters. The right-hand text can reach roughly
-- "~12 min 30 s left (8 flights)", and a flight master with a long name would otherwise run under
-- it. Util.Truncate is the same cut Map/NodeTooltip.lua applies to its "Also here:" row.
local MAX_NAME_CHARS = 22

local frame, fillBar, nameText, timeText
--- The font size the template gave the two font strings, read once before anything scaled them.
-- Read once rather than on every applyLayout: reading it back after a SetFont would multiply the
-- last scale by the new one, and the bar would grow every time the slider moved (the same note is
-- on UI/DigSiteBar.lua's baseFontSize).
local baseFontSize
local accum = 0
--- GetTime() at which the bar hides itself, or nil. While it is set it is the ONLY thing that
-- hides the bar: a preview outlives the flight it was drawn without.
local hideAt
local visible = false
local dragging = false
--- What the last draw put on screen, for GetState(). The tests cannot look at a screen, and
-- reading it back off the StatusBar would only tell us what was legal to draw, not what was true.
local shown = {}

-- Own AceEvent object: AceEvent keys its registry by target, so registering PQ_FLIGHT_* on ns.PQ
-- would collide with whichever other module wants the same message (the same note is on
-- Nodes/Respawn.lua's listener and on Flight/Routes.lua's).
local listener = {}
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
end
M.listener = listener

local function now()
    return (GetTime and GetTime()) or 0
end

local function settings()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return (profile and profile.flight) or ns.DEFAULTS.profile.flight
end

---------------------------------------------------------------------------
-- The frame
---------------------------------------------------------------------------

local function savePosition()
    if not frame then return end
    local point, _, _, x, y = frame:GetPoint(1)
    if not point then return end
    local p = settings()
    p.barPoint, p.barX, p.barY = point, x, y
end

local function onDragStart(self)
    if settings().barLocked then return end
    dragging = true
    self:StartMoving()
end

local function onDragStop(self)
    if not dragging then return end
    dragging = false
    self:StopMovingOrSizing()
    savePosition()
end

local function scaleFont(fontString, size)
    if not (fontString and fontString.GetFont and fontString.SetFont and size) then return end
    local path, _, flags = fontString:GetFont()
    if path then fontString:SetFont(path, size, flags) end
end

--- applyLayout(): "Bar size" moves the frame AND everything drawn in it. Nav/Arrow.lua does the
-- same for its textures (:429-438) and UI/DigSiteBar.lua for these same three parts, for the
-- reason both give: the fill height and the font sizes are set once at creation, so a frame that
-- scaled alone would leave them behind -- at 0.5 the 14 px fill is taller than the 17 px frame.
local function applyLayout()
    if not frame then return end
    local p = settings()
    local scale = tonumber(p.barScale) or 1
    -- A profile edited by hand could hold a zero or a negative, which would collapse the frame to
    -- something the player could never click again. The slider itself only offers 0.5 to 2.0.
    if scale <= 0 then scale = 1 end
    frame:SetSize(BASE_WIDTH * scale, BASE_HEIGHT * scale)
    frame:SetMovable(not p.barLocked)
    frame:EnableMouse(true)
    if fillBar then fillBar:SetHeight(BASE_FILL_HEIGHT * scale) end
    if baseFontSize then
        scaleFont(nameText, baseFontSize * scale)
        scaleFont(timeText, baseFontSize * scale)
    end
end

local function applyPosition()
    if not frame then return end
    local p = settings()
    frame:ClearAllPoints()
    frame:SetPoint(p.barPoint or "CENTER", UIParent, p.barPoint or "CENTER",
        tonumber(p.barX) or 0, tonumber(p.barY) or -200)
end

--- The only per-frame work in this file, and it does arithmetic on two numbers until TICK has gone
-- by. A pending deadline wins over the flight check rather than being one more reason to hide on
-- top of it -- the same rule UI/DigSiteBar.lua's OnUpdate follows, and for the same reason: a
-- preview is shown when there is no flight at all.
local function onUpdate(_, elapsed)
    accum = accum + (tonumber(elapsed) or 0)
    if accum < TICK then return end
    accum = 0
    if hideAt then
        if now() >= hideAt then M.Hide() end
        return
    end
    M.Refresh()
end

local function createFrame()
    if frame or not CreateFrame then return frame end
    frame = CreateFrame("Frame", "PandaQuestFlightBar", UIParent)
    if frame.SetFrameStrata then frame:SetFrameStrata("MEDIUM") end
    if frame.SetClampedToScreen then frame:SetClampedToScreen(true) end
    frame:SetMovable(true)
    frame:EnableMouse(true)
    if frame.RegisterForDrag then frame:RegisterForDrag("LeftButton") end

    fillBar = CreateFrame("StatusBar", nil, frame)
    fillBar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    fillBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    fillBar:SetHeight(BASE_FILL_HEIGHT)
    fillBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    -- The dig site bar's gold says "you are digging"; this blue says "you are in the air". One
    -- shape, two colours, so a player who has both on screen can tell them apart at a glance.
    fillBar:SetStatusBarColor(0.37, 0.61, 0.85)
    fillBar:SetMinMaxValues(0, 1)
    fillBar:SetValue(0)

    local background = fillBar:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints(fillBar)
    background:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
    background:SetVertexColor(0, 0, 0, 0.6)

    nameText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    nameText:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    timeText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    timeText:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    if nameText.GetFont then
        local _, size = nameText:GetFont()
        baseFontSize = tonumber(size)
    end

    frame:SetScript("OnDragStart", onDragStart)
    frame:SetScript("OnDragStop", onDragStop)
    frame:SetScript("OnUpdate", onUpdate)
    frame:Hide()

    applyLayout()
    applyPosition()
    M.frame = frame
    return frame
end

---------------------------------------------------------------------------
-- Drawing
---------------------------------------------------------------------------

--- TimeText(elapsed, seconds, samples) -> text, fraction|nil
-- The one place that decides what the bar is allowed to say. `fraction` nil means "draw no fill".
--
-- Three cases, and only the first of them knows a whole:
--   * a route measured at least MIN_SAMPLES times, still inside its measured time -> how much is
--     left, with the count it rests on, and a fill;
--   * the same route once the flight has run past that time -> the time in the air and a full
--     fill. We knew a whole and this flight is not obeying it, so the remaining figure stops
--     being something we measured. Saying "0 s left" while the ground is still moving underneath
--     would be a number nothing measured;
--   * everything else -- no samples, or one -> the time in the air and no fill at all.
function M.TimeText(elapsed, seconds, samples)
    local spent = tonumber(elapsed) or 0
    if spent < 0 then spent = 0 end
    local Routes = ns.FlightRoutes
    local minimum = (Routes and tonumber(Routes.MIN_SAMPLES)) or 2
    local total, count = tonumber(seconds), tonumber(samples) or 0
    if total and total > 0 and count >= minimum then
        if spent < total then
            -- Floored, not rounded: the redraw is TICK apart, and a rounded figure would
            -- sometimes name a second the flight has not reached yet.
            local left = Util.FormatTime(floor(total - spent))
            local pattern = count == 1 and L["~%s left (%d flight)"] or L["~%s left (%d flights)"]
            return format(pattern, left, count), spent / total
        end
        return format(L["%s in the air"], Util.FormatTime(floor(spent))), 1
    end
    return format(L["%s in the air"], Util.FormatTime(floor(spent))), nil
end

--- draw(destination, elapsed, seconds, samples [, label]): put one reading on screen.
-- The StatusBar needs a legal, non-empty range, so its numbers are clamped. The player's are not:
-- what `timeText` says is what M.TimeText decided, and when that decided there is no fraction the
-- bar is drawn empty rather than filled to some plausible place.
local function draw(destination, elapsed, seconds, samples, label)
    local f = createFrame()
    if not f then return end
    local text, fraction
    if label then
        text, fraction = label, nil
    else
        text, fraction = M.TimeText(elapsed, seconds, samples)
    end
    fillBar:SetMinMaxValues(0, 1)
    fillBar:SetValue(fraction and min(fraction, 1) or 0)
    local name = destination and Util.Truncate(destination, MAX_NAME_CHARS) or ""
    nameText:SetText(name)
    timeText:SetText(text)
    shown = { destination = destination, elapsed = tonumber(elapsed), seconds = tonumber(seconds),
              samples = tonumber(samples), fraction = fraction, text = text }
    f:Show()
    visible = true
end

--- Refresh(): redraw from whatever ns.FlightRoutes is measuring, or hide when it is measuring
-- nothing. One authority for "is a flight happening": the module that confirms it against
-- UnitOnTaxi. This bar never asks the client that question itself, so the two can never disagree.
function M.Refresh()
    if not M.Enabled() then
        M.Hide()
        return false
    end
    local Routes = ns.FlightRoutes
    local flight = Routes and type(Routes.GetFlight) == "function" and Routes.GetFlight() or nil
    if not flight then
        M.Hide()
        return false
    end
    draw(flight.name, flight.elapsed, flight.seconds, flight.samples)
    return true
end

--- GetState() -> what the bar is drawing: { shown, destination, elapsed, seconds, samples,
-- fraction, text, locked }. Fields the bar does not have are absent rather than blank, and
-- `fraction` absent is the honest answer for a route with nothing to divide by.
function M.GetState()
    return {
        shown = visible and frame ~= nil and frame:IsShown() == true,
        destination = shown.destination,
        elapsed = shown.elapsed,
        seconds = shown.seconds,
        samples = shown.samples,
        fraction = shown.fraction,
        text = shown.text,
        value = fillBar and fillBar:GetValue() or nil,
        locked = settings().barLocked and true or false,
    }
end

--- GetLayout() -> { width, height, fillHeight, fontSize }, or nil before the frame exists.
-- Like GetState(), it is here because the tests cannot look at a screen, and because "Bar size"
-- has to move all four together or the pieces come apart inside the frame.
function M.GetLayout()
    if not frame then return nil end
    local fontSize
    if nameText and nameText.GetFont then
        local _, size = nameText:GetFont()
        fontSize = size
    end
    return {
        width = frame:GetWidth(), height = frame:GetHeight(),
        fillHeight = fillBar and fillBar:GetHeight() or nil,
        fontSize = fontSize,
    }
end

function M.IsShown()
    return visible and frame ~= nil and frame:IsShown() == true
end

function M.Hide()
    hideAt = nil
    if frame and visible then frame:Hide() end
    visible = false
end

function M.Enabled()
    return settings().bar ~= false
end

---------------------------------------------------------------------------
-- Preview (so a bar nobody has seen can still be dragged)
---------------------------------------------------------------------------

--- WhyNoPreview() -> the line to print instead of a preview, or nil. Both entry points ask this
-- one question, because a switch the command obeys and the button beside it ignores is two answers
-- to one question (UI/DigSiteBar.lua makes the same argument for its own preview).
function M.WhyNoPreview()
    if not M.Enabled() then return L["The flight bar is switched off in /pq options."] end
    return nil
end

--- Preview(): show the bar where it is, with no numbers in it, so the player can find it and drag
-- it. It says "flight" and nothing else on purpose: a preview filled with a plausible "~4 min
-- left" would be this addon showing a number it had not measured.
function M.Preview()
    if M.WhyNoPreview() then return false end
    createFrame()
    if not frame then return false end
    draw(nil, nil, nil, nil, L["Flight progress"])
    hideAt = now() + PREVIEW_HOLD
    return true
end

--- PreviewWithReply() -> true when the bar was drawn. The preview plus the one line of chat that
-- goes with it. Telling a player to drag a bar that is locked would be this addon asking for
-- something its own settings forbid: onDragStart returns immediately while barLocked is set, and
-- nothing on screen would say why the dragging did nothing.
function M.PreviewWithReply()
    local refusal = M.WhyNoPreview()
    if refusal then
        Log.Print("%s", refusal)
        return false
    end
    M.Preview()
    if settings().barLocked then
        Log.Print("%s", L["The flight bar is locked. Unlock it in /pq options to move it."])
    else
        Log.Print("%s", L["Drag the flight bar where you want it. It hides itself again in a moment."])
    end
    return true
end

---------------------------------------------------------------------------
-- Settings
---------------------------------------------------------------------------

--- ApplySettings(): re-reads the settings. UI/Options.lua calls it after any flight.* change.
function M.ApplySettings()
    if not M.Enabled() then
        M.Hide()
        return
    end
    if frame then
        applyLayout()
        applyPosition()
    end
end

--- ResetPosition(): put the bar back where the defaults put it.
function M.ResetPosition()
    local p, d = settings(), ns.DEFAULTS.profile.flight
    p.barPoint, p.barX, p.barY = d.barPoint, d.barX, d.barY
    applyPosition()
end

function M.OnProfileChanged()
    M.ApplySettings()
end

---------------------------------------------------------------------------
-- Module lifecycle
---------------------------------------------------------------------------

function M.Enable()
    if not listener.RegisterMessage then return end
    -- The start message only saves the bar half a second of waiting for its own OnUpdate; the
    -- OnUpdate is what keeps it right, and Refresh() is the same call either way.
    listener:RegisterMessage("PQ_FLIGHT_STARTED", function()
        hideAt = nil
        M.Refresh()
    end)
    listener:RegisterMessage("PQ_FLIGHT_ENDED", function()
        if not hideAt then M.Hide() end
    end)
end

function M.Init()
    local PQ = ns.PQ
    if not (PQ and PQ.commands) then return end
    -- `/pq flight` -- show the bar where it is so it can be dragged, or say why there is none.
    PQ.commands.flight = function() M.PreviewWithReply() end
end
