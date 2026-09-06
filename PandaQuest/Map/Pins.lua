-- Map/Pins.lua: world-map and minimap pins through HereBeDragons-Pins-2.0 (docs/06 section 10).
--
-- Model (Questie's QuestieMap, see docs/liitteet/A section 5): targets are folded into "specs",
-- one per coordinate, so several quests that share a spawn become a single pin with one tooltip.
-- The specs are then drained by a draw queue that creates at most PINS_PER_FRAME frames per
-- OnUpdate, which keeps a 300-pin zone from freezing the client for a second.
local _, ns = ...
local L = ns.L

local Const, Util, Log = ns.Const, ns.Util, ns.Log

local M = {}
ns.Pins = M

local type, pairs, tostring, format = type, pairs, tostring, string.format
local tremove, floor = table.remove, math.floor
local wipe = wipe or function(t) for k in pairs(t) do t[k] = nil end return t end

local PINS_PER_FRAME = 24           -- docs/06 section 10: max 24 pins drawn per frame
local MAX_PINS = 300                -- hard cap; a zone with more spawns than this is unreadable anyway
local REDRAW_DELAY = 0.2            -- coalesce redraw bursts (three messages can arrive in one frame)
local HBD_REF = "PandaQuest"

-- Layer per Target.kind (docs/06 section 10).
local KIND_LAYER = {
    OBJECTIVE = "objective", ITEMUSE = "objective", EXPLORE = "objective",
    TURNIN = "turnin", PICKUP = "available", CUSTOM = "custom",
}
local LAYERS = { "available", "objective", "turnin", "custom" }
-- Layers that mirror a profile key; "custom" is always on (the player placed it by hand).
local LAYER_PROFILE_KEY = { available = "showAvailable", objective = "showObjectives", turnin = "showTurnIn" }
-- Which icon wins when two targets share a coordinate: turn-ins first, then objectives.
local LAYER_RANK = { turnin = 1, objective = 2, custom = 3, available = 4 }

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local specs = {}                    -- array of pin specs, rebuilt on Redraw
local queue = {}                    -- specs waiting for a frame
local queueIndex = 1
local activeWorld = {}              -- pin frame -> spec
local activeMinimap = {}
local pool = {}                     -- free pin frames
local pinCount = 0
local currentKey = nil              -- Router's current target key (highlight)
local redrawPending = false
local driver                        -- OnUpdate frame that drains the queue
local layerOverride = {}            -- runtime SetLayerVisible values (nil = follow the profile)

local function profile()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.profile
end

local function mapProfile()
    local p = profile()
    return p and p.map
end

local function hbdPins()
    if not LibStub then return nil end
    local ok, lib = pcall(LibStub, "HereBeDragons-Pins-2.0", true)
    if ok then return lib end
    return nil
end

---------------------------------------------------------------------------
-- Layers
---------------------------------------------------------------------------

--- Pins.IsLayerVisible(layer) -> bool. Runtime overrides win over the profile keys.
function M.IsLayerVisible(layer)
    if layerOverride[layer] ~= nil then return layerOverride[layer] end
    local key = LAYER_PROFILE_KEY[layer]
    if not key then return true end                 -- "custom" and unknown layers stay on
    local map = mapProfile()
    if not map then return true end
    return map[key] ~= false
end

--- Pins.SetLayerVisible(layer, visible): toggles a layer and redraws. Layers that own a profile
-- key write it back so the choice survives a reload; the rest live for this session only.
function M.SetLayerVisible(layer, visible)
    if not LAYER_RANK[layer] then return false end
    visible = visible and true or false
    local key = LAYER_PROFILE_KEY[layer]
    local map = mapProfile()
    if key and map then
        map[key] = visible
        layerOverride[layer] = nil
        local PQ = ns.PQ
        if PQ and PQ.SendMessage then PQ:SendMessage("PQ_SETTING_CHANGED", "map." .. key, visible) end
    else
        layerOverride[layer] = visible
    end
    M.Redraw()
    return true
end

--- Pins.GetLayers() -> the four layer names, in draw order.
function M.GetLayers()
    return LAYERS
end

---------------------------------------------------------------------------
-- Pin frames
---------------------------------------------------------------------------

local onEnter, onLeave, onClick

local function acquirePin()
    local pin = tremove(pool)
    if pin then return pin end
    if not CreateFrame then return nil end
    pinCount = pinCount + 1
    pin = CreateFrame("Button", "PandaQuestPin" .. pinCount, UIParent)
    pin:SetSize(16, 16)
    pin.texture = pin:CreateTexture(nil, "OVERLAY")
    pin.texture:SetAllPoints(pin)
    pin.glow = pin:CreateTexture(nil, "BACKGROUND")
    pin.glow:SetPoint("CENTER", pin, "CENTER", 0, 0)
    pin.glow:SetTexture(ns.Icons and ns.Icons.Get("glow") or nil)
    pin.glow:Hide()
    if pin.RegisterForClicks then pin:RegisterForClicks("LeftButtonUp", "RightButtonUp") end
    pin:SetScript("OnEnter", onEnter)
    pin:SetScript("OnLeave", onLeave)
    pin:SetScript("OnClick", onClick)
    return pin
end

local function releasePin(pin)
    if not pin then return end
    pin.spec = nil
    pin.data = nil
    pin.context = nil
    if pin.glow then pin.glow:Hide() end
    pin:Hide()
    pool[#pool + 1] = pin
end

local function applyHighlight(pin)
    if not pin or not pin.glow then return end
    local spec = pin.spec
    local on = false
    if currentKey and spec and spec.keys then
        on = spec.keys[currentKey] and true or false
    end
    if on then
        local size = (pin:GetWidth() or 16) * 1.8
        pin.glow:SetSize(size, size)
        pin.glow:Show()
    else
        pin.glow:Hide()
    end
end

---------------------------------------------------------------------------
-- Spec building
---------------------------------------------------------------------------

local function isHidden(questID)
    if not questID then return false end
    local PQ = ns.PQ
    local char = PQ and PQ.db and PQ.db.char
    if char and char.hiddenQuests and char.hiddenQuests[questID] then return true end
    if ns.DB and ns.DB.IsQuestHiddenOnMap and ns.DB.IsQuestHiddenOnMap(questID) then return true end
    return false
end

local function uiMapFor(target, spawn)
    local uiMapID = spawn and spawn.uiMapID or nil
    if not uiMapID and spawn and spawn.areaID and ns.Zones and ns.Zones.GetUiMapIdByAreaId then
        uiMapID = ns.Zones.GetUiMapIdByAreaId(spawn.areaID)
    end
    return uiMapID or target.uiMapID
end

-- Coordinate merge key. clusterSpawns rounds to whole percent (~1 % of the zone), which folds a
-- pack of mobs into one pin; without it the key keeps a tenth of a percent.
local function coordKey(uiMapID, x, y, cluster)
    if cluster then
        return format("%d:%d:%d", uiMapID, floor(x + 0.5), floor(y + 0.5))
    end
    return format("%d:%.1f:%.1f", uiMapID, x, y)
end

local function addSpawn(byKey, target, layer, uiMapID, x, y, cluster)
    if type(uiMapID) ~= "number" or type(x) ~= "number" or type(y) ~= "number" then return end
    if x < 0 or x > 100 or y < 0 or y > 100 then return end
    local key = coordKey(uiMapID, x, y, cluster)
    local spec = byKey[key]
    if not spec then
        if #specs >= MAX_PINS then return end
        spec = { key = key, uiMapID = uiMapID, x = x, y = y, layer = layer,
                 rank = LAYER_RANK[layer] or 9, count = 0, targets = {}, keys = {} }
        byKey[key] = spec
        specs[#specs + 1] = spec
    end
    spec.count = spec.count + 1
    if not spec.keys[target.key] then
        spec.keys[target.key] = true
        spec.targets[#spec.targets + 1] = target
    end
    local rank = LAYER_RANK[layer] or 9
    if rank < spec.rank then
        spec.rank, spec.layer = rank, layer
    end
end

--- Rebuilds `specs` from ns.Targets. Allocates, so it only runs from Redraw, never per frame.
local function buildSpecs()
    wipe(specs)
    local byKey = {}
    local Targets = ns.Targets
    local list = Targets and Targets.GetAll and Targets.GetAll() or nil
    if type(list) ~= "table" then return 0 end
    local map = mapProfile()
    local cluster = not map or map.clusterSpawns ~= false
    for i = 1, #list do
        local target = list[i]
        local layer = target and (KIND_LAYER[target.kind] or "objective")
        if target and M.IsLayerVisible(layer) and not isHidden(target.questID) then
            local spawns = target.spawns
            if type(spawns) == "table" and #spawns > 0 then
                for j = 1, #spawns do
                    local spawn = spawns[j]
                    addSpawn(byKey, target, layer, uiMapFor(target, spawn), spawn.x, spawn.y, cluster)
                end
            else
                addSpawn(byKey, target, layer, target.uiMapID, target.x, target.y, cluster)
            end
        end
    end
    return #specs
end

---------------------------------------------------------------------------
-- Draw queue
---------------------------------------------------------------------------

local function placePin(spec, minimap)
    local lib = hbdPins()
    if not lib then return nil end
    local pin = acquirePin()
    if not pin then return nil end
    pin.spec = spec
    pin.data = spec.targets[1]
    pin.context = minimap and "minimap" or "world"
    if ns.Icons then ns.Icons.Apply(pin.texture, spec.targets[1], minimap, pin) end
    local map = mapProfile()
    local ok
    if minimap then
        local float = not map or map.fadeMinimapEdge ~= false
        ok = lib:AddMinimapIconMap(HBD_REF, pin, spec.uiMapID, spec.x / 100, spec.y / 100, false, float)
    else
        ok = lib:AddWorldMapIconMap(HBD_REF, pin, spec.uiMapID, spec.x / 100, spec.y / 100)
    end
    if not ok then
        releasePin(pin)
        return nil
    end
    applyHighlight(pin)
    return pin
end

--- Draws up to `budget` queued specs. Returns how many were drawn.
function M.ProcessQueue(budget)
    budget = budget or PINS_PER_FRAME
    local map = mapProfile()
    local wantMinimap = not map or map.showOnMinimap ~= false
    local drawn = 0
    while drawn < budget and queueIndex <= #queue do
        local spec = queue[queueIndex]
        queueIndex = queueIndex + 1
        local world = placePin(spec, false)
        if world then activeWorld[world] = spec end
        if wantMinimap then
            local mini = placePin(spec, true)
            if mini then activeMinimap[mini] = spec end
        end
        drawn = drawn + 1
    end
    if queueIndex > #queue then
        wipe(queue)
        queueIndex = 1
        if driver then driver:Hide() end
    end
    return drawn
end

local function ensureDriver()
    if driver or not CreateFrame then return driver end
    driver = CreateFrame("Frame", "PandaQuestPinDriver", UIParent)
    driver:Hide()
    driver:SetScript("OnUpdate", function()
        -- No allocations here: ProcessQueue only pulls from the pre-built queue.
        M.ProcessQueue(PINS_PER_FRAME)
    end)
    return driver
end

---------------------------------------------------------------------------
-- Public draw API
---------------------------------------------------------------------------

--- Pins.Clear(): removes every pin from both maps and returns the frames to the pool.
function M.Clear()
    local lib = hbdPins()
    if lib then
        lib:RemoveAllWorldMapIcons(HBD_REF)
        lib:RemoveAllMinimapIcons(HBD_REF)
    end
    for pin in pairs(activeWorld) do releasePin(pin) end
    for pin in pairs(activeMinimap) do releasePin(pin) end
    wipe(activeWorld)
    wipe(activeMinimap)
    wipe(queue)
    queueIndex = 1
    if driver then driver:Hide() end
end

--- Pins.Redraw([immediate]): rebuilds the pin set. Without `immediate` the drawing is spread over
-- following frames (24 pins each); with it everything is drawn at once (used by tests and /pq reset).
function M.Redraw(immediate)
    redrawPending = false
    M.Clear()
    local p = profile()
    if not p then return 0 end
    local count = buildSpecs()
    for i = 1, count do queue[i] = specs[i] end
    queueIndex = 1
    if count == 0 then return 0 end
    if immediate then
        M.ProcessQueue(count * 2 + 1)
    else
        local d = ensureDriver()
        if d then d:Show() else M.ProcessQueue(count * 2 + 1) end
    end
    Log.Debug("Pins", "redraw: %d pins queued", count)
    return count
end

-- Coalesces the redraw bursts that arrive when Targets, Availability and Router all update.
local function requestRedraw()
    if redrawPending then return end
    redrawPending = true
    if C_Timer and C_Timer.After then
        C_Timer.After(REDRAW_DELAY, function()
            if redrawPending then M.Redraw() end
        end)
    else
        M.Redraw()
    end
end
M.RequestRedraw = requestRedraw

--- Pins.SetCurrent(target|nil): highlights the pins that carry the router's current target.
function M.SetCurrent(target)
    local key = target and target.key or nil
    if key == currentKey then return end
    currentKey = key
    for pin in pairs(activeWorld) do applyHighlight(pin) end
    for pin in pairs(activeMinimap) do applyHighlight(pin) end
end

--- Pins.ShowTarget(target): opens the world map on the target's zone (Arrow's "Show on map").
function M.ShowTarget(target)
    if not target or not target.uiMapID then return false end
    local frame = _G and _G.WorldMapFrame
    if not frame then return false end
    if frame.SetMapID then pcall(frame.SetMapID, frame, target.uiMapID) end
    if not frame:IsShown() and frame.Show then frame:Show() end
    M.SetCurrent(target)
    return true
end

---------------------------------------------------------------------------
-- Introspection (options UI, tests)
---------------------------------------------------------------------------

function M.GetSpecs() return specs end
function M.GetPinCount()
    local world, mini = 0, 0
    for _ in pairs(activeWorld) do world = world + 1 end
    for _ in pairs(activeMinimap) do mini = mini + 1 end
    return world, mini
end
function M.GetQueueLength() return #queue - (queueIndex - 1) end
function M.GetCurrentKey() return currentKey end
function M.GetPoolSize() return #pool end
M.PINS_PER_FRAME = PINS_PER_FRAME
M.MAX_PINS = MAX_PINS

---------------------------------------------------------------------------
-- Tooltip
---------------------------------------------------------------------------

--- Fills `lines` (an array, reused) with the tooltip text for a spec. Kept separate from the
-- tooltip frame so tests and the options preview can read the same text.
function M.BuildTooltipLines(spec, lines)
    lines = lines or {}
    wipe(lines)
    if not spec then return lines end
    local targets = spec.targets
    for i = 1, #targets do
        local target = targets[i]
        local title = target.questTitle or (target.questID and format("#%d", target.questID)) or L["Custom target"]
        if target.questLevel then
            title = Util.ColorText(format("[%d] %s", target.questLevel, title),
                Util.QuestDifficultyColorHex(target.questLevel))
        end
        lines[#lines + 1] = title
        if target.text then
            lines[#lines + 1] = "  " .. target.text
        end
    end
    local Router = ns.Router
    local distance = Router and Router.GetDistanceTo and Router.GetDistanceTo(targets[1]) or nil
    if distance then
        lines[#lines + 1] = Util.FormatDistance(distance)
    end
    if spec.count and spec.count > 1 then
        lines[#lines + 1] = format(L["%d spawns here"], spec.count)
    end
    lines[#lines + 1] = L["Left-click: navigate here"]
    lines[#lines + 1] = L["Shift-click: send to TomTom"]
    lines[#lines + 1] = L["Right-click: more options"]
    return lines
end

local tooltipLines = {}

function onEnter(self)
    local spec = self.spec
    if not spec or not GameTooltip then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:ClearLines()
    GameTooltip:AddLine(Const.CHAT_PREFIX)
    local lines = M.BuildTooltipLines(spec, tooltipLines)
    for i = 1, #lines do
        GameTooltip:AddLine(lines[i], 1, 1, 1, true)
    end
    GameTooltip:Show()
end

function onLeave()
    if GameTooltip and GameTooltip.Hide then GameTooltip:Hide() end
end

---------------------------------------------------------------------------
-- Clicks
---------------------------------------------------------------------------

--- Builds the right-click menu for a spec (docs/06 section 10: hide quest, Wowhead).
function M.BuildMenu(spec)
    local target = spec and spec.targets[1]
    local menu = {
        { text = Const.CHAT_PREFIX, isTitle = true, notCheckable = true },
    }
    if target then
        menu[#menu + 1] = { text = L["Set as target"], notCheckable = true, func = function()
            if ns.Router and ns.Router.SetManualTarget then ns.Router.SetManualTarget(target) end
        end }
    end
    for i = 1, (spec and #spec.targets or 0) do
        local t = spec.targets[i]
        if t.questID then
            menu[#menu + 1] = { text = format(L["Hide quest: %s"], t.questTitle or tostring(t.questID)),
                notCheckable = true, func = function()
                    local db = ns.PQ and ns.PQ.db
                    if db then db.char.hiddenQuests[t.questID] = true end
                    if ns.Targets and ns.Targets.Rebuild then ns.Targets.Rebuild("pinHide") end
                    M.Redraw()
                end }
            menu[#menu + 1] = { text = format(L["Wowhead: %s"], t.questTitle or tostring(t.questID)),
                notCheckable = true, func = function()
                    if ns.Wowhead and ns.Wowhead.ShowCopyDialog and ns.Wowhead.QuestUrl then
                        ns.Wowhead.ShowCopyDialog(ns.Wowhead.QuestUrl(t.questID))
                    end
                end }
        end
    end
    menu[#menu + 1] = { text = L["Close"], notCheckable = true, func = function() end }
    return menu
end

function M.OpenMenu(spec)
    local menu = M.BuildMenu(spec)
    M.lastMenu = menu
    -- EasyMenu is FrameXML, not a documented API: reach it through _G so a client without it
    -- simply loses the menu instead of erroring.
    local easyMenu = _G and _G.EasyMenu
    if easyMenu and CreateFrame then
        M.menuFrame = M.menuFrame or CreateFrame("Frame", "PandaQuestPinMenu", UIParent, "UIDropDownMenuTemplate")
        easyMenu(menu, M.menuFrame, "cursor", 0, 0, "MENU")
    end
    return menu
end

function onClick(self, button)
    local spec = self.spec
    local target = spec and spec.targets[1]
    if not target then return end
    if button == "RightButton" then
        M.OpenMenu(spec)
        return
    end
    local shift = IsShiftKeyDown and IsShiftKeyDown()
    if shift then
        local TomTom = ns.TomTomBridge
        if TomTom and TomTom.IsAvailable and TomTom.IsAvailable() and TomTom.SetWaypoint then
            TomTom.SetWaypoint(target)
            return
        end
        Log.Print(L["TomTom is not loaded."])
        return
    end
    if ns.Router and ns.Router.SetManualTarget then
        ns.Router.SetManualTarget(target)
    end
end

M.OnPinClick = onClick
M.OnPinEnter = onEnter

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    wipe(layerOverride)
end

function M.Enable()
    -- AceEvent keeps one callback per (object, message), and every module would otherwise share
    -- ns.PQ as that object and silently overwrite each other. Each module embeds its own.
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if not AceEvent then return end
    AceEvent:Embed(M)
    M:RegisterMessage("PQ_TARGETS_UPDATED", function() requestRedraw() end)
    M:RegisterMessage("PQ_AVAILABLE_UPDATED", function() requestRedraw() end)
    M:RegisterMessage("PQ_CURRENT_TARGET_CHANGED", function(_, target) M.SetCurrent(target) end)
    Log.Debug("Pins", "enabled (HBD pins %s)", hbdPins() and "ready" or "missing")
end

function M.OnDataReady()
    requestRedraw()
end

function M.OnProfileChanged()
    wipe(layerOverride)
    M.Redraw()
end
