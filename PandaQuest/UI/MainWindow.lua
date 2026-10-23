-- UI/MainWindow.lua: PandaQuest's one window. `/pq` (and the minimap button) opens it.
--
-- The window is the quest browser's frame (UI/QuestBrowser.lua), dressed: a round logo over its top
-- left corner, the title in gold, and tabs along the top -- Quests (the browser, the default), Status,
-- Options, About & Help and Performance -- with the close X at the right. Every tab but Quests is a page
-- of the options table in UI/Options.lua drawn by UI/OptionsRenderer.lua, so the window, the game's
-- Settings panel and `/pq config` all read one definition.
--
-- Options: a category list on the left (with an icon each and a search box over every setting), the
-- category on the right with a Reset Settings button, sub-tabs where it has several groups, and the
-- settings as rows.
--
-- The window is built the first time it is opened, each page the first time its tab is chosen, and only
-- the rows on screen exist (the renderer pools them). It can be moved and resized; its place, size and
-- scale are kept per profile (profile.window, a new key). Escape closes it. Nothing runs while it is
-- hidden: no OnUpdate, no timer.
local _, ns = ...

local M = ns.PQ:GetModule("MainWindow")   -- an AceAddon module (Core/Const.lua)
ns.MainWindow = M

local L = ns.L
local R = ns.OptionsRenderer

local type, pairs, ipairs, tostring, tonumber = type, pairs, ipairs, tostring, tonumber
local max, min, floor = math.max, math.min, math.floor
local format = string.format

-- Where the window is, per profile. A new key: nothing older is moved into it. No width or height
-- until the player resizes the window; the quest browser's own size is the first one.
ns.DEFAULTS.profile.window = { point = "CENTER", relPoint = "CENTER", x = 0, y = 0, scale = 1 }

local LOGO = "Interface\\AddOns\\PandaQuest\\Textures\\logo_round"
local GOLD = { 1.0, 0.82, 0.0 }
local PANEL = { 0.05, 0.05, 0.07, 0.94 }
local EDGE = { 0.36, 0.30, 0.12, 1 }
local SELECTED = { 0.45, 0.35, 0.08, 0.55 }

local TAB_W, TAB_H = 92, 20
local LEFT_W = 214                      -- the Options tab's category column
local CATEGORY_H = 28
local SCALE_MIN, SCALE_MAX = 0.6, 1.4

M.TABS = {
    { key = "quests", name = L["Quests"] },
    { key = "status", name = L["Status"] },
    { key = "options", name = L["Options"] },
    { key = "about", name = L["About & Help"] },
    { key = "performance", name = L["Performance"] },
}

local frame, widgets                    -- the quest browser's frame and widget table, once decorated
local baseW, baseH                      -- the browser's own size: the window's smallest
local tabs, panels = {}, {}
local current = "quests"
local options = { category = nil, sub = 1, search = "" }

local function settings()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return profile and profile.window or ns.DEFAULTS.profile.window
end

local function optionsTable()
    return ns.Options and ns.Options.GetTable and ns.Options.GetTable() or { args = {} }
end

local function appName()
    return ns.Options and ns.Options.APP_NAME or "PandaQuest"
end

---------------------------------------------------------------------------
-- Place, size and scale
---------------------------------------------------------------------------

--- ApplyGeometry(): the window where profile.window says, at its size and scale.
function M.ApplyGeometry()
    if not frame then return end
    local w = settings()
    local scale = tonumber(w.scale) or 1
    scale = max(SCALE_MIN, min(SCALE_MAX, scale))
    -- Never larger than the screen, whatever the game's UI scale (0.64 to 1.15 and beyond): at the
    -- largest UI scale the screen is about 668 units high, and the window's smallest size has to fit.
    local screenW, screenH = UIParent:GetWidth(), UIParent:GetHeight()
    if screenW and screenW > 0 and screenH and screenH > 0 then
        scale = min(scale, screenW / baseW, screenH / baseH)
    end
    frame:SetScale(scale)
    frame:ClearAllPoints()
    frame:SetPoint(w.point or "CENTER", UIParent, w.relPoint or w.point or "CENTER", tonumber(w.x) or 0, tonumber(w.y) or 0)
    local width = max(baseW, tonumber(w.width) or baseW)
    local height = max(baseH, tonumber(w.height) or baseH)
    frame:SetSize(width, height)
