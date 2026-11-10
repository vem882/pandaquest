-- A copyable export of observations already recorded by telemetry.
local _, ns = ...
local M = {}
ns.Trace = M

local fields = {
    QA = { "q" }, QT = { "q" }, OBJ = { "q", "i", "n", "r" },
    KILL = { "npc" }, LOOT = { "npc", "item", "count" },
    NODE = { "k", "o" }, RESP = { "kind", "id", "dt", "sample" },
}
local common = { "t", "m", "x", "y" }
local gameKeys = { mop = true, era = true, anniversary = true, forever = true }

local function literal(value)
    value = ns.Compat.Plain(value)
    if type(value) == "number" and value == value and math.abs(value) ~= math.huge then
        return tostring(value)
    end
    if type(value) == "string" and #value <= 32 and value:match("^[%w_.%-]+$") then
        return '"' .. value .. '"'
    end
end

local function appendFields(parts, names, event)
    for _, name in ipairs(names) do
        local value = literal(event[name])
        if value then parts[#parts + 1] = '"' .. name .. '":' .. value end
    end
end

function M.BuildExport(store)
    local game = store and store.game
    if not gameKeys[game] then return nil end
    local sessions = store.sessions or {}
    for index = #sessions, 1, -1 do
        local session = sessions[index]
        local start, build = literal(session.start), literal(session.clientBuild)
        if start and build then
            local events = {}
            local rows = session.events or {}
            for i = math.max(1, #rows - 1999), #rows do
                local event = rows[i]
                local names = fields[event.e]
                if names then
                    local parts = { '"e":' .. literal(event.e) }
                    appendFields(parts, common, event)
                    appendFields(parts, names, event)
                    events[#events + 1] = "{" .. table.concat(parts, ",") .. "}"
                end
            end
            if #events > 0 then
                return '!PandaQuestTrace:1\n{"version":1,"game":' .. literal(game) ..
                    ',"sessions":[{"id":"trace","character":"Trace","start":' .. start ..
                    ',"clientBuild":' .. build .. ',"events":[' .. table.concat(events, ",") .. ']}]}'
            end
        end
    end
end

local frame, edit
function M.Show()
    local telemetry = ns.Telemetry
    local export = telemetry and M.BuildExport(telemetry.GetStore())
    if not export then
        ns.Log.Print("No recorded quest or gathering observations are available to export.")
        return
    end
    if not frame then
        frame = CreateFrame("Frame", nil, UIParent, BackdropTemplateMixin and "BackdropTemplate")
        frame:SetSize(580, 270)
        frame:SetPoint("CENTER")
        frame:SetFrameStrata("DIALOG")
        frame:EnableMouse(true)
        local background = frame:CreateTexture(nil, "BACKGROUND")
        background:SetAllPoints(frame)
        background:SetColorTexture(0.06, 0.05, 0.03, 0.98)
        local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        title:SetPoint("TOPLEFT", 16, -16)
        title:SetText("PandaQuest Trace")
        local hint = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        hint:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
        hint:SetText("Copy the export and paste it at pd.zroot.it/trace.")
        local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
        close:SetPoint("TOPRIGHT")
        close:SetScript("OnClick", function() frame:Hide() end)
        local scroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", 16, -58)
        scroll:SetPoint("BOTTOMRIGHT", -34, 16)
        edit = CreateFrame("EditBox", nil, scroll)
        edit:SetWidth(525)
        edit:SetFontObject(GameFontHighlightSmall)
        edit:SetMultiLine(true)
        edit:SetAutoFocus(false)
        edit:SetScript("OnEscapePressed", function() frame:Hide() end)
        scroll:SetScrollChild(edit)
    end
    frame:Show()
    edit:SetText(export)
    edit:SetFocus()
    edit:HighlightText()
end
