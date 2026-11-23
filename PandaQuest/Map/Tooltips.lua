-- Map/Tooltips.lua: quest information on unit and item tooltips.
--
-- C_TooltipInfo does not exist on 5.5.4, so the only way in is the classic script hook:
-- GameTooltip fires OnTooltipSetUnit / OnTooltipSetItem after it has filled itself, and
-- HookScript appends our handler without replacing Blizzard's.
local _, ns = ...
local L = ns.L

local Util, Log = ns.Util, ns.Log

local M = ns.PQ:GetModule("Tooltips")   -- an AceAddon module (Core/Const.lua)
ns.Tooltips = M

local type, pairs, tonumber, tostring, format = type, pairs, tonumber, tostring, string.format
local wipe = wipe or function(t) for k in pairs(t) do t[k] = nil end return t end

local MAX_QUESTS_PER_TOOLTIP = 6        -- a hub NPC can start a dozen quests; keep the tooltip readable
local MAX_CACHE_ENTRIES = 200

-- Colours (r,g,b) per line kind.
local COLOR_TITLE = { 1, 0.82, 0 }      -- quest title, gold
local COLOR_OBJECTIVE = { 0.85, 0.85, 0.85 }
local COLOR_COMPLETE = { 0.2, 1, 0.2 }
local COLOR_AVAILABLE = { 0.4, 0.8, 1 }

local hooked = false
local cache = {}                        -- "npc:57232" -> { {text=, r=, g=, b=}, ... }
local cacheCount = 0
local vendorHotkey, vendorItemID
local vendorPins = {}
local VENDOR_PIN_REF = "PandaQuestItemVendors"
local MAX_VENDOR_PINS = 120

local function profile()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.profile
end

-- The hooks cannot be taken off a tooltip again, so a module switched off in Options > Modules
-- is told apart here, on every tooltip.
local function enabled()
    if not ns.IsModuleWanted("Tooltips") then return false end
    local p = profile()
    return not p or not p.tooltips or p.tooltips.enabled ~= false
end

local function showIds()
    local p = profile()
    return p and p.tooltips and p.tooltips.showIds and true or false
end

-- A quest the NPC starts gets its rewards under it unless tooltips.questRewards is off.
local function showRewards()
    local p = profile()
    return not p or not p.tooltips or p.tooltips.questRewards ~= false
end

local MAX_REWARD_CHARS = 60

-- Where an item comes from (tooltips.itemSources): the creatures that drop it, the objects it is
-- found in, the containers it comes out of and who sells it, from the item database.
local COLOR_SOURCE = { 0.55, 0.78, 0.95 }
local MAX_SOURCE_NAMES = 3

local function showItemSources()
    local p = profile()
    return not p or not p.tooltips or p.tooltips.itemSources ~= false
end

---------------------------------------------------------------------------
-- Cache
---------------------------------------------------------------------------

--- Tooltips.InvalidateCache(): drops every cached tooltip block (PQ_QUESTLOG_CHANGED).
function M.InvalidateCache()
    wipe(cache)
    cacheCount = 0
end

function M.GetCacheSize()
    return cacheCount
end

---------------------------------------------------------------------------
-- Line building
---------------------------------------------------------------------------