end

local function saveGeometry()
    if not frame then return end
    local w = settings()
    local point, _, relPoint, x, y = frame:GetPoint(1)
    if point then
        w.point, w.relPoint = point, relPoint or point
        w.x, w.y = floor((x or 0) + 0.5), floor((y or 0) + 0.5)
    end
    local width, height = frame:GetWidth(), frame:GetHeight()
    if width and width > baseW + 0.5 then w.width = floor(width + 0.5) else w.width = nil end
    if height and height > baseH + 0.5 then w.height = floor(height + 0.5) else w.height = nil end
end
M.SaveGeometry = saveGeometry

--- ResetGeometry(): back in the middle, at the first size and scale 1.
function M.ResetGeometry()
    local w = settings()
    local d = ns.DEFAULTS.profile.window
    w.point, w.relPoint, w.x, w.y, w.scale = d.point, d.relPoint, d.x, d.y, d.scale
    w.width, w.height = nil, nil
    M.ApplyGeometry()
end

---------------------------------------------------------------------------
-- Building blocks
---------------------------------------------------------------------------

local function newPanel()
    local panel = CreateFrame("Frame", nil, frame)
    panel:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -27)
    panel:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -1, 1)
    panel:Hide()
    return panel
end

local function tabButton(parent, label, width, height)
    local b = R.FlatButton(parent, width, height)
    b.underline = R.Bar(b, "ARTWORK", GOLD, 1)
    b.underline:SetPoint("BOTTOMLEFT", b, "BOTTOMLEFT", 2, 0)
    b.underline:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", -2, 0)
    b.underline:SetHeight(2)
    b.underline:Hide()
    b.text:SetText(label)
    b.SetSelected = function(self, on)
        if on then
            self.underline:Show()
            self.text:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
            R.Paint(self.bg, SELECTED)
        else
            self.underline:Hide()
            self.text:SetTextColor(1, 1, 1)
            R.Paint(self.bg, { 0.14, 0.14, 0.17, 0.95 })
        end
    end
    return b
end

-- A page that is one group of the options table: Status, About & Help, Performance.
local function buildPage(key)
    local panel = newPanel()
    local view = R.New(panel, appName())
    view.frame:SetPoint("TOPLEFT", panel, "TOPLEFT", 8, -8)
    view.frame:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -8, 8)
    local group = ns.Options and ns.Options.TAB_GROUPS and ns.Options.TAB_GROUPS[key] or key
    view.rebuild = function() return R.Collect(optionsTable(), { group }, appName()) end
    R.Watch(view)
    panel.view = view
    panel:SetScript("OnShow", function() view:Refresh() end)
    return panel
end

---------------------------------------------------------------------------
-- The Options tab
---------------------------------------------------------------------------

local function categories()
    return ns.Options and ns.Options.Categories and ns.Options.Categories() or {}
end

local function findCategory(key)
    for _, category in ipairs(categories()) do
        if category.key == key then return category end
    end
    return nil
end

local function groupName(key)
    local group = optionsTable().args[key]
    local name = group and group.name
    if type(name) == "function" then name = name({}) end
    return name or key
end

