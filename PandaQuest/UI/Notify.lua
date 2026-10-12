-- UI/Notify.lua: the centre-screen notification.
--
-- Rate limiting is the whole point of this module: quest events arrive in bursts (QUEST_TURNED_IN
-- plus three QUEST_LOG_UPDATEs), and a helper that shouts four times per quest is worse than one
-- that stays quiet. The same text is never repeated inside REPEAT_WINDOW, and two notifications
-- are never shown closer together than MIN_GAP.
--
-- What passes the rate limit is PLAYED, one message at a time: it slides up into place while it
-- fades in, a glint crosses the text and a gold line draws in beneath it, it is held for reading and
-- then fades out. A message that arrives while another is on screen waits in a short queue instead of
-- overwriting it (MAX_QUEUE deep; a full queue drops its oldest non-forced entry), and a waiting
-- message shortens the reading time of the one in front of it so the backlog never goes stale. The
-- same words forced again (the options Preview button) lengthen the message on screen, or are
-- absorbed by the identical one that is waiting, instead of queueing copies.
-- Everything that moves goes through ns.Motion; the hold is a C_Timer, so this file has no OnUpdate
-- of its own and a hidden notification costs nothing. With motion off a message appears whole and
-- is removed after the same hold as before.
local _, ns = ...
local L = ns.L

local Util, Log = ns.Util, ns.Log

local M = {}
ns.Notify = M

local type, pairs, tostring, format = type, pairs, tostring, string.format
local max = math.max

local HOLD_TIME = 3.0           -- seconds fully visible (reading time: the speed multiplier leaves it alone)
local BACKLOG_HOLD = 1.6        -- ... when another message is waiting behind it
local MIN_GAP = 1.5             -- minimum seconds between two notifications
local REPEAT_WINDOW = 10.0      -- the same text is suppressed for this long
local MAX_HISTORY = 24
local MAX_QUEUE = 3             -- messages waiting behind the one on screen

local IN_TIME = 0.22            -- fade + slide in
local OUT_TIME = 0.35           -- fade out
local SLIDE = 14                -- pixels the message rises into its place
local SHEEN_TIME = 0.7          -- the glint across the text
local LINE_TIME = 0.35          -- the underline drawing in
local LINE_DELAY = 0.08
local LINE_HEIGHT = 2
local TEXT_PAD = 24             -- room either side of the text for the glint and the underline
local BASE_Y = -180             -- the message's resting offset below the top of the screen
local LINE_COLOR = { 1.0, 0.82, 0.0, 0.85 }   -- the addon's gold

-- owners of the tweens, so one of them can be stopped without touching the others
local IN_OWNER, OUT_OWNER, LINE_OWNER = "pq:notify:in", "pq:notify:out", "pq:notify:line"

local frame, fontString, holder, underline
local lastShown = {}            -- text -> GetTime() when it was last shown
local lastAny = 0
local history = {}              -- ring of the last messages (tests, /pq status)
local lastQuestID = nil         -- for PQ_CURRENT_TARGET_CHANGED: only speak when the quest changes
local current = nil             -- the entry on screen, nil between messages
local queue = {}                -- entries waiting for their turn, oldest first
local holdTimer = nil           -- C_Timer that ends the reading time of `current`
local holdDue = 0               -- GetTime() at which that timer fires
local shownAt = 0               -- GetTime() when `current` arrived
local present, endHold          -- forward declarations (they call each other through the queue)

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

-- v runs 0 -> 1 as a message arrives: transparent and `SLIDE` pixels low, then opaque and in place.
local function setReveal(v)
    frame:SetAlpha(v)
    frame:ClearAllPoints()
    frame:SetPoint("TOP", UIParent, "TOP", 0, BASE_Y - SLIDE * (1 - v))
end

local function setFade(v)
    frame:SetAlpha(v)
end

local function setLine(width)
    underline:SetWidth(width)
end

local function ensureFrame()
    if frame or not CreateFrame then return frame end
    frame = CreateFrame("Frame", "PandaQuestNotify", UIParent)
    frame:SetSize(600, 40)
    frame:SetPoint("TOP", UIParent, "TOP", 0, BASE_Y)
    if frame.SetFrameStrata then frame:SetFrameStrata("HIGH") end
    fontString = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    fontString:SetPoint("CENTER", frame, "CENTER", 0, 0)
    if fontString.SetJustifyH then fontString:SetJustifyH("CENTER") end
    -- A frame exactly as wide as the text: the glint sweeps across the words and not across the
    -- 600 pixels of empty frame around them.
    holder = CreateFrame("Frame", nil, frame)
    holder:SetSize(TEXT_PAD, 26)
    holder:SetPoint("CENTER", frame, "CENTER", 0, 0)
    underline = holder:CreateTexture(nil, "ARTWORK")
    underline:SetPoint("TOP", fontString, "BOTTOM", 0, -3)
    underline:SetSize(1, LINE_HEIGHT)
    if underline.SetColorTexture then
        underline:SetColorTexture(LINE_COLOR[1], LINE_COLOR[2], LINE_COLOR[3], LINE_COLOR[4])
    end
    frame:Hide()
    return frame
end

---------------------------------------------------------------------------
-- Playing a message
---------------------------------------------------------------------------

local function playSound(kind)
    local p = notifyProfile()
    if (not p or p.sound ~= false) and PlaySound then
        local soundKey = KIND_SOUND[kind]
        local kit = _G and _G.SOUNDKIT
        local id = soundKey and kit and kit[soundKey]
        if id then pcall(PlaySound, id, "Master") end
    end
