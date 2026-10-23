-- UI/DigSiteBar.lua: the dig-site progress bar Mists never shipped.
--
-- While a player surveys a dig site the server tells the client how many finds of that site are
-- done and how many there are, on every survey and on every find. Cataclysm's UI drew that as a
-- bar; Mists does not. The code is still in the tree Blizzard ships --
-- Blizzard_FrameXML/Cata/ArchaeologyProgressBar.lua -- but its XML is listed only in
-- Blizzard_FrameXML_Mainline.toc, so nothing loads it on this client, and Mists' own UIParent
-- carries the call to it commented out with the note "Add this line if we add the Archaeology
-- progress bar back in." (Blizzard_UIParent/Mists/UIParent.lua:1148). So the numbers arrive and
-- nothing shows them, and a player surveying counts in their head.
--
-- **Nothing here touches ArcheologyDigsiteProgressBar or ArcheologyDigsiteProgressBarMixin.** They
-- do not exist on 5.5.4 and this file never names them except to stand down: if a future build ever
-- does load Blizzard's own bar, `ns.DigSiteBar` leaves it alone rather than drawing a second one
-- over it. That is the same rule this addon follows for dig-site pins, which it deliberately does
-- not draw because Blizzard's Mists world map already does (Blizzard_WorldMap_Mists.toc loads
-- Cata/Blizzard_WorldMap.lua, whose :219 adds DigSiteDataProviderMixin -- the line is commented out
-- on Vanilla, TBC and Wrath and live on Mists). Duplicating the game is not a feature.
--
-- What it is driven by, all three payloads copied from Blizzard's own generated documentation for
-- this build (Blizzard_APIDocumentationGenerated/ResearchInfoDocumentation.lua):
--
--   ARCHAEOLOGY_SURVEY_CAST(numFindsCompleted, totalFinds, researchBranchID, successfulFind)
--   ARCHAEOLOGY_FIND_COMPLETE(numFindsCompleted, totalFinds, researchBranchID)
--   ARTIFACT_DIGSITE_COMPLETE(researchBranchID)
--   CanScanResearchSite() -> whether the player is standing in a dig site at all
--                            (Cata/ArchaeologyProgressBar.lua:22 is the one call site in the tree)
--   GetArchaeologyRaceInfoByID(researchBranchID) -> raceName, ... (:126 uses it for the same thing:
--                            naming the race a completed dig site belonged to)
--
-- Two deliberate differences from Blizzard's implementation, both because of what it was built
-- around:
--
--   1. It swaps its own event registrations on show and hide -- SURVEY_CAST only while hidden,
--      FIND_COMPLETE and DIGSITE_COMPLETE only while shown (:30-42). That dance exists to stop its
--      AnimIn replaying on every survey of the same site. Nothing here replays: the bar's motion
--      is a fade when it appears and goes, a fill that glides to the new count, and one
--      celebration on the completion event, which the client sends once per site. So all three
--      stay registered and the bar simply redraws. That also fixes the case Blizzard's own
--      comment at :81-83 apologises for: a player walking from one dig site straight into another.
--      On 5.5.4 every one of these events carries researchBranchID -- ResearchInfoDocumentation
--      .lua declares it Nilable = false on all three (:43, :55, :72) -- so which race the count
--      belongs to is answered on every event rather than remembered from the last one. An event
--      that somehow carried no branch draws an unnamed bar, which is this file's rule everywhere
--      else; the previous site's name over this site's count would be a name nothing measured.
--   2. It hides itself through an animation whose OnFinished sets shouldShow (:116-128). Here the
--      leave check and the holds are one OnUpdate: while a deadline is pending it is the only
--      thing that hides the bar, and the leave check does not run at all. That is the same rule
--      Blizzard enforces by taking its own OnUpdate away twice -- on the last find (:74-79) and
--      again on ARTIFACT_DIGSITE_COMPLETE (:96-100) -- and for the reason its comment gives: a
--      finished dig site is no longer a dig site, so CanScanResearchSite() answers false while the
--      bar is still meant to be saying that the site is what finished.
--
-- It stays hidden until a survey is cast, hides again when CanScanResearchSite() goes false, is
-- dragged with the mouse when unlocked, and is switched off entirely by profile.archaeology
-- .digSiteBar -- which refuses the preview too, from either the command or the options button.
-- It never guesses: a race the client will not name is drawn with no name rather than with a
-- made-up one, and the counts on screen are the client's own, never the ones clamped to give the
-- StatusBar a legal range.
local _, ns = ...
local L = ns.L