local function drawOptions()
    local panel = panels.options
    if not panel then return end
    local view = panel.view
    for _, button in pairs(panel.categoryButtons) do button:SetSelected(button.category.key == options.category) end
    if options.search ~= "" then
        panel.title:SetText(format(L["Search: %s"], options.search))
        panel.reset:Hide()
        for _, b in ipairs(panel.subtabs) do b:Hide() end
        view.frame:SetPoint("TOPLEFT", panel, "TOPLEFT", LEFT_W + 8, -40)
        local sections = {}
        for _, category in ipairs(categories()) do
            for _, group in ipairs(category.groups) do
                sections[#sections + 1] = { label = category.name .. " - " .. groupName(group), path = { group } }
            end
        end
        local query = options.search
        view.rebuild = function() return R.Search(optionsTable(), sections, query, appName()) end
        view:SetItems(view.rebuild(), L["No setting matches."])
        return
    end
    local category = findCategory(options.category) or categories()[1]
    if not category then return end
    options.category = category.key
    panel.title:SetText(category.name)
    panel.reset:Show()
    local groups = category.groups
    if options.sub > #groups then options.sub = 1 end
    local top = -40
    for i, b in ipairs(panel.subtabs) do
        if #groups > 1 and groups[i] then
            b.text:SetText(groupName(groups[i]))
            b.group = groups[i]
            b:SetSelected(i == options.sub)
            b:Show()
        else
            b:Hide()
        end
    end
    if #groups > 1 then top = -68 end
    view.frame:SetPoint("TOPLEFT", panel, "TOPLEFT", LEFT_W + 8, top)
    local group = groups[options.sub]
    view.rebuild = function() return R.Collect(optionsTable(), { group }, appName()) end
    view:SetItems(view.rebuild())
end

local function buildOptions()
    local panel = newPanel()
    -- the category column
    local column = R.Bar(panel, "BACKGROUND", PANEL)
    column:SetPoint("TOPLEFT", panel, "TOPLEFT", 0, 0)
    column:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT", 0, 0)
    column:SetWidth(LEFT_W)
    local line = R.Bar(panel, "BORDER", EDGE, 0.8)
    line:SetPoint("TOPLEFT", panel, "TOPLEFT", LEFT_W, 0)
    line:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT", LEFT_W, 0)
    line:SetWidth(1)

    local search = CreateFrame("EditBox", "PandaQuestOptionsSearch", panel)
    search:SetSize(LEFT_W - 20, 22)
    search:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    search:SetAutoFocus(false)
    search:SetFontObject("GameFontHighlightSmall")
    search:SetTextInsets(6, 6, 0, 0)
    local searchBg = R.Bar(search, "BACKGROUND", { 0.03, 0.03, 0.045, 1 })
    searchBg:SetAllPoints(search)
    R.Edge(search, EDGE, 0.8)
    search.hint = R.FontString(search, "GameFontDisableSmall", { 0.5, 0.5, 0.5 }, "LEFT")
    search.hint:SetPoint("LEFT", search, "LEFT", 7, 0)
    search.hint:SetSize(LEFT_W - 34, 18)
    search.hint:SetText(L["Search all settings"])
    search:SetScript("OnTextChanged", function(self)
        local textValue = self:GetText() or ""
        if textValue == "" then self.hint:Show() else self.hint:Hide() end
        M.Search(textValue)
    end)
    search:SetScript("OnEscapePressed", function(self) self:SetText(""); self:ClearFocus() end)
    search:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
    panel.search = search

    panel.categoryButtons = {}
    for i, category in ipairs(categories()) do
        local b = CreateFrame("Button", nil, panel)
        b:SetSize(LEFT_W - 20, CATEGORY_H - 2)
        b:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -42 - (i - 1) * CATEGORY_H)
        b.bg = R.Bar(b, "BACKGROUND", SELECTED)
        b.bg:SetAllPoints(b)
        b.edge = R.Edge(b, GOLD, 0.9)
        b.icon = b:CreateTexture(nil, "ARTWORK")
        b.icon:SetTexture(category.icon)
        b.icon:SetSize(20, 20)
        b.icon:SetPoint("LEFT", b, "LEFT", 4, 0)
        if b.icon.SetTexCoord then b.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92) end
        b.text = R.FontString(b, "GameFontHighlight", { 1, 1, 1 }, "LEFT")
        b.text:SetPoint("LEFT", b.icon, "RIGHT", 8, 0)
        b.text:SetSize(LEFT_W - 20 - 36, 18)
        if b.text.SetWordWrap then b.text:SetWordWrap(false) end
        b.text:SetText(category.name)
        local hover = R.Bar(b, "HIGHLIGHT", GOLD, 0.10)
        hover:SetAllPoints(b)
        b.category = category
        b.SetSelected = function(self, on)
            for _, edgeLine in ipairs(self.edge) do if on then edgeLine:Show() else edgeLine:Hide() end end
            if on then self.bg:Show() else self.bg:Hide() end
            self.text:SetTextColor(on and GOLD[1] or 1, on and GOLD[2] or 1, on and GOLD[3] or 1)
        end
        b:SetScript("OnClick", function() M.SelectCategory(category.key) end)
        panel.categoryButtons[category.key] = b
    end

    panel.title = R.FontString(panel, "GameFontNormalLarge", GOLD, "LEFT")
    panel.title:SetPoint("TOPLEFT", panel, "TOPLEFT", LEFT_W + 16, -12)
    panel.title:SetSize(420, 22)
    panel.reset = R.FlatButton(panel, 130, 22)
    panel.reset:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -14, -8)
    panel.reset.text:SetText(L["Reset Settings"])
    panel.reset:SetScript("OnClick", function() M.ResetCategory(options.category) end)

    panel.subtabs = {}
    for i = 1, 4 do
        local b = tabButton(panel, "", 120, 20)
        b:SetPoint("TOPLEFT", panel, "TOPLEFT", LEFT_W + 16 + (i - 1) * 124, -42)
        b:SetScript("OnClick", function() M.SelectSubTab(i) end)
        b:Hide()
        panel.subtabs[i] = b
    end

    local view = R.New(panel, appName())
    view.frame:SetPoint("TOPLEFT", panel, "TOPLEFT", LEFT_W + 8, -40)
    view.frame:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -8, 8)
    R.Watch(view)
    panel.view = view
    panel:SetScript("OnShow", drawOptions)
    return panel
