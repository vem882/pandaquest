-- UI/QuestBrowser.lua: browse every quest in the database, like a quest page of a game site.
--
--   /pq quests          open (or close) the window
--
-- `/pq` opens this window: it is PandaQuest's front door. The gear in its header opens the Settings, and
-- every chat command that was about one quest is a button on its page or in a row's right-click menu:
-- navigate to it, hide it from the navigator or show it again, show it on the world map, copy the link
-- to its page on the PandaQuest portal.
--
-- Left: categories (continents, dungeons, raids, classes, professions, events) with counts. Middle: the
-- quests that match the filters, sortable by clicking a column heading. Right: the selected quest as a
-- page: text on a sheet of parchment, who starts and ends it, level, difficulty, side, and a map with the
-- start (!), the end (?) and the objectives marked.
--
-- Quests come from ns.QuestCatalog, which reads ns.DB: PandaQuest's own database plus, when the
-- QuestieDB bridge is on, what that addon adds. The side filter starts as the player's faction, so an
-- Alliance character sees Alliance and neutral quests and a Horde character the Horde's.
--
-- Only plain frames, textures and font strings are used (no templates), so the window needs nothing
-- from the game's UI that the rest of the addon does not already rely on.
--
-- Motion: everything that moves goes through ns.Motion (UI/Motion.lua). The window fades in and rises a
-- few pixels, its three panels arrive one after another the first time, picking a quest crossfades the
-- page and sweeps a glint over its title, the map's pins pop in and the ! and ? breathe while the page is
-- on screen, rows brighten under the mouse and the counter eases to its number. With animations off
-- every one of these is simply its final state, and a hidden window has nothing running at all.
local _, ns = ...

local M = ns.PQ:GetModule("QuestBrowser")   -- an AceAddon module (Core/Const.lua)
ns.QuestBrowser = M

local L = ns.L
local Util, Log, Motion = ns.Util, ns.Log, ns.Motion

local type, pairs, ipairs, tostring, tonumber, next = type, pairs, ipairs, tostring, tonumber, next
local floor, ceil, max, min = math.floor, math.ceil, math.max, math.min
local format = string.format
local tconcat, tsort = table.concat, table.sort

-- Layout ---------------------------------------------------------------------------------------
local WIDTH = 960
local ROW_H, ROWS = 20, 25                 -- list rows (and tree rows: the three panels are one height)
local TREE_ROWS = ROWS
local HEAD_H = 24                          -- the heading strip at the top of the tree and the list
local PANEL_TOP = 78
local PANEL_H = HEAD_H + ROWS * ROW_H + 4
local HEIGHT = PANEL_TOP + PANEL_H + 30    -- the strip under the panels holds the counter
local TREE_X, TREE_W = 12, 190
local LIST_X, LIST_W = 210, 460
local DETAIL_X, DETAIL_W = 678, 270
local PAD = 10                             -- inner margin of the page
local INNER_W = DETAIL_W - 2 * PAD
local MAP_W, MAP_H = INNER_W, 167          -- 1002:668, the proportion of a zone map layer
local MAX_TILES = 20
local MAX_PINS = 60
local PIN_SIZE = 16

-- Text budgets: about as many characters as fit the width of their font string (10 px font, ~5 px a
-- character). The client cuts what still does not fit with "..." because those strings do not wrap.
local NAME_CHARS, ZONE_CHARS = 32, 21
local TREE_CHARS, TREE_SUB_CHARS = 25, 22
local TITLE_CHARS, SUBTITLE_CHARS = 56, 50
local VALUE_CHARS = 38
local TAB_CHARS = 10
local OBJECTIVE_CHARS = 180               -- the paper gave two lines to the second row of buttons

-- Motion ---------------------------------------------------------------------------------------
local OPEN_TIME, CLOSE_TIME, OPEN_RISE = 0.18, 0.12, 8
local PANEL_STEP = 0.06                    -- Motion.Stagger step of the tree, list and page reveal
local PAGE_FADE = 0.15
local PIN_STEP, PIN_POP, MAX_STAGGERED = 0.05, 0.28, 12
local HOVER_TIME, HOVER_ALPHA = 0.12, 0.10
local COUNT_TIME, LIST_TIME = 0.25, 0.12

-- Palette (shared by every PandaQuest window) ------------------------------------------------------
local GOLD = { 1.0, 0.82, 0.0 }
local TEXT = { 0.90, 0.90, 0.90 }
local MUTED = { 0.62, 0.62, 0.66 }
local PANEL = { 0.05, 0.05, 0.07, 0.94 }
local HEADER = { 0.12, 0.10, 0.05, 1 }
local EDGE = { 0.36, 0.30, 0.12, 1 }
local ALLIANCE = { 0.25, 0.50, 1.0 }
local HORDE = { 0.85, 0.20, 0.20 }
local PARCHMENT = { 0.78, 0.67, 0.46, 1 }
local INK = { 0.16, 0.11, 0.05 }
local WINDOW_BG = { 0.07, 0.07, 0.10, 0.97 }
local TOOLBAR_BG = { 0.09, 0.09, 0.12, 1 }
local FIELD_BG = { 0.03, 0.03, 0.045, 1 }
local BUTTON_BG = { 0.14, 0.14, 0.17, 0.95 }
local BUTTON_ON = { 0.45, 0.35, 0.08, 1 }

local frame, built
local filter = { kinds = {} }
local sortKey, sortDescending = "level", false
local results = {}
local selectedId
local treeData, treeRows, expandedKey = {}, {}, nil
local scrollOffset, treeOffset = 0, 0
local widgets = {}
local mapAreas = {}
local closing, revealed = false, false     -- fading out; the three panels have already arrived once
local pulsing = {}                         -- pins that are breathing right now
local shownCount                           -- the number the counter is displaying

local KIND_LABELS = {
    dungeon = "Dungeon", raid = "Raid", group = "Group", pvp = "PvP", daily = "Daily", event = "Event",
}
local SIDE_ORDER = { "mine", "alliance", "horde", "both" }
local SIDE_LABELS = { mine = "My side", alliance = "Alliance", horde = "Horde", both = "Both" }

-- The order the pins of a page arrive in: where it starts, where it ends, then what it asks for.
local PIN_RANK = { available = 1, complete = 2, node = 3 }

---------------------------------------------------------------------------
-- Small helpers
---------------------------------------------------------------------------

local function catalog() return ns.QuestCatalog end

--- browserOption(key) -> the profile's browser.<key>; on until a profile says otherwise.
-- questText: the quest giver's text under the objectives. rewards: the money and the reward items the
-- PandaQuest portal read off Wowhead. Both are read every time a page is drawn.
local function browserOption(key)
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    local browser = profile and profile.browser
    if type(browser) ~= "table" then return true end
    return browser[key] ~= false
end

local function playerSide()
    local Catalog = catalog()
    return Catalog and Catalog.PlayerSide and Catalog.PlayerSide() or nil
end

local function effectiveSide(choice)
    if choice == "alliance" or choice == "horde" then return choice end
    if choice == "both" then return nil end
    return playerSide()                 -- "mine": nil (everything) for a Pandaren who has not chosen
end

local function sideText(side)
    if side == "alliance" then return L["Alliance"] end
    if side == "horde" then return L["Horde"] end
    return L["both factions"]
end

-- Questie writes -1 (and the database 0) for a quest whose level follows the player's: it scales.
local function scales(level)
    return type(level) ~= "number" or level <= 0
end

local function playerLevel()
    local level = UnitLevel and UnitLevel("player")
    return (type(level) == "number" and level > 0) and level or 1
end

--- The level a quest is played at: its own, or the player's when it scales.
local function effectiveLevel(level)
    if scales(level) then return playerLevel() end
    return level
end

local function colorHex(level)
    return Util.QuestDifficultyColorHex(effectiveLevel(level)):sub(3)
end

--- The level as the list and the page write it: the number, or "Scales" for a scaling quest.
local function levelText(level)
    local hex = colorHex(level)
    if scales(level) then return format("|c%s%s|r", "ff" .. hex:sub(1, 6), L["Scales"]) end
    return format("|c%s%d|r", "ff" .. hex:sub(1, 6), level)
end
M.LevelText = levelText

local function setColor(fontString, color)
    fontString:SetTextColor(color[1], color[2], color[3], color[4] or 1)
end

local function sideColor(side)
    if side == "alliance" then return ALLIANCE end
    if side == "horde" then return HORDE end
    return nil
end

local function ownerOf(object, suffix)
    return tostring(object) .. ":" .. suffix
end

--- newText(parent, font, point, x, y, width, height, justify, color, lines) -> FontString
-- Every string of the window has a width and a height. One line does not wrap: the client ends it with
-- "..." where it runs out of room. More lines wrap and stop at `lines`.
local function newText(parent, font, point, x, y, width, height, justify, color, lines)
    local fs = parent:CreateFontString(nil, "OVERLAY", font or "GameFontHighlightSmall")
    fs:SetPoint(point or "TOPLEFT", parent, point or "TOPLEFT", x or 0, y or 0)
    fs:SetSize(width, height)
    fs:SetJustifyH(justify or "LEFT")
    fs:SetJustifyV("MIDDLE")
    lines = lines or 1
    if fs.SetWordWrap then fs:SetWordWrap(lines > 1) end
    if lines > 1 and fs.SetMaxLines then fs:SetMaxLines(lines) end
    if color then setColor(fs, color) end
    return fs
end

local function fillColor(texture, r, g, b, a)
    if texture.SetColorTexture then
        texture:SetColorTexture(r, g, b, a or 1)
    else
        texture:SetTexture("Interface\\Buttons\\WHITE8X8")
        texture:SetVertexColor(r, g, b, a or 1)
    end
end

local function paint(texture, color, alpha)
    fillColor(texture, color[1], color[2], color[3], alpha or color[4] or 1)
end

