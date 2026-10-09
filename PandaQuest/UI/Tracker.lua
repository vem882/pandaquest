-- UI/Tracker.lua: enhances the Blizzard WatchFrame.
--
-- v0.1 has no tracker of its own. Under each tracked quest title that has a distance we open one row
-- inside Blizzard's own layout and write the distance into it; beside the title sits a "set as
-- target" button. Rules: no frame is created and none of our overlays is anchored or re-anchored
-- while InCombatLockdown(), the Blizzard line frames are never re-parented, every hook is a
-- hooksecurefunc post-hook, and everything degrades to a no-op when WatchFrame is missing. The one
-- piece that also works in combat is the row itself -- see "Making room" for why that is safe.
local _, ns = ...
local L = ns.L

local Util, Log = ns.Util, ns.Log

local M = {}
ns.Tracker = M

local type, select, pairs = type, select, pairs
local ceil = math.ceil

local REFRESH_INTERVAL = 0.5        -- seconds between distance updates
local MAX_ROWS = 25                 -- WatchFrame never shows more than 25 quests

local overlays = {}                 -- pool of { fs = FontString, button = Button, line = , questID = }
local usedOverlays = 0
local lastRefresh = 0
local hooked = false
local rows = {}                     -- scratch: reused every refresh, never re-allocated

-- Rows opened by the current Blizzard layout. Weak keys: the frames belong to Blizzard's line pool.
local roomFor = setmetatable({}, { __mode = "k" })      -- title line -> questID whose distance it holds
local liftedFrom = setmetatable({}, { __mode = "k" })   -- line pushed down -> the title it hangs under
local liftedOffset = setmetatable({}, { __mode = "k" }) -- line pushed down -> Blizzard's own offset
local watchCursor = 1                                   -- next watch index a title may belong to

local function trackerProfile()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return profile and profile.tracker
end

local function enabled()
    local p = trackerProfile()
    return not p or p.enhanceBlizzard ~= false
end

local function showDistance()
    local p = trackerProfile()
    return not p or p.showDistance ~= false
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

---------------------------------------------------------------------------
-- Making room under a quest title
---------------------------------------------------------------------------

-- The WatchFrame stacks its lines itself. WatchFrame_SetLine (Wrath/WatchFrame.lua:698, the file
-- 5.5.4 loads for Mists) hangs each line's TOP from the BOTTOM of the line before it, and
-- WatchFrame_DisplayTrackedQuests (:903) calls it for every title and objective, then drops a quest
-- whose last line falls below the frame (:1050). A text anchored under a title without a row of its
-- own is therefore painted over the objective Blizzard draws in the same place: the overlap players
-- reported. So we post-hook WatchFrame_SetLine and, when a line hangs from a title that has a
-- distance, move that same TOP anchor one row further down. Doing it inside Blizzard's pass, rather
-- than shifting lines once the pass is over, is what lets the check at :1050 see the row -- a full
-- tracker then drops its last quest instead of running off the bottom of the screen -- and it means
-- the tracker's height changes only when Blizzard lays it out, never on the half-second refresh.
--
-- The hook also runs in combat. Blizzard lays the tracker out again on every QUEST_LOG_UPDATE, kill
-- credit included, and WatchFrameLineTemplate_Reset (:1256) clears every anchor first, so a hook that
-- stood down in combat would take every row away at the first kill and give it back after the fight:
-- the tracker would jump twice per pull. It is safe there for two reasons. hooksecurefunc calls us
-- after Blizzard's function and hands Blizzard back an untainted execution, so the quest item buttons
-- DisplayTrackedQuests goes on to create (:1067) are still created by secure code. And the only call
-- we make is SetPoint on a WatchFrameLineTemplate frame, which is not protected and has nothing
-- protected anchored to it -- WatchFrame.xml and QuestPOI.xml inherit no secure template for the
-- line, link, item or POI buttons -- so the call cannot be blocked.

