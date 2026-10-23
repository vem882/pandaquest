-- UI/MinimapButton.lua: the PandaQuest LibDataBroker data source and its minimap button.
--
-- One LDB object does three jobs:
--   * LibDBIcon draws it as the minimap button -- shown, hidden, locked and placed from the AceDB
--     profile, so every profile keeps its own button;
--   * any broker display (Titan Panel, ChocolateBar, Bazooka, ...) shows its live `text` and
--     `icon`: the flight in progress, else the current target and how far it is, else how many
--     quests are being tracked;
--   * its tooltip answers the question the button exists for -- where am I going, how far is it --
--     and adds the flight, the last sync with the PandaQuest site and what the clicks do.
--
-- Clicks: left-click opens or closes the quest browser, Shift-left-click shows or hides the arrow,
-- right-click opens the options.
--
-- The text is never rebuilt per frame. It is rebuilt when something it shows changes (the target,
-- a flight starting or ending, the watched quests, a setting), throttled so that a burst of those
-- costs one rebuild, and by a one-second AceTimer only while a target or a flight is on it -- the
-- two things that change without an event saying so.
--
-- The add-on compartment. Retail's AddonCompartmentFrame is the dropdown under the minimap that
-- LibDBIcon:AddButtonToCompartment registers into. The 5.5.4 client has none: there is no
-- "Compartment" anywhere in Blizzard's 5.5.4 UI source (wow-ui-source-classic, 5.5.4 69585).
-- LibDBIcon:IsButtonCompartmentAvailable() is the feature check, so on this client the option is
-- hidden and nothing is registered; on a client that gains the frame it simply starts working.
local _, ns = ...
local L = ns.L

local Const, Util, Log = ns.Const, ns.Util, ns.Log

local M = {}
ns.MinimapButton = M

local type, tonumber, tostring, format, max = type, tonumber, tostring, string.format, math.max
local pcall = pcall

local LDB_NAME = "PandaQuest"
local ICON = "Interface\\AddOns\\PandaQuest\\Textures\\icon.tga"
--- While a flight runs the icon is Blizzard's own taxi node art -- the green "you are here" pin
-- the flight map draws (TaxiButtonTypes.CURRENT, Blizzard_UIPanels_Game/Shared/TaxiFrame.lua) --
-- so a broker bar shows at a glance that the text is about a flight and not about a quest.
local FLIGHT_ICON = "Interface\\TaxiFrame\\UI-Taxi-Icon-Green"

--- Seconds between rebuilds while a target or a flight is shown: a distance and a remaining time
-- move without any event saying so. One a second is what the flight bar's own text changes by.
local TICK = 1
--- A burst of messages inside this window is one rebuild.
local THROTTLE = 0.25
--- Longest target title a broker bar gets. A bar is one line shared with other addons.
local MAX_TITLE_CHARS = 28

local dataObject
local registered = false
local pendingUpdate, ticker

-- Own AceEvent/AceTimer object. AceEvent keys its registry by target, so registering on ns.PQ would
-- collide with whichever other module wants the same message (Flight/Routes.lua has the same note).
local listener = {}
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
    local AceTimer = LibStub and LibStub("AceTimer-3.0", true)
    if AceTimer then AceTimer:Embed(listener) end
end
M.listener = listener

local function buttonProfile()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return profile and profile.minimapButton
end

local function iconLib()
    return LibStub and LibStub("LibDBIcon-1.0", true)
end

---------------------------------------------------------------------------
-- What the button says
---------------------------------------------------------------------------

--- GetFlight() -> name|nil, timeText|nil while a flight runs, else nil.
-- The words are the flight bar's own (FlightBar.TimeText), so the bar, the broker text and the
-- tooltip can never disagree about how long is left. A flight whose destination is not known --
-- a quest taxi, an early landing -- has no name, only the time in the air.
function M.GetFlight()
    local Routes = ns.FlightRoutes
    local flight = Routes and type(Routes.GetFlight) == "function" and Routes.GetFlight() or nil
    if not flight then return nil end
    local name = (not flight.discarded) and flight.name or nil
    local seconds, samples = flight.seconds, flight.samples
    if flight.discarded then seconds, samples = nil, nil end
    local Bar = ns.FlightBar
    local text
    if Bar and type(Bar.TimeText) == "function" then
        text = Bar.TimeText(flight.elapsed, seconds, samples)
    end
    if not text then
        text = format(L["%s in the air"], Util.FormatTime(math.floor(tonumber(flight.elapsed) or 0)))
    end
    return name, text
end

--- GetTrackedCount() -> how many quests the quest log has on its watch list.
function M.GetTrackedCount()
    return ns.Compat.GetNumQuestWatches()
end

local function currentTarget()
    local Router = ns.Router
    return Router and Router.GetCurrent and Router.GetCurrent() or nil
end

local function targetDistance(target)
    local Router = ns.Router
    local distance = Router and Router.GetDistanceTo and Router.GetDistanceTo(target) or target.distance
    return tonumber(distance)
