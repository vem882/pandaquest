-- UI/QuestBrowser.lua: browse every quest in the database, like a quest page of a game site.
--
--   /pq quests          open (or close) the window
--
-- Left: categories (continents, dungeons, raids, classes, professions, events) with counts. Middle: the
-- quests that match the filters, sortable by clicking a column heading. Right: the selected quest as a
-- page: text, who starts and ends it, level, difficulty, side, and a map with the start (!), the end (?)
-- and the objectives marked.
--
-- Quests come from ns.QuestCatalog, which reads ns.DB: PandaQuest's own database plus, when the
-- QuestieDB bridge is on, what that addon adds. The side filter starts as the player's faction, so an
-- Alliance character sees Alliance and neutral quests and a Horde character the Horde's.
--
-- Only plain frames, textures and font strings are used (no templates), so the window needs nothing
-- from the game's UI that the rest of the addon does not already rely on.
local _, ns = ...

local M = {}
ns.QuestBrowser = M

local L = ns.L
local Util, Log = ns.Util, ns.Log

local type, pairs, ipairs, tostring, tonumber, next = type, pairs, ipairs, tostring, tonumber, next
local floor, ceil, max, min = math.floor, math.ceil, math.max, math.min
local format = string.format
local tconcat = table.concat

local WIDTH, HEIGHT = 960, 610
local ROW_H, ROWS = 20, 19
local TREE_ROWS = 22
local MAP_W, MAP_H = 280, 187           -- 1002:668, the proportion of a zone map layer
local MAX_TILES = 20
local MAX_PINS = 60

local frame, built
local filter = { kinds = {} }
local sortKey, sortDescending = "level", false
local results = {}
local selectedId
local treeData, treeRows, expandedKey = {}, {}, nil
local scrollOffset, treeOffset = 0, 0
local widgets = {}
local mapAreas = {}

local KIND_LABELS = {
    dungeon = "Dungeon", raid = "Raid", group = "Group", pvp = "PvP", daily = "Daily", event = "Event",
}
local SIDE_ORDER = { "mine", "alliance", "horde", "both" }
local SIDE_LABELS = { mine = "My side", alliance = "Alliance", horde = "Horde", both = "Both" }

local COLOR_GOLD = { 1.0, 0.82, 0.0 }

---------------------------------------------------------------------------
-- Small helpers
---------------------------------------------------------------------------

local function catalog() return ns.QuestCatalog end

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

local function colorHex(level)
    return Util.QuestDifficultyColorHex(level):sub(3)
end

local function setColor(fontString, color)
    fontString:SetTextColor(color[1], color[2], color[3], color[4] or 1)
end

local function newText(parent, layer, template, point, relative, x, y, width, justify)
    local fs = parent:CreateFontString(nil, layer or "OVERLAY", template or "GameFontHighlightSmall")
    if point then fs:SetPoint(point, relative or parent, point, x or 0, y or 0) end
    if width then fs:SetWidth(width) end
    if justify then fs:SetJustifyH(justify) end
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

local function newPanel(parent, r, g, b, a)
    local f = CreateFrame("Frame", nil, parent)
    local bg = f:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(f)
    fillColor(bg, r, g, b, a)
    return f
end

--- A flat text button: label, hover highlight, click handler.
local function newButton(parent, label, width, height, onClick)
    local b = CreateFrame("Button", nil, parent)
    b:SetSize(width, height)
    local bg = b:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(b)
    fillColor(bg, 0.18, 0.18, 0.2, 0.9)
    b.bg = bg
    local hl = b:CreateTexture(nil, "HIGHLIGHT")
    hl:SetAllPoints(b)
    fillColor(hl, 1, 1, 1, 0.12)
    b.text = newText(b, "OVERLAY", "GameFontHighlightSmall", "CENTER", b, 0, 0)
    b.text:SetText(label or "")
    b:SetScript("OnClick", onClick)
    b.SetActive = function(self, active)
        if active then fillColor(self.bg, 0.55, 0.42, 0.08, 0.95) else fillColor(self.bg, 0.18, 0.18, 0.2, 0.9) end
    end
    return b
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
    if refreshList then refreshList() end
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
            row.text:SetText(data.label or "")
            row.count:SetText(tostring(data.count or 0))
            local selected = (filter.category == data.key and filter.zone == data.zone)
                and (data.key ~= nil or (filter.category == nil))
            if data.top then
                row.text:SetPoint("LEFT", row, "LEFT", 6, 0)
                setColor(row.text, selected and { 1, 1, 1 } or COLOR_GOLD)
            else
                row.text:SetPoint("LEFT", row, "LEFT", 18, 0)
                setColor(row.text, selected and { 1, 1, 1 } or { 0.85, 0.85, 0.85 })
            end
            row.sel:SetShown(selected and true or false)
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

