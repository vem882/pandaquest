-- UI/Notify.lua: the centre-screen notification.
--
-- Rate limiting is the whole point of this module: quest events arrive in bursts (QUEST_TURNED_IN
-- plus three QUEST_LOG_UPDATEs), and a helper that shouts four times per quest is worse than one
-- that stays quiet. The same text is never repeated inside REPEAT_WINDOW, and two notifications
-- are never shown closer together than MIN_GAP.
local _, ns = ...
local L = ns.L

local Util, Log = ns.Util, ns.Log

local M = {}
ns.Notify = M

local type, pairs, tostring, format = type, pairs, tostring, string.format

local HOLD_TIME = 3.0           -- seconds fully visible
local FADE_TIME = 1.0           -- seconds fading out
local MIN_GAP = 1.5             -- minimum seconds between two notifications
local REPEAT_WINDOW = 10.0      -- the same text is suppressed for this long
local MAX_HISTORY = 24

local frame, fontString
local lastShown = {}            -- text -> GetTime() when it was last shown
local lastAny = 0
local shownUntil = 0
local history = {}              -- ring of the last messages (tests, /pq status)
local lastQuestID = nil         -- for PQ_CURRENT_TARGET_CHANGED: only speak when the quest changes

local KIND_COLOR = {
    questComplete = { 0.2, 1, 0.2 },
    nextTarget    = { 1, 0.82, 0 },
    info          = { 1, 1, 1 },
}

local KIND_SOUND = {
    questComplete = "UI_AUTO_QUEST_COMPLETE",
    nextTarget    = nil,
    info          = nil,
}

local function notifyProfile()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return profile and profile.notify
end

local function now()
    return Util.Now and Util.Now() or (GetTime and GetTime() or 0)
end

---------------------------------------------------------------------------
-- Frame
---------------------------------------------------------------------------

local function onUpdate(self)
    local t = now()
    if t <= shownUntil then
        self:SetAlpha(1)
        return
    end
    local fade = 1 - (t - shownUntil) / FADE_TIME
    if fade <= 0 then
        self:SetAlpha(0)
        self:Hide()
        self:SetScript("OnUpdate", nil)
        return
    end
    self:SetAlpha(fade)
end

local function ensureFrame()
    if frame or not CreateFrame then return frame end
    frame = CreateFrame("Frame", "PandaQuestNotify", UIParent)
    frame:SetSize(600, 40)
    frame:SetPoint("TOP", UIParent, "TOP", 0, -180)
    if frame.SetFrameStrata then frame:SetFrameStrata("HIGH") end
    fontString = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    fontString:SetPoint("CENTER", frame, "CENTER", 0, 0)
    if fontString.SetJustifyH then fontString:SetJustifyH("CENTER") end
    frame:Hide()
    return frame
end

---------------------------------------------------------------------------
-- Show
---------------------------------------------------------------------------