local Log = ns.Log

local M = ns.PQ:GetModule("DigSiteBar")   -- an AceAddon module (Core/Const.lua)
ns.DigSiteBar = M

local type, tonumber, pcall, format = type, tonumber, pcall, string.format
local Motion = ns.Motion

-- Blizzard's LEFT_DIGSITE_CHECK_TIME (Cata/ArchaeologyProgressBar.lua:2): how often the bar asks
-- whether the player is still standing in a dig site. Half a second is also the whole OnUpdate
-- budget of this file -- everything else is event driven.
local LEAVE_CHECK = 0.5
--- How long the bar stays up after ARTIFACT_DIGSITE_COMPLETE. Blizzard plays an animation and hands
-- off to an alert; we hold the finished bar for three seconds so the player sees that the site was
-- what finished, and not that they walked out of it.
local COMPLETE_HOLD = 3.0
--- The backstop for a client that answers no CanScanResearchSite: without the leave check the bar
-- would stay up until the next dig site. Not reachable on 5.5.4, where the function exists.
local IDLE_TIMEOUT = 300
--- How long M.Preview() leaves an empty bar on screen for the player to drag.
local PREVIEW_HOLD = 20

-- The bar at "Bar size" 1.0. Everything inside it is a fraction of these, recomputed in
-- applyLayout, because a slider that moved the frame and left its contents at 1.0 would be a
-- slider that breaks the frame: at 0.5 the 14 px fill bar is taller than the 17 px frame and the
-- text lands on top of it, at 2.0 there is a 44 px gap of mouse-enabled nothing between them.
local BASE_WIDTH, BASE_HEIGHT = 240, 34
local BASE_FILL_HEIGHT = 14