function refreshList()
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
            local hex = colorHex(record.level)
            row.name:SetText(record.name)
            row.zone:SetText(Catalog.ZoneLabel(nil, record.area) or "")
            row.level:SetText(format("|c%s%d|r", "ff" .. hex:sub(1, 6), record.level))
            row.req:SetText(record.minLevel > 0 and tostring(record.minLevel) or "-")
            row.xp:SetText(record.xp and tostring(record.xp) or "")
            local icon
            if record.side == "alliance" then icon = "Interface\\Icons\\INV_BannerPVP_02"
            elseif record.side == "horde" then icon = "Interface\\Icons\\INV_BannerPVP_01" end
            row.side:SetShown(icon ~= nil)
            if icon then row.side:SetTexture(icon) end
            row.sel:SetShown(record.id == selectedId)
            row:Show()
        else
            row.questId = nil
            row:Hide()
        end
    end
    widgets.count:SetText(format(L["%d quests"], total))
    if widgets.slider then
        widgets.sliderUpdating = true
        widgets.slider:SetMinMaxValues(0, maxOffset)
        widgets.slider:SetValue(scrollOffset)
        widgets.sliderUpdating = false
    end
    if widgets.emptyText then
        if total == 0 then
            local Catalog2 = catalog()
            widgets.emptyText:SetText(Catalog2.IsReady() and L["No quest matches these filters."]
                or L["Reading the quest database..."])
            widgets.emptyText:Show()
        else
            widgets.emptyText:Hide()
        end
    end
    for key, button in pairs(widgets.sortButtons) do
        local suffix = ""
        if key == sortKey then suffix = sortDescending and " v" or " ^" end
        button.text:SetText(button.label .. suffix)
    end
end

local function selectQuest(questId)
    selectedId = questId
    refreshList()
    if refreshDetail then refreshDetail() end
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

local function pointText(entry)
    local Catalog = catalog()
    local zone = entry.area and (Catalog.ZoneLabel(nil, entry.area) or "") or ""
    if entry.x and entry.y then
        return format("%s |cffa0a0a0%s %.1f, %.1f|r", entry.name, zone, entry.x, entry.y)
    end
    return entry.name
end

--- Difficulty: the player levels at which the quest turns yellow, green and grey.
-- Blizzard's own colour rule (GetQuestDifficultyColor): yellow from 2 levels below the quest's, green
-- from 3 above, grey beyond the green range, which the client reports for the player's level.
local function difficultyText(level)
    if type(level) ~= "number" or level <= 0 then return "-" end
    local range = 5
    if GetQuestGreenRange then
        local ok, value = pcall(GetQuestGreenRange)
        if ok and type(value) == "number" and value > 0 then range = value end
    end
    return format("|cffffff00%d|r  |cff40c040%d|r  |cff808080%d|r",
        max(1, level - 2), level + 3, level + range + 1)
end

-- Map preview ---------------------------------------------------------------------------------