end

local function targetTitle(target)
    return target.questTitle or (target.questID and format("#%d", target.questID)) or L["Custom target"]
end

--- GetLastSync() -> unix time of the newest upload the PandaQuest site has confirmed, or nil.
-- The site writes what it has accepted into the community file and Sync/Community.lua copies it
-- into PandaQuestSync (`ackUploadedThrough` for sessions, `flightsAckedAt` for flights). Nothing
-- else on this side knows when a sync happened, so nothing else is shown.
function M.GetLastSync()
    local sync = ns.Sync or _G.PandaQuestSync
    if type(sync) ~= "table" then return nil end
    local newest = max(tonumber(sync.ackUploadedThrough) or 0, tonumber(sync.flightsAckedAt) or 0)
    if newest <= 0 then return nil end
    return newest
end

local function formatStamp(unix)
    if date then
        local ok, text = pcall(date, "%Y-%m-%d %H:%M", unix)
        if ok and type(text) == "string" then return text end
    end
    return tostring(unix)
end

--- GetText() -> the broker text, icon, and whether it changes by itself (a target or a flight).
function M.GetText()
    local name, flightText = M.GetFlight()
    if flightText then
        if name then
            return format("%s: %s", Util.Truncate(name, MAX_TITLE_CHARS), flightText), FLIGHT_ICON, true
        end
        return flightText, FLIGHT_ICON, true
    end
    local target = currentTarget()
    if target then
        local title = Util.Truncate(targetTitle(target), MAX_TITLE_CHARS)
        local distance = targetDistance(target)
        if distance then
            return format("%s %s", title, Util.FormatDistance(distance)), ICON, true
        end
        return title, ICON, true
    end
    local count = M.GetTrackedCount()
    local pattern = count == 1 and L["%d tracked quest"] or L["%d tracked quests"]
    return format(pattern, count), ICON, false
end

---------------------------------------------------------------------------
-- Tooltip
---------------------------------------------------------------------------