--- Notify.Show(text, kind, force, dedupeKey) -> bool shown.
-- `force` bypasses the rate limit (used by the options preview button). `dedupeKey` replaces the
-- text as the repeat key: a message that embeds a live value ("... (420 m)") is a different string
-- every time the player moves, and would otherwise slip past REPEAT_WINDOW.
function M.Show(text, kind, force, dedupeKey)
    if type(text) ~= "string" or text == "" then return false end
    kind = kind or "info"
    local p = notifyProfile()
    if not force then
        if p and p.enabled == false then return false end
        if kind == "questComplete" and p and p.questComplete == false then return false end
        if kind == "nextTarget" and p and p.nextTarget == false then return false end
    end

    local t = now()
    local repeatKey = dedupeKey or text
    if not force then
        local seen = lastShown[repeatKey]
        if seen and (t - seen) < REPEAT_WINDOW then return false end
        if (t - lastAny) < MIN_GAP then return false end
    end
    lastShown[repeatKey] = t
    lastAny = t

    history[#history + 1] = { text = text, kind = kind, at = t }
    if #history > MAX_HISTORY then table.remove(history, 1) end

    -- Occasionally prune the repeat table so a long session cannot grow it without bound.
    if #history % MAX_HISTORY == 0 then
        for key, when in pairs(lastShown) do
            if (t - when) > REPEAT_WINDOW then lastShown[key] = nil end
        end
    end

    local f = ensureFrame()
    if f and fontString then
        local color = KIND_COLOR[kind] or KIND_COLOR.info
        fontString:SetText(text)
        fontString:SetTextColor(color[1], color[2], color[3])
        shownUntil = t + HOLD_TIME
        f:SetAlpha(1)
        f:Show()
        f:SetScript("OnUpdate", onUpdate)
    end

    if (not p or p.sound ~= false) and PlaySound then
        local soundKey = KIND_SOUND[kind]
        local kit = _G and _G.SOUNDKIT
        local id = soundKey and kit and kit[soundKey]
        if id then pcall(PlaySound, id, "Master") end
    end
    Log.Debug("Notify", "%s: %s", kind, text)
    return true
end

--- Notify.Hide(): clears the frame immediately.
function M.Hide()
    if frame then
        frame:SetScript("OnUpdate", nil)
        frame:Hide()
    end
    shownUntil = 0
end

function M.IsShown()
    return frame and frame:IsShown() and true or false
end

function M.GetText()
    return fontString and fontString:GetText() or nil
end

function M.GetHistory()
    return history
end

--- Notify.ResetRateLimit(): forgets what has been shown (profile switch, tests).
function M.ResetRateLimit()
    for k in pairs(lastShown) do lastShown[k] = nil end
    lastAny = 0
    lastQuestID = nil
end

M.HOLD_TIME = HOLD_TIME
M.MIN_GAP = MIN_GAP
M.REPEAT_WINDOW = REPEAT_WINDOW

---------------------------------------------------------------------------
-- Message handlers
---------------------------------------------------------------------------

local function titleFor(questID)
    local QuestLog = ns.QuestLog
    local entry = QuestLog and QuestLog.GetQuest and QuestLog.GetQuest(questID) or nil
    if entry and entry.title then return entry.title end
    if ns.DB and ns.DB.GetQuestName then
        local name = ns.DB.GetQuestName(questID)
        if name then return name end
    end
    return format("#%d", questID)
end

-- "Moth-Ridden complete - turn in to Ji Firepaw (420 m)"
local function completeText(questID)
    local title = titleFor(questID)
    local Targets, Router = ns.Targets, ns.Router
    local turnIn
    if Targets and Targets.GetForQuest then
        local list = Targets.GetForQuest(questID)
        for i = 1, (list and #list or 0) do
            if list[i].kind == "TURNIN" then turnIn = list[i]; break end
        end
    end
    if turnIn then
        local distance = Router and Router.GetDistanceTo and Router.GetDistanceTo(turnIn) or turnIn.distance
        return format(L["%s complete - turn in to %s (%s)"], title,
            turnIn.entityName or L["the quest giver"],
            distance and Util.FormatDistance(distance) or L["unknown distance"])
    end
    return format(L["%s complete"], title)
end

-- "Quest complete" is announced on the TRANSITION only. `changes.updated` also lists a quest whose
-- log index merely shifted (Quest/QuestLog.lua:278), which happens every time any other quest is
-- accepted, abandoned or turned in - without this set every complete quest in the log would
-- re-announce itself then, and the rate limiter cannot catch it because the text carries a live
-- distance.
local wasComplete = {}

local function isComplete(questID)
    local QuestLog = ns.QuestLog
    return (QuestLog and QuestLog.IsComplete and QuestLog.IsComplete(questID)) and true or false
end

--- Seeds the complete/not-complete memory without announcing anything (login, profile switch).
function M.SyncCompleteState()
    for k in pairs(wasComplete) do wasComplete[k] = nil end
    local QuestLog = ns.QuestLog
    local all = QuestLog and QuestLog.GetAll and QuestLog.GetAll() or nil
    if type(all) ~= "table" then return end
    for questID in pairs(all) do
        if isComplete(questID) then wasComplete[questID] = true end
    end
end

function M.WasComplete(questID)
    return wasComplete[questID] == true
end

function M.OnQuestLogChanged(_, changes)
    if type(changes) ~= "table" then return end
    if changes.initial then
        M.SyncCompleteState()
        return
    end
    local p = notifyProfile()
    if p and p.questComplete == false then return end
    local turnedIn = changes.turnedIn
    for i = 1, (turnedIn and #turnedIn or 0) do
        local questID = turnedIn[i]
        wasComplete[questID] = nil
        M.Show(format(L["Turned in: %s"], titleFor(questID)), "questComplete")
    end
    local removed = changes.removed
    for i = 1, (removed and #removed or 0) do
        wasComplete[removed[i]] = nil
    end
    local updated = changes.updated
    for i = 1, (updated and #updated or 0) do
        local questID = updated[i]
        if isComplete(questID) then
            if not wasComplete[questID] then
                wasComplete[questID] = true
                M.Show(completeText(questID), "questComplete", false, "complete:" .. tostring(questID))
            end
        else
            wasComplete[questID] = nil
        end
    end
    local accepted = changes.accepted
    for i = 1, (accepted and #accepted or 0) do
        local questID = accepted[i]
        -- An instantly-complete quest (an item turn-in) is complete the moment it is accepted.
        wasComplete[questID] = isComplete(questID) or nil
    end
end

function M.OnCurrentTargetChanged(_, target)
    local p = notifyProfile()
    if p and p.nextTarget == false then return end
    if not target then
        lastQuestID = nil
        return
    end
    -- Only speak when the quest changes: the router re-targets within a quest constantly.
    if target.questID == lastQuestID then return end
    lastQuestID = target.questID
    if not target.text then return end
    M.Show(format(L["Next: %s"], target.text), "nextTarget")
end

function M.OnNotify(_, kind, text)
    M.Show(text, kind or "info")
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Enable()
    -- Own AceEvent embed: ns.PQ holds exactly one callback per message, so modules that all
    -- registered on it would overwrite each other.
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if not AceEvent then return end
    AceEvent:Embed(M)
    M:RegisterMessage("PQ_QUESTLOG_CHANGED", M.OnQuestLogChanged)
    M:RegisterMessage("PQ_CURRENT_TARGET_CHANGED", M.OnCurrentTargetChanged)
    M:RegisterMessage("PQ_NOTIFY", M.OnNotify)
end

function M.OnProfileChanged()
    M.ResetRateLimit()
end
