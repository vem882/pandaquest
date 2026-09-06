-- Map/Tooltips.lua: quest information on unit and item tooltips (docs/06 section 10).
--
-- C_TooltipInfo does not exist on 5.5.4, so the only way in is the classic script hook:
-- GameTooltip fires OnTooltipSetUnit / OnTooltipSetItem after it has filled itself, and
-- HookScript appends our handler without replacing Blizzard's.
local _, ns = ...
local L = ns.L

local Util, Log = ns.Util, ns.Log

local M = {}
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

local function profile()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.profile
end

local function enabled()
    local p = profile()
    return not p or not p.tooltips or p.tooltips.enabled ~= false
end

local function showIds()
    local p = profile()
    return p and p.tooltips and p.tooltips.showIds and true or false
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

--- Tooltips.BuildItemLines(itemID) -> lines: quests the item starts and objectives it fills.
function M.BuildItemLines(itemID)
    if type(itemID) ~= "number" then return nil end
    local key = "item:" .. itemID
    local cached = cache[key]
    if cached then return cached end
    local lines = {}
    local count = 0
    count = addObjectives(lines, "item", itemID, count)
    addStarters(lines, "item", itemID, count)
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
    local _, unit = tooltip:GetUnit()
    if not unit then return end
    local guid = UnitGUID and UnitGUID(unit)
    local npcID = guid and Util.NpcIdFromGuid(guid) or nil
    if not npcID then return end
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
    if not enabled() then return end
    local itemID = itemIdFromTooltip(tooltip)
    if not itemID then return end
    appendLines(tooltip, M.BuildItemLines(itemID))
end

local function hookTooltip(tooltip)
    if not tooltip or not tooltip.HookScript then return end
    tooltip:HookScript("OnTooltipSetUnit", M.OnTooltipSetUnit)
    tooltip:HookScript("OnTooltipSetItem", M.OnTooltipSetItem)
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    M.InvalidateCache()
end

function M.Enable()
    if not hooked then
        hookTooltip(_G and _G.GameTooltip)
        hookTooltip(_G and _G.ItemRefTooltip)
        hooked = true
    end
    -- Own AceEvent embed: registering on ns.PQ would overwrite another module's handler for the
    -- same message (AceEvent stores one callback per object and message).
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then
        AceEvent:Embed(M)
        M:RegisterMessage("PQ_QUESTLOG_CHANGED", M.InvalidateCache)
        M:RegisterMessage("PQ_TARGETS_UPDATED", M.InvalidateCache)
        M:RegisterMessage("PQ_AVAILABLE_UPDATED", M.InvalidateCache)
    end
    Log.Debug("Tooltips", "enabled")
end

function M.OnDataReady()
    M.InvalidateCache()
end

function M.OnProfileChanged()
    M.InvalidateCache()
end