end

--- SelectCategory(key [, sub]): one category of the Options tab (search is cleared).
function M.SelectCategory(key, sub)
    options.category = key
    options.sub = tonumber(sub) or 1
    options.search = ""
    local panel = panels.options
    if panel and panel.search:GetText() ~= "" then panel.search:SetText("") end
    drawOptions()
end

--- SelectSubTab(index): one group of a category that has several.
function M.SelectSubTab(index)
    options.sub = tonumber(index) or 1
    drawOptions()
end

--- Search(text): every setting whose name or description has the text in it; "" goes back.
function M.Search(textValue)
    options.search = tostring(textValue or ""):gsub("^%s+", ""):gsub("%s+$", "")
    drawOptions()
end

--- ResetCategory(key [, confirmed]): the category's settings back to their defaults, after a yes.
function M.ResetCategory(key, confirmed)
    local category = findCategory(key)
    if not category then return false end
    local function reset()
        local changed = ns.Options.ResetGroups(category.groups)
        if ns.Log then ns.Log.Print(L["%s: %d settings back to their defaults."], category.name, changed) end
        drawOptions()
    end
    if confirmed then reset() return true end
    return R.Confirm(format(L["Reset every setting in %s to its default?"], category.name), reset)
end

--- GetOptionsState() -> { category, sub, search, view } (tests).
function M.GetOptionsState()
    local panel = panels.options
    return { category = options.category, sub = options.sub, search = options.search, view = panel and panel.view,
             panel = panel }
end

---------------------------------------------------------------------------
-- Tabs
---------------------------------------------------------------------------

local builders = {
    status = function() return buildPage("status") end,
    about = function() return buildPage("about") end,
    performance = function() return buildPage("performance") end,
    options = buildOptions,
}