--- A 1 px border of four textures on the frame's own border layer.
local function addEdge(f, color, alpha)
    local lines = {}
    local function line(from, to, width, height)
        local t = f:CreateTexture(nil, "BORDER")
        t:SetPoint(from, f, from, 0, 0)
        t:SetPoint(to, f, to, 0, 0)
        if width then t:SetWidth(width) end
        if height then t:SetHeight(height) end
        paint(t, color, alpha)
        return t
    end
    lines[1] = line("TOPLEFT", "TOPRIGHT", nil, 1)
    lines[2] = line("BOTTOMLEFT", "BOTTOMRIGHT", nil, 1)
    lines[3] = line("TOPLEFT", "BOTTOMLEFT", 1, nil)
    lines[4] = line("TOPRIGHT", "BOTTOMRIGHT", 1, nil)
    return lines
end

local function paintEdge(lines, color, alpha)
    for _, t in ipairs(lines) do paint(t, color, alpha) end
end

--- A solid rectangle.
local function newBar(parent, layer, color, alpha)
    local t = parent:CreateTexture(nil, layer or "BACKGROUND")
    paint(t, color, alpha)
    return t
end

--- An inset panel: dark fill, 1 px edge.
local function newPanel(parent, color, edge)
    local f = CreateFrame("Frame", nil, parent)
    local bg = f:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(f)
    paint(bg, color)
    f.bg = bg
    if edge then f.edge = addEdge(f, edge) end
    return f
end

--- A tooltip goes away with the frame that owns it. The client sends no OnLeave to a frame that hid under
-- the mouse (a closed window, a quest picked with the cursor still over a tab), so it would stay up.
local function dropTooltip(owner)
    if GameTooltip and GameTooltip.IsOwned and GameTooltip:IsOwned(owner) then GameTooltip:Hide() end
end

--- Hover: a white sheet over `host` that brightens (an alpha tween, not an instant swap) while the
-- mouse is on `target`. It is put away again when `target` hides.
local function attachHover(target, host, peak)
    local sheet = host:CreateTexture(nil, "ARTWORK")
    sheet:SetAllPoints(host)
    fillColor(sheet, 1, 1, 1, 1)
    sheet:SetAlpha(0)
    target.hover = sheet
    local owner = ownerOf(sheet, "hover")
    local function glide(to)
        Motion.Tween{ owner = owner, duration = HOVER_TIME, from = sheet:GetAlpha() or 0, to = to, ease = "outQuad",
            apply = function(v) sheet:SetAlpha(v) end }
    end
    target.glide = glide
    target:SetScript("OnEnter", function() glide(peak or HOVER_ALPHA) end)
    target:SetScript("OnLeave", function() glide(0) end)
    target:SetScript("OnHide", function(self)
        Motion.Cancel(owner)
        sheet:SetAlpha(0)
        dropTooltip(self)
    end)
end

--- A flat text button: label, hover glow, click handler.
local function newButton(parent, label, width, height, onClick, flat)
    local b = CreateFrame("Button", nil, parent)
    b:SetSize(width, height)
    local bg = b:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(b)
    if flat then paint(bg, BUTTON_BG, 0) else paint(bg, BUTTON_BG) end
    b.bg = bg
    if not flat then b.edge = addEdge(b, EDGE, 0.55) end
    attachHover(b, b, HOVER_ALPHA)
    b.text = newText(b, "GameFontHighlightSmall", "CENTER", 0, 0, width - 6, height - 2, "CENTER")
    b.text:SetText(label or "")
    b:SetScript("OnClick", onClick)
    b.SetActive = function(self, active)
        paint(self.bg, active and BUTTON_ON or BUTTON_BG)
    end
    return b
end

--- A one-line input box with a thin edge that turns gold while it has the keyboard.
local function newInput(parent, name, x, y, width, numeric)
    local box = CreateFrame("EditBox", name, parent)
    box:SetSize(width, 20)
    box:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    box:SetAutoFocus(false)
    box:SetFontObject("GameFontHighlightSmall")
    box:SetTextInsets(5, 5, 0, 0)
    local bg = box:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(box)
    paint(bg, FIELD_BG)
    local edge = addEdge(box, EDGE, 0.7)
    if numeric then
        box:SetNumeric(true)
        box:SetMaxLetters(3)
        box:SetJustifyH("CENTER")
    end
    box:SetScript("OnEditFocusGained", function() paintEdge(edge, GOLD, 0.9) end)
    box:SetScript("OnEditFocusLost", function() paintEdge(edge, EDGE, 0.7) end)
    box:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    box:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
    return box
end

---------------------------------------------------------------------------
-- Data -> view
---------------------------------------------------------------------------

local function currentFilter()
    local f = { kinds = filter.kinds, text = filter.text, category = filter.category, zone = filter.zone }
    f.minLevel, f.maxLevel = filter.minLevel, filter.maxLevel
    f.side = effectiveSide(filter.sideChoice or "mine")
    if filter.myLevel then
        local Player = ns.Player
        f.playerLevel = Player and Player.GetLevel and Player.GetLevel() or nil
    end
    return f
end

local function treeFilter()
    -- The tree counts what the filters leave, except the category choice itself.
    local f = currentFilter()
    f.category, f.zone = nil, nil
    local Catalog = catalog()
    return function(record) return Catalog.Matches(record, f) end
end

local refreshList, refreshTree, refreshDetail

local function runQuery()
    local Catalog = catalog()
    results = Catalog.Query(currentFilter(), sortKey, sortDescending)
    scrollOffset = 0
    if refreshList then refreshList(true) end
end