-- One GameFontHighlightSmall line plus the gap Blizzard keeps between two tracker texts,
-- WATCHFRAMELINES_FONTSPACING = (WATCHFRAME_LINEHEIGHT - font height) / 2 (WatchFrame.lua:293). The
-- distance is drawn from the title's bottom edge, so the same gap then separates it from the
-- objective below as separates the title's own text from it.
local function roomHeight()
    local font = _G.GameFontHighlightSmall
    local size = font and font.GetFont and select(2, font:GetFont())
    local spacing = _G.WATCHFRAMELINES_FONTSPACING
    if type(size) ~= "number" or size <= 0 then size = 10 end
    if type(spacing) ~= "number" or spacing < 0 then spacing = 2 end
    return ceil(size + spacing)
end

local function isQuestLine(line)
    -- Achievement headers go through WatchFrame_SetLine with the very same arguments (:780).
    local lines = _G.WATCHFRAME_QUESTLINES
    if type(lines) ~= "table" then return false end
    for i = #lines, 1, -1 do
        if lines[i] == line then return true end
    end
    return false
end

-- Only the title text reaches WatchFrame_SetLine; the watch index is attached to the link button
-- after the quest's last line (:1091). DisplayTrackedQuests walks the watches in order and skips the
-- filtered ones, so the first watch at or after the previous match whose title reads the same is
-- the quest being drawn. Two tracked quests with one title are told apart by that order; only when
-- the first of them is filtered out can the second be mistaken for it, and even then nothing lands
-- on the wrong line: Refresh writes only into a row opened for the questID the link button names, so
-- that quest shows no distance for as long as its namesake stays filtered out.
local function questIdForTitle(text)
    if type(text) ~= "string" or not GetNumQuestWatches or not GetQuestIndexForWatch or not GetQuestLogTitle then
        return nil
    end
    for watch = watchCursor, GetNumQuestWatches() do
        local questIndex = GetQuestIndexForWatch(watch)
        if questIndex then
            local title, _, _, _, _, _, _, questID, _, displayQuestID = GetQuestLogTitle(questIndex)
            -- :986 prefixes the quest ID when the client is set to show quest IDs.
            if title and (text == title or (displayQuestID and questID and text == questID .. " - " .. title)) then
                watchCursor = watch + 1
                if type(questID) == "number" and questID ~= 0 then return questID end
                return nil
            end
        end
    end
    return nil
end

local function layoutLine(line, anchor, verticalOffset, isHeader, text)
    -- Whatever this frame was in the previous layout, Blizzard is placing it afresh now.
    roomFor[line] = nil
    liftedFrom[line], liftedOffset[line] = nil, nil
    if anchor and roomFor[anchor] then
        local offset = type(verticalOffset) == "number" and verticalOffset or 0
        line:SetPoint("TOP", anchor, "BOTTOM", 0, offset - roomHeight())
        liftedFrom[line], liftedOffset[line] = anchor, offset
    end
    if isHeader and enabled() and showDistance() and isQuestLine(line) then
        -- The first title of a layout is the one Blizzard anchors itself (:989-998).
        if not anchor then watchCursor = 1 end
        local questID = questIdForTitle(text)
        if questID and distanceForQuest(questID) then
            roomFor[line] = questID
        end
    end
end

local function onSetLine(line, anchor, verticalOffset, isHeader, text)
    if not line then return end
    local ok, err = pcall(layoutLine, line, anchor, verticalOffset, isHeader, text)
    if not ok then Log.Error("Tracker", "layout hook failed: %s", tostring(err)) end
end

-- A setting can take the rows away between two Blizzard layouts. Each lifted line gets back the
-- offset Blizzard gave it, which puts the tracker exactly where Blizzard left it; the rows return
-- with Blizzard's next layout, where its overflow check can see them. Out of combat only.
local function collapseRooms()
    if inCombat() then return end
    for line, anchor in pairs(liftedFrom) do
        -- A hidden line went back to Blizzard's pool, which already cleared its anchors.
        if line.IsShown and line:IsShown() then
            line:SetPoint("TOP", anchor, "BOTTOM", 0, liftedOffset[line] or 0)
        end
        liftedFrom[line], liftedOffset[line] = nil, nil
    end
    for line in pairs(roomFor) do roomFor[line] = nil end
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