--- SelectTab(key): one tab of the window; its page is built the first time.
function M.SelectTab(key)
    if not frame then return false end
    local known = false
    for _, tab in ipairs(M.TABS) do if tab.key == key then known = true end end
    if not known then key = "quests" end
    current = key
    if key ~= "quests" and not panels[key] then panels[key] = builders[key]() end
    if widgets.page then
        if key == "quests" then widgets.page:Show() else widgets.page:Hide() end
    end
    for k, panel in pairs(panels) do
        if k == key then panel:Show() else panel:Hide() end
    end
    for _, tab in ipairs(M.TABS) do
        local b = tabs[tab.key]
        if b then b:SetSelected(tab.key == key) end
    end
    if widgets.title then
        local name = key
        for _, tab in ipairs(M.TABS) do if tab.key == key then name = tab.name end end
        widgets.title:SetText("PandaQuest  -  " .. name)
    end
    R.HideList()
    return true
end

function M.GetTab() return current end
function M.GetPanel(key) return panels[key] end
function M.GetFrame() return frame end
function M.GetTabButton(key) return tabs[key] end
function M.IsBuilt() return frame ~= nil end

--- Open(tab [, group]): the window, on that tab; for Options, on the category that holds `group`.
function M.Open(tab, group)
    local Browser = ns.QuestBrowser
    if not (Browser and Browser.ShowWindow and Browser.ShowWindow()) then return false end
    M.SelectTab(tab or "quests")
    if tab == "options" and group then
        for _, category in ipairs(categories()) do
            for index, g in ipairs(category.groups) do
                if g == group then M.SelectCategory(category.key, index) end
            end
        end
    end
    return true
end

--- Decorate(frame, widgets): called by UI/QuestBrowser.lua once its frame exists. Adds the logo, the
-- tabs, the resize grip and the remembered place; the frame stays the browser's.
function M.Decorate(browserFrame, browserWidgets)
    if frame then return end
    frame, widgets = browserFrame, browserWidgets
    baseW, baseH = frame:GetWidth(), frame:GetHeight()

    -- the round logo, over the top left corner
    local logo = frame:CreateTexture(nil, "OVERLAY")
    logo:SetTexture(LOGO)
    logo:SetSize(52, 52)
    logo:SetPoint("TOPLEFT", frame, "TOPLEFT", -14, 16)
    widgets.logo = logo
    if widgets.title then
        widgets.title:ClearAllPoints()
        widgets.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 46, -6)
    end

    -- tabs along the header, left of the Settings button
    local anchor = widgets.settings or widgets.close
    for i = #M.TABS, 1, -1 do
        local tab = M.TABS[i]
        local b = tabButton(frame, tab.name, TAB_W, TAB_H)
        b:SetPoint("TOPRIGHT", anchor, "TOPLEFT", -4, 1)
        b:SetScript("OnClick", function() M.SelectTab(tab.key) end)
        tabs[tab.key] = b
        anchor = b
    end

    -- moving and resizing, remembered per profile
    frame:SetResizable(true)
    if frame.SetResizeBounds then
        frame:SetResizeBounds(baseW, baseH, 2400, 1600)
    elseif frame.SetMinResize then
        frame:SetMinResize(baseW, baseH)
    end
    local grip = CreateFrame("Button", nil, frame)
    grip:SetSize(16, 16)
    grip:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
    grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    grip:SetScript("OnMouseDown", function() frame:StartSizing("BOTTOMRIGHT") end)
    grip:SetScript("OnMouseUp", function()
        frame:StopMovingOrSizing()
        saveGeometry()
    end)
    widgets.grip = grip
    frame:HookScript("OnDragStop", saveGeometry)
    M.ApplyGeometry()
    M.SelectTab("quests")
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.OnProfileChanged()
    M.ApplyGeometry()
    if panels.options and panels.options:IsVisible() then drawOptions() end
end