local function rebuildTree()
    local Catalog = catalog()
    treeData = Catalog.GetTree(treeFilter())
    treeRows = {}
    treeRows[#treeRows + 1] = { key = nil, label = L["All quests"], count = Catalog.Count(), top = true }
    for _, entry in ipairs(treeData) do
        treeRows[#treeRows + 1] = { key = entry.key, label = entry.name, count = entry.count, top = true,
            expandable = #entry.zones > 0 }
        if expandedKey == entry.key then
            for _, z in ipairs(entry.zones) do
                treeRows[#treeRows + 1] = { key = entry.key, zone = z.key, label = z.name or tostring(z.key),
                    count = z.count }
            end
        end
    end
    if refreshTree then refreshTree() end
end

local function refreshAll()
    runQuery()
    rebuildTree()
end

---------------------------------------------------------------------------
-- Motion
---------------------------------------------------------------------------

--- Is there a page on screen that may animate?
local function pageVisible()
    local d = widgets.detail
    return frame ~= nil and frame:IsVisible() and not closing and d ~= nil and d.panel:IsShown()
end

local function canAnimate()
    return Motion.IsEnabled() and frame ~= nil and frame:IsVisible() and not closing
end

local function stopPulses()
    for i = #pulsing, 1, -1 do
        Motion.StopPulse(pulsing[i])
        pulsing[i] = nil
    end
end

--- The ! and ? breathe; nothing else does. Off with animations off.
local function pulsePin(pin)
    if not Motion.IsEnabled() then return end
    if pin.kind ~= "available" and pin.kind ~= "complete" then return end
    if Motion.IsRunning(ownerOf(pin, "pulse")) then return end
    Motion.Pulse(pin, 0.55, 1, 1.6)
    pulsing[#pulsing + 1] = pin
end

--- A pin arrives: it is invisible until its turn, then grows from a fraction of its size with a small
-- overshoot (Motion.Pop) while it fades up; a ! or ? then starts to breathe.
local function popPin(pin, delay)
    pin:SetSize(PIN_SIZE, PIN_SIZE)
    pin:SetAlpha(0)
    Motion.Pop(pin, 0.35, PIN_POP, delay)
    Motion.Tween{ owner = ownerOf(pin, "arrive"), duration = PIN_POP * 0.5, delay = delay, from = 0, to = 1,
        ease = "outQuad",
        apply = function(v) pin:SetAlpha(v) end,
        onDone = function()
            if pageVisible() then pulsePin(pin) end
        end }
end

--- Stop everything a pin was doing and put it back at full size.
local function resetPin(pin)
    Motion.Cancel(ownerOf(pin, "pop"))
    Motion.Cancel(ownerOf(pin, "arrive"))
    Motion.StopPulse(pin)
    pin:SetSize(PIN_SIZE, PIN_SIZE)
    pin:SetAlpha(1)
end

local function clearPins()
    local map = widgets.map
    if not (map and map.pins) then return end
    stopPulses()
    for _, pin in ipairs(map.pins) do
        resetPin(pin)
        pin:Hide()
    end
end

--- The pins just drawn arrive one after another, the quest's start first. Only the first
-- MAX_STAGGERED are spread out; the rest share the last one's moment.
local function revealPins()
    local map = widgets.map
    if not (map and map.pins) then return end
    local order = {}
    for index, pin in ipairs(map.pins) do
        if pin:IsShown() then order[#order + 1] = { pin = pin, rank = (PIN_RANK[pin.kind] or 4) * 1000 + index } end
    end
    tsort(order, function(a, b) return a.rank < b.rank end)
    local animate = canAnimate()
    for n, item in ipairs(order) do
        if animate then
            popPin(item.pin, Motion.Stagger(min(n, MAX_STAGGERED), PIN_STEP))
        else
            resetPin(item.pin)
        end
    end
end

--- The window is on screen again: the pins of the page that was open start breathing again. A pin that
-- is still arriving is left to its own tween, which starts the breathing when it lands.
local function resumePulses()
    local map = widgets.map
    if not (map and map.pins) or not pageVisible() then return end
    for _, pin in ipairs(map.pins) do
        if pin:IsShown() and not Motion.IsRunning(ownerOf(pin, "arrive")) then pulsePin(pin) end
    end
end

--- The page changed under the mouse: the new content fades up from nearly nothing and a glint crosses
-- the title.
local function crossfadePage()
    local d = widgets.detail
    local owner = ownerOf(d.panel, "alpha")
    if not canAnimate() then
        Motion.Cancel(owner)
        d.panel:SetAlpha(1)
        return
    end
    Motion.Tween{ owner = owner, duration = PAGE_FADE, from = 0.15, to = 1, ease = "outQuad",
        apply = function(v) d.panel:SetAlpha(v) end }
    Motion.Sheen(d.titleFrame, 0.6, 0.05)
end

--- The list's rows settle after a filter or a sort changed them.
local function easeList()
    local host = widgets.rowHost
    if not host then return end
    local owner = "pqbrowser:list"
    if not canAnimate() then
        Motion.Cancel(owner)
        host:SetAlpha(1)
        return
    end
    Motion.Tween{ owner = owner, duration = LIST_TIME, from = 0.7, to = 1, ease = "outQuad",
        apply = function(v) host:SetAlpha(v) end }
end

--- The "N quests" counter counts to its number instead of jumping.
local function setCount(total)
    local fs = widgets.count
    if not fs then return end
    local owner = "pqbrowser:count"
    if shownCount == nil or shownCount == total or not canAnimate() then
        Motion.Cancel(owner)
        shownCount = total
        fs:SetText(format(L["%d quests"], total))
        return
    end
    Motion.Tween{ owner = owner, duration = COUNT_TIME, from = shownCount, to = total, ease = "outCubic",
        apply = function(v)
            shownCount = floor(v + 0.5)
            fs:SetText(format(L["%d quests"], shownCount))
        end }
end

--- Whatever is half way when the window goes away is finished, so the next time it opens from true
-- states, and nothing is left running for a window nobody sees.
local function settleMotion()
    if not frame then return end
    stopPulses()
    Motion.Cancel(ownerOf(frame, "rise"), true)
    Motion.Cancel(ownerOf(frame, "alpha"), true)
    frame:SetAlpha(1)
    for _, panel in ipairs({ widgets.treePanel, widgets.listPanel, widgets.detailPanel }) do
        Motion.Cancel(ownerOf(panel, "rise"), true)
        Motion.Cancel(ownerOf(panel, "alpha"), true)
    end
    local d = widgets.detail
    if d then
        Motion.Cancel(ownerOf(d.panel, "alpha"), true)
        Motion.Cancel(ownerOf(d.titleFrame, "sheen"), true)
        d.panel:SetAlpha(1)
    end
    local map = widgets.map
    if map and map.pins then
        for _, pin in ipairs(map.pins) do
            Motion.Cancel(ownerOf(pin, "pop"), true)
            Motion.Cancel(ownerOf(pin, "arrive"), true)
        end
    end
    Motion.Cancel("pqbrowser:list", true)
    Motion.Cancel("pqbrowser:count", true)
    stopPulses()
end

--- The three panels arrive one after another: the tree, the list, the page.
local function revealPanels()
    local panels = { widgets.treePanel, widgets.listPanel, widgets.detailPanel }
    for index, panel in ipairs(panels) do
        local delay = Motion.Stagger(index, PANEL_STEP)
        Motion.FadeIn(panel, OPEN_TIME, delay)
        Motion.Rise(panel, -6, OPEN_TIME + 0.04, delay)
    end
end

--- The window appears: it fades in and rises a few pixels. Opening again while it is still fading out
-- turns it round from where it is.
local function openFrame(f)
    if f:IsShown() and not closing then return end
    local wasClosing = closing
    local from = closing and (f:GetAlpha() or 1) or 0
    closing = false
    Motion.Cancel(ownerOf(f, "rise"), true)
    f:SetAlpha(from)
    f:Show()
    -- the frame never hid, so the client sends no OnShow: the breathing that stopped when the close began
    -- has to be picked up here
    if wasClosing then resumePulses() end
    Motion.Tween{ owner = ownerOf(f, "alpha"), duration = OPEN_TIME, from = from, to = 1, ease = "outQuad",
        apply = function(v) f:SetAlpha(v) end }
    Motion.Rise(f, -OPEN_RISE, OPEN_TIME)
    if not revealed then
        revealed = true
        revealPanels()
    end
end

---------------------------------------------------------------------------
-- Category tree
---------------------------------------------------------------------------

function refreshTree()
    if not frame then return end
    local rows = widgets.treeRows
    local maxOffset = max(0, #treeRows - TREE_ROWS)
    treeOffset = min(treeOffset, maxOffset)
    for i = 1, TREE_ROWS do
        local row, data = rows[i], treeRows[treeOffset + i]
        if data then
            row.data = data
            row.text:SetText(Util.Truncate(data.label or "", data.top and TREE_CHARS or TREE_SUB_CHARS))
            row.count:SetText(tostring(data.count or 0))
            local selected = (filter.category == data.key and filter.zone == data.zone)
                and (data.key ~= nil or (filter.category == nil))
            row.text:ClearAllPoints()
            if data.top then
                row.text:SetPoint("LEFT", row, "LEFT", 8, 0)
                row.text:SetWidth(128)
                setColor(row.text, selected and { 1, 1, 1 } or GOLD)
            else
                row.text:SetPoint("LEFT", row, "LEFT", 20, 0)
                row.text:SetWidth(116)
                setColor(row.text, selected and { 1, 1, 1 } or TEXT)
            end
            row.sel:SetShown(selected and true or false)
            row.accent:SetShown(selected and true or false)
            row:Show()
        else
            row.data = nil
            row:Hide()
        end
    end
end

local function onTreeClick(row)
    local data = row.data
    if not data then return end
    if data.top then
        if data.key and data.expandable then
            expandedKey = (expandedKey ~= data.key) and data.key or nil
        end
        filter.category, filter.zone = data.key, nil
    else
        filter.category, filter.zone = data.key, data.zone
    end
    refreshAll()
end

---------------------------------------------------------------------------
-- Quest list
---------------------------------------------------------------------------

function refreshList(changed)
    if not frame then return end
    local Catalog = catalog()
    local rows = widgets.rows
    local total = #results
    local maxOffset = max(0, total - ROWS)
    scrollOffset = min(max(scrollOffset, 0), maxOffset)
    for i = 1, ROWS do
        local row, record = rows[i], results[scrollOffset + i]
        if record then
            row.questId = record.id
            local selected = record.id == selectedId
            row.name:SetText(Util.Truncate(record.name, NAME_CHARS))
            setColor(row.name, selected and GOLD or TEXT)
            row.zone:SetText(Util.Truncate(Catalog.ZoneLabel(nil, record.area) or "", ZONE_CHARS))
            row.level:SetText(levelText(record.level))
            row.req:SetText(record.minLevel > 0 and tostring(record.minLevel) or "-")
            row.xp:SetText(record.xp and tostring(record.xp) or "")
            local color = sideColor(record.side)
            if color then paint(row.side, color) end
            row.side:SetShown(color ~= nil)
            row.sel:SetShown(selected)
            row.accent:SetShown(selected)
            row:Show()
        else
            row.questId = nil
            row:Hide()
        end
    end
    setCount(total)
    if changed then easeList() end
    if widgets.slider then
        widgets.sliderUpdating = true
        widgets.slider:SetMinMaxValues(0, maxOffset)
        widgets.slider:SetValue(scrollOffset)
        widgets.sliderUpdating = false
    end
    if widgets.emptyText then
        if total == 0 then
            local ready = Catalog.IsReady()
            widgets.emptyText:SetText(ready and L["No quest matches these filters."] or L["Reading the quest database..."])
            widgets.emptyText:Show()
            widgets.emptyHint:SetShown(ready)
            widgets.emptyIcon:SetShown(ready)
        else
            widgets.emptyText:Hide()
            widgets.emptyHint:Hide()
            widgets.emptyIcon:Hide()
        end
    end
    for key, button in pairs(widgets.sortButtons) do
        local suffix = ""
        if key == sortKey then suffix = sortDescending and " v" or " ^" end
        button.text:SetText(button.label .. suffix)
        setColor(button.text, key == sortKey and { 1, 1, 1 } or GOLD)
    end
end

local function selectQuest(questId)
    local changed = questId ~= selectedId
    selectedId = questId
    refreshList()
    if refreshDetail then refreshDetail(changed) end
end
M.Select = selectQuest

---------------------------------------------------------------------------
-- Detail page
---------------------------------------------------------------------------

local function npcName(id)
    local DB = ns.DB
    return DB.GetNpcName and DB.GetNpcName(id) or ("NPC " .. tostring(id))
end

local function objectName(id)
    local DB = ns.DB
    return DB.GetObjectName and DB.GetObjectName(id) or ("Object " .. tostring(id))
end

local function firstSpawn(spawns)
    if type(spawns) ~= "table" then return nil end
    local areaID, list = next(spawns)
    if not areaID or type(list) ~= "table" then return nil end
    local best, bestArea = list[1], areaID
    -- prefer an area with real coordinates (areaID > 0)
    for area, points in pairs(spawns) do
        if type(area) == "number" and area > 0 and type(points) == "table" and points[1] then
            return points[1], area
        end
    end
    return best, bestArea
end

--- Who starts or ends the quest, as { {kind=, id=, name=, area=, x=, y=}, ... }.
local function endpoints(quest, side)
    local DB = ns.DB
    local out = {}
    local list = quest[side].npcs
    if type(list) == "table" then
        for _, id in ipairs(list) do
            local npc = DB.GetNpc(id)
            local point, area = firstSpawn(npc and npc.spawns)
            out[#out + 1] = { kind = "npc", id = id, name = npcName(id), area = area,
                x = point and point[1], y = point and point[2] }
        end
    end
    list = quest[side].objects
    if type(list) == "table" then
        for _, id in ipairs(list) do
            local object = DB.GetObject(id)
            local point, area = firstSpawn(object and object.spawns)
            out[#out + 1] = { kind = "object", id = id, name = objectName(id), area = area,
                x = point and point[1], y = point and point[2] }
        end
    end
    local items = side == "startedBy" and quest.startedBy.items
    if type(items) == "table" then
        for _, id in ipairs(items) do
            out[#out + 1] = { kind = "item", id = id, name = (ns.DB.GetItemName and ns.DB.GetItemName(id)) or tostring(id) }
        end
    end
    return out
end

--- The Start / End text: two lines at most. A lone giver gets its name and, below it, its zone and
-- coordinates; several givers get one line each (name and coordinates), and "+N" for the ones left out.
local function pointText(entries)
    if #entries == 0 then return "-" end
    local Catalog = catalog()
    local lines = {}
    if #entries == 1 then
        local e = entries[1]
        lines[1] = Util.Truncate(e.name, VALUE_CHARS)
        if e.x and e.y then
            local zone = e.area and (Catalog.ZoneLabel(nil, e.area) or "") or ""
            if zone ~= "" then zone = Util.Truncate(zone, 24) .. " " end
            lines[2] = format("|cffa0a0a0%s%.1f, %.1f|r", zone, e.x, e.y)
        end
    else
        for i = 1, min(#entries, 2) do
            local e = entries[i]
            if e.x and e.y then
                lines[i] = format("%s |cffa0a0a0%.1f, %.1f|r", Util.Truncate(e.name, 22), e.x, e.y)
            else
                lines[i] = Util.Truncate(e.name, VALUE_CHARS)
            end
        end
        if #entries > 2 then lines[2] = lines[2] .. format(" |cffa0a0a0+%d|r", #entries - 2) end
    end
    return tconcat(lines, "\n")
end

--- Difficulty: the player levels at which the quest turns yellow, green and grey.
-- Blizzard's own colour rule (GetQuestDifficultyColor): yellow from 2 levels below the quest's, green
-- from 3 above, grey beyond the green range, which the client reports for the player's level.
--- The reputation a quest gives, "+5 The Tillers": Questie's {factionID, amount} with the faction named
-- the way the client names it; an id the client does not know stays readable as an id.
local function factionName(factionID)
    if type(factionID) ~= "number" then return tostring(factionID) end
    local name = ns.Compat.GetFactionInfoByID(factionID)
    if type(name) == "string" and name ~= "" then return name end
    return format(L["faction %d"], factionID)
end

local function reputationText(entry)
    return format("%+d %s", tonumber(entry[2]) or 0, factionName(tonumber(entry[1]) or entry[1]))
end
M.ReputationText = reputationText

local function difficultyText(level)
    level = effectiveLevel(level)
    if type(level) ~= "number" or level <= 0 then return "-" end
    local range = ns.Compat.GetQuestGreenRange()
    if not range or range <= 0 then range = 5 end
    return format("|cffffff00%d|r  |cff40c040%d|r  |cff808080%d|r",
        max(1, level - 2), level + 3, level + range + 1)
end

-- Map preview ---------------------------------------------------------------------------------

local function ensureMapTiles()
    local map = widgets.map
    if map.tiles then return end
    map.tiles = {}
    for i = 1, MAX_TILES do
        -- Sub-level 1: above the map's brown ground (sub-level -8). Two textures in one draw layer and
        -- sub-level are drawn in no fixed order, and the client re-sorts them whenever the page changes
        -- (the crossfade's alpha, a pin popping in), so tiles at the ground's own sub-level showed for a
        -- frame and then vanished under it.
        local t = map:CreateTexture(nil, "BACKGROUND", nil, 1)
        t:Hide()
        map.tiles[i] = t
    end
    map.pins = {}
    for i = 1, MAX_PINS do
        local p = map:CreateTexture(nil, "OVERLAY")
        p:SetSize(PIN_SIZE, PIN_SIZE)
        p:Hide()
        map.pins[i] = p
    end
end

local function drawMapArt(uiMapID)
    local map = widgets.map
    for _, t in ipairs(map.tiles) do t:Hide() end
    map.fallback:Show()
    if not (uiMapID and C_Map and C_Map.GetMapArtLayers and C_Map.GetMapArtLayerTextures) then return end
    local layers = C_Map.GetMapArtLayers(uiMapID)
    local layer = layers and layers[1]
    local textures = C_Map.GetMapArtLayerTextures(uiMapID, 1)
    if not (layer and textures and next(textures)) then return end
    local cols = ceil(layer.layerWidth / layer.tileWidth)
    local rows = ceil(layer.layerHeight / layer.tileHeight)
    if cols * rows > MAX_TILES then return end
    local tileW, tileH = MAP_W / cols, MAP_H / rows
    local n = 0
    for row = 1, rows do
        for col = 1, cols do
            n = n + 1
            local tile = map.tiles[n]
            tile:ClearAllPoints()
            tile:SetPoint("TOPLEFT", map, "TOPLEFT", (col - 1) * tileW, -(row - 1) * tileH)
            tile:SetSize(tileW + 0.5, tileH + 0.5)
            tile:SetTexture(textures[(row - 1) * cols + col])
            tile:Show()
        end
    end
    map.fallback:Hide()
end

local function placePin(map, index, kind, x, y)
    local pin = map.pins[index]
    if not pin or type(x) ~= "number" or type(y) ~= "number" then return false end
    local Icons = ns.Icons
    pin.kind = kind
    pin:SetTexture(Icons.Get(kind))
    pin:ClearAllPoints()
    pin:SetPoint("CENTER", map, "TOPLEFT", (x / 100) * MAP_W, -(y / 100) * MAP_H)
    pin:Show()
    return true
end

local function drawMapPins(quest, area)
    local map = widgets.map
    clearPins()
    local n = 0
    local function add(kind, point, pointArea)
        if pointArea == area and n < MAX_PINS and point then
            if placePin(map, n + 1, kind, point[1], point[2]) then n = n + 1 end
        end
    end
    local DB = ns.DB
    local function spawnsOf(getter, id, kind)
        local entity = getter(id)
        local spawns = entity and entity.spawns
        local points = type(spawns) == "table" and spawns[area]
        if type(points) == "table" then
            for _, point in ipairs(points) do add(kind, point, area) end
        end
    end
    -- objectives first, so the ! and ? are drawn above them
    for _, o in ipairs(quest.objectives and quest.objectives.creatures or {}) do spawnsOf(DB.GetNpc, o.id, "node") end
    for _, o in ipairs(quest.objectives and quest.objectives.objects or {}) do spawnsOf(DB.GetObject, o.id, "node") end
    if quest.triggerEnd and type(quest.triggerEnd.coords) == "table" then
        local points = quest.triggerEnd.coords[area]
        if type(points) == "table" then for _, point in ipairs(points) do add("node", point, area) end end
    end
    for _, id in ipairs(quest.finishedBy.npcs or {}) do spawnsOf(DB.GetNpc, id, "complete") end
    for _, id in ipairs(quest.finishedBy.objects or {}) do spawnsOf(DB.GetObject, id, "complete") end
    for _, id in ipairs(quest.startedBy.npcs or {}) do spawnsOf(DB.GetNpc, id, "available") end
    for _, id in ipairs(quest.startedBy.objects or {}) do spawnsOf(DB.GetObject, id, "available") end
end

local function collectAreas(quest)
    local areas, seen = {}, {}
    local DB = ns.DB
    local function note(entity)
        local spawns = entity and entity.spawns
        if type(spawns) ~= "table" then return end
        for area, points in pairs(spawns) do
            if type(area) == "number" and area > 0 and type(points) == "table" and points[1] and not seen[area] then
                seen[area] = true
                areas[#areas + 1] = area
            end
        end
    end
    for _, id in ipairs(quest.startedBy.npcs or {}) do note(DB.GetNpc(id)) end
    for _, id in ipairs(quest.startedBy.objects or {}) do note(DB.GetObject(id)) end
    for _, id in ipairs(quest.finishedBy.npcs or {}) do note(DB.GetNpc(id)) end
    for _, id in ipairs(quest.finishedBy.objects or {}) do note(DB.GetObject(id)) end
    -- the quest's own zone first, when one of its spawns is in it
    local own = quest.zoneOrSort
    if seen[own] then
        for i, area in ipairs(areas) do
            if area == own and i > 1 then
                table.remove(areas, i)
                table.insert(areas, 1, own)
                break
            end
        end
    end
    if #areas > 4 then for i = #areas, 5, -1 do areas[i] = nil end end
    return areas
end

local function showMapArea(quest, index)
    local Zones = ns.Zones
    local area = mapAreas[index]
    local map = widgets.map
    ensureMapTiles()
    for i, button in ipairs(widgets.areaTabs) do
        if mapAreas[i] then
            local full = Zones.GetAreaName(mapAreas[i])
            button.fullName = full
            button:Show()
            button.text:SetText(Util.Truncate(full, TAB_CHARS))
            button:SetActive(i == index)
        else
            button:Hide()
        end
    end
    if not area then
        drawMapArt(nil)
        clearPins()
        map.fallbackText:SetText(L["No location is known for this quest."])
        return
    end
    map.fallbackText:SetText(Util.Truncate(Zones.GetAreaName(area), 40))
    drawMapArt(Zones.GetUiMapIdByAreaId(area))
    drawMapPins(quest, area)
    revealPins()
end

--- refreshDetail(animate): fill the page for the selected quest. `animate` is true when it is a
-- different quest from the one that was showing, which is when the page crossfades.
function refreshDetail(animate)
    if not frame then return end
    local d = widgets.detail
    local DB = ns.DB
    local quest = selectedId and DB.GetQuest(selectedId)
    if not quest then
        Motion.Cancel(ownerOf(d.panel, "alpha"))
        Motion.Cancel(ownerOf(d.titleFrame, "sheen"), true)
        d.panel:SetAlpha(1)
        clearPins()
        d.panel:Hide()
        d.hint:Show()
        return
    end
    local wasShown = d.panel:IsShown()
    d.hint:Hide()
    d.panel:Show()

    d.title:SetText(Util.Truncate(quest.name or ("Quest " .. selectedId), TITLE_CHARS))
    local side = ns.QuestCatalog.SideOf(quest.requiredRaces)
    if scales(quest.questLevel) then
        d.subtitle:SetText(Util.Truncate(format(L["A quest that scales with your level, for %s, from level %d."],
            sideText(side), max(1, quest.requiredLevel or 1)), SUBTITLE_CHARS))
    else
        d.subtitle:SetText(Util.Truncate(format(L["A level %d quest for %s, from level %d."], quest.questLevel,
            sideText(side), max(1, quest.requiredLevel or 1)), SUBTITLE_CHARS))
    end
    local accent = sideColor(side)
    if accent then paint(d.accent, accent) else paint(d.accent, EDGE) end

    -- objectives, on the parchment, and under them what the quest giver says (the PandaQuest portal's,
    -- read off Wowhead) when it is known and wanted
    local Catalog = catalog()
    local text = quest.objectivesText
    local body = type(text) == "table" and tconcat(text, "\n") or tostring(text or "")
    local questText = browserOption("questText") and Catalog.QuestText and Catalog.QuestText(selectedId) or nil
    if questText then body = body ~= "" and (body .. "\n\n" .. questText) or questText end
    local shownText = Util.Truncate(body, OBJECTIVE_CHARS)       -- counts characters, not bytes
    d.objectives:SetText(shownText)
    d.paper.full = shownText ~= body and body or nil
    dropTooltip(d.paper)                                        -- it would still show the last quest's text
    d.paper:SetShown(body ~= "")

    -- rewards: money, experience, reputation, then the items; the whole list is the line's tooltip
    local rewards = {}
    local info = DB.GetQuestRewards and DB.GetQuestRewards(selectedId) or nil
    local withItems = browserOption("rewards")
    -- The money goes in front in coins, outside the character budget: a texture escape must not be cut.
    local money = info and info.money and withItems and Util.FormatMoneyCoins(info.money) or nil
    if info and info.xp then rewards[#rewards + 1] = format(L["%d experience"], info.xp) end
    if type(quest.reputationReward) == "table" then
        for _, entry in ipairs(quest.reputationReward) do
            if type(entry) == "table" and entry[1] and entry[2] then
                rewards[#rewards + 1] = reputationText(entry)
            end
        end
    end
    local hasItems = withItems and info and (info.items or info.choices) and true or false
    if hasItems then
        for _, entry in ipairs(info.items or {}) do rewards[#rewards + 1] = Catalog.ItemText(entry) end
        if info.choices then
            rewards[#rewards + 1] = #info.choices == 1 and Catalog.ItemText(info.choices[1])
                or format(L["one of %d items"], #info.choices)
        end
    end
    local rewardText = tconcat(rewards, ", ")
    -- the money takes as many characters as it shows: its digits, its spaces and one per coin
    local budget = 2 * VALUE_CHARS - 2
    if money then budget = budget - #(money:gsub("|T.-|t", "o")) - 2 end
    local shownRewards = Util.Truncate(rewardText, budget)
    if money then
        shownRewards = #rewards > 0 and (money .. ", " .. shownRewards) or money
        rewardText = #rewards > 0 and (money .. ", " .. rewardText) or money
    end
    d.rewards:SetText((#rewards > 0 or money) and shownRewards or L["Not in the database."])
    d.rewardHit.questID = (hasItems or shownRewards ~= rewardText) and selectedId or nil
    dropTooltip(d.rewardHit)

    -- start / end
    d.startText:SetText(pointText(endpoints(quest, "startedBy")))
    d.endText:SetText(pointText(endpoints(quest, "finishedBy")))

    d.level:SetText(levelText(quest.questLevel))
    d.required:SetText(tostring(quest.requiredLevel or 0))
    d.difficulty:SetText(difficultyText(quest.questLevel))
    d.side:SetText(Util.Truncate(sideText(side), 14))
    local shareable = quest.questFlags and bit and bit.band(quest.questFlags, ns.Schema.questFlags.SHARABLE) ~= 0
    d.shareable:SetText(shareable and L["Yes"] or L["No"])
    d.questId:SetText(tostring(selectedId))

    mapAreas = collectAreas(quest)
    d.quest = quest
    if d.hide and M.HiddenLabel then d.hide.text:SetText(M.HiddenLabel(selectedId)) end
    if animate or not wasShown then crossfadePage() end
    showMapArea(quest, 1)
end

--- RewardLines(questID) -> { {text, r, g, b}, ... }: the rewards tooltip as data, for the tooltip and the tests.
function M.RewardLines(questID)
    local DB, Catalog = ns.DB, catalog()
    local info = DB and DB.GetQuestRewards and DB.GetQuestRewards(questID) or {}
    local quest = DB and DB.GetQuest and DB.GetQuest(questID)
    local lines = {}
    local function add(text, color) lines[#lines + 1] = { text, color[1], color[2], color[3] } end
    if info.money and browserOption("rewards") then add(Util.FormatMoneyCoins(info.money), TEXT) end
    if info.xp then add(format(L["%d experience"], info.xp), TEXT) end
    if quest and type(quest.reputationReward) == "table" then
        for _, entry in ipairs(quest.reputationReward) do
            if type(entry) == "table" and entry[1] and entry[2] then
                add(reputationText(entry), TEXT)
            end
        end
    end
    if browserOption("rewards") then
        if info.items then
            add(L["You will receive:"], GOLD)
            for _, entry in ipairs(info.items) do add("  " .. Catalog.ItemText(entry), TEXT) end
        end
        if info.choices then
            add(L["Choose one of:"], GOLD)
            for _, entry in ipairs(info.choices) do add("  " .. Catalog.ItemText(entry), TEXT) end
        end
    end
    return lines
end

function M.ShowRewardTooltip(owner, questID)
    if not (questID and GameTooltip) then return end
    local lines = M.RewardLines(questID)
    if #lines == 0 then return end
    GameTooltip:SetOwner(owner, "ANCHOR_LEFT")
    GameTooltip:SetText(L["Rewards"], GOLD[1], GOLD[2], GOLD[3])
    for _, line in ipairs(lines) do GameTooltip:AddLine(line[1], line[2], line[3], line[4]) end
    GameTooltip:Show()
end

local function onAreaTab(index)
    local quest = widgets.detail.quest
    if quest then showMapArea(quest, index) end
end

---------------------------------------------------------------------------
-- What can be done with one quest: the page's buttons and a row's right-click menu
---------------------------------------------------------------------------

local function questName(questID)
    local DB = ns.DB
    return (DB and DB.GetQuestName and DB.GetQuestName(questID)) or tostring(questID)
end

local browserPin                   -- the custom target the browser made for a quest not in the log

--- Navigate(questID) -> bool: pin the quest as the arrow's target (what `/pq target <id>` does). A quest
-- the navigator has no target for -- not in the log, not available nearby -- is routed to where it is
-- picked up, as one custom target the browser owns and replaces on the next quest it is asked for.
function M.Navigate(questID)
    if not questID then return false end
    local Targets, Router, Objectives = ns.Targets, ns.Router, ns.Objectives
    if not (Targets and Router and Router.SetManualTarget) then return false end
    local list = Targets.GetForQuest and Targets.GetForQuest(questID)
    local target = list and list[1]
    if not target and Objectives and Objectives.BuildPickup and Targets.AddCustom then
        local pickup = Objectives.BuildPickup(questID)
        if pickup and pickup.uiMapID and pickup.x and pickup.y then
            if browserPin and Targets.RemoveCustom then Targets.RemoveCustom(browserPin) end
            target = Targets.AddCustom(pickup.uiMapID, pickup.x, pickup.y, questName(questID))
            browserPin = target and target.key or nil
        end
    end
    if target then
        Router.SetManualTarget(target)
        Log.Print(L["Navigating to: %s"], questName(questID))
        return true
    end
    Log.Print(L["No target found for quest %d."], questID)
    return false
end

--- IsHidden(questID) -> is the quest hidden from the navigator (char.hiddenQuests)?
function M.IsHidden(questID)
    local PQ = ns.PQ
    local char = PQ and PQ.db and PQ.db.char
    return questID ~= nil and char ~= nil and type(char.hiddenQuests) == "table" and char.hiddenQuests[questID] == true
end

--- ToggleHidden(questID) -> hidden now: `/pq hide <id>` or `/pq unhide <id>`, the same functions.
function M.ToggleHidden(questID)
    if not questID then return false end
    local PQ = ns.PQ
    local commands = PQ and PQ.commands
    local verb = M.IsHidden(questID) and "unhide" or "hide"
    if commands and commands[verb] then commands[verb](tostring(questID)) end
    if M.Refresh then M.Refresh() end
    return M.IsHidden(questID)
end

--- MapIdFor(questID) -> the uiMapID of the first place the quest is known to start or end, or nil.
function M.MapIdFor(questID)
    local DB, Zones = ns.DB, ns.Zones
    local quest = DB and DB.GetQuest and DB.GetQuest(questID)
    if not quest then return nil end
    local area = collectAreas(quest)[1]
    return area and Zones and Zones.GetUiMapIdByAreaId and Zones.GetUiMapIdByAreaId(area) or nil
end

--- ShowOnMap(questID) -> bool: the world map, opened on the zone where the quest starts.
function M.ShowOnMap(questID)
    local uiMapID = questID and M.MapIdFor(questID)
    if not uiMapID then
        Log.Print("%s", L["No location is known for this quest."])
        return false
    end
    if type(OpenWorldMap) == "function" then
        return (pcall(OpenWorldMap, uiMapID))
    end
    local map = _G and _G.WorldMapFrame
    if not map then return false end
    if not map:IsShown() and type(ShowUIPanel) == "function" then pcall(ShowUIPanel, map) end
    if map.SetMapID then pcall(map.SetMapID, map, uiMapID) end
    return true
end

--- CopyLink(questID) -> bool: the quest's page on the PandaQuest portal, in a copy box.
function M.CopyLink(questID)
    local Links = ns.Wowhead
    if not (questID and Links and Links.ShowCopyDialog and Links.QuestUrl) then return false end
    Links.ShowCopyDialog(Links.QuestUrl(questID))
    return true
end

local function pageQuestId()
    local quest = widgets.detail and widgets.detail.quest
    return quest and quest.id or nil
end

local function navigate() M.Navigate(pageQuestId()) end
local function toggleHidden() M.ToggleHidden(pageQuestId()) end
local function showOnMap() M.ShowOnMap(pageQuestId()) end
local function showWowhead() M.CopyLink(pageQuestId()) end

-- The label of the hide button says what pressing it will do.
local function hiddenLabel(questID)
    return M.IsHidden(questID) and L["Show in the navigator"] or L["Hide from the navigator"]
end
M.HiddenLabel = hiddenLabel

-- A row's right-click menu: the four things the page's buttons do, for that row's quest. Built the
-- first time it is asked for, and hidden with the window.
local rowMenu
local MENU_ACTIONS = {
    { label = function() return L["Navigate"] end, run = function(id) return M.Navigate(id) end },
    { label = hiddenLabel, run = function(id) return M.ToggleHidden(id) end },
    { label = function() return L["Show on map"] end, run = function(id) return M.ShowOnMap(id) end },
    { label = function() return L["PandaQuest link"] end, run = function(id) return M.CopyLink(id) end },
}

local function hideRowMenu()
    if rowMenu then rowMenu:Hide() end
end

local function buildRowMenu()
    if rowMenu or not frame then return rowMenu end
    rowMenu = CreateFrame("Frame", nil, frame)
    if rowMenu.SetFrameStrata then rowMenu:SetFrameStrata("DIALOG") end
    rowMenu:SetSize(176, #MENU_ACTIONS * 22 + 8)
    local bg = rowMenu:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(rowMenu)
    paint(bg, WINDOW_BG)
    addEdge(rowMenu, GOLD, 0.6)
    rowMenu:EnableMouse(true)
    rowMenu.buttons = {}
    for i, action in ipairs(MENU_ACTIONS) do
        local b = newButton(rowMenu, "", 168, 20, function()
            local id = rowMenu.questId
            hideRowMenu()
            action.run(id)
        end, true)
        b:SetPoint("TOPLEFT", rowMenu, "TOPLEFT", 4, -4 - (i - 1) * 22)
        b.action = action
        rowMenu.buttons[i] = b
    end
    rowMenu:Hide()
    return rowMenu
end

--- OpenRowMenu(questID, anchor) -> the menu frame: what a right-click on a list row opens.
function M.OpenRowMenu(questID, anchor)
    local m = buildRowMenu()
    if not (m and questID) then return nil end
    m.questId = questID
    for _, b in ipairs(m.buttons) do b.text:SetText(b.action.label(questID)) end
    m:ClearAllPoints()
    if anchor then
        m:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 60, 2)
    else
        m:SetPoint("CENTER", frame, "CENTER", 0, 0)
    end
    m:Show()
    return m
end

function M.GetRowMenu() return rowMenu end

--- OpenSettings(): every PandaQuest setting, from the gear in the header: the window's Options tab.
function M.OpenSettings()
    local Window = ns.MainWindow
    if Window and Window.Open and Window.Open("options") then return true end
    local Options = ns.Options
    if Options and Options.OpenDialog then return Options.OpenDialog() end
    if Options and Options.OpenPanel then return Options.OpenPanel() end
    return false
end

---------------------------------------------------------------------------
-- Building the window
---------------------------------------------------------------------------

local function buildFilters(parent)
    local labelY, boxY = -33, -47
    newText(parent, "GameFontNormalSmall", "TOPLEFT", 12, labelY, 100, 12):SetText(L["Name"])
    local name = newInput(parent, "PandaQuestBrowserName", 12, boxY, 170)
    name:SetScript("OnTextChanged", function(self)
        local text = self:GetText() or ""
        filter.text = text ~= "" and text:lower() or nil
        runQuery()
        rebuildTree()
    end)
    widgets.name = name

    local function levelBox(x, label, field)
        newText(parent, "GameFontNormalSmall", "TOPLEFT", x, labelY, 38, 12, "CENTER"):SetText(label)
        local box = newInput(parent, nil, x, boxY, 38, true)
        box:SetScript("OnTextChanged", function(self)
            local value = tonumber(self:GetText())
            filter[field] = value and value > 0 and value or nil
            runQuery()
            rebuildTree()
        end)
        return box
    end
    widgets.minLevel = levelBox(196, L["Level"], "minLevel")
    widgets.maxLevel = levelBox(240, L["to"], "maxLevel")

    local myLevel = newButton(parent, L["My level"], 70, 20, function(self)
        filter.myLevel = not filter.myLevel
        self:SetActive(filter.myLevel)
        refreshAll()
    end)
    myLevel:SetPoint("TOPLEFT", parent, "TOPLEFT", 290, boxY)
    widgets.myLevel = myLevel

    local sideButton = newButton(parent, "", 90, 20, function(self)
        local current = filter.sideChoice or "mine"
        for i, key in ipairs(SIDE_ORDER) do
            if key == current then
                filter.sideChoice = SIDE_ORDER[i % #SIDE_ORDER + 1]
                break
            end
        end
        self.text:SetText(L[SIDE_LABELS[filter.sideChoice]])
        refreshAll()
    end)
    sideButton:SetPoint("TOPLEFT", parent, "TOPLEFT", 366, boxY)
    sideButton.text:SetText(L[SIDE_LABELS.mine])
    widgets.sideButton = sideButton

    widgets.kindButtons = {}
    local x = 462
    for _, kind in ipairs(ns.QuestCatalog.KINDS) do
        local b = newButton(parent, L[KIND_LABELS[kind]], 58, 20, function(self)
            filter.kinds[kind] = (not filter.kinds[kind]) or nil
            self:SetActive(filter.kinds[kind])
            refreshAll()
        end)
        b:SetPoint("TOPLEFT", parent, "TOPLEFT", x, boxY)
        widgets.kindButtons[kind] = b
        x = x + 62
    end

    local reset = newButton(parent, L["Reset"], 52, 20, function()
        filter = { kinds = {} }
        sortKey, sortDescending = "level", false
        widgets.name:SetText("")
        widgets.minLevel:SetText("")
        widgets.maxLevel:SetText("")
        widgets.myLevel:SetActive(false)
        widgets.sideButton.text:SetText(L[SIDE_LABELS.mine])
        for _, b in pairs(widgets.kindButtons) do b:SetActive(false) end
        expandedKey = nil
        refreshAll()
    end)
    reset:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -12, boxY)
end

--- A heading strip across the top of a panel: header colour and a thin line under it.
local function addHeading(panel)
    local strip = newBar(panel, "BORDER", HEADER)
    strip:SetPoint("TOPLEFT", panel, "TOPLEFT", 1, -1)
    strip:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -1, -1)
    strip:SetHeight(HEAD_H - 1)
    local line = newBar(panel, "BORDER", EDGE, 0.8)
    line:SetPoint("TOPLEFT", panel, "TOPLEFT", 1, -HEAD_H)
    line:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -1, -HEAD_H)
    line:SetHeight(1)
end

--- The pieces every selectable row has: a zebra stripe, a selection wash, a 2 px gold bar, a hover sheet.
local function newRow(parent, index, width)
    local row = CreateFrame("Button", nil, parent)
    row:SetSize(width, ROW_H)
    local zebra = newBar(row, "BACKGROUND", { 1, 1, 1 }, index % 2 == 0 and 0.03 or 0)
    zebra:SetAllPoints(row)
    row.zebra = zebra
    row.sel = newBar(row, "BACKGROUND", GOLD, 0.10)
    row.sel:SetAllPoints(row)
    row.sel:Hide()
    row.accent = newBar(row, "ARTWORK", GOLD)
    row.accent:SetPoint("TOPLEFT", row, "TOPLEFT", 0, 0)
    row.accent:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 0, 0)
    row.accent:SetWidth(2)
    row.accent:Hide()
    attachHover(row, row, HOVER_ALPHA)
    return row
end

local function buildTree(parent)
    local panel = newPanel(parent, PANEL, EDGE)
    panel:SetPoint("TOPLEFT", parent, "TOPLEFT", TREE_X, -PANEL_TOP)
    panel:SetSize(TREE_W, PANEL_H)
    widgets.treePanel = panel
    addHeading(panel)
    newText(panel, "GameFontNormalSmall", "TOPLEFT", 8, -6, TREE_W - 16, 12, "LEFT", MUTED):SetText(L["Categories"])
    widgets.treeRows = {}
    for i = 1, TREE_ROWS do
        local row = newRow(panel, i, TREE_W - 2)
        row:SetPoint("TOPLEFT", panel, "TOPLEFT", 1, -HEAD_H - 1 - (i - 1) * ROW_H)
        row.text = newText(row, "GameFontNormalSmall", "LEFT", 8, 0, 128, ROW_H - 4, "LEFT", GOLD)
        row.count = newText(row, "GameFontDisableSmall", "RIGHT", -6, 0, 36, ROW_H - 4, "RIGHT")
        row:SetScript("OnClick", onTreeClick)
        widgets.treeRows[i] = row
    end
    panel:EnableMouseWheel(true)
    panel:SetScript("OnMouseWheel", function(_, delta)
        treeOffset = max(0, min(treeOffset - delta * 3, max(0, #treeRows - TREE_ROWS)))
        refreshTree()
    end)
end

-- x is relative to the row; the heading buttons sit above the same columns. "field" is the font string
-- of the row that shows the column.
local COLUMNS = {
    { key = "name", field = "name", label = "Quest", x = 10, w = 162, justify = "LEFT",
        font = "GameFontNormalSmall", color = TEXT },
    { key = "zone", field = "zone", label = "Zone", x = 176, w = 110, justify = "LEFT",
        font = "GameFontHighlightSmall", color = MUTED },
    { key = "level", field = "level", label = "Level", x = 290, w = 40, justify = "CENTER",
        font = "GameFontHighlightSmall" },
    { key = "minLevel", field = "req", label = "Req.", x = 334, w = 40, justify = "CENTER",
        font = "GameFontHighlightSmall", color = MUTED },
    { key = "xp", field = "xp", label = "XP", x = 378, w = 50, justify = "RIGHT",
        font = "GameFontHighlightSmall", color = MUTED },
}

local function buildList(parent)
    local panel = newPanel(parent, PANEL, EDGE)
    panel:SetPoint("TOPLEFT", parent, "TOPLEFT", LIST_X, -PANEL_TOP)
    panel:SetSize(LIST_W, PANEL_H)
    widgets.listPanel = panel
    addHeading(panel)

    widgets.sortButtons = {}
    for _, col in ipairs(COLUMNS) do
        local label = L[col.label]
        local b = newButton(panel, label, col.w + 4, HEAD_H - 4, function()
            if sortKey == col.key then
                sortDescending = not sortDescending
            else
                sortKey, sortDescending = col.key, false
            end
            runQuery()
        end, true)
        b:SetPoint("TOPLEFT", panel, "TOPLEFT", col.x + 1 - 2, -2)
        b.label = label
        b.text:ClearAllPoints()
        b.text:SetPoint("LEFT", b, "LEFT", 2, 0)
        b.text:SetWidth(col.w)
        b.text:SetJustifyH(col.justify)
        setColor(b.text, GOLD)
        widgets.sortButtons[col.key] = b
    end

    local host = CreateFrame("Frame", nil, panel)
    host:SetSize(430, ROWS * ROW_H)
    host:SetPoint("TOPLEFT", panel, "TOPLEFT", 1, -HEAD_H - 1)
    widgets.rowHost = host

    widgets.rows = {}
    for i = 1, ROWS do
        local row = newRow(host, i, 430)
        row:SetPoint("TOPLEFT", host, "TOPLEFT", 0, -(i - 1) * ROW_H)
        -- the faction stripe: Alliance blue, Horde red, nothing for a quest both sides share
        row.side = newBar(row, "ARTWORK", ALLIANCE)
        row.side:SetPoint("TOPLEFT", row, "TOPLEFT", 3, -2)
        row.side:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 3, 2)
        row.side:SetWidth(3)
        for _, col in ipairs(COLUMNS) do
            row[col.field] = newText(row, col.font, "LEFT", col.x, 0, col.w, ROW_H - 4, col.justify, col.color)
        end
        if row.RegisterForClicks then row:RegisterForClicks("LeftButtonUp", "RightButtonUp") end
        row:SetScript("OnClick", function(self, button)
            if not self.questId then return end
            selectQuest(self.questId)
            if button == "RightButton" then M.OpenRowMenu(self.questId, self) else hideRowMenu() end
        end)
        widgets.rows[i] = row
    end

    local slider = CreateFrame("Slider", nil, panel)
    slider:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -3, -HEAD_H - 1)
    slider:SetSize(12, ROWS * ROW_H)
    slider:SetOrientation("VERTICAL")
    slider:SetMinMaxValues(0, 0)
    slider:SetValueStep(1)
    local track = newBar(slider, "BACKGROUND", { 0.12, 0.12, 0.15 }, 1)
    track:SetPoint("TOP", slider, "TOP", 0, 0)
    track:SetPoint("BOTTOM", slider, "BOTTOM", 0, 0)
    track:SetWidth(4)
    slider:SetThumbTexture("Interface\\Buttons\\WHITE8X8")
    local thumb = slider:GetThumbTexture()
    if type(thumb) == "table" and thumb.SetSize then
        thumb:SetSize(8, 32)
        thumb:SetVertexColor(0.55, 0.45, 0.18, 1)
    end
    slider:SetScript("OnValueChanged", function(_, value)
        if widgets.sliderUpdating then return end
        scrollOffset = floor((value or 0) + 0.5)
        refreshList()
    end)
    widgets.slider = slider

    panel:EnableMouseWheel(true)
    panel:SetScript("OnMouseWheel", function(_, delta)
        scrollOffset = max(0, min(scrollOffset - delta * 3, max(0, #results - ROWS)))
        refreshList()
    end)

    widgets.count = newText(parent, "GameFontDisableSmall", "TOPLEFT", LIST_X + 4, -(PANEL_TOP + PANEL_H + 8), 200, 12, "LEFT")

    -- the empty state: a dimmed mark, what is wrong, and what to do about it
    local icon = panel:CreateTexture(nil, "ARTWORK")
    icon:SetSize(32, 32)
    icon:SetPoint("CENTER", panel, "CENTER", -14, 36)
    icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    icon:SetAlpha(0.35)
    icon:Hide()
    widgets.emptyIcon = icon
    widgets.emptyText = newText(panel, "GameFontNormal", "CENTER", -14, 0, 380, 18, "CENTER", MUTED)
    widgets.emptyHint = newText(panel, "GameFontDisableSmall", "CENTER", -14, -20, 380, 14, "CENTER")
    widgets.emptyHint:SetText(L["Loosen a filter, or press Reset."])
    widgets.emptyHint:Hide()
end

--- A labelled value: the label in gold, the text beside it.
local function addLine(p, label, key, y, height, d)
    local l = newText(p, "GameFontNormalSmall", "TOPLEFT", PAD, y, 52, 12, "LEFT", GOLD)
    l:SetText(label)
    d.labels[#d.labels + 1] = l
    local lines = max(1, floor(height / 13))
    local v = newText(p, "GameFontHighlightSmall", "TOPLEFT", PAD + 54, y, INNER_W - 54, height, "LEFT", TEXT, lines)
    v:SetJustifyV("TOP")
    d[key] = v
    return y - height - 4
end

--- A small caption over a value, three to a row.
local function addCell(p, label, key, column, y, d)
    local width = floor((INNER_W - 6) / 3)
    local x = PAD + (column - 1) * (width + 3)
    local l = newText(p, "GameFontNormalSmall", "TOPLEFT", x, y, width, 12, "LEFT", GOLD)
    l:SetText(label)
    d.labels[#d.labels + 1] = l
    d[key] = newText(p, "GameFontHighlightSmall", "TOPLEFT", x, y - 13, width, 13, "LEFT", TEXT)
end

local function buildDetail(parent)
    local panel = newPanel(parent, PANEL, EDGE)
    panel:SetPoint("TOPLEFT", parent, "TOPLEFT", DETAIL_X, -PANEL_TOP)
    panel:SetSize(DETAIL_W, PANEL_H)
    widgets.detailPanel = panel
    local d = { panel = CreateFrame("Frame", nil, panel), labels = {} }
    widgets.detail = d
    d.panel:SetAllPoints(panel)

    d.hint = newText(panel, "GameFontNormal", "CENTER", 0, 0, 220, 44, "CENTER", MUTED, 3)
    d.hint:SetText(L["Pick a quest from the list to see its page."])

    local p = d.panel
    -- a thin bar across the top in the quest's side colour
    d.accent = newBar(p, "ARTWORK", EDGE)
    d.accent:SetPoint("TOPLEFT", p, "TOPLEFT", 1, -1)
    d.accent:SetPoint("TOPRIGHT", p, "TOPRIGHT", -1, -1)
    d.accent:SetHeight(2)

    local y = -9
    d.titleFrame = CreateFrame("Frame", nil, p)
    d.titleFrame:SetSize(INNER_W, 38)
    d.titleFrame:SetPoint("TOPLEFT", p, "TOPLEFT", PAD, y)
    d.title = newText(d.titleFrame, "GameFontNormalLarge", "TOPLEFT", 0, 0, INNER_W, 38, "LEFT", GOLD, 2)
    y = y - 38 - 2
    d.subtitle = newText(p, "GameFontHighlightSmall", "TOPLEFT", PAD, y, INNER_W, 14, "LEFT", MUTED)
    y = y - 14 - 3

    -- map with its area tabs
    d.areaTabs = {}
    widgets.areaTabs = d.areaTabs
    local tabW = floor((INNER_W - 9) / 4)
    for i = 1, 4 do
        local b = newButton(p, "", tabW, 16, function() onAreaTab(i) end)
        b:SetPoint("TOPLEFT", p, "TOPLEFT", PAD + (i - 1) * (tabW + 3), y)
        b.text:SetFontObject("GameFontDisableSmall")
        b:SetScript("OnEnter", function(self)
            self.glide(HOVER_ALPHA)
            if self.fullName and GameTooltip then
                GameTooltip:SetOwner(self, "ANCHOR_TOP")
                GameTooltip:SetText(self.fullName)
                GameTooltip:Show()
            end
        end)
        b:SetScript("OnLeave", function(self)
            self.glide(0)
            dropTooltip(self)
        end)
        b:Hide()
        d.areaTabs[i] = b
    end
    y = y - 16 - 2
    local map = CreateFrame("Frame", nil, p)
    map:SetSize(MAP_W, MAP_H)
    map:SetPoint("TOPLEFT", p, "TOPLEFT", PAD, y)
    local mapBg = map:CreateTexture(nil, "BACKGROUND", nil, -8)      -- under the tiles, always
    mapBg:SetAllPoints(map)
    map.ground = mapBg
    fillColor(mapBg, 0.16, 0.13, 0.08, 1)
    map.fallback = CreateFrame("Frame", nil, map)
    map.fallback:SetAllPoints(map)
    map.fallbackText = newText(map.fallback, "GameFontDisableSmall", "CENTER", 0, 0, MAP_W - 20, 28, "CENTER", nil, 2)
    map.frameEdge = CreateFrame("Frame", nil, map)
    map.frameEdge:SetAllPoints(map)
    addEdge(map.frameEdge, EDGE, 0.9)
    widgets.map = map
    y = y - MAP_H - 6

    y = addLine(p, L["Start"], "startText", y, 26, d)
    y = addLine(p, L["End"], "endText", y - 1, 26, d) - 1

    local cell = 26
    addCell(p, L["Level"], "level", 1, y, d)
    addCell(p, L["Req."], "required", 2, y, d)
    addCell(p, L["Difficulty"], "difficulty", 3, y, d)
    y = y - cell - 4
    addCell(p, L["Side"], "side", 1, y, d)
    addCell(p, L["Shareable"], "shareable", 2, y, d)
    addCell(p, L["Quest ID"], "questId", 3, y, d)
    y = y - cell - 5

    y = addLine(p, L["Rewards"], "rewards", y, 26, d) - 2
    -- the whole reward list, when the line has items or had to be cut
    d.rewardHit = CreateFrame("Frame", nil, p)
    d.rewardHit:SetAllPoints(d.rewards)
    d.rewardHit:EnableMouse(true)
    d.rewardHit:SetScript("OnEnter", function(self) M.ShowRewardTooltip(self, self.questID) end)
    d.rewardHit:SetScript("OnLeave", function(self) dropTooltip(self) end)
    d.rewardHit:SetScript("OnHide", function(self) dropTooltip(self) end)

    -- the quest text, on parchment, in ink
    local paperBottom = -(PANEL_H - 58)          -- two rows of buttons under the paper
    d.paper = CreateFrame("Frame", nil, p)
    d.paper:SetPoint("TOPLEFT", p, "TOPLEFT", PAD, y)
    d.paper:SetSize(INNER_W, y - paperBottom)
    local sheet = d.paper:CreateTexture(nil, "BACKGROUND")
    sheet:SetAllPoints(d.paper)
    paint(sheet, PARCHMENT)
    addEdge(d.paper, { 0.45, 0.36, 0.18 }, 1)
    local lit = newBar(d.paper, "ARTWORK", { 0.90, 0.82, 0.62 })
    lit:SetPoint("TOPLEFT", d.paper, "TOPLEFT", 1, -1)
    lit:SetPoint("TOPRIGHT", d.paper, "TOPRIGHT", -1, -1)
    lit:SetHeight(1)
    local paperHeight = y - paperBottom
    d.objectives = newText(d.paper, "GameFontHighlightSmall", "TOPLEFT", 6, -5, INNER_W - 12, paperHeight - 10, "LEFT",
        INK, max(2, floor((paperHeight - 10) / 12)))
    d.objectives:SetJustifyV("TOP")
    d.objectives:SetShadowOffset(0, 0)
    d.paper:EnableMouse(true)
    d.paper:SetScript("OnEnter", function(self)
        if self.full and GameTooltip then
            GameTooltip:SetOwner(self, "ANCHOR_LEFT")
            GameTooltip:SetText(self.full, 1, 1, 1, 1, true)
            GameTooltip:Show()
        end
    end)
    d.paper:SetScript("OnLeave", function(self) dropTooltip(self) end)
    d.paper:SetScript("OnHide", function(self) dropTooltip(self) end)

    local buttonW = floor((INNER_W - 6) / 2)
    d.navigate = newButton(p, L["Navigate"], buttonW, 20, navigate)
    d.navigate:SetPoint("BOTTOMLEFT", p, "BOTTOMLEFT", PAD, 32)
    d.hide = newButton(p, L["Hide from the navigator"], buttonW, 20, toggleHidden)
    d.hide:SetPoint("BOTTOMRIGHT", p, "BOTTOMRIGHT", -PAD, 32)
    d.map = newButton(p, L["Show on map"], buttonW, 20, showOnMap)
    d.map:SetPoint("BOTTOMLEFT", p, "BOTTOMLEFT", PAD, 8)
    d.wowhead = newButton(p, L["PandaQuest link"], buttonW, 20, showWowhead)
    d.wowhead:SetPoint("BOTTOMRIGHT", p, "BOTTOMRIGHT", -PAD, 8)
    for _, b in ipairs({ d.navigate, d.hide, d.map, d.wowhead }) do
        b:HookScript("OnEnter", function(self)
            if self.tip and GameTooltip then
                GameTooltip:SetOwner(self, "ANCHOR_TOP")
                GameTooltip:SetText(self.tip, 1, 1, 1, 1, true)
                GameTooltip:Show()
            end
        end)
        b:HookScript("OnLeave", function(self) dropTooltip(self) end)
    end
    d.navigate.tip = L["The arrow and the map pins follow this quest."]
    d.hide.tip = L["A hidden quest is left out of the arrow's route and the map pins. Settings > Hidden quests lists them."]
    d.map.tip = L["Opens the world map where this quest starts."]
    d.wowhead.tip = L["The quest's page on the PandaQuest portal, to copy into your browser."]

    d.panel:Hide()
end

local function build()
    if built then return frame end
    if not CreateFrame then return nil end
    frame = CreateFrame("Frame", "PandaQuestBrowser", UIParent)
    frame:SetSize(WIDTH, HEIGHT)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    if frame.SetFrameStrata then frame:SetFrameStrata("HIGH") end
    if frame.SetClampedToScreen then frame:SetClampedToScreen(true) end
    frame:SetMovable(true)
    frame:EnableMouse(true)
    if frame.RegisterForDrag then frame:RegisterForDrag("LeftButton") end
    frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(frame)
    paint(bg, WINDOW_BG)
    widgets.edge = addEdge(frame, EDGE)

    -- header, a gold line under it, and a toolbar strip for the filters
    local header = newBar(frame, "BORDER", HEADER)
    header:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)
    header:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -1)
    header:SetHeight(25)
    local gold = newBar(frame, "ARTWORK", GOLD, 0.9)
    gold:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -26)
    gold:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -26)
    gold:SetHeight(1)
    widgets.goldLine = gold
    -- Everything below the header is the Quests page: UI/MainWindow.lua shows another page in its place
    -- when another tab is chosen. It covers the whole frame, so the panels keep their positions.
    local page = CreateFrame("Frame", nil, frame)
    page:SetAllPoints(frame)
    widgets.page = page

    local toolbar = newBar(page, "BORDER", TOOLBAR_BG)
    toolbar:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -27)
    toolbar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -27)
    toolbar:SetHeight(46)
    local toolbarLine = newBar(page, "BORDER", EDGE, 0.6)
    toolbarLine:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -73)
    toolbarLine:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -73)
    toolbarLine:SetHeight(1)

    local title = newText(frame, "GameFontNormal", "TOPLEFT", 12, -6, 220, 16, "LEFT", GOLD)
    title:SetText("PandaQuest - " .. L["Quests"])
    widgets.title = title

    local close = newButton(frame, "X", 22, 18, function() M.Hide() end)
    close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -4)
    widgets.close = close

    -- The gear: every setting PandaQuest has. /pq opens this window, so this is the way in.
    local settings = newButton(frame, L["Settings"], 96, 18, function() M.OpenSettings() end)
    settings:SetPoint("TOPRIGHT", close, "TOPLEFT", -6, 0)
    settings.text:ClearAllPoints()
    settings.text:SetPoint("LEFT", settings, "LEFT", 22, 0)
    settings.text:SetWidth(70)
    local gear = settings:CreateTexture(nil, "ARTWORK")
    gear:SetTexture("Interface\\Icons\\INV_Misc_Gear_01")
    gear:SetSize(14, 14)
    gear:SetPoint("LEFT", settings, "LEFT", 4, 0)
    if gear.SetTexCoord then gear:SetTexCoord(0.08, 0.92, 0.08, 0.92) end
    settings:HookScript("OnEnter", function(self)
        if GameTooltip then
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
            GameTooltip:SetText(L["Settings"], 1, 0.82, 0)
            GameTooltip:AddLine(L["Every PandaQuest setting: modules, arrow, map, tooltips, sync and privacy, language and more."], 1, 1, 1, true)
            GameTooltip:Show()
        end
    end)
    settings:HookScript("OnLeave", function(self) dropTooltip(self) end)
    widgets.settings = settings

    buildFilters(page)
    buildTree(page)
    buildList(page)
    buildDetail(page)

    frame:SetScript("OnShow", function()
        local Catalog = catalog()
        if Catalog and not Catalog.IsReady() then Catalog.Build() end
        resumePulses()
    end)
    frame:SetScript("OnHide", function()
        closing = false
        hideRowMenu()
        settleMotion()
    end)
    frame:Hide()
    if UISpecialFrames then
        local present = false
        for _, name in ipairs(UISpecialFrames) do
            if name == "PandaQuestBrowser" then present = true end
        end
        if not present then UISpecialFrames[#UISpecialFrames + 1] = "PandaQuestBrowser" end
    end
    built = true
    M.frame = frame
    -- The window around the browser: logo, tabs, resizing, the remembered place (UI/MainWindow.lua).
    local Window = ns.MainWindow
    if Window and Window.Decorate then Window.Decorate(frame, widgets) end
    return frame
end

---------------------------------------------------------------------------
-- Public
---------------------------------------------------------------------------

--- IsShown() -> true while the window is open; a window that is fading out is already closed.
function M.IsShown() return frame and frame:IsShown() and not closing or false end

--- GetResults() -> the quests the current filters leave, in the current order (shared; do not mutate).
function M.GetResults() return results end

--- GetSelected() -> questID|nil
function M.GetSelected() return selectedId end

--- GetWidgets() -> the window's widget table (for tests and for other addons that want to anchor to it).
function M.GetWidgets() return widgets end

--- PulseCount() -> how many map pins are breathing right now (for tests).
function M.PulseCount() return #pulsing end

--- ShowWindow() -> bool: PandaQuest's window, on whichever tab it was on.
function M.ShowWindow()
    local f = build()
    if not f then return false end
    local Catalog = catalog()
    if Catalog and not Catalog.IsReady() then Catalog.Build() end
    openFrame(f)
    if Catalog and Catalog.IsReady() then refreshAll() else
        results = {}
        if refreshList then refreshList() end
    end
    return true
end

--- Show() -> bool: the window on its Quests tab.
function M.Show()
    if not M.ShowWindow() then return false end
    local Window = ns.MainWindow
    if Window and Window.SelectTab then Window.SelectTab("quests") end
    return true
end

function M.Hide()
    if not frame or not frame:IsShown() or closing then return end
    closing = true
    stopPulses()
    Motion.Cancel(ownerOf(frame, "rise"), true)
    Motion.FadeOut(frame, CLOSE_TIME, function() closing = false end)
end

function M.Toggle()
    if M.IsShown() then M.Hide() else M.Show() end
end

--- Refresh(): draw the open page again (an option it reads changed).
function M.Refresh()
    if frame and frame:IsShown() and refreshDetail then refreshDetail(false) end
end

--- Open(questID): show the window with that quest's page.
function M.Open(questID)
    if not M.Show() then return false end
    selectQuest(questID)
    return true
end

function M.OnInitialize() end

-- The catalog finishes asynchronously; the window fills in when it does.
function M.OnEnable()
    M:RegisterMessage("PQ_CATALOG_READY", function()
        if frame and frame:IsShown() then refreshAll() end
    end)
    M:RegisterMessage("PQ_DB_READY", function()
        local Catalog = catalog()
        if Catalog then Catalog.Invalidate() end
    end)
end

--- The page reads browser.questText and browser.rewards as it is drawn: an open one is drawn again.
function M.OnProfileChanged()
    M.Refresh()
end

return M
