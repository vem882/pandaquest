-- UI/MinimapButton.lua: LibDataBroker launcher on the minimap (docs/06 section 11).
-- Left click toggles the arrow, right click opens the options, and the tooltip answers the one
-- question the button exists for: where am I going and how far is it.
local _, ns = ...
local L = ns.L

local Const, Util, Log = ns.Const, ns.Util, ns.Log

local M = {}
ns.MinimapButton = M

local type, format = type, string.format

local LDB_NAME = "PandaQuest"
local ICON = "Interface\\AddOns\\PandaQuest\\Textures\\icon.tga"

local dataObject
local registered = false

local function buttonProfile()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return profile and profile.minimapButton
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
    local Router = ns.Router
    local target = Router and Router.GetCurrent and Router.GetCurrent() or nil
    if target then
        local title = target.questTitle or (target.questID and format("#%d", target.questID)) or L["Custom target"]
        out[#out + 1] = title
        if target.text then out[#out + 1] = target.text end
        local distance = Router and Router.GetDistanceTo and Router.GetDistanceTo(target) or target.distance
        if distance then
            out[#out + 1] = Util.FormatDistance(distance)
        else
            out[#out + 1] = L["Distance unknown"]
        end
    else
        out[#out + 1] = L["No current target."]
    end
    out[#out + 1] = " "
    out[#out + 1] = L["Left-click: toggle the arrow"]
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
    if ns.Arrow and ns.Arrow.Toggle then
        ns.Arrow.Toggle()
    end
end

M.OnClick = onClick
M.OnTooltipShow = onTooltipShow

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.GetDataObject()
    return dataObject
end

--- MinimapButton.Refresh(): applies profile.minimapButton.hide and the stored position.
function M.Refresh()
    local icon = LibStub and LibStub("LibDBIcon-1.0", true)
    if not icon or not registered then return false end
    local p = buttonProfile()
    if p and p.hide then
        if icon.Hide then icon:Hide(LDB_NAME) end
    else
        if icon.Show then icon:Show(LDB_NAME) end
    end
    if icon.Refresh then pcall(icon.Refresh, icon, LDB_NAME, p) end
    return true
end

function M.Init()
    local LDB = LibStub and LibStub("LibDataBroker-1.1", true)
    if not LDB then
        Log.Warn("MinimapButton", "LibDataBroker-1.1 is missing; no minimap button")
        return
    end
    dataObject = LDB:GetDataObjectByName(LDB_NAME) or LDB:NewDataObject(LDB_NAME, {
        type = "launcher",
        label = "PandaQuest",
        icon = ICON,
        OnClick = onClick,
        OnTooltipShow = onTooltipShow,
    })
end

function M.Enable()
    if registered or not dataObject then return end
    local icon = LibStub and LibStub("LibDBIcon-1.0", true)
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
    -- Own AceEvent embed (ns.PQ keeps only one callback per message).
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then
        AceEvent:Embed(M)
        M:RegisterMessage("PQ_SETTING_CHANGED", function(_, path)
            if path == "minimapButton.hide" then M.Refresh() end
        end)
    end
    Log.Debug("MinimapButton", "registered")
end

function M.OnProfileChanged()
    M.Refresh()
end

M.LDB_NAME = LDB_NAME
M.ICON = ICON
