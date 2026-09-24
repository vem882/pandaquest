-- UI/DigSiteBar.lua: the dig-site progress bar Mists never shipped (docs/11 B6).
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
--      AnimIn replaying on every survey of the same site. There are no animations here, so all
--      three stay registered, and the bar simply redraws. It also fixes the case Blizzard's own
--      comment at :81-83 apologises for: a player walking from one dig site straight into another.
--      On 5.5.4 every one of these events carries researchBranchID, so which race the count belongs
--      to is answered on every event rather than remembered from the last one.
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
-- .digSiteBar. It never guesses: a race the client will not name is drawn with no name rather than
-- with a made-up one.
local _, ns = ...
local L = ns.L

local Log = ns.Log

local M = {}
ns.DigSiteBar = M

local type, tonumber, pcall, format = type, tonumber, pcall, string.format

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

local BASE_WIDTH, BASE_HEIGHT = 240, 34

local frame, fillBar, raceText, countText
local branchID                  -- the race the visible count belongs to, as this event named it
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

--- The only per-frame work in this file, and it does arithmetic on two numbers until half a second
-- has gone by. Blizzard's own bar checks at exactly this interval and for exactly this reason: the
-- client sends no event for "you walked out of the dig site".
local function onUpdate(self, elapsed)
    accum = accum + (tonumber(elapsed) or 0)
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

local function applyLayout()
    if not frame then return end
    local p = settings()
    local scale = tonumber(p.barScale) or 1
    frame:SetSize(BASE_WIDTH * scale, BASE_HEIGHT * scale)
    frame:SetMovable(not p.barLocked)
    frame:EnableMouse(true)
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
    fillBar:SetHeight(14)
    fillBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    fillBar:SetStatusBarColor(0.9, 0.7, 0.2)
    fillBar:SetMinMaxValues(0, 1)
    fillBar:SetValue(0)

    local background = fillBar:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints(fillBar)
    background:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
    background:SetVertexColor(0, 0, 0, 0.6)

    raceText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    raceText:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    countText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    countText:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)

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

local function draw(found, total, label)
    local f = createFrame()
    if not f then return end
    total = tonumber(total) or 0
    found = tonumber(found) or 0
    if total < 1 then total = 1 end
    if found > total then found = total end
    fillBar:SetMinMaxValues(0, total)
    fillBar:SetValue(found)
    raceText:SetText(M.RaceName(branchID) or "")
    countText:SetText(label or format("%d / %d", found, total))
    f:Show()
    visible = true
end

--- GetState() -> { shown, branchID, raceName, found, total, locked, text } - what the bar is
-- showing, for the tests, which cannot look at a screen. Fields the bar does not have are absent
-- rather than blank: outside a dig site there is no branchID, and a race the client will not name
-- has no raceName.
function M.GetState()
    local found, total = 0, 0
    if fillBar then
        found = fillBar:GetValue() or 0
        local _, maximum = fillBar:GetMinMaxValues()
        total = maximum or 0
    end
    return {
        shown = visible and frame ~= nil and frame:IsShown() == true,
        branchID = branchID,
        raceName = M.RaceName(branchID),
        found = found, total = total,
        locked = settings().barLocked and true or false,
        text = countText and countText:GetText() or nil,
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

--- Preview(): show the bar where it is, with no numbers in it, so the player can find it and drag
-- it. It says "dig site" and nothing else on purpose -- a preview that filled the bar with a
-- plausible 2/4 would be this addon showing a number it had not measured.
function M.Preview()
    if stoodDown then return false end
    createFrame()
    if not frame then return false end
    branchID = nil
    draw(0, 1, L["Dig site progress"])
    hideAt = now() + PREVIEW_HOLD
    lastEventAt = now()
    return true
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------

local function enabled()
    return settings().digSiteBar ~= false and not stoodDown
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
    branchID = tonumber(researchBranchID) or branchID
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
    branchID = tonumber(researchBranchID) or branchID
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

---------------------------------------------------------------------------
-- Module lifecycle
---------------------------------------------------------------------------

function M.Enable()
    if M.BlizzardHasOne() then
        -- Said once, at level Info, and then never again: this is a client that does not need us.
        stoodDown = true
        Log.Info("DigSiteBar", "the client has its own dig site progress bar; PandaQuest draws none")
        return
    end
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if not AceEvent then return end
    AceEvent:Embed(M)
    -- All three stay registered for the life of the session; see the header for why this does not
    -- follow Blizzard's show/hide registration swap.
    M:RegisterEvent("ARCHAEOLOGY_SURVEY_CAST", function(_, ...) M.OnSurveyCast(...) end)
    M:RegisterEvent("ARCHAEOLOGY_FIND_COMPLETE", function(_, ...) M.OnFindComplete(...) end)
    M:RegisterEvent("ARTIFACT_DIGSITE_COMPLETE", function(_, ...) M.OnDigsiteComplete(...) end)
end

function M.Init()
    local PQ = ns.PQ
    if not (PQ and PQ.commands) then return end
    -- `/pq digsite` -- show the bar where it is so it can be dragged, or say why there is none.
    PQ.commands.digsite = function()
        if stoodDown then
            Log.Print("%s", L["This client draws its own dig site progress bar."])
            return
        end
        if settings().digSiteBar == false then
            Log.Print("%s", L["The dig site bar is switched off in /pq options."])
            return
        end
        M.Preview()
        Log.Print("%s", L["Drag the dig site bar where you want it. It hides itself again in a moment."])
    end
end