--- How fast the fill closes the gap to the count, in 1/s (Motion.Approach's rate). Only the FILL
-- is smoothed: the count beside it is written from the event the moment it arrives.
local FILL_RATE = 8
--- The bar fades in when it appears and out when it goes (seconds, before the player's speed).
local FADE_IN, FADE_OUT = 0.18, 0.12
local FADE_OWNER = "PandaQuestDigSiteBar:fade"
--- A finished dig site: the fill swells to POP_FROM times its height and settles back over POP_TIME
-- while a glint of SHEEN_TIME crosses the bar. The swell is the FILL's, not the frame's: the frame
-- is anchored by its centre, and scaling it would slide the whole bar about the screen.
local POP_FROM, POP_TIME, SHEEN_TIME = 1.35, 0.32, 0.7
local POP_OWNER = "PandaQuestDigSiteBar:pop"

local frame, fillBar, raceText, countText
--- The fill the last event asked for (clamped to a legal range), the one on screen, and the range
-- it was measured against. goal and shown differ only while the fill is gliding.
local fillGoal, fillShown, fillTotal = 0, 0, 1
--- True from the moment the bar was told to go until its fade-out has hidden the frame. `visible`
-- is the logical answer ("is the bar drawn?") and goes false at once; this is the frame catching up.
local leaving = false
--- The font size the template gave the two font strings, read once before anything scaled them.
-- Read once rather than on every applyLayout: reading it back after a SetFont would multiply the
-- last scale by the new one, and the bar would grow every time the slider moved.
local baseFontSize
local branchID                -- the race the visible count belongs to, as this event named it
local accum = 0                 -- seconds since the last leave check
--- GetTime() at which the bar hides itself, or nil. While it is set it is the ONLY thing that
-- hides the bar: a preview and a finished dig site both outlive the dig site they were drawn for.
local hideAt
local lastEventAt = 0
local visible = false
local dragging = false
local stoodDown = false         -- Blizzard's own bar exists on this client after all: we drew none

local function now()
    return (GetTime and GetTime()) or 0
end

local function settings()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return (profile and profile.archaeology) or ns.DEFAULTS.profile.archaeology
end

--- BlizzardHasOne() -> true when this client loaded Blizzard's own dig-site progress bar.
-- It does not on 5.5.4 (its XML is listed only in Blizzard_FrameXML_Mainline.toc), which is the
-- whole reason this file exists; the check is here so that "PandaQuest draws it because the game
-- does not" stays a true sentence on a client where the game does.
function M.BlizzardHasOne()
    return _G.ArcheologyDigsiteProgressBar ~= nil or _G.ArchaeologyProgressBar ~= nil
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

--- The per-frame work in this file: one step of the fill's glide while it is still moving, and
-- arithmetic on two numbers until half a second has gone by. Blizzard's own bar checks at exactly
-- this interval and for exactly this reason: the client sends no event for "you walked out of the
-- dig site". With motion off Approach answers the goal at once, so the glide is one frame long.
local function onUpdate(self, elapsed)
    elapsed = tonumber(elapsed) or 0
    if fillShown ~= fillGoal then
        fillShown = Motion and Motion.Approach(fillShown, fillGoal, elapsed, FILL_RATE) or fillGoal
        fillBar:SetValue(fillShown)
    end
    accum = accum + elapsed
    if accum < LEAVE_CHECK then return end
    accum = 0
    local t = now()
    -- A pending deadline wins over the leave check, rather than being one more reason to hide on
    -- top of it. Everything the bar holds itself up for -- a preview, the last find of a site, a
    -- completed site -- happens when the player is standing somewhere CanScanResearchSite() no
    -- longer says yes to, so letting the leave check run underneath a deadline would end every
    -- hold at the next 0.5 s tick. Blizzard's equivalent is nil-ing OnUpdate outright.
    if hideAt then
        if t >= hideAt then M.Hide() end
        return
    end
    if type(CanScanResearchSite) == "function" then
        if not CanScanResearchSite() then M.Hide() end
        return
    end
    -- No leave check on this client: fall back to a timeout so the bar cannot stay up forever.
    if (t - lastEventAt) > IDLE_TIMEOUT then M.Hide() end
end

local function scaleFont(fontString, size)
    if not (fontString and fontString.GetFont and fontString.SetFont and size) then return end
    local path, _, flags = fontString:GetFont()
    if path then fontString:SetFont(path, size, flags) end
end

--- applyLayout(): "Bar size" moves the frame AND everything drawn in it.
-- Nav/Arrow.lua does the same for its textures (:429-438) and for the same reason: the fill bar's
-- height and the two font strings are set once at creation, so a frame that scaled on its own
-- would leave them behind -- at 0.5 the 14 px fill bar is taller than the 17 px frame and the text
-- sits on top of it, at 2.0 there is a 44 px band of mouse-enabled nothing between them.
local function applyLayout()
    if not frame then return end
    local p = settings()
    local scale = tonumber(p.barScale) or 1
    -- A profile edited by hand could hold a zero or a negative, which would collapse the frame to
    -- nothing the player could ever click again. The slider itself only offers 0.5 to 2.0.
    if scale <= 0 then scale = 1 end
    frame:SetSize(BASE_WIDTH * scale, BASE_HEIGHT * scale)
    frame:SetMovable(not p.barLocked)
    frame:EnableMouse(true)
    if fillBar then fillBar:SetHeight(BASE_FILL_HEIGHT * scale) end
    if baseFontSize then
        scaleFont(raceText, baseFontSize * scale)
        scaleFont(countText, baseFontSize * scale)
    end
end

local function applyPosition()
    if not frame then return end
    local p = settings()
    frame:ClearAllPoints()
    frame:SetPoint(p.barPoint or "CENTER", UIParent, p.barPoint or "CENTER",
        tonumber(p.barX) or 0, tonumber(p.barY) or -260)
end

local function createFrame()
    if frame or not CreateFrame then return frame end
    frame = CreateFrame("Frame", "PandaQuestDigSiteBar", UIParent)
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
    fillBar:SetStatusBarColor(0.9, 0.7, 0.2)
    fillBar:SetMinMaxValues(0, 1)
    fillBar:SetValue(0)
    fillGoal, fillShown, fillTotal = 0, 0, 1

    local background = fillBar:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints(fillBar)
    background:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
    background:SetVertexColor(0, 0, 0, 0.6)

    raceText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    raceText:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    countText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    countText:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    if raceText.GetFont then
        local _, size = raceText:GetFont()
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

local function setAlpha(value)
    if frame then frame:SetAlpha(value) end
end

--- reveal(f): the bar appears. A bar that comes back while its fade-out is still running carries on
-- from the opacity it had reached instead of blinking to nothing first.
local function reveal(f)
    local from = 0
    if leaving then from = f:GetAlpha() or 0 end
    leaving = false
    f:SetAlpha(from)
    f:Show()
    if Motion then
        Motion.Tween{ owner = FADE_OWNER, duration = FADE_IN, from = from, to = 1, ease = "outQuad", apply = setAlpha }
    else
        f:SetAlpha(1)
    end
end

--- finishLeave(): the fade-out is over, so the frame stops being drawn and runs no more OnUpdate.
local function finishLeave()
    leaving = false
    if frame and not visible then
        frame:Hide()
        frame:SetAlpha(1)
    end
end

local function setFillScale(value)
    if fillBar then fillBar:SetScale(value) end
end

--- celebrate(): the one flourish of this bar, for a dig site that is finished -- the fill swells and
-- settles while a glint crosses the bar. Both go through ns.Motion, so with motion off neither is
-- more than a call that puts everything back at its normal size, and neither is ever left running.
local function celebrate()
    if not (frame and fillBar and Motion) then return end
    Motion.Tween{ owner = POP_OWNER, duration = POP_TIME, from = POP_FROM, to = 1, ease = "outBack", apply = setFillScale }
    Motion.Sheen(frame, SHEEN_TIME)
end

--- RaceName(branch) -> the race's name, or nil when the client will not name it.
-- GetArchaeologyRaceInfoByID is what Blizzard's own bar uses for exactly this
-- (Cata/ArchaeologyProgressBar.lua:126). nil is an answer: a bar with no name is honest, and a bar
-- saying "Unknown" over a real dig site is not.
function M.RaceName(branch)
    if type(branch) ~= "number" then return nil end
    if type(GetArchaeologyRaceInfoByID) ~= "function" then return nil end
    local ok, name = pcall(GetArchaeologyRaceInfoByID, branch)
    if not ok or type(name) ~= "string" or name == "" then return nil end
    return name
end

--- draw(found, total [, label]): put one reading on screen.
-- The StatusBar needs a legal, non-empty range or it draws nothing sensible, so the numbers it is
-- given are clamped. The numbers the PLAYER is given are not: a clamped 0 of 0 finds printed as
-- "0 / 1" would be this addon showing a denominator the client never sent, which is the one thing
-- it does not do. A client that named no total gets the count alone, and a client that named
-- neither gets no text at all -- an empty bar is honest about being empty.
local function draw(found, total, label)
    local f = createFrame()
    if not f then return end
    local rawFound, rawTotal = tonumber(found), tonumber(total)
    local barTotal = (rawTotal and rawTotal > 0) and rawTotal or 1
    local barFound = rawFound or 0
    if barFound < 0 then barFound = 0 end
    if barFound > barTotal then barFound = barTotal end
    -- The fill glides to the count, and only FORWARD within one dig site: a bar that has only just
    -- appeared, a different range (another site) or a smaller count (a new site began) starts where
    -- it is going to be, because draining a bar slowly would read as progress running backwards.
    -- With motion off every count is written at once, as it always was.
    local appearing = not visible or not f:IsShown()
    fillBar:SetMinMaxValues(0, barTotal)
    fillGoal = barFound
    if appearing or barTotal ~= fillTotal or barFound <= fillShown or not (Motion and Motion.IsEnabled()) then
        fillShown = barFound
        fillBar:SetValue(barFound)
    end
    fillTotal = barTotal
    raceText:SetText(M.RaceName(branchID) or "")
    local text = label
    if not text then
        if rawFound and rawTotal and rawTotal > 0 then
            text = format("%d / %d", rawFound, rawTotal)
        elseif rawFound then
            text = format("%d", rawFound)
        end
    end
    -- nil rather than "": GetState() reports a field the bar does not have as absent, and "no
    -- count at all" is a different answer from "a count that happens to be blank".
    countText:SetText(text)
    if appearing then reveal(f) end
    visible = true
end

--- GetState() -> { shown, branchID, raceName, found, total, fill, fillScale, locked, text } - what
-- the bar is showing, for the tests, which cannot look at a screen. Fields the bar does not have are
-- absent rather than blank: outside a dig site there is no branchID, and a race the client will not
-- name has no raceName.
--
-- `found` and `total` are the StatusBar's own range, which draw() clamps to something legal to
-- fill; `text` is the line the player reads, which is the client's numbers unclamped. On every
-- payload a 5.5.4 client really sends the two agree, and where they do not it is `text` that is
-- the measurement. `fill` is the value the StatusBar shows this frame -- it trails `found` while
-- the fill glides and equals it once it has arrived (at once with motion off) -- and `fillScale`
-- is 1 except during the celebration of a finished site.
function M.GetState()
    local found, total, fill, fillScale = 0, 0, 0, 1
    if fillBar then
        -- `found` is the count the fill is going to; `fill` is the fill as drawn this frame. They
        -- are the same number once the glide is over, and always with motion off.
        found = fillGoal
        fill = fillBar:GetValue() or 0
        fillScale = fillBar.GetScale and fillBar:GetScale() or 1
        local _, maximum = fillBar:GetMinMaxValues()
        total = maximum or 0
    end
    return {
        shown = visible and frame ~= nil and frame:IsShown() == true,
        branchID = branchID,
        raceName = M.RaceName(branchID),
        found = found, total = total, fill = fill, fillScale = fillScale,
        locked = settings().barLocked and true or false,
        text = countText and countText:GetText() or nil,
    }
end

--- GetLayout() -> { width, height, fillHeight, fontSize }, or nil before the frame exists - the
-- sizes the bar is actually drawn at. Like GetState(), it is here because the tests cannot look at
-- a screen, and because "Bar size" has to move all four together or the pieces come apart inside
-- the frame.
function M.GetLayout()
    if not frame then return nil end
    local fontSize
    if raceText and raceText.GetFont then
        local _, size = raceText:GetFont()
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

--- Hide(): the bar goes. It is "not shown" to every caller at once (IsShown, GetState); the frame
-- itself fades out over FADE_OUT and then hides, so a bar that times out does not vanish between
-- two frames. With motion off the frame hides at once, as it always did.
function M.Hide()
    hideAt = nil
    local wasVisible = visible
    visible = false
    if not (frame and wasVisible) then return end
    if Motion and Motion.IsEnabled() and frame:IsShown() then
        leaving = true
        Motion.Tween{ owner = FADE_OWNER, duration = FADE_OUT, from = frame:GetAlpha() or 1, to = 0,
            ease = "outQuad", apply = setAlpha, onDone = finishLeave }
    else
        -- A fade still running (the player switched Animations off in the middle of it) goes with it.
        if Motion then Motion.Cancel(FADE_OWNER) end
        leaving = false
        frame:Hide()
        frame:SetAlpha(1)
    end
end

--- WhyNoPreview() -> the line to print instead of a preview, or nil when nothing is in the way.
-- Both entry points -- `/pq digsite` and the options panel's "Show me where it is" -- ask this one
-- question, because a switch that the command obeys and the button beside it ignores is two
-- answers to one question.
--
-- The switch wins over an explicit request here, which is the opposite of the rule `/pq scan
-- archaeology` follows. The two
-- settings are different shapes. `snapshotOnOpen` is an automation switch -- "read it when I open
-- the window" -- and a typed command is not that automation, so obeying the command contradicts
-- nothing. `digSiteBar` says "Show the dig site progress bar", and a bar drawn after the player
-- turned that off contradicts the switch in its own words.
function M.WhyNoPreview()
    if stoodDown then return L["This client draws its own dig site progress bar."] end
    if settings().digSiteBar == false or not ns.IsModuleWanted("DigSiteBar") then
        return L["The dig site bar is switched off in /pq options."]
    end
    return nil
end

--- Preview(): show the bar where it is, with no numbers in it, so the player can find it and drag
-- it. It says "dig site" and nothing else on purpose -- a preview that filled the bar with a
-- plausible 2/4 would be this addon showing a number it had not measured.
-- Returns false when it drew nothing; WhyNoPreview() says why, in words for the player.
function M.Preview()
    if M.WhyNoPreview() then return false end
    createFrame()
    if not frame then return false end
    branchID = nil
    draw(nil, nil, L["Dig site progress"])
    hideAt = now() + PREVIEW_HOLD
    lastEventAt = now()
    return true
end

--- PreviewWithReply() -> true when the bar was drawn. The preview plus the one line of chat that
-- goes with it, so that `/pq digsite` and the options panel's button do the same thing and say the
-- same thing. Telling a player to drag a bar that is locked would be this addon asking for
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
        Log.Print("%s", L["The dig site bar is locked. Unlock it in /pq options to move it."])
    else
        Log.Print("%s", L["Drag the dig site bar where you want it. It hides itself again in a moment."])
    end
    return true
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------

-- The same two conditions M.WhyNoPreview() names, as one yes-or-no for the event handlers. They
-- have to stay in step: a bar that draws itself on a survey but refuses to preview, or the other
-- way round, is the switch meaning two different things.
local function enabled()
    return settings().digSiteBar ~= false and not stoodDown and ns.IsModuleWanted("DigSiteBar")
end

--- OnSurveyCast(numFindsCompleted, totalFinds, researchBranchID [, successfulFind])
-- successfulFind is read and not used: whether this particular survey turned something up is
-- already in numFindsCompleted, and a bar that also flashed on it would be a second telling of one
-- fact. It is named in the signature so the next reader can see it was considered.
function M.OnSurveyCast(numFindsCompleted, totalFinds, researchBranchID, successfulFind)  -- luacheck: ignore successfulFind
    if not enabled() then return end
    branchID = tonumber(researchBranchID)
    hideAt = nil
    lastEventAt = now()
    accum = 0
    draw(numFindsCompleted, totalFinds)
end

--- OnFindComplete(numFindsCompleted, totalFinds, researchBranchID): one find of the site is done.
-- The last one starts the hold rather than clearing it. ARTIFACT_DIGSITE_COMPLETE is a separate
-- event that arrives after this one, and by then the finished site is no longer a site the player
-- can scan, so without the hold the leave check hides the bar in the gap and the completion draws
-- it again -- a blink instead of an ending. Blizzard stops its own leave check at the same moment
-- and for the same reason (Cata/ArchaeologyProgressBar.lua:74-79). The difference is that this
-- hold is a deadline rather than Blizzard's "not until the bar is shown again", so a client that
-- sends a last find and no completion still lets the bar go.
function M.OnFindComplete(numFindsCompleted, totalFinds, researchBranchID)
    if not enabled() then return end
    branchID = tonumber(researchBranchID)
    lastEventAt = now()
    draw(numFindsCompleted, totalFinds)
    local found, total = tonumber(numFindsCompleted), tonumber(totalFinds)
    if found and total and total > 0 and found >= total then
        hideAt = now() + COMPLETE_HOLD
    else
        hideAt = nil
    end
end

--- OnDigsiteComplete(researchBranchID): the site is finished. The bar is filled, named, held for a
-- few seconds and then hidden -- the player has to walk to another dig site anyway, and a bar that
-- vanished on the last find would take the news with it.
function M.OnDigsiteComplete(researchBranchID)
    if not enabled() then return end
    branchID = tonumber(researchBranchID)
    lastEventAt = now()
    -- The total the bar was already counting to. Read through an `if` rather than
    -- `fillBar and fillBar:GetMinMaxValues()`, because an `and` expression keeps only the first
    -- return: the maximum would have been silently nil on every completed dig site.
    local total = 1
    if fillBar then
        local _, maximum = fillBar:GetMinMaxValues()
        total = tonumber(maximum) or 1
    end
    draw(total, total, L["Dig site complete"])
    hideAt = now() + COMPLETE_HOLD
    celebrate()
end

---------------------------------------------------------------------------
-- Settings
---------------------------------------------------------------------------

--- Refresh(): re-reads the settings. UI/Options.lua calls it after any archaeology.* change.
function M.Refresh()
    if not enabled() then
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
    local p, d = settings(), ns.DEFAULTS.profile.archaeology
    p.barPoint, p.barX, p.barY = d.barPoint, d.barX, d.barY
    applyPosition()
end

function M.OnProfileChanged()
    M.Refresh()
end

--- Switched off in Options > Modules: the three archaeology events are gone (AceEvent); the bar goes.
function M.OnDisable()
    M.Hide()
end

---------------------------------------------------------------------------
-- Module lifecycle
---------------------------------------------------------------------------

function M.OnEnable()
    if M.BlizzardHasOne() then
        -- Said once, at level Info, and then never again: this is a client that does not need us.
        stoodDown = true
        Log.Info("DigSiteBar", "the client has its own dig site progress bar; PandaQuest draws none")
        return
    end
    -- All three stay registered while the module is on; see the header for why this does not
    -- follow Blizzard's show/hide registration swap.
    M:RegisterEvent("ARCHAEOLOGY_SURVEY_CAST", function(_, ...) M.OnSurveyCast(...) end)
    M:RegisterEvent("ARCHAEOLOGY_FIND_COMPLETE", function(_, ...) M.OnFindComplete(...) end)
    M:RegisterEvent("ARTIFACT_DIGSITE_COMPLETE", function(_, ...) M.OnDigsiteComplete(...) end)
end

function M.OnInitialize()
    local PQ = ns.PQ
    if not (PQ and PQ.commands) then return end
    -- `/pq digsite` -- show the bar where it is so it can be dragged, or say why there is none.
    PQ.commands.digsite = function() M.PreviewWithReply() end
end
