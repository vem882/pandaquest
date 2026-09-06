-- UI/Tracker.lua: enhances the Blizzard WatchFrame (docs/06 section 11).
--
-- v0.1 has no tracker of its own. We register an objective handler that passes the layout through
-- untouched and only decorates the finished lines with a distance and a "set as target" button.
-- Rules: nothing happens while InCombatLockdown() (no frame creation, no anchoring), the Blizzard
-- line frames are never re-parented or moved, and everything degrades to a no-op when WatchFrame
-- is missing.
local _, ns = ...
local L = ns.L

local Util, Log = ns.Util, ns.Log

local M = {}
ns.Tracker = M

local type, select = type, select

local REFRESH_INTERVAL = 0.5        -- seconds between distance updates
local MAX_ROWS = 25                 -- WatchFrame never shows more than 25 quests

local overlays = {}                 -- pool of { fs = FontString, button = Button }
local usedOverlays = 0
local lastRefresh = 0
local hooked = false
local rows = {}                     -- scratch: reused every refresh, never re-allocated

local function trackerProfile()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return profile and profile.tracker
end

local function enabled()
    local p = trackerProfile()
    return not p or p.enhanceBlizzard ~= false
end

local function inCombat()
    if ns.Compat and ns.Compat.InCombatLockdown then return ns.Compat.InCombatLockdown() end
    return InCombatLockdown and InCombatLockdown() or false
end

---------------------------------------------------------------------------
-- Reading the Blizzard tracker
---------------------------------------------------------------------------

-- Blizzard's link buttons are the only reliable bridge from a watch index to the title line that
-- was drawn for it (WatchFrame.lua: linkButton.lines / .startLine / .index).
local function questIdForWatch(watchIndex)
    local getIndex = _G and _G.GetQuestIndexForWatch
    if not getIndex or not watchIndex then return nil end
    local questIndex = getIndex(watchIndex)
    if not questIndex or questIndex == 0 then return nil end
    if not GetQuestLogTitle then return nil end
    -- questID is return 8 of the 17 GetQuestLogTitle returns on 5.5.4.
    local questID = select(8, GetQuestLogTitle(questIndex))
    if type(questID) ~= "number" or questID == 0 then return nil end
    return questID
end