end

local function textWidth(text)
    local w = fontString.GetStringWidth and fontString:GetStringWidth()
    if type(w) ~= "number" or w <= 0 then w = #text * 9 end
    return w
end

local function cancelHold()
    if holdTimer and holdTimer.Cancel then holdTimer:Cancel() end
    holdTimer = nil
end

local function scheduleHold(seconds)
    cancelHold()
    holdDue = now() + seconds
    if C_Timer and C_Timer.NewTimer then
        holdTimer = C_Timer.NewTimer(seconds, endHold)
    else
        endHold()       -- no timers at all (a bare runtime): do not leave a message up for ever
    end
end

-- The fade-out is over: hand the screen to the next waiting message, if there is one.
local function finish()
    current = nil
    frame:Hide()
    setReveal(1)        -- alpha back to 1 and the anchor back in place for the next arrival
    local entry = table.remove(queue, 1)
    if entry then present(entry) end
end

endHold = function()
    holdTimer = nil
    if not current then return end
    local Motion = ns.Motion
    if Motion then
        Motion.Cancel(IN_OWNER)
        Motion.Tween{ owner = OUT_OWNER, duration = OUT_TIME, from = frame:GetAlpha() or 1, to = 0,
            ease = "outQuad", apply = setFade, onDone = finish }
    else
        finish()
    end
end

present = function(entry)
    current = entry
    shownAt = now()
    local color = KIND_COLOR[entry.kind] or KIND_COLOR.info
    fontString:SetText(entry.text)
    fontString:SetTextColor(color[1], color[2], color[3])
    local width = textWidth(entry.text) + TEXT_PAD
    holder:SetWidth(width)
    underline:SetWidth(1)
    playSound(entry.kind)

    frame:Show()
    local Motion = ns.Motion
    if Motion then
        Motion.Cancel(OUT_OWNER)
        Motion.Tween{ owner = IN_OWNER, duration = IN_TIME, from = 0, to = 1, ease = "outCubic", apply = setReveal }
        Motion.Tween{ owner = LINE_OWNER, duration = LINE_TIME, delay = LINE_DELAY, from = 1, to = width,
            ease = "outCubic", apply = setLine }
        if Motion.IsEnabled() then Motion.Sheen(holder, SHEEN_TIME) end
    else
        setReveal(1)
        setLine(width)
    end
    scheduleHold(#queue > 0 and BACKLOG_HOLD or HOLD_TIME)
end

local function sameMessage(a, b)
    return a.text == b.text and a.kind == b.kind
end

-- A message that passed the rate limit: play it now, or wait for the one on screen.
local function enqueue(entry)
    if not current then
        present(entry)
        return
    end
    -- The same words again (a forced repeat: the options Preview button pressed twice) are not a second
    -- copy to sit through. The one being read stays for a full reading time from now, which is what a
    -- re-show did before there was a queue; a copy that is already waiting absorbs the new one, so a
    -- burst of identical previews never plays more than twice in a row (the message, and one more if
    -- it was already on its way out).
    if holdTimer and sameMessage(current, entry) then
        shownAt = now()
        scheduleHold(#queue > 0 and BACKLOG_HOLD or HOLD_TIME)
        return
    end
    for i = 1, #queue do
        if sameMessage(queue[i], entry) then
            if entry.force then queue[i].force = true end   -- it was asked for: not the first to be dropped
            return
        end
    end
    if #queue >= MAX_QUEUE then
        local drop = 1          -- everything waiting is forced: the oldest goes after all
        for i = 1, #queue do
            if not queue[i].force then drop = i; break end
        end
        table.remove(queue, drop)
    end
    queue[#queue + 1] = entry
    -- A backlog shortens the reading time of what is on screen, but never below BACKLOG_HOLD.
    if holdTimer then
        local due = shownAt + BACKLOG_HOLD
        if due < holdDue then scheduleHold(max(0, due - now())) end
    end
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

    local entry = { text = text, kind = kind, force = force and true or nil }
    local f = ensureFrame()
    if f and fontString then
        enqueue(entry)
    else
        playSound(kind)
    end
    Log.Debug("Notify", "%s: %s", kind, text)
    return true
end

--- Notify.Hide(): clears the frame immediately, and whatever was waiting behind the message.
function M.Hide()
    cancelHold()
    for i = #queue, 1, -1 do queue[i] = nil end
    current = nil
    local Motion = ns.Motion
    if Motion then
        Motion.Cancel(IN_OWNER)
        Motion.Cancel(OUT_OWNER)
        Motion.Cancel(LINE_OWNER)
        -- Finished, not just dropped: a glint cancelled half way across stays shown at whatever alpha it
        -- had reached, and the next message (with motion switched off, nothing restarts the glint)
        -- would arrive with that band stuck over its text.
        if holder then Motion.Cancel(tostring(holder) .. ":sheen", true) end
    end
    if frame then
        frame:Hide()
        setReveal(1)
    end
end

--- Notify.GetQueue() -> the entries waiting behind the message on screen (oldest first).
function M.GetQueue()
    return queue
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
M.BACKLOG_HOLD = BACKLOG_HOLD
M.MAX_QUEUE = MAX_QUEUE
M.IN_TIME = IN_TIME
M.OUT_TIME = OUT_TIME
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