--- MinimapButton.GetTooltipLines([out]) -> array of strings. Split out so the text can be tested
-- and reused without a live tooltip frame.
function M.GetTooltipLines(out)
    out = out or {}
    for i = #out, 1, -1 do out[i] = nil end
    out[#out + 1] = Const.CHAT_PREFIX

    local name, flightText = M.GetFlight()
    if flightText then
        out[#out + 1] = name and format(L["Flying to %s"], name) or L["Flying"]
        out[#out + 1] = flightText
    end

    local target = currentTarget()
    if target then
        out[#out + 1] = targetTitle(target)
        if target.text then out[#out + 1] = target.text end
        local distance = targetDistance(target)
        if distance then
            out[#out + 1] = Util.FormatDistance(distance)
        else
            out[#out + 1] = L["Distance unknown"]
        end
    else
        out[#out + 1] = L["No current target."]
    end

    local synced = M.GetLastSync()
    if synced then
        out[#out + 1] = format(L["Last sync with the PandaQuest site: %s"], formatStamp(synced))
    end

    out[#out + 1] = " "
    out[#out + 1] = L["Left-click: browse all quests"]
    out[#out + 1] = L["Shift-click: toggle the arrow"]
    out[#out + 1] = L["Right-click: open options"]
    return out
end

local tooltipBuffer = {}

local function onTooltipShow(tooltip)
    if not tooltip or not tooltip.AddLine then return end
    local lines = M.GetTooltipLines(tooltipBuffer)
    for i = 1, #lines do
        if i == 1 then
            tooltip:AddLine(lines[i])
        else
            tooltip:AddLine(lines[i], 1, 1, 1)
        end
    end
end

---------------------------------------------------------------------------
-- Clicks
---------------------------------------------------------------------------

local function onClick(_, button)
    if button == "RightButton" then
        if ns.Options and ns.Options.Open then ns.Options.Open() end
        return
    end
    if IsShiftKeyDown and IsShiftKeyDown() then
        if ns.Arrow and ns.Arrow.Toggle then ns.Arrow.Toggle() end
        return
    end
    if ns.QuestBrowser and ns.QuestBrowser.Toggle then ns.QuestBrowser.Toggle() end
end

M.OnClick = onClick
M.OnTooltipShow = onTooltipShow

---------------------------------------------------------------------------
-- The live text
---------------------------------------------------------------------------

local function stopTicker()
    if ticker and listener.CancelTimer then listener:CancelTimer(ticker) end
    ticker = nil
end

--- Update() -> the text it set. Writes `text` and `icon` only when they changed: LibDataBroker
-- tells every display about every write, and LibDBIcon redraws the minimap icon on an icon write.
function M.Update()
    pendingUpdate = nil
    if not dataObject then return nil end
    local ok, text, icon, live = pcall(M.GetText)
    if not ok then
        Log.Debug("MinimapButton", "text failed: %s", tostring(text))
        return nil
    end
    if dataObject.text ~= text then dataObject.text = text end
    if dataObject.icon ~= icon then dataObject.icon = icon end
    if live and not ticker and listener.ScheduleRepeatingTimer then
        ticker = listener:ScheduleRepeatingTimer(M.Update, TICK)
    elseif not live and ticker then
        stopTicker()
    end
    return text
end

--- RequestUpdate(): a rebuild THROTTLE seconds from now, however many ask before then.
function M.RequestUpdate()
    if pendingUpdate or not listener.ScheduleTimer then return end
    pendingUpdate = listener:ScheduleTimer(M.Update, THROTTLE)
end

--- IsTicking() -> true while the one-second rebuild runs (for the tests: it must not run idle).
function M.IsTicking()
    return ticker ~= nil
end

---------------------------------------------------------------------------
-- The minimap button and the compartment
---------------------------------------------------------------------------

--- IsCompartmentAvailable() -> true when the client has an add-on compartment to register into.
function M.IsCompartmentAvailable()
    local icon = iconLib()
    if not (icon and icon.IsButtonCompartmentAvailable) then return false end
    return icon:IsButtonCompartmentAvailable() and true or false
end

local function applyCompartment(icon, p)
    if not M.IsCompartmentAvailable() then return end
    if p.showInCompartment then
        if icon.AddButtonToCompartment then pcall(icon.AddButtonToCompartment, icon, LDB_NAME) end
    elseif icon.RemoveButtonFromCompartment then
        pcall(icon.RemoveButtonFromCompartment, icon, LDB_NAME)
    end
end

function M.GetDataObject()
    return dataObject
end

--- MinimapButton.Refresh(): applies profile.minimapButton -- hide, lock, position and the
-- compartment -- to the button. LibDBIcon:Refresh(name, db) also re-points the button at `db`,
-- which is what makes a profile switch, copy or reset land on the new profile's table: without it
-- the button would keep reading, and dragging into, the profile that was active at login.
function M.Refresh()
    local icon = iconLib()
    if not icon or not registered then return false end
    local p = buttonProfile()
    if type(p) ~= "table" then return false end
    if p.hide then
        if icon.Hide then icon:Hide(LDB_NAME) end
    else
        if icon.Show then icon:Show(LDB_NAME) end
    end
    if icon.Refresh then pcall(icon.Refresh, icon, LDB_NAME, p) end
    applyCompartment(icon, p)
    return true
end

function M.Init()
    local LDB = LibStub and LibStub("LibDataBroker-1.1", true)
    if not LDB then
        Log.Warn("MinimapButton", "LibDataBroker-1.1 is missing; no minimap button")
        return
    end
    dataObject = LDB:GetDataObjectByName(LDB_NAME) or LDB:NewDataObject(LDB_NAME, {
        type = "data source",
        label = "PandaQuest",
        text = "PandaQuest",
        icon = ICON,
        OnClick = onClick,
        OnTooltipShow = onTooltipShow,
    })
end

local function registerButton()
    local icon = iconLib()
    if not icon or not icon.Register then
        Log.Warn("MinimapButton", "LibDBIcon-1.0 is missing; no minimap button")
        return
    end
    local p = buttonProfile()
    if type(p) ~= "table" then return end
    local ok, err = pcall(icon.Register, icon, LDB_NAME, dataObject, p)
    if not ok then
        Log.Warn("MinimapButton", "LibDBIcon register failed: %s", tostring(err))
        return
    end
    registered = true
    -- profile.minimapButton.radius is deliberately not pushed into LibDBIcon:SetButtonRadius:
    -- that setting is library-wide and would move every other addon's minimap button too.
    M.Refresh()
end

function M.Enable()
    if not dataObject then return end
    if not registered then registerButton() end

    if listener.RegisterMessage then
        listener:RegisterMessage("PQ_SETTING_CHANGED", function(_, path)
            if type(path) ~= "string" then return end
            if path:sub(1, 14) == "minimapButton." then M.Refresh() end
            -- The units change how the distance reads.
            M.RequestUpdate()
        end)
        for _, message in ipairs({ "PQ_CURRENT_TARGET_CHANGED", "PQ_TARGETS_UPDATED", "PQ_TARGET_REACHED",
                                   "PQ_FLIGHT_STARTED", "PQ_FLIGHT_ENDED", "PQ_QUESTLOG_CHANGED" }) do
            listener:RegisterMessage(message, M.RequestUpdate)
        end
    end
    if listener.RegisterEvent then
        listener:RegisterEvent("QUEST_WATCH_LIST_CHANGED", M.RequestUpdate)
        listener:RegisterEvent("PLAYER_ENTERING_WORLD", M.RequestUpdate)
    end
    M.Update()
    Log.Debug("MinimapButton", "registered")
end

function M.OnProfileChanged()
    M.Refresh()
    M.RequestUpdate()
end

M.LDB_NAME = LDB_NAME
M.ICON = ICON
M.FLIGHT_ICON = FLIGHT_ICON
M.TICK = TICK
M.THROTTLE = THROTTLE