--- Tracker.GetRows([out]) -> { { questID = , line = frame }, ... } for the visible tracked quests.
function M.GetRows(out)
    out = out or {}
    for i = #out, 1, -1 do out[i] = nil end
    local buttons = _G and _G.WATCHFRAME_LINKBUTTONS
    if type(buttons) ~= "table" then return out end
    for i = 1, #buttons do
        if #out >= MAX_ROWS then break end
        local button = buttons[i]
        if type(button) == "table" and button.IsShown and button:IsShown()
            and (button.type == nil or button.type == "QUEST") and button.lines and button.startLine then
            local line = button.lines[button.startLine]
            local questID = button.questID or questIdForWatch(button.index)
            if line and questID then
                out[#out + 1] = { questID = questID, line = line }
            end
        end
    end
    return out
end

---------------------------------------------------------------------------
-- Overlays
---------------------------------------------------------------------------

local function onOverlayClick(self)
    local questID = self.questID
    if not questID then return end
    local Targets, Router = ns.Targets, ns.Router
    if not Targets or not Targets.GetForQuest or not Router or not Router.SetManualTarget then return end
    local list = Targets.GetForQuest(questID)
    local target = list and list[1]
    if target then
        Router.SetManualTarget(target)
        Log.Debug("Tracker", "pinned quest %d", questID)
    end
end

local function acquireOverlay(index)
    local overlay = overlays[index]
    if overlay then return overlay end
    local parent = _G and _G.WatchFrameLines
    if not parent or not CreateFrame then return nil end
    overlay = {}
    overlay.fs = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    overlay.button = CreateFrame("Button", "PandaQuestTrackerButton" .. index, parent)
    overlay.button:SetSize(14, 14)
    overlay.button.label = overlay.button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    overlay.button.label:SetPoint("CENTER", overlay.button, "CENTER", 0, 0)
    overlay.button.label:SetText("|cff5fd7ff>|r")
    overlay.button:SetScript("OnClick", onOverlayClick)
    overlay.button:SetScript("OnEnter", function(self)
        if not GameTooltip then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine(L["Navigate to this quest"])
        GameTooltip:Show()
    end)
    overlay.button:SetScript("OnLeave", function()
        if GameTooltip and GameTooltip.Hide then GameTooltip:Hide() end
    end)
    overlays[index] = overlay
    return overlay
end

local function hideOverlaysFrom(index)
    for i = index, #overlays do
        local overlay = overlays[i]
        if overlay then
            overlay.fs:Hide()
            overlay.button:Hide()
        end
    end
end

--- Tracker.Clear(): hides every overlay (tracker disabled, profile switch).
function M.Clear()
    hideOverlaysFrom(1)
    usedOverlays = 0
end

---------------------------------------------------------------------------
-- Refresh
---------------------------------------------------------------------------

local function distanceForQuest(questID)
    local Targets, Router = ns.Targets, ns.Router
    if not Targets or not Targets.GetForQuest then return nil end
    local list = Targets.GetForQuest(questID)
    local best
    for i = 1, (list and #list or 0) do
        local target = list[i]
        local distance = Router and Router.GetDistanceTo and Router.GetDistanceTo(target) or target.distance
        if distance and (not best or distance < best) then best = distance end
    end
    return best
end

--- Tracker.Refresh() -> number of decorated rows. A no-op in combat and when disabled.
function M.Refresh()
    if inCombat() then return 0 end
    if not enabled() then
        M.Clear()
        return 0
    end
    local p = trackerProfile()
    local list = M.GetRows(rows)
    local count = 0
    for i = 1, #list do
        local row = list[i]
        local overlay = acquireOverlay(i)
        if overlay then
            count = count + 1
            overlay.button.questID = row.questID
            overlay.button:ClearAllPoints()
            overlay.button:SetPoint("RIGHT", row.line, "LEFT", -2, 0)
            overlay.button:Show()
            if not p or p.showDistance ~= false then
                local distance = distanceForQuest(row.questID)
                overlay.fs:ClearAllPoints()
                -- docs/06 section 11: the distance goes UNDER the quest line. Anchoring it to the
                -- right of the line would push it out of the 204 px wide, right-docked WatchFrame
                -- (its lines are up to WATCHFRAME_MAXLINEWIDTH = 192) and against the screen edge.
                overlay.fs:SetPoint("TOPLEFT", row.line, "BOTTOMLEFT", 0, -1)
                overlay.fs:SetText(distance and Util.FormatDistance(distance) or "")
                overlay.fs:Show()
            else
                overlay.fs:Hide()
            end
        end
    end
    hideOverlaysFrom(count + 1)
    usedOverlays = count
    return count
end

function M.GetOverlayCount()
    return usedOverlays
end

---------------------------------------------------------------------------
-- WatchFrame hooks
---------------------------------------------------------------------------

-- Objective handler contract (Blizzard_UIPanels_Game/WatchFrame.lua):
--   nextAnchor, maxLineWidth, numObjectives, numPopUps = handler(lineFrame, nextAnchor, maxHeight, frameWidth)
-- We add no lines of our own, so the anchor is passed straight through and the counts are zero.
local function objectiveHandler(_, nextAnchor)
    if not inCombat() then
        local ok, err = pcall(M.Refresh)
        if not ok then Log.Error("Tracker", "refresh failed: %s", tostring(err)) end
    end
    return nextAnchor, 0, 0, 0
end
M.ObjectiveHandler = objectiveHandler

-- WatchFrameLines update function: throttled distance refresh. Returning a truthy value would
-- force a full WatchFrame_Update, so we always return nothing.
local function lineUpdate()
    local now = Util.Now and Util.Now() or (GetTime and GetTime() or 0)
    if (now - lastRefresh) < REFRESH_INTERVAL then return end
    lastRefresh = now
    if inCombat() or not enabled() then return end
    pcall(M.Refresh)
end
M.LineUpdate = lineUpdate

function M.Enable()
    if hooked then return end
    if not _G or not _G.WatchFrame then
        Log.Debug("Tracker", "WatchFrame is missing; tracker enhancement disabled")
        return
    end
    local add = _G.WatchFrame_AddObjectiveHandler
    local addUpdate = _G.WatchFrameLines_AddUpdateFunction
    if type(add) ~= "function" then
        Log.Debug("Tracker", "WatchFrame_AddObjectiveHandler is missing")
        return
    end
    pcall(add, objectiveHandler)
    if type(addUpdate) == "function" then pcall(addUpdate, lineUpdate) end
    hooked = true

    -- Own AceEvent embed (ns.PQ keeps only one callback per message).
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then
        AceEvent:Embed(M)
        M:RegisterMessage("PQ_TARGETS_UPDATED", function() M.Refresh() end)
        M:RegisterMessage("PQ_QUESTLOG_CHANGED", function() M.Refresh() end)
    end
    Log.Debug("Tracker", "enabled")
end

function M.OnProfileChanged()
    if enabled() then M.Refresh() else M.Clear() end
end

M.REFRESH_INTERVAL = REFRESH_INTERVAL
