-- Sync/Consent.lua: the question PandaQuest asks about itself, and only when it is asked for
-- (docs/07 B1).
--
-- Synchronisation is optional. Nothing in PandaQuest needs it: the quest database, the arrow, the
-- map and every other feature work with it off, and it is off by default. This file therefore does
-- NOT put a dialog on screen at login. A player who wants to take part turns it on under
-- /pq > Synchronisation, or types `/pq consent` to get the question below.
--
-- Four rules, and they are the whole module:
--
--   * **Off is the answer if nobody answers.** Closing the dialog, pressing Escape, or never
--     opening it leaves `enabled` false. Nothing is recorded in the meantime, because Telemetry's
--     `active` switch mirrors the setting and not the question.
--   * **Asked once per request, remembered either way.** `global.telemetry.asked` is set by both
--     buttons and by the dismissal, so "no" is remembered exactly as firmly as "yes".
--   * **The dialog says what is collected, in the words a player would use.** Coordinates and
--     times, per character. Not "usage data".
--   * **It changes nothing else.** Turning it on is `Telemetry.SetEnabled(true)`, the same call
--     the options panel makes, so there is one code path that starts the recorder.
local _, ns = ...

local M = {}
ns.Consent = M

local Log = ns.Log
local L = ns.L

local POPUP = "PANDAQUEST_TELEMETRY_CONSENT"

local function telemetrySettings()
    local PQ = ns.PQ
    local db = PQ and PQ.db and PQ.db.global
    return db and db.telemetry
end

--- Remember that the question has been put, whatever the answer was.
local function markAsked()
    local settings = telemetrySettings()
    if settings then settings.asked = true end
end

--- Apply an answer.  `true` starts the recorder through the same call the options panel uses.
local function answer(share)
    markAsked()
    local Telemetry = ns.Telemetry
    if Telemetry and Telemetry.SetEnabled then
        Telemetry.SetEnabled(share and true or false)
    else                                    -- pragma: the module failed to load; still record it
        local settings = telemetrySettings()
        if settings then settings.enabled = share and true or false end
    end
    if share then
        Log.Print(L["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."])
    else
        Log.Print(L["Nothing will be collected. Turn it on any time in /pq options."])
    end
end

if StaticPopupDialogs then
    StaticPopupDialogs[POPUP] = {
        text = "%s",
        button1 = nil,          -- filled in at show time, so the buttons follow the chosen locale
        button2 = nil,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
        OnAccept = function() answer(true) end,
        OnCancel = function() answer(false) end,
        -- Escape, or the dialog being pushed off the stack: still an answer, and the answer is no.
        OnHide = function() markAsked() end,
    }
end

--- Consent.QuestionText() -> the dialog body, as one string.
-- Three sentences kept as three locale keys and joined here rather than one long key: a
-- translator works on sentences, and a 300 character key is a 300 character key to get exactly
-- right in every language before anything renders at all.
function M.QuestionText()
    return L["PandaQuest can send what you do while questing to the community hub."]
        .. "\n\n"
        .. L["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."]
        .. "\n\n"
        .. L["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."]
end

--- Consent.Ask() -> true when the question was actually put to the player.
-- Falls back to two chat lines when StaticPopup is unavailable (an old client, or a test harness),
-- because a question that silently fails to appear would leave telemetry off forever with no way
-- to discover why.
function M.Ask()
    local settings = telemetrySettings()
    if not settings then return false end

    local dialog = StaticPopupDialogs and StaticPopupDialogs[POPUP]
    if StaticPopup_Show and dialog then
        dialog.button1 = L["Share my quest data"]
        dialog.button2 = L["No thanks"]
        local shown = StaticPopup_Show(POPUP, M.QuestionText())
        if shown then return true end
    end

    -- No StaticPopup: ask in chat instead, and leave it off until the player turns it on.
    Log.Print("%s", L["PandaQuest can share your quest data to build the community routes."])
    Log.Print("%s", L["It is off. Turn it on in /pq options if you want to take part."])
    markAsked()
    return false
end

--- Consent.NeedsAsking() -> has the player never been given the choice?
function M.NeedsAsking()
    local settings = telemetrySettings()
    if not settings then return false end
    return not settings.asked
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init() end

--- Nothing is asked at login: synchronisation is optional, and a dialog nobody requested is a
-- nag. `/pq consent` and the options panel are the two ways in.
function M.Enable() end

--- A profile change cannot un-ask the question: `asked` is global, not per profile.
function M.OnProfileChanged() end

return M