local function addLine(lines, text, color)
    if not text then return end
    color = color or COLOR_OBJECTIVE
    lines[#lines + 1] = { text = text, r = color[1], g = color[2], b = color[3] }
end

local function questTitle(questID)
    local QuestLog = ns.QuestLog
    local entry = QuestLog and QuestLog.GetQuest and QuestLog.GetQuest(questID) or nil
    if entry and entry.title then return entry.title end
    if ns.DB and ns.DB.GetQuestName then
        local name = ns.DB.GetQuestName(questID)
        if name then return name end
    end
    return format("#%d", questID)
end

local function decorate(text, questID)
    if showIds() and questID then
        return format("%s |cff808080(%d)|r", text, questID)
    end
    return text
end

-- Quests this entity starts that the player could pick up right now.
local function addStarters(lines, kind, id, count)
    local DB = ns.DB
    if not DB or not DB.GetQuestsStartedBy then return count end
    local list = DB.GetQuestsStartedBy(kind, id)
    if type(list) ~= "table" then return count end
    local Availability, QuestLog = ns.Availability, ns.QuestLog
    for i = 1, #list do
        if count >= MAX_QUESTS_PER_TOOLTIP then return count end
        local questID = list[i]
        local onQuest = QuestLog and QuestLog.IsOnQuest and QuestLog.IsOnQuest(questID)
        local available = true
        if Availability and Availability.IsAvailable then
            available = Availability.IsAvailable(questID) and true or false
        end
        if not onQuest and available then
            count = count + 1
            addLine(lines, decorate(format(L["Starts: %s"], questTitle(questID)), questID), COLOR_AVAILABLE)
            local Catalog = ns.QuestCatalog
            local summary = showRewards() and Catalog and Catalog.RewardSummary and Catalog.RewardSummary(questID)
            if summary then
                addLine(lines, "  " .. format(L["Reward: %s"], Util.Truncate(summary, MAX_REWARD_CHARS)), COLOR_OBJECTIVE)
            end
        end
    end
    return count
end

-- Quests in the log that this entity finishes.
local function addEnders(lines, kind, id, count)
    local DB = ns.DB
    if not DB or not DB.GetQuestsEndedBy then return count end
    local list = DB.GetQuestsEndedBy(kind, id)
    if type(list) ~= "table" then return count end
    local QuestLog = ns.QuestLog
    for i = 1, #list do
        if count >= MAX_QUESTS_PER_TOOLTIP then return count end
        local questID = list[i]
        if QuestLog and QuestLog.IsOnQuest and QuestLog.IsOnQuest(questID) then
            count = count + 1
            local complete = QuestLog.IsComplete and QuestLog.IsComplete(questID)
            local text = complete and format(L["Turn in: %s"], questTitle(questID))
                or format(L["Ends: %s"], questTitle(questID))
            addLine(lines, decorate(text, questID), complete and COLOR_COMPLETE or COLOR_TITLE)
        end
    end
    return count
end

-- Objectives this entity advances, read off the targets Nav already built:
-- "Moth-Ridden" / "Dappled Moth: 3/8".
local function addObjectives(lines, entityType, id, count)
    local Targets, QuestLog = ns.Targets, ns.QuestLog
    if not Targets or not Targets.GetAll then return count end
    local list = Targets.GetAll()
    if type(list) ~= "table" then return count end
    local seen
    for i = 1, #list do
        if count >= MAX_QUESTS_PER_TOOLTIP then return count end
        local target = list[i]
        if target.entityType == entityType and target.entityID == id and target.objectiveIndex then
            local objective = QuestLog and QuestLog.GetObjective
                and QuestLog.GetObjective(target.questID, target.objectiveIndex) or nil
            seen = seen or {}
            local dedupe = tostring(target.questID) .. ":" .. tostring(target.objectiveIndex)
            if not seen[dedupe] then
                seen[dedupe] = true
                count = count + 1
                addLine(lines, decorate(questTitle(target.questID), target.questID), COLOR_TITLE)
                local name = objective and objective.name or target.entityName or target.objectiveText
                if objective and objective.numRequired and objective.numRequired > 0 then
                    addLine(lines, format("  %s: %d/%d", name or "?",
                        objective.numFulfilled or 0, objective.numRequired), COLOR_OBJECTIVE)
                elseif target.objectiveText then
                    addLine(lines, "  " .. target.objectiveText, COLOR_OBJECTIVE)
                end
            end
        end
    end
    return count
end

--- Tooltips.BuildNpcLines(npcID) -> { {text, r, g, b}, ... }. Cached until PQ_QUESTLOG_CHANGED.
function M.BuildNpcLines(npcID)
    if type(npcID) ~= "number" then return nil end
    local key = "npc:" .. npcID
    local cached = cache[key]
    if cached then return cached end
    local lines = {}
    local count = 0
    count = addObjectives(lines, "npc", npcID, count)
    count = addEnders(lines, "npc", npcID, count)
    addStarters(lines, "npc", npcID, count)
    if cacheCount >= MAX_CACHE_ENTRIES then M.InvalidateCache() end
    cache[key] = lines
    cacheCount = cacheCount + 1
    return lines
end

--- Tooltips.BuildObjectLines(objectID) -> lines (used by the pin tooltips and /pq dump).
function M.BuildObjectLines(objectID)
    if type(objectID) ~= "number" then return nil end
    local key = "object:" .. objectID
    local cached = cache[key]
    if cached then return cached end
    local lines = {}
    local count = 0
    count = addObjectives(lines, "object", objectID, count)
    count = addEnders(lines, "object", objectID, count)
    addStarters(lines, "object", objectID, count)
    if cacheCount >= MAX_CACHE_ENTRIES then M.InvalidateCache() end
    cache[key] = lines
    cacheCount = cacheCount + 1
    return lines
end

-- "Drops from: Dappled Moth, Mistfall Ruffian and 4 more": names once each, hidden entries left out.
local function sourceLine(lines, label, list, nameOf, isHidden)
    if type(list) ~= "table" or #list == 0 then return end
    local names, seen, total = {}, {}, 0
    for i = 1, #list do
        local id = list[i]
        local name = type(id) == "number" and not (isHidden and isHidden(id)) and nameOf(id) or nil
        if type(name) == "string" and name ~= "" and not seen[name] then
            seen[name] = true
            total = total + 1
            if #names < MAX_SOURCE_NAMES then names[#names + 1] = name end
        end
    end
    if total == 0 then return end
    local text = table.concat(names, ", ")
    if total > #names then text = format(L["%s and %d more"], text, total - #names) end
    addLine(lines, format(label, text), COLOR_SOURCE)
end

local function addSources(lines, itemID)
    local DB = ns.DB
    if not (DB and DB.GetItemSources and showItemSources()) then return end
    local sources = DB.GetItemSources(itemID)
    if type(sources) ~= "table" then return end
    sourceLine(lines, L["Drops from: %s"], sources.npcs, DB.GetNpcName, DB.IsNpcHidden)
    sourceLine(lines, L["Found in: %s"], sources.objects, DB.GetObjectName, DB.IsObjectHidden)
    sourceLine(lines, L["Comes out of: %s"], sources.items, DB.GetItemName, DB.IsItemHidden)
    sourceLine(lines, L["Sold by: %s"], sources.vendors, DB.GetNpcName, DB.IsNpcHidden)
end

-- A tooltip line cannot receive clicks in the WoW UI.  The small action button
-- beneath an item tooltip is therefore the honest clickable equivalent of its
-- "Sold by" line.  It uses the same database coordinates as PandaQuest's map
-- pins and never invents a vendor location.
local function hbdPins()
    return LibStub and LibStub("HereBeDragons-Pins-2.0", true) or nil
end

local function clearVendorPins()
    local lib = hbdPins()
    for pin in pairs(vendorPins) do
        if lib then lib:RemoveWorldMapIcon(VENDOR_PIN_REF, pin) end
        pin:Hide()
        vendorPins[pin] = nil
    end
end

function M.ShowVendorsOnMap(itemID)
    local DB, Zones = ns.DB, ns.Zones
    local lib, frame = hbdPins(), _G and _G.WorldMapFrame
    if not (DB and Zones and lib and frame and DB.GetItemSources and DB.GetNpc) then return false end
    clearVendorPins()
    local sources, firstMap, count = DB.GetItemSources(itemID), nil, 0
    for _, npcID in ipairs(sources and sources.vendors or {}) do
        local npc = DB.GetNpc(npcID)
        for areaID, points in pairs(npc and npc.spawns or {}) do
            local uiMapID = Zones.GetUiMapIdByAreaId and Zones.GetUiMapIdByAreaId(areaID) or nil
            if uiMapID and type(points) == "table" then
                for _, point in ipairs(points) do
                    if count >= MAX_VENDOR_PINS then break end
                    local x, y = point[1], point[2]
                    if type(x) == "number" and type(y) == "number" then
                        local pin = CreateFrame("Button", nil, UIParent)
                        pin:SetSize(18, 18); pin:SetFrameStrata("HIGH")
                        pin.icon = pin:CreateTexture(nil, "OVERLAY"); pin.icon:SetAllPoints(pin)
                        pin.icon:SetTexture("Interface\\MINIMAP\\TRACKING\\Auctioneer")
                        pin.vendorName, pin.itemName = npc.name or ("Vendor #" .. npcID), DB.GetItemName(itemID) or ("Item #" .. itemID)
                        pin:SetScript("OnEnter", function(self)
                            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                            GameTooltip:SetText(self.vendorName, 1, 0.82, 0)
                            GameTooltip:AddLine("Sells " .. self.itemName, 1, 1, 1, true); GameTooltip:Show()
                        end)
                        pin:SetScript("OnLeave", function() GameTooltip:Hide() end)
                        if lib:AddWorldMapIconMap(VENDOR_PIN_REF, pin, uiMapID, x / 100, y / 100) then
                            vendorPins[pin] = true; count = count + 1; firstMap = firstMap or uiMapID
                        else pin:Hide() end
                    end
                end
            end
        end
    end
    if not firstMap then return false end
    if frame.SetMapID then pcall(frame.SetMapID, frame, firstMap) end
    if not frame:IsShown() then frame:Show() end
    return true
end

local function clearVendorShortcut()
    if vendorHotkey and ClearOverrideBindings then
        ClearOverrideBindings(vendorHotkey)
    end
end

-- Tooltips vanish before a button placed below them can be reached with the
-- mouse.  Keep the action on the tooltip itself instead: while the item is
-- hovered, Shift+M opens the map at its known vendor locations.
local function showVendorShortcut(tooltip, itemID)
    local DB = ns.DB
    local vendors = DB and DB.GetItemSources and DB.GetItemSources(itemID).vendors
    if type(vendors) ~= "table" or #vendors == 0 then
        clearVendorShortcut()
        return
    end
    if not vendorHotkey then
        vendorHotkey = CreateFrame("Button", "PandaQuestVendorMapHotkey", UIParent)
        vendorHotkey:SetScript("OnClick", function()
            if vendorItemID then M.ShowVendorsOnMap(vendorItemID) end
        end)
    end
    vendorItemID = itemID
    if not (InCombatLockdown and InCombatLockdown()) and SetOverrideBindingClick then
        SetOverrideBindingClick(vendorHotkey, true, "SHIFT-M", "PandaQuestVendorMapHotkey")
    end
    tooltip:AddLine("Press Shift+M to show vendors on map", COLOR_SOURCE[1], COLOR_SOURCE[2], COLOR_SOURCE[3], true)
    if tooltip.Show then tooltip:Show() end
end

--- Tooltips.BuildItemLines(itemID) -> lines: quests the item starts, objectives it fills, and where
--- it comes from.
function M.BuildItemLines(itemID)
    if type(itemID) ~= "number" then return nil end
    local key = "item:" .. itemID
    local cached = cache[key]
    if cached then return cached end
    local lines = {}
    local count = 0
    count = addObjectives(lines, "item", itemID, count)
    addStarters(lines, "item", itemID, count)
    addSources(lines, itemID)
    if cacheCount >= MAX_CACHE_ENTRIES then M.InvalidateCache() end
    cache[key] = lines
    cacheCount = cacheCount + 1
    return lines
end

---------------------------------------------------------------------------
-- Tooltip hooks
---------------------------------------------------------------------------

local function appendLines(tooltip, lines)
    if not lines or #lines == 0 then return false end
    tooltip:AddLine(" ")
    for i = 1, #lines do
        local line = lines[i]
        tooltip:AddLine(line.text, line.r, line.g, line.b, true)
    end
    if tooltip.Show then tooltip:Show() end
    return true
end

--- Handles OnTooltipSetUnit for any tooltip frame.
function M.OnTooltipSetUnit(tooltip)
    if not enabled() or not tooltip or not tooltip.GetUnit then return end
    clearVendorShortcut()
    local _, unit = tooltip:GetUnit()
    if not unit then return end
    -- A secret value (Forever, restricted) cannot be parsed: no line rather than an error.
    local guid = UnitGUID and ns.Compat.Plain(UnitGUID(unit))
    local npcID = guid and Util.NpcIdFromGuid(guid) or nil
    if not npcID then return end
    -- Blizzard's unit tooltip already carries the name, the level and the type of the node tooltip's
    -- block, so the only header line missing here is the respawn. No spawn key: a hovered unit is
    -- where it stands now, not necessarily where it died, so ns.Respawn answers for the creature
    -- as a whole.
    --
    -- The countdown is allowed only over a corpse. Without that check, killing one Dappled Moth
    -- labelled every *living* moth in the zone "Respawn in: 5 Mins" until the estimate ran out --
    -- an invented fact, printed on Blizzard's own tooltip where it reads as
    -- authoritative. The static "Respawn:" line is about the creature and stays either way.
    local NodeTooltip = ns.NodeTooltip
    if NodeTooltip and NodeTooltip.AppendRespawn then
        local dead = UnitIsDead and UnitIsDead(unit) and true or false
        NodeTooltip.AppendRespawn(tooltip, "npc", npcID, nil, dead)
    end
    appendLines(tooltip, M.BuildNpcLines(npcID))
end

local function itemIdFromTooltip(tooltip)
    if not tooltip or not tooltip.GetItem then return nil end
    local ok, _, link, id = pcall(tooltip.GetItem, tooltip)
    if not ok then return nil end
    if type(id) == "number" then return id end
    if type(link) == "string" then
        return tonumber(link:match("item:(%d+)"))
    end
    return nil
end

--- Handles OnTooltipSetItem for GameTooltip and ItemRefTooltip.
function M.OnTooltipSetItem(tooltip)
    if not enabled() then
        clearVendorShortcut()
        return
    end
    local itemID = itemIdFromTooltip(tooltip)
    if not itemID then
        clearVendorShortcut()
        return
    end
    appendLines(tooltip, M.BuildItemLines(itemID))
    showVendorShortcut(tooltip, itemID)
end

local function hookTooltip(tooltip)
    if not tooltip then return end
    -- The script hooks in the classic clients, TooltipDataProcessor in Forever (Core/Compat.lua).
    ns.Compat.HookTooltip(tooltip, "Unit", M.OnTooltipSetUnit)
    ns.Compat.HookTooltip(tooltip, "Item", M.OnTooltipSetItem)
    tooltip:HookScript("OnHide", clearVendorShortcut)
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.OnInitialize()
    M.InvalidateCache()
end

function M.OnEnable()
    if not hooked then
        hookTooltip(_G and _G.GameTooltip)
        hookTooltip(_G and _G.ItemRefTooltip)
        hooked = true
    end
    M:RegisterMessage("PQ_QUESTLOG_CHANGED", M.InvalidateCache)
    M:RegisterMessage("PQ_TARGETS_UPDATED", M.InvalidateCache)
    M:RegisterMessage("PQ_AVAILABLE_UPDATED", M.InvalidateCache)
    M:RegisterMessage("PQ_SETTING_CHANGED", M.InvalidateCache)     -- a tooltip switch: build it again
    Log.Debug("Tooltips", "enabled")
end

-- Switched off: the messages are gone (AceEvent) and the cache would only go stale.
function M.OnDisable()
    M.InvalidateCache()
end

function M.OnDataReady()
    M.InvalidateCache()
end

function M.OnProfileChanged()
    M.InvalidateCache()
end