--- Tracker.Clear(): hides every overlay and closes the rows (tracker disabled, profile switch).
function M.Clear()
    hideOverlaysFrom(1)
    usedOverlays = 0
    collapseRooms()
end

-- A Blizzard layout in combat can hand a title's frame to another line -- a finished objective moves
-- every later quest up one frame -- and in combat we may not re-anchor an overlay. One whose frame
-- still carries its quest keeps showing, since the row moved with the title; the others are hidden
-- until the first refresh after the fight. Hiding a region we created is not anchoring it.
local function hideStaleOverlays()
    local list = M.GetRows(rows)
    for i = 1, #overlays do
        local overlay = overlays[i]
        local current = false
        for j = 1, #list do
            if list[j].line == overlay.line and list[j].questID == overlay.questID then
                current = true
                break
            end
        end
        if not current then
            overlay.fs:Hide()
            overlay.button:Hide()
        elseif roomFor[overlay.line] ~= overlay.questID then
            overlay.fs:Hide()
        end
    end
end

---------------------------------------------------------------------------
-- Refresh
---------------------------------------------------------------------------

--- Tracker.Refresh() -> number of decorated rows. A no-op in combat and when disabled.
function M.Refresh()
    if inCombat() then return 0 end
    if not enabled() then
        M.Clear()
        return 0
    end
    local distances = showDistance()
    if not distances then collapseRooms() end
    local list = M.GetRows(rows)
    local count = 0
    for i = 1, #list do
        local row = list[i]
        local overlay = acquireOverlay(i)
        if overlay then
            count = count + 1
            overlay.line, overlay.questID = row.line, row.questID
            overlay.button.questID = row.questID
            overlay.button:ClearAllPoints()
            overlay.button:SetPoint("RIGHT", row.line, "LEFT", -2, 0)
            overlay.button:Show()
            -- Only a row Blizzard's layout opened for this very quest may hold its distance; without
            -- one the text would land on the next line again.
            local distance = distances and roomFor[row.line] == row.questID and distanceForQuest(row.questID)
            overlay.fs:ClearAllPoints()
            if distance then
                overlay.fs:SetPoint("TOPLEFT", row.line, "BOTTOMLEFT", 0, 0)
                overlay.fs:SetText(Util.FormatDistance(distance))
                overlay.fs:Show()
            else
                overlay.fs:SetText("")
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

-- Runs after every Blizzard layout. Earlier versions registered an objective handler instead, but
-- WatchFrame_Update calls its handlers before it releases the previous layout's surplus link buttons
-- (:484 against :525), so a handler read quests that were no longer drawn; and a handler is called
-- from inside Blizzard's function, so the rest of that function ran tainted. While Blizzard is still
-- inside a layout (a nested call returns early at :462) there is nothing new to read yet.
local function afterLayout()
    local frame = _G.WatchFrame
    if frame and frame.updating then return end
    if inCombat() then
        hideStaleOverlays()
        return
    end
    local ok, err = pcall(M.Refresh)
    if not ok then Log.Error("Tracker", "refresh failed: %s", tostring(err)) end
end
M.AfterLayout = afterLayout

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
    if type(hooksecurefunc) ~= "function" or type(_G.WatchFrame_Update) ~= "function" then
        Log.Debug("Tracker", "WatchFrame_Update is missing")
        return
    end
    hooksecurefunc("WatchFrame_Update", afterLayout)
    -- Without SetLine there is no row to write into, so no distance is drawn; the buttons still work.
    if type(_G.WatchFrame_SetLine) == "function" then
        hooksecurefunc("WatchFrame_SetLine", onSetLine)
    else
        Log.Debug("Tracker", "WatchFrame_SetLine is missing; distances stay hidden")
    end
    local addUpdate = _G.WatchFrameLines_AddUpdateFunction
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