local function ensureMapTiles()
    local map = widgets.map
    if map.tiles then return end
    map.tiles = {}
    for i = 1, MAX_TILES do
        local t = map:CreateTexture(nil, "BACKGROUND")
        t:Hide()
        map.tiles[i] = t
    end
    map.pins = {}
    for i = 1, MAX_PINS do
        local p = map:CreateTexture(nil, "OVERLAY")
        p:SetSize(16, 16)
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
    pin:SetTexture(Icons.Get(kind))
    pin:ClearAllPoints()
    pin:SetPoint("CENTER", map, "TOPLEFT", (x / 100) * MAP_W, -(y / 100) * MAP_H)
    pin:Show()
    return true
end

local function drawMapPins(quest, area)
    local map = widgets.map
    for _, p in ipairs(map.pins) do p:Hide() end
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
            button:Show()
            button.text:SetText(Zones.GetAreaName(mapAreas[i]))
            button:SetActive(i == index)
        else
            button:Hide()
        end
    end
    if not area then
        drawMapArt(nil)
        for _, p in ipairs(map.pins) do p:Hide() end
        map.fallbackText:SetText(L["No location is known for this quest."])
        return
    end
    map.fallbackText:SetText(Zones.GetAreaName(area))
    drawMapArt(Zones.GetUiMapIdByAreaId(area))
    drawMapPins(quest, area)
end

