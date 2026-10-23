-- UI/OptionsRenderer.lua: draws an AceConfig-3.0 options table as PandaQuest's own rows.
--
-- The options table in UI/Options.lua stays the one definition of every setting: AceConfigDialog draws
-- it in the game's Settings panel, AceConfigCmd reads it for `/pq config`, and this file draws it in
-- PandaQuest's main window (UI/MainWindow.lua). It walks the table the way AceConfig does -- `order`,
-- `name`, `desc`, `hidden`, `disabled`, `get`/`set`/`func`/`values`/`validate`/`confirm`, a function or
-- a method name on the `handler`, all inherited from the groups above -- and draws each option as a row:
-- a white title, a grey line under it, the control on the right (a check box; a slider with its minimum,
-- maximum and a number box; a list; a button; a text box; a colour swatch), a gold heading for a header
-- or a group, and plain text for a description.
--
-- Only the rows that are on screen exist: a view keeps a pool of row frames and lays out the visible part
-- of its item list on every scroll, so a long category costs as many frames as fit the window. Nothing
-- here runs on its own: no OnUpdate, no timer; a view redraws when it is scrolled, resized, used, or
-- told that the options changed (AceConfigRegistry's ConfigTableChange) while it is on screen.
local _, ns = ...

local R = {}
ns.OptionsRenderer = R

local type, pairs, ipairs, tostring, tonumber = type, pairs, ipairs, tostring, tonumber
local floor, ceil, max, min = math.floor, math.ceil, math.max, math.min
local format, lower, find = string.format, string.lower, string.find
local tsort = table.sort

-- Palette (the quest browser's) ----------------------------------------------------------------------
local GOLD = { 1.0, 0.82, 0.0 }
local WHITE = { 1, 1, 1 }
local GREY = { 0.62, 0.62, 0.66 }
local DIM = { 0.40, 0.40, 0.44 }
local SEPARATOR = { 0.36, 0.30, 0.12 }
local FIELD_BG = { 0.03, 0.03, 0.045, 1 }
local BUTTON_BG = { 0.14, 0.14, 0.17, 0.95 }
local EDGE = { 0.36, 0.30, 0.12, 1 }

-- Row heights -----------------------------------------------------------------------------------------
local HEIGHT = { header = 30, toggle = 42, range = 50, select = 42, execute = 38, input = 42, color = 42 }
local ROW_PLAIN = 28              -- an option with no description line
local TEXT_LINE = 13              -- one line of a description, GameFontHighlightSmall
local CONTROL_W = 190             -- the column the controls live in
local PAD = 12
local WHEEL = 48                  -- pixels per mouse wheel notch

R.HEIGHT = HEIGHT

---------------------------------------------------------------------------
-- Reading the table the way AceConfig does
---------------------------------------------------------------------------

local INHERITED = { get = true, set = true, func = true, validate = true, confirm = true,
                    disabled = true, hidden = true, handler = true }

--- The value of `key` on the option or on the nearest group above it (AceConfig's inheritance).
local function inherit(item, key)
    local option = item.option
    if option[key] ~= nil or not INHERITED[key] then return option[key] end
    local chain = item.chain
    for i = #chain, 1, -1 do
        local v = chain[i][key]
        if v ~= nil then return v end
    end
    return nil
end

--- Calls a member: a function gets (info, ...), a method name is called on the handler, anything else
-- is the value itself.
local function call(item, key, ...)
    local member = inherit(item, key)
    if type(member) == "function" then return member(item.info, ...) end
    if type(member) == "string" and key ~= "name" and key ~= "desc" then
        local handler = inherit(item, "handler")
        local method = handler and handler[member]
        if type(method) == "function" then return method(handler, item.info, ...) end
    end
    return member
end
R.Call = call

local function text(item, key)
    local option = item.option
    local v = option[key]
    if type(v) == "function" then v = v(item.info) end
    if v == nil then return nil end
    return tostring(v)
end

local function isHidden(item)
    local option = item.option
    if option.guiHidden or option.dialogHidden then return true end
    return call(item, "hidden") and true or false
end

local function isDisabled(item)
    return call(item, "disabled") and true or false
end
R.IsDisabled = isDisabled

local function sortedKeys(args)
    local keys = {}
    for key, option in pairs(args or {}) do
        if type(option) == "table" then keys[#keys + 1] = key end
    end
    tsort(keys, function(a, b)
        local oa, ob = args[a].order or 100, args[b].order or 100
        if type(oa) ~= "number" then oa = 100 end
        if type(ob) ~= "number" then ob = 100 end
        if oa < 0 then oa = 10000 + oa end              -- AceConfig: a negative order counts from the end
        if ob < 0 then ob = 10000 + ob end
        if oa ~= ob then return oa < ob end
        return tostring(a) < tostring(b)
    end)
    return keys
end
R.SortedKeys = sortedKeys

local function newItem(root, chain, path, key, option, appName)
    local info = { options = root, option = option, arg = option.arg, type = option.type,
                   uiType = "dialog", uiName = "PandaQuest", appName = appName }
    for i = 1, #path do info[i] = path[i] end
    info[#path + 1] = key
    local item = { key = key, option = option, chain = chain, info = info, kind = option.type }
    info.handler = inherit(item, "handler")
    return item
end

--- Collect(root, path, appName) -> items. The options of the group at `path` (a list of keys from the
-- root), in AceConfig order, hidden ones left out. A group inside it becomes a gold heading followed by
-- its own options, so a category reads top to bottom like the sections of a settings page.
function R.Collect(root, path, appName, items, depth)
    items = items or {}
    depth = depth or 0
    local group, chain = root, { root }
    for _, key in ipairs(path) do
        group = group.args and group.args[key]
        if type(group) ~= "table" then return items end
        chain[#chain + 1] = group
    end
    for _, key in ipairs(sortedKeys(group.args)) do
        local option = group.args[key]
        local item = newItem(root, chain, path, key, option, appName)
        if not isHidden(item) then
            if option.type == "group" then
                local name = text(item, "name")
                items[#items + 1] = { kind = "header", key = key, label = name, item = item }
                local sub = {}
                for i = 1, #path do sub[i] = path[i] end
                sub[#sub + 1] = key
                if depth < 3 then R.Collect(root, sub, appName, items, depth + 1) end
            else
                items[#items + 1] = item
            end
        end
    end
    return items
end

--- Matches(item, query) -> does the option's name or description contain the query (any case)?
local function matches(item, query)
    if item.kind == "header" or item.kind == "description" then return false end
    local name = text(item, "name") or ""
    local desc = text(item, "desc") or ""
    return find(lower(name), query, 1, true) ~= nil or find(lower(desc), query, 1, true) ~= nil
end

--- Search(root, sections, query, appName) -> items. Every option of the given sections whose name or
-- description contains `query`, under a heading per section that has a match. `sections` is a list of
-- { label = text, path = { keys } }.
function R.Search(root, sections, query, appName)
    query = lower(tostring(query or ""):gsub("^%s+", ""):gsub("%s+$", ""))
    local out = {}
    if query == "" then return out end
    for _, section in ipairs(sections) do
        local found = {}
        for _, item in ipairs(R.Collect(root, section.path, appName)) do
            if matches(item, query) then found[#found + 1] = item end
        end
        if #found > 0 then
            out[#out + 1] = { kind = "header", label = section.label }
            for _, item in ipairs(found) do out[#out + 1] = item end
        end
    end
    return out
end

---------------------------------------------------------------------------
-- Drawing helpers
---------------------------------------------------------------------------

local function paint(texture, color, alpha)
    if texture.SetColorTexture then
        texture:SetColorTexture(color[1], color[2], color[3], alpha or color[4] or 1)
    else
        texture:SetTexture(color[1], color[2], color[3], alpha or color[4] or 1)
    end
end

local function bar(parent, layer, color, alpha)
    local t = parent:CreateTexture(nil, layer)
    paint(t, color, alpha)
    return t
end

local function fontString(parent, font, color, justify)
    local fs = parent:CreateFontString(nil, "OVERLAY", font)
    fs:SetJustifyH(justify or "LEFT")
    if fs.SetWordWrap then fs:SetWordWrap(true) end
    if color then fs:SetTextColor(color[1], color[2], color[3]) end
    return fs
end

local function edge(f, color, alpha)
    local lines = {}
    for i, side in ipairs({ "TOP", "BOTTOM", "LEFT", "RIGHT" }) do
        local t = bar(f, "BORDER", color, alpha)
        if side == "TOP" or side == "BOTTOM" then
            t:SetPoint(side .. "LEFT", f, side .. "LEFT", 0, 0)
            t:SetPoint(side .. "RIGHT", f, side .. "RIGHT", 0, 0)
            t:SetHeight(1)
        else
            t:SetPoint("TOP" .. side, f, "TOP" .. side, 0, 0)
            t:SetPoint("BOTTOM" .. side, f, "BOTTOM" .. side, 0, 0)
            t:SetWidth(1)
        end
        lines[i] = t
    end
    return lines
end

local function flatButton(parent, width, height)
    local b = CreateFrame("Button", nil, parent)
    b:SetSize(width, height)
    b.bg = bar(b, "BACKGROUND", BUTTON_BG)
    b.bg:SetAllPoints(b)
    b.edge = edge(b, EDGE, 0.7)
    b.text = fontString(b, "GameFontHighlightSmall", WHITE, "CENTER")
    b.text:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.text:SetSize(width - 8, height - 2)
    if b.text.SetWordWrap then b.text:SetWordWrap(false) end
    local hover = bar(b, "HIGHLIGHT", GOLD, 0.12)
    hover:SetAllPoints(b)
    return b
end
R.FlatButton = flatButton
R.Paint, R.Bar, R.Edge, R.FontString = paint, bar, edge, fontString

-- How many lines a text wraps into at a width (about 5.6 px a character in the small game font).
local function textLines(textValue, width)
    textValue = tostring(textValue or "")
    if textValue == "" then return 0 end
    local perLine = max(10, floor(width / 5.6))
    local lines = 0
    for paragraph in (textValue .. "\n"):gmatch("([^\n]*)\n") do
        lines = lines + max(1, ceil(#paragraph / perLine))
    end
    return lines
end

local function describeHeight(textValue, width)
    local lines = textLines(textValue, width)
    if lines == 0 then return 6 end
    return lines * TEXT_LINE + 10
end

local function textWidth(width)
    return width - 2 * PAD - CONTROL_W - 12
end

---------------------------------------------------------------------------
-- The shared list popup of a `select`
---------------------------------------------------------------------------

local listPopup
local LIST_ROW, LIST_MAX = 20, 14

local function listValues(item)
    local values = call(item, "values") or {}
    local keys = {}
    local sorting = inherit(item, "sorting")
    if type(sorting) == "function" then sorting = sorting(item.info) end
    if type(sorting) == "table" then
        for _, k in ipairs(sorting) do if values[k] ~= nil then keys[#keys + 1] = k end end
    else
        for k in pairs(values) do keys[#keys + 1] = k end
        tsort(keys, function(a, b) return tostring(values[a]) < tostring(values[b]) end)
    end
    return values, keys
end
R.ListValues = listValues

local function hideList()
    if listPopup then listPopup:Hide() end
end
R.HideList = hideList

local function showList(view, row, item)
    if not listPopup then
        listPopup = CreateFrame("Frame", "PandaQuestOptionsList", UIParent)
        if listPopup.SetFrameStrata then listPopup:SetFrameStrata("FULLSCREEN_DIALOG") end
        if listPopup.SetClampedToScreen then listPopup:SetClampedToScreen(true) end
        listPopup.bg = bar(listPopup, "BACKGROUND", { 0.05, 0.05, 0.07, 0.98 })
        listPopup.bg:SetAllPoints(listPopup)
        edge(listPopup, GOLD, 0.6)
        listPopup:EnableMouse(true)
        listPopup.buttons = {}
        listPopup:Hide()
    end
    local values, keys = listValues(item)
    local current = call(item, "get")
    local count = min(#keys, LIST_MAX)
    listPopup.offset = 0
    listPopup:SetSize(CONTROL_W, count * LIST_ROW + 8)
    listPopup:ClearAllPoints()
    listPopup:SetPoint("TOPRIGHT", row.select, "BOTTOMRIGHT", 0, -2)
    local function fill()
        for i = 1, max(count, #listPopup.buttons) do
            local b = listPopup.buttons[i]
            if i <= count then
                if not b then
                    b = flatButton(listPopup, CONTROL_W - 8, LIST_ROW - 2)
                    b:SetPoint("TOPLEFT", listPopup, "TOPLEFT", 4, -4 - (i - 1) * LIST_ROW)
                    b.text:SetJustifyH("LEFT")
                    listPopup.buttons[i] = b
                end
                local key = keys[i + listPopup.offset]
                b.value = key
                b.text:SetText(tostring(values[key]))
                b.text:SetTextColor(key == current and GOLD[1] or 1, key == current and GOLD[2] or 1,
                    key == current and GOLD[3] or 1)
                b:SetScript("OnClick", function(self)
                    hideList()
                    view:Set(item, self.value)
                end)
                b:Show()
            elseif b then
                b:Hide()
            end
        end
    end
    listPopup:EnableMouseWheel(true)
    listPopup:SetScript("OnMouseWheel", function(_, delta)
        local most = max(0, #keys - count)
        listPopup.offset = max(0, min(most, listPopup.offset - delta))
        fill()
    end)
    fill()
    listPopup.item = item
    listPopup:Show()
    return listPopup
end

function R.GetListPopup() return listPopup end

---------------------------------------------------------------------------
-- Rows
---------------------------------------------------------------------------

-- Every control a row can show is made the first time a row needs it, then reused by that row.
local builders = {}

function builders.check(row)
    local c = CreateFrame("Button", nil, row)
    c:SetSize(22, 22)
    c.bg = bar(c, "BACKGROUND", FIELD_BG)
    c.bg:SetAllPoints(c)
    c.edge = edge(c, EDGE, 0.9)
    c.mark = c:CreateTexture(nil, "ARTWORK")
    c.mark:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
    c.mark:SetPoint("CENTER", c, "CENTER", 0, 0)
    c.mark:SetSize(24, 24)
    local hover = bar(c, "HIGHLIGHT", GOLD, 0.15)
    hover:SetAllPoints(c)
    c:SetScript("OnClick", function()
        local item = row.item
        if item and not isDisabled(item) then row.view:Set(item, not call(item, "get")) end
    end)
    return c
end

function builders.slider(row)
    local s = CreateFrame("Slider", nil, row)
    s:SetOrientation("HORIZONTAL")
    s:SetSize(CONTROL_W - 56, 14)
    local track = bar(s, "BACKGROUND", { 0.12, 0.12, 0.15 }, 1)
    track:SetPoint("LEFT", s, "LEFT", 0, 0)
    track:SetPoint("RIGHT", s, "RIGHT", 0, 0)
    track:SetHeight(4)
    s:SetThumbTexture("Interface\\Buttons\\WHITE8X8")
    local thumb = s:GetThumbTexture()
    if type(thumb) == "table" and thumb.SetSize then
        thumb:SetSize(8, 14)
        if thumb.SetVertexColor then thumb:SetVertexColor(GOLD[1], GOLD[2], GOLD[3], 1) end
    end
    s.low = fontString(row, "GameFontDisableSmall", DIM, "LEFT")
    s.low:SetPoint("TOPLEFT", s, "BOTTOMLEFT", 0, -1)
    s.low:SetSize(60, 12)
    s.high = fontString(row, "GameFontDisableSmall", DIM, "RIGHT")
    s.high:SetPoint("TOPRIGHT", s, "BOTTOMRIGHT", 0, -1)
    s.high:SetSize(60, 12)
    s.box = CreateFrame("EditBox", nil, row)
    s.box:SetSize(48, 18)
    s.box:SetAutoFocus(false)
    s.box:SetFontObject("GameFontHighlightSmall")
    s.box:SetJustifyH("CENTER")
    local boxBg = bar(s.box, "BACKGROUND", FIELD_BG)
    boxBg:SetAllPoints(s.box)
    edge(s.box, EDGE, 0.7)
    s.box:SetPoint("LEFT", s, "RIGHT", 6, 0)
    s:SetScript("OnValueChanged", function(_, value)
        if row.updating or not row.item then return end
        row.view:Set(row.item, value, true)
    end)
    s:SetScript("OnMouseUp", function() if row.item then row.view:Refresh() end end)
    s.box:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local typed = (self:GetText() or ""):gsub(",", ".")      -- a decimal comma reads too
        local value = tonumber(typed)
        local item = row.item
        if value and item then
            local option = item.option
            local lo, hi = option.softMin or option.min or 0, option.softMax or option.max or 100
            row.view:Set(item, max(lo, min(hi, value)))
        else
            row.view:Refresh()
        end
    end)
    s.box:SetScript("OnEscapePressed", function(self) self:ClearFocus(); row.view:Refresh() end)
    return s
end

function builders.select(row)
    local b = flatButton(row, CONTROL_W, 22)
    b.text:SetJustifyH("LEFT")
    b.arrow = fontString(b, "GameFontNormalSmall", GOLD, "RIGHT")
    b.arrow:SetPoint("RIGHT", b, "RIGHT", -6, 0)
    b.arrow:SetSize(10, 14)
    b.arrow:SetText("v")
    b:SetScript("OnClick", function()
        local item = row.item
        if not item or isDisabled(item) then return end
        if listPopup and listPopup:IsShown() and listPopup.item == item then hideList() return end
        showList(row.view, row, item)
    end)
    return b
end

function builders.button(row)
    local b = flatButton(row, CONTROL_W, 22)
    b:SetScript("OnClick", function()
        local item = row.item
        if item and not isDisabled(item) then row.view:Execute(item) end
    end)
    return b
end

function builders.input(row)
    local box = CreateFrame("EditBox", nil, row)
    box:SetSize(CONTROL_W, 22)
    box:SetAutoFocus(false)
    box:SetFontObject("GameFontHighlightSmall")
    box:SetTextInsets(6, 6, 0, 0)
    local bg = bar(box, "BACKGROUND", FIELD_BG)
    bg:SetAllPoints(box)
    edge(box, EDGE, 0.7)
    box:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        if row.item then row.view:Set(row.item, self:GetText() or "") end
    end)
    box:SetScript("OnEscapePressed", function(self) self:ClearFocus(); row.view:Refresh() end)
    return box
end

function builders.swatch(row)
    local b = CreateFrame("Button", nil, row)
    b:SetSize(32, 20)
    b.color = bar(b, "ARTWORK", WHITE)
    b.color:SetPoint("TOPLEFT", b, "TOPLEFT", 2, -2)
    b.color:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", -2, 2)
    edge(b, GOLD, 0.6)
    b:SetScript("OnClick", function()
        local item = row.item
        if not item or isDisabled(item) then return end
        local r, g, bl, a = call(item, "get")
        local picker = _G and _G.ColorPickerFrame
        if not picker then return end
        local hasAlpha = item.option.hasAlpha and true or false
        local function apply()
            local nr, ng, nb = picker:GetColorRGB()
            local na = hasAlpha and picker.GetColorAlpha and picker:GetColorAlpha() or a
            row.view:Set(item, nr, ng, nb, na)
        end
        if picker.SetupColorPickerAndShow then
            picker:SetupColorPickerAndShow({ r = r or 1, g = g or 1, b = bl or 1, opacity = a, hasOpacity = hasAlpha,
                swatchFunc = apply, opacityFunc = apply,
                cancelFunc = function() row.view:Set(item, r, g, bl, a) end })
        end
    end)
    return b
end

local function control(row, name)
    local c = row.controls[name]
    if not c then
        c = builders[name](row)
        row.controls[name] = c
    end
    return c
end

local function newRow(view)
    local row = CreateFrame("Frame", nil, view.content)
    row.view = view
    row.controls = {}
    row.title = fontString(row, "GameFontHighlight", WHITE, "LEFT")
    row.title:SetPoint("TOPLEFT", row, "TOPLEFT", PAD, -6)
    row.title:SetSize(200, 16)
    if row.title.SetWordWrap then row.title:SetWordWrap(false) end
    row.desc = fontString(row, "GameFontHighlightSmall", GREY, "LEFT")
    row.desc:SetPoint("TOPLEFT", row.title, "BOTTOMLEFT", 0, -2)
    row.desc:SetSize(200, TEXT_LINE)
    row.sep = bar(row, "BORDER", SEPARATOR, 0.35)
    row.sep:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", PAD, 0)
    row.sep:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -PAD, 0)
    row.sep:SetHeight(1)
    row.headLine = bar(row, "ARTWORK", GOLD, 0.6)
    row.headLine:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", PAD, 4)
    row.headLine:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -PAD, 4)
    row.headLine:SetHeight(1)
    row:EnableMouse(true)
    row:SetScript("OnEnter", function(self)
        local item = self.item
        local tip = item and item.option and text(item, "desc")
        if tip and GameTooltip and self.title:IsShown() then
            GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
            GameTooltip:SetText(text(item, "name") or "", 1, 0.82, 0)
            GameTooltip:AddLine(tip, 1, 1, 1, true)
            GameTooltip:Show()
        end
    end)
    row:SetScript("OnLeave", function(self)
        if GameTooltip and GameTooltip.GetOwner and GameTooltip:GetOwner() == self then GameTooltip:Hide() end
    end)
    return row
end

local function hideControls(row)
    for _, c in pairs(row.controls) do
        c:Hide()
        if c.low then c.low:Hide(); c.high:Hide(); c.box:Hide() end
    end
end

-- Lays one item into a row. Values are read fresh every time: a row is a view, never a cache.
local function configure(view, row, entry, width)
    row.item = entry.option and entry or nil
    row.entry = entry
    hideControls(row)
    row.headLine:Hide()
    row.sep:Show()
    local kind = entry.kind
    local title, desc = row.title, row.desc
    title:ClearAllPoints()
    title:SetPoint("TOPLEFT", row, "TOPLEFT", PAD, -6)
    title:SetSize(textWidth(width), 16)
    desc:SetSize(textWidth(width), max(1, textLines(entry.option and text(entry, "desc"), textWidth(width))) * TEXT_LINE)
    title:Show()
    desc:Show()

    if kind == "header" then
        local label = entry.label
        if not label and entry.item then label = text(entry.item, "name") end
        if not label and entry.option then label = text(entry, "name") end
        title:SetFontObject("GameFontNormal")
        title:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
        title:ClearAllPoints()
        title:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", PAD, 8)
        title:SetSize(width - 2 * PAD, 16)
        title:SetText(label or "")
        desc:Hide()
        row.sep:Hide()
        row.headLine:Show()
        return
    end

    title:SetFontObject("GameFontHighlight")
    local disabled = isDisabled(entry)
    local tint = disabled and DIM or WHITE
    title:SetTextColor(tint[1], tint[2], tint[3])

    if kind == "description" then
        local fontSize = entry.option.fontSize
        if type(fontSize) == "function" then fontSize = fontSize(entry.info) end
        title:SetFontObject(fontSize == "large" and "GameFontHighlightLarge"
            or fontSize == "medium" and "GameFontHighlight" or "GameFontHighlightSmall")
        if title.SetWordWrap then title:SetWordWrap(true) end
        title:SetTextColor(0.85, 0.85, 0.85)
        local body = text(entry, "name") or ""
        title:SetSize(width - 2 * PAD, max(1, textLines(body, width - 2 * PAD)) * TEXT_LINE + 4)
        title:SetText(body)
        desc:Hide()
        row.sep:Hide()
        return
    end
    if title.SetWordWrap then title:SetWordWrap(false) end
    title:SetText(text(entry, "name") or "")
    local descText = text(entry, "desc")
    desc:SetText(descText or "")
    desc:SetTextColor(GREY[1], GREY[2], GREY[3])

    row.updating = true
    if kind == "toggle" then
        local c = control(row, "check")
        c:ClearAllPoints()
        c:SetPoint("RIGHT", row, "RIGHT", -PAD - CONTROL_W + 22, 0)
        local value = call(entry, "get")
        if value then c.mark:Show() else c.mark:Hide() end
        c:SetEnabled(not disabled)
        c:Show()
    elseif kind == "range" then
        local s = control(row, "slider")
        local option = entry.option
        local lo, hi = option.softMin or option.min or 0, option.softMax or option.max or 100
        local step = option.bigStep or option.step or 0
        s:ClearAllPoints()
        s:SetPoint("RIGHT", row, "RIGHT", -PAD - 54, 2)
        s:SetMinMaxValues(lo, hi)
        s:SetValueStep(step)
        local value = tonumber(call(entry, "get")) or lo
        s:SetValue(value)
        local fmt = option.isPercent and "%d%%" or ((step ~= 0 and step < 1) and "%.2f" or "%d")
        local function show(v) return option.isPercent and format(fmt, v * 100) or format(fmt, v) end
        s.low:SetText(show(lo))
        s.high:SetText(show(hi))
        if not s.box:HasFocus() then s.box:SetText(show(value)) end
        s:SetEnabled(not disabled)
        s:Show(); s.low:Show(); s.high:Show(); s.box:Show()
    elseif kind == "select" then
        local b = control(row, "select")
        b:ClearAllPoints()
        b:SetPoint("RIGHT", row, "RIGHT", -PAD, 0)
        local values = call(entry, "values") or {}
        local current = call(entry, "get")
        b.text:SetText(current ~= nil and values[current] ~= nil and tostring(values[current]) or "")
        b:SetEnabled(not disabled)
        b:Show()
    elseif kind == "execute" then
        local b = control(row, "button")
        b:ClearAllPoints()
        b:SetPoint("RIGHT", row, "RIGHT", -PAD, 0)
        b.text:SetText(text(entry, "name") or "")
        b:SetEnabled(not disabled)
        b:Show()
    elseif kind == "input" then
        local box = control(row, "input")
        box:ClearAllPoints()
        box:SetPoint("RIGHT", row, "RIGHT", -PAD, 0)
        if not box:HasFocus() then box:SetText(tostring(call(entry, "get") or "")) end
        box:SetEnabled(not disabled)
        box:Show()
    elseif kind == "color" then
        local b = control(row, "swatch")
        b:ClearAllPoints()
        b:SetPoint("RIGHT", row, "RIGHT", -PAD - CONTROL_W + 32, 0)
        local r, g, bl, a = call(entry, "get")
        paint(b.color, { r or 1, g or 1, bl or 1 }, a or 1)
        b:SetEnabled(not disabled)
        b:Show()
    end
    row.updating = false
end

---------------------------------------------------------------------------
-- A view: a clipped, scrollable list of rows
---------------------------------------------------------------------------

local View = {}
View.__index = View

--- R.New(parent, appName) -> view. Anchor it with view.frame; give it items with SetItems.
function R.New(parent, appName)
    local view = setmetatable({ appName = appName, items = {}, offset = 0, rows = {}, pool = {}, total = 0 }, View)
    local frame = CreateFrame("Frame", nil, parent)
    view.frame = frame
    local clip = CreateFrame("ScrollFrame", nil, frame)
    clip:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    clip:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -14, 0)
    view.clip = clip
    local content = CreateFrame("Frame", nil, clip)
    content:SetSize(10, 10)
    clip:SetScrollChild(content)
    view.content = content

    local slider = CreateFrame("Slider", nil, frame)
    slider:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, -2)
    slider:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
    slider:SetWidth(10)
    slider:SetOrientation("VERTICAL")
    slider:SetMinMaxValues(0, 0)
    slider:SetValueStep(1)
    local track = bar(slider, "BACKGROUND", { 0.12, 0.12, 0.15 }, 1)
    track:SetPoint("TOP", slider, "TOP", 0, 0)
    track:SetPoint("BOTTOM", slider, "BOTTOM", 0, 0)
    track:SetWidth(4)
    slider:SetThumbTexture("Interface\\Buttons\\WHITE8X8")
    local thumb = slider:GetThumbTexture()
    if type(thumb) == "table" and thumb.SetSize then
        thumb:SetSize(6, 32)
        if thumb.SetVertexColor then thumb:SetVertexColor(GOLD[1], GOLD[2], GOLD[3], 0.8) end
    end
    slider:SetScript("OnValueChanged", function(_, value)
        if view.syncing then return end
        view:ScrollTo(value)
    end)
    view.slider = slider

    frame:EnableMouseWheel(true)
    frame:SetScript("OnMouseWheel", function(_, delta) view:ScrollTo(view.offset - delta * WHEEL) end)
    frame:SetScript("OnSizeChanged", function() view:Layout() end)
    frame:SetScript("OnHide", hideList)
    view.empty = fontString(frame, "GameFontDisable", GREY, "CENTER")
    view.empty:SetPoint("TOP", frame, "TOP", 0, -30)
    view.empty:SetSize(360, 40)
    view.empty:Hide()
    return view
end

function View:Width()
    local w = self.clip:GetWidth()
    if not w or w <= 0 then w = self.frame:GetWidth() - 14 end
    return max(320, w or 320)
end

function View:Height()
    local h = self.clip:GetHeight()
    if not h or h <= 0 then h = self.frame:GetHeight() end
    return max(40, h or 40)
end

--- The height an item needs at the current width.
function View:ItemHeight(entry, width)
    local kind = entry.kind
    if kind == "header" then return HEIGHT.header end
    if kind == "description" then
        return describeHeight(text(entry, "name"), width - 2 * PAD)
    end
    local h = HEIGHT[kind] or 40
    local lines = textLines(text(entry, "desc"), textWidth(width))
    if lines == 0 and kind ~= "range" then return ROW_PLAIN + 6 end
    -- the title, then as many lines of description as it wraps into
    return max(h, 6 + 16 + 2 + lines * TEXT_LINE + 8)
end

--- SetItems(items [, emptyText]): what the view lists; scrolled back to the top.
function View:SetItems(items, emptyText)
    self.items = items or {}
    self.emptyText = emptyText
    self.offset = 0
    hideList()
    self:Layout()
end

--- Layout(): measure every item and draw the part that is on screen.
function View:Layout()
    local width = self:Width()
    local top = 0
    for _, entry in ipairs(self.items) do
        entry.top = top
        entry.height = self:ItemHeight(entry, width)
        top = top + entry.height
    end
    self.total = top
    self.content:SetSize(width, self:Height())
    local most = max(0, top - self:Height())
    self.syncing = true
    self.slider:SetMinMaxValues(0, most)
    if most > 0 then self.slider:Show() else self.slider:Hide() end
    self.syncing = false
    self:ScrollTo(self.offset)
end

--- ScrollTo(pixels): show the items from that offset on, reusing the pooled rows.
function View:ScrollTo(offset)
    local most = max(0, self.total - self:Height())
    offset = max(0, min(most, tonumber(offset) or 0))
    self.offset = offset
    self.syncing = true
    self.slider:SetValue(offset)
    self.syncing = false
    self:Draw()
end

function View:Draw()
    for i = #self.rows, 1, -1 do
        local row = self.rows[i]
        row:Hide()
        row.item, row.entry = nil, nil
        self.pool[#self.pool + 1] = row
        self.rows[i] = nil
    end
    local width, height, offset = self:Width(), self:Height(), self.offset
    for _, entry in ipairs(self.items) do
        local y = entry.top - offset
        if y + entry.height > 0 and y < height then
            local row = table.remove(self.pool) or newRow(self)
            row:ClearAllPoints()
            row:SetPoint("TOPLEFT", self.content, "TOPLEFT", 0, -y)
            row:SetSize(width, entry.height)
            configure(self, row, entry, width)
            row:Show()
            self.rows[#self.rows + 1] = row
        elseif y >= height then
            break
        end
    end
    if #self.items == 0 and self.emptyText then
        self.empty:SetText(self.emptyText)
        self.empty:Show()
    else
        self.empty:Hide()
    end
end

--- Refresh(): the same items, values read again (an option changed somewhere).
function View:Refresh()
    if self.rebuild then
        local items = self.rebuild()
        if items then self.items = items end
    end
    self:Layout()
end

--- Rows() -> the row frames on screen, top to bottom (tests).
function View:Rows() return self.rows end

--- FindRow(key) -> the row on screen that draws option `key`.
function View:FindRow(key)
    for _, row in ipairs(self.rows) do
        if row.entry and row.entry.key == key and row.item then return row end
    end
    return nil
end

local function notify(view)
    local registry = LibStub and LibStub("AceConfigRegistry-3.0", true)
    if registry and view.appName and registry.GetOptionsTable(registry, view.appName) then
        view.notifying = true
        pcall(registry.NotifyChange, registry, view.appName)
        view.notifying = false
    end
end

--- Set(item, value...): validate, confirm when the option asks, set, and redraw.
function View:Set(item, ...)
    local validate = inherit(item, "validate")
    if validate then
        local ok = call(item, "validate", ...)
        if ok ~= true and ok ~= nil then
            if type(ok) == "string" and ns.Log then ns.Log.Print("%s", ok) end
            self:Refresh()
            return false
        end
    end
    call(item, "set", ...)
    notify(self)
    self:Refresh()
    return true
end

local CONFIRM = "PANDAQUEST_OPTION_CONFIRM"

--- Execute(item): an execute button, through its confirmation when it has one.
function View:Execute(item)
    local confirm = inherit(item, "confirm")
    local run = function()
        call(item, "func")
        notify(self)
        self:Refresh()
    end
    if confirm then
        local question = item.option.confirmText or (type(confirm) == "string" and call(item, "confirm"))
        if type(question) ~= "string" then question = text(item, "name") .. "?" end
        return R.Confirm(question, run)
    end
    run()
    return true
end

--- R.Confirm(text, onAccept): the one yes/no dialog every option and the category reset go through.
function R.Confirm(question, onAccept)
    if StaticPopupDialogs and StaticPopup_Show then
        StaticPopupDialogs[CONFIRM] = StaticPopupDialogs[CONFIRM] or {
            text = "%s", button1 = _G.YES or "Yes", button2 = _G.NO or "No",
            timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3,
        }
        StaticPopupDialogs[CONFIRM].OnAccept = function() onAccept() end
        StaticPopup_Show(CONFIRM, question)
        return true
    end
    onAccept()
    return true
end
R.CONFIRM = CONFIRM

--- Watch(view): redraw the view when the options change elsewhere -- a profile switch, a chat command,
-- the game's own Settings panel -- but only while it is on screen.
function R.Watch(view)
    local registry = LibStub and LibStub("AceConfigRegistry-3.0", true)
    if not registry or not registry.RegisterCallback then return end
    registry.RegisterCallback(view, "ConfigTableChange", function(_, appName)
        if appName == view.appName and not view.notifying and view.frame:IsVisible() then view:Refresh() end
    end)
end

R.TEXT_LINE, R.PAD, R.CONTROL_W = TEXT_LINE, PAD, CONTROL_W