function refreshDetail()
    if not frame then return end
    local d = widgets.detail
    local DB = ns.DB
    local quest = selectedId and DB.GetQuest(selectedId)
    if not quest then
        d.panel:Hide()
        d.hint:Show()
        return
    end
    d.hint:Hide()
    d.panel:Show()

    local hex = colorHex(quest.questLevel or 0)
    d.title:SetText(quest.name or ("Quest " .. selectedId))
    local side = ns.QuestCatalog.SideOf(quest.requiredRaces)
    d.subtitle:SetText(format(L["A level %d quest for %s, from level %d."], quest.questLevel or 0,
        sideText(side), max(1, quest.requiredLevel or 1)))

    -- objectives
    local text = quest.objectivesText
    d.objectives:SetText(type(text) == "table" and tconcat(text, "\n\n") or tostring(text or ""))

    -- rewards
    local rewards = {}
    local xp = ns.Data and ns.Data.questXP and ns.Data.questXP[selectedId]
    if type(xp) == "table" and xp[2] then rewards[#rewards + 1] = format(L["%d experience"], xp[2]) end
    if type(quest.reputationReward) == "table" then
        for _, entry in ipairs(quest.reputationReward) do
            if type(entry) == "table" and entry[1] and entry[2] then
                rewards[#rewards + 1] = format("%+d %s", entry[2], tostring(entry[1]))
            end
        end
    end
    d.rewards:SetText(#rewards > 0 and tconcat(rewards, "\n") or L["Not in the database."])

    -- start / end
    local startTexts, endTexts = {}, {}
    for _, e in ipairs(endpoints(quest, "startedBy")) do startTexts[#startTexts + 1] = pointText(e) end
    for _, e in ipairs(endpoints(quest, "finishedBy")) do endTexts[#endTexts + 1] = pointText(e) end
    d.startText:SetText(#startTexts > 0 and tconcat(startTexts, "\n") or "-")
    d.endText:SetText(#endTexts > 0 and tconcat(endTexts, "\n") or "-")

    d.level:SetText(format("|c%s%d|r, %s %d", "ff" .. hex:sub(1, 6), quest.questLevel or 0,
        L["requires level"], quest.requiredLevel or 0))
    d.difficulty:SetText(difficultyText(quest.questLevel))
    d.side:SetText(sideText(side))
    local shareable = quest.questFlags and bit and bit.band(quest.questFlags, ns.Schema.questFlags.SHARABLE) ~= 0
    d.shareable:SetText(shareable and L["Yes"] or L["No"])
    d.questId:SetText(tostring(selectedId))

    mapAreas = collectAreas(quest)
    showMapArea(quest, 1)
    d.quest = quest
end

local function onAreaTab(index)
    local quest = widgets.detail.quest
    if quest then showMapArea(quest, index) end
end

local function navigate()
    local quest = widgets.detail and widgets.detail.quest
    if not quest then return end
    local Targets, Router = ns.Targets, ns.Router
    local list = Targets and Targets.GetForQuest and Targets.GetForQuest(quest.id)
    local target = list and list[1]
    if target and Router and Router.SetManualTarget then
        Router.SetManualTarget(target)
        Log.Print(L["Navigating to: %s"], quest.name or tostring(quest.id))
    else
        Log.Print(L["No target found for quest %d."], quest.id)
    end
end

local function showWowhead()
    local quest = widgets.detail and widgets.detail.quest
    local Wowhead = ns.Wowhead
    if quest and Wowhead and Wowhead.ShowCopyDialog then
        Wowhead.ShowCopyDialog(Wowhead.QuestUrl(quest.id))
    end
end

---------------------------------------------------------------------------
-- Building the window
---------------------------------------------------------------------------

local function buildFilters(parent)
    local top = -34
    newText(parent, "OVERLAY", "GameFontNormalSmall", "TOPLEFT", parent, 12, top, nil):SetText(L["Name"])
    local name = CreateFrame("EditBox", "PandaQuestBrowserName", parent)
    name:SetSize(170, 20)
    name:SetPoint("TOPLEFT", parent, "TOPLEFT", 12, top - 14)
    name:SetAutoFocus(false)
    name:SetFontObject("GameFontHighlightSmall")
    name:SetTextInsets(4, 4, 0, 0)
    local bg = name:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(name)
    fillColor(bg, 0.05, 0.05, 0.07, 0.95)
    name:SetScript("OnTextChanged", function(self)
        local text = self:GetText() or ""
        filter.text = text ~= "" and text:lower() or nil
        runQuery()
        rebuildTree()
    end)
    name:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    name:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
    widgets.name = name

    local function levelBox(x, label, field)
        newText(parent, "OVERLAY", "GameFontNormalSmall", "TOPLEFT", parent, x, top, nil):SetText(label)
        local box = CreateFrame("EditBox", nil, parent)
        box:SetSize(38, 20)
        box:SetPoint("TOPLEFT", parent, "TOPLEFT", x, top - 14)
        box:SetAutoFocus(false)
        box:SetNumeric(true)
        box:SetMaxLetters(3)
        box:SetFontObject("GameFontHighlightSmall")
        box:SetJustifyH("CENTER")
        local b = box:CreateTexture(nil, "BACKGROUND")
        b:SetAllPoints(box)
        fillColor(b, 0.05, 0.05, 0.07, 0.95)
        box:SetScript("OnTextChanged", function(self)
            local value = tonumber(self:GetText())
            filter[field] = value and value > 0 and value or nil
            runQuery()
            rebuildTree()
        end)
        box:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
        box:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
        return box
    end
    widgets.minLevel = levelBox(196, L["Level"], "minLevel")
    widgets.maxLevel = levelBox(240, L["to"], "maxLevel")

    local myLevel = newButton(parent, L["My level"], 70, 20, function(self)
        filter.myLevel = not filter.myLevel
        self:SetActive(filter.myLevel)
        refreshAll()
    end)
    myLevel:SetPoint("TOPLEFT", parent, "TOPLEFT", 290, top - 14)
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
    sideButton:SetPoint("TOPLEFT", parent, "TOPLEFT", 366, top - 14)
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
        b:SetPoint("TOPLEFT", parent, "TOPLEFT", x, top - 14)
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
    reset:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -12, top - 14)
end

local function buildTree(parent)
    local panel = newPanel(parent, 0.04, 0.04, 0.06, 0.9)
    panel:SetPoint("TOPLEFT", parent, "TOPLEFT", 12, -84)
    panel:SetSize(190, TREE_ROWS * 21 + 4)
    widgets.treePanel = panel
    widgets.treeRows = {}
    for i = 1, TREE_ROWS do
        local row = CreateFrame("Button", nil, panel)
        row:SetSize(186, 21)
        row:SetPoint("TOPLEFT", panel, "TOPLEFT", 2, -2 - (i - 1) * 21)
        local sel = row:CreateTexture(nil, "BACKGROUND")
        sel:SetAllPoints(row)
        fillColor(sel, 0.5, 0.4, 0.1, 0.35)
        sel:Hide()
        row.sel = sel
        local hl = row:CreateTexture(nil, "HIGHLIGHT")
        hl:SetAllPoints(row)
        fillColor(hl, 1, 1, 1, 0.08)
        row.text = newText(row, "OVERLAY", "GameFontNormalSmall", "LEFT", row, 6, 0, 130, "LEFT")
        row.count = newText(row, "OVERLAY", "GameFontDisableSmall", "RIGHT", row, -6, 0, 40, "RIGHT")
        row:SetScript("OnClick", onTreeClick)
        widgets.treeRows[i] = row
    end
    panel:EnableMouseWheel(true)
    panel:SetScript("OnMouseWheel", function(_, delta)
        treeOffset = max(0, min(treeOffset - delta * 3, max(0, #treeRows - TREE_ROWS)))
        refreshTree()
    end)
end

local COLUMNS = {
    { key = "name", label = "Quest", x = 6, w = 190, justify = "LEFT" },
    { key = "zone", label = "Zone", x = 200, w = 110, justify = "LEFT" },
    { key = "level", label = "Level", x = 314, w = 34, justify = "CENTER" },
    { key = "minLevel", label = "Req.", x = 350, w = 34, justify = "CENTER" },
    { key = "xp", label = "XP", x = 386, w = 44, justify = "RIGHT" },
}

local function buildList(parent)
    local panel = newPanel(parent, 0.04, 0.04, 0.06, 0.9)
    panel:SetPoint("TOPLEFT", parent, "TOPLEFT", 210, -84)
    panel:SetSize(460, 24 + ROWS * ROW_H + 4)
    widgets.listPanel = panel

    widgets.sortButtons = {}
    for _, col in ipairs(COLUMNS) do
        local label = L[col.label]
        local b = newButton(panel, label, col.w, 20, function()
            if sortKey == col.key then
                sortDescending = not sortDescending
            else
                sortKey, sortDescending = col.key, false
            end
            runQuery()
        end)
        b:SetPoint("TOPLEFT", panel, "TOPLEFT", col.x, -2)
        b.label = label
        widgets.sortButtons[col.key] = b
    end

    widgets.rows = {}
    for i = 1, ROWS do
        local row = CreateFrame("Button", nil, panel)
        row:SetSize(430, ROW_H)
        row:SetPoint("TOPLEFT", panel, "TOPLEFT", 2, -24 - (i - 1) * ROW_H)
        local sel = row:CreateTexture(nil, "BACKGROUND")
        sel:SetAllPoints(row)
        fillColor(sel, 0.5, 0.4, 0.1, 0.35)
        sel:Hide()
        row.sel = sel
        local hl = row:CreateTexture(nil, "HIGHLIGHT")
        hl:SetAllPoints(row)
        fillColor(hl, 1, 1, 1, 0.08)
        row.side = row:CreateTexture(nil, "ARTWORK")
        row.side:SetSize(14, 14)
        row.side:SetPoint("LEFT", row, "LEFT", 4, 0)
        row.name = newText(row, "OVERLAY", "GameFontNormalSmall", "LEFT", row, 22, 0, 176, "LEFT")
        row.zone = newText(row, "OVERLAY", "GameFontHighlightSmall", "LEFT", row, 200, 0, 110, "LEFT")
        row.level = newText(row, "OVERLAY", "GameFontHighlightSmall", "LEFT", row, 314, 0, 34, "CENTER")
        row.req = newText(row, "OVERLAY", "GameFontHighlightSmall", "LEFT", row, 350, 0, 34, "CENTER")
        row.xp = newText(row, "OVERLAY", "GameFontHighlightSmall", "LEFT", row, 386, 0, 40, "RIGHT")
        row:SetScript("OnClick", function(self)
            if self.questId then selectQuest(self.questId) end
        end)
        widgets.rows[i] = row
    end

    local slider = CreateFrame("Slider", nil, panel)
    slider:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -2, -24)
    slider:SetSize(14, ROWS * ROW_H)
    slider:SetOrientation("VERTICAL")
    slider:SetMinMaxValues(0, 0)
    slider:SetValueStep(1)
    local track = slider:CreateTexture(nil, "BACKGROUND")
    track:SetAllPoints(slider)
    fillColor(track, 0.1, 0.1, 0.12, 0.9)
    slider:SetThumbTexture("Interface\\Buttons\\WHITE8X8")
    local thumb = slider:GetThumbTexture()
    if type(thumb) == "table" and thumb.SetSize then
        thumb:SetSize(12, 24)
        thumb:SetVertexColor(0.6, 0.5, 0.2, 1)
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

    widgets.count = newText(panel, "OVERLAY", "GameFontDisableSmall", "BOTTOMLEFT", panel, 8, -16, nil, "LEFT")
    widgets.count:ClearAllPoints()
    widgets.count:SetPoint("TOPLEFT", panel, "BOTTOMLEFT", 4, -4)
    widgets.emptyText = newText(panel, "OVERLAY", "GameFontNormal", "CENTER", panel, 0, 0, 380, "CENTER")
end

local function buildDetail(parent)
    local panel = newPanel(parent, 0.04, 0.04, 0.06, 0.9)
    panel:SetPoint("TOPLEFT", parent, "TOPLEFT", 678, -84)
    panel:SetSize(270, 24 + ROWS * ROW_H + 4)
    local d = { panel = CreateFrame("Frame", nil, panel) }
    widgets.detail = d
    d.panel:SetAllPoints(panel)

    d.hint = newText(panel, "OVERLAY", "GameFontNormal", "CENTER", panel, 0, 0, 230, "CENTER")
    d.hint:SetText(L["Pick a quest from the list to see its page."])
    setColor(d.hint, { 0.7, 0.7, 0.7 })

    local p = d.panel
    d.title = newText(p, "OVERLAY", "GameFontNormalLarge", "TOPLEFT", p, 8, -8, 254, "LEFT")
    setColor(d.title, COLOR_GOLD)
    d.subtitle = newText(p, "OVERLAY", "GameFontHighlightSmall", "TOPLEFT", p, 8, -30, 254, "LEFT")
    setColor(d.subtitle, { 0.85, 0.85, 0.85 })

    -- map with its area tabs
    d.areaTabs = {}
    widgets.areaTabs = d.areaTabs
    for i = 1, 4 do
        local b = newButton(p, "", 64, 16, function() onAreaTab(i) end)
        b:SetPoint("TOPLEFT", p, "TOPLEFT", 8 + (i - 1) * 66, -52)
        b.text:SetFontObject("GameFontDisableSmall")
        b:Hide()
        d.areaTabs[i] = b
    end
    local map = CreateFrame("Frame", nil, p)
    map:SetSize(MAP_W, MAP_H)
    map:SetPoint("TOPLEFT", p, "TOPLEFT", 8, -72)
    local mapBg = map:CreateTexture(nil, "BACKGROUND")
    mapBg:SetAllPoints(map)
    fillColor(mapBg, 0.16, 0.13, 0.08, 1)
    map.fallback = CreateFrame("Frame", nil, map)
    map.fallback:SetAllPoints(map)
    map.fallbackText = newText(map.fallback, "OVERLAY", "GameFontDisableSmall", "CENTER", map.fallback, 0, 0, 240, "CENTER")
    widgets.map = map

    local y = -72 - MAP_H - 8
    local function line(label, key, height)
        local l = newText(p, "OVERLAY", "GameFontNormalSmall", "TOPLEFT", p, 8, y, 60, "LEFT")
        l:SetText(label)
        setColor(l, COLOR_GOLD)
        local v = newText(p, "OVERLAY", "GameFontHighlightSmall", "TOPLEFT", p, 72, y, 192, "LEFT")
        v:SetHeight(height or 14)
        d[key] = v
        y = y - (height or 14) - 3
    end
    line(L["Start"], "startText", 26)
    line(L["End"], "endText", 26)
    line(L["Level"], "level")
    line(L["Difficulty"], "difficulty")
    line(L["Side"], "side")
    line(L["Shareable"], "shareable")
    line(L["Quest ID"], "questId")

    local rewardsLabel = newText(p, "OVERLAY", "GameFontNormalSmall", "TOPLEFT", p, 8, y, 60, "LEFT")
    rewardsLabel:SetText(L["Rewards"])
    setColor(rewardsLabel, COLOR_GOLD)
    d.rewards = newText(p, "OVERLAY", "GameFontHighlightSmall", "TOPLEFT", p, 72, y, 192, "LEFT")
    d.rewards:SetHeight(28)
    y = y - 32
    d.objectives = newText(p, "OVERLAY", "GameFontHighlightSmall", "TOPLEFT", p, 8, y, 254, "LEFT")
    d.objectives:SetHeight(max(30, 24 + ROWS * ROW_H + 4 + y - 40))
    d.objectives:SetJustifyV("TOP")
    setColor(d.objectives, { 0.85, 0.8, 0.65 })

    local nav = newButton(p, L["Navigate"], 120, 20, navigate)
    nav:SetPoint("BOTTOMLEFT", p, "BOTTOMLEFT", 8, 6)
    local wh = newButton(p, L["Wowhead link"], 120, 20, showWowhead)
    wh:SetPoint("BOTTOMRIGHT", p, "BOTTOMRIGHT", -8, 6)

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
    fillColor(bg, 0.07, 0.07, 0.1, 0.97)
    local header = frame:CreateTexture(nil, "BORDER")
    header:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    header:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    header:SetHeight(26)
    fillColor(header, 0.12, 0.1, 0.05, 1)

    local title = newText(frame, "OVERLAY", "GameFontNormal", "TOPLEFT", frame, 12, -7, nil, "LEFT")
    title:SetText("PandaQuest - " .. L["Quests"])
    setColor(title, COLOR_GOLD)

    local close = newButton(frame, "X", 22, 18, function() M.Hide() end)
    close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -4)

    buildFilters(frame)
    buildTree(frame)
    buildList(frame)
    buildDetail(frame)

    frame:SetScript("OnShow", function()
        local Catalog = catalog()
        if Catalog and not Catalog.IsReady() then Catalog.Build() end
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
    return frame
end

---------------------------------------------------------------------------
-- Public
---------------------------------------------------------------------------

function M.IsShown() return frame and frame:IsShown() or false end

--- GetResults() -> the quests the current filters leave, in the current order (shared; do not mutate).
function M.GetResults() return results end

--- GetSelected() -> questID|nil
function M.GetSelected() return selectedId end

--- GetWidgets() -> the window's widget table (for tests and for other addons that want to anchor to it).
function M.GetWidgets() return widgets end

function M.Show()
    local f = build()
    if not f then return false end
    local Catalog = catalog()
    if Catalog and not Catalog.IsReady() then Catalog.Build() end
    f:Show()
    if Catalog and Catalog.IsReady() then refreshAll() else
        results = {}
        if refreshList then refreshList() end
    end
    return true
end

function M.Hide()
    if frame then frame:Hide() end
end

function M.Toggle()
    if M.IsShown() then M.Hide() else M.Show() end
end

--- Open(questID): show the window with that quest's page.
function M.Open(questID)
    if not M.Show() then return false end
    selectQuest(questID)
    return true
end

-- The catalog finishes asynchronously; the window fills in when it does.
local listener = {}
M.listener = listener
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
end

function M.Init() end

function M.Enable()
    if listener.RegisterMessage then
        listener:RegisterMessage("PQ_CATALOG_READY", function()
            if frame and frame:IsShown() then refreshAll() end
        end)
        listener:RegisterMessage("PQ_DB_READY", function()
            local Catalog = catalog()
            if Catalog then Catalog.Invalidate() end
        end)
    end
end

function M.OnProfileChanged() end

return M
