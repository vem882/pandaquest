-- Quest/QuestMobs.lua: marks the NPCs the player's unfinished quests need, on their nameplates and
-- tooltips.
--
-- The owner asked: "in quests where you have to kill some NPCs, the quest's NPCs should be
-- highlighted a bit, so the player knows which NPCs belong to the quest." So:
--
-- **Which NPCs.** For every quest in the log that is neither complete nor failed, every objective that
-- is not finished yet, matched to the database's objectives by Quest/Objectives.lua's own rules
-- (BuildDescriptors / SelectDescriptors -- the same match the arrow uses):
--   * a kill objective ("Dappled Moth slain: 3/8"): its creature, or every NPC of its kill-credit
--     group. A "monster" objective without a counter is a talk-to, not a kill, and is left out;
--   * a loot objective ("Moth Wing: 2/6"): the NPCs the database says drop the item, at most
--     MAX_DROPPERS of them.
-- An objective that finishes takes its NPCs off at the next quest log change; a quest that becomes
-- complete takes all of its own.
--
-- **When.** Only when the quest log changes: Quest/QuestLog.lua turns QUEST_LOG_UPDATE and
-- UNIT_QUEST_LOG_CHANGED into PQ_QUESTLOG_CHANGED, and this module buckets that message (AceBucket)
-- so a burst of updates is one rebuild. The set is a table keyed by NPC id; a nameplate is looked up
-- in it by the id in its unit's GUID. Nothing runs per frame.
--
-- **How it is drawn.** A small icon frame of our own, parented to the nameplate base frame that
-- C_NamePlate.GetNamePlateForUnit returns and anchored above it. Nothing of Blizzard's (or Plater's,
-- or KUI's) is changed: their frames are read for an anchor and never written to, so there is no
-- taint, in combat or out. A forbidden plate -- friendly nameplates inside an instance -- is skipped;
-- enemy plates there still work. The optional tint is a texture of ours laid over Blizzard's health
-- bar when that bar is the one on screen, off by default.
--
-- **The icons**, each checked against what 5.5.4 ships:
--   * "quest"  Interface\GossipFrame\AvailableQuestIcon, the yellow "!" -- set by Blizzard's own
--              Classic\QuestFrame.lua and Classic\GossipFrame.lua, both loaded on Mists
--              (Blizzard_UIPanels_Game, no AllowLoadGameType on those lines);
--   * "swords" the atlas "countdown-swords" -- set by Blizzard_FrameXML\Timer.lua, listed in
--              Blizzard_FrameXML_Mists.toc. If SetAtlas refuses it the "!" is drawn instead;
--   * "slay"   this addon's own Textures\pin_slay.tga, the map pin of a kill objective.
local _, ns = ...
local L = ns.L

local Util, Log = ns.Util, ns.Log

local type, tonumber, tostring, pairs, ipairs, pcall, format = type, tonumber, tostring, pairs, ipairs, pcall,
    string.format
local min = math.min
local wipe = wipe or table.wipe

ns.DEFAULTS.profile.questMobs = ns.DEFAULTS.profile.questMobs or {
    icon = "quest",     -- "quest" | "swords" | "slay"
    tint = false,       -- a gold wash over the nameplate's health bar
    tooltip = true,     -- "Quest: <title> (3/8)" on the unit tooltip
    size = 1,
}

local M = ns.PQ:GetModule("QuestMobs")   -- an AceAddon module (Core/Const.lua)
ns.QuestMobs = M

local MAX_DROPPERS = 40         -- an item 200 mobs drop marks the first 40 the database lists
local BUCKET_SECONDS = 0.2
local ICON_SIZE = 20
local MAX_NAMEPLATES = 40

M.ICONS = {
    quest = { texture = "Interface\\GossipFrame\\AvailableQuestIcon" },
    swords = { atlas = "countdown-swords", fallback = "Interface\\GossipFrame\\AvailableQuestIcon" },
    slay = { texture = "Interface\\AddOns\\PandaQuest\\Textures\\pin_slay.tga" },
}
M.ICON_ORDER = { "quest", "swords", "slay" }

M.stats = { rebuilds = 0, shown = 0 }   -- read by the tests

local mobs = {}         -- npcID -> { { questID, title, have, need }, ... }
local count = 0
local active = {}       -- nameplate token -> our icon frame
local pool = {}         -- icon frames not in use

local function profile()
    local p = ns.PQ and ns.PQ.db and ns.PQ.db.profile
    return (p and p.questMobs) or ns.DEFAULTS.profile.questMobs
end

local function running()
    return M:IsEnabled() and ns.IsModuleWanted("QuestMobs")
end

---------------------------------------------------------------------------
-- The set
---------------------------------------------------------------------------

local function add(npcID, questID, entry, objective)
    npcID = tonumber(npcID)
    if not npcID then return end
    local list = mobs[npcID]
    if not list then
        list = {}
        mobs[npcID] = list
        count = count + 1
    end
    for i = 1, #list do
        if list[i].questID == questID then return end
    end
    list[#list + 1] = { questID = questID, title = entry.title or format("#%d", questID),
                        have = objective.numFulfilled or 0, need = objective.numRequired or 0 }
end

local function addDescriptor(DB, desc, questID, entry, objective)
    if desc.kind == "npc" then
        add(desc.id, questID, entry, objective)
    elseif desc.kind == "killcredit" then
        local ids = type(desc.ids) == "table" and desc.ids or { desc.id }
        for i = 1, #ids do add(ids[i], questID, entry, objective) end
    elseif desc.kind == "item" and DB.GetItemSources then
        local droppers = DB.GetItemSources(desc.id).npcs or {}
        for i = 1, min(#droppers, MAX_DROPPERS) do add(droppers[i], questID, entry, objective) end
    end
end

--- Wanted(objective) -> true for a kill (a monster objective with a counter) or a loot objective.
function M.Wanted(objective)
    if type(objective) ~= "table" or objective.finished then return false end
    if objective.type == "monster" then return objective.name ~= nil end
    return objective.type == "item"
end

--- Rebuild() -> how many NPCs are marked. Reads the quest log and the database; nothing else.
function M.Rebuild()
    wipe(mobs)
    count = 0
    M.stats.rebuilds = M.stats.rebuilds + 1
    local QuestLog, DB, Objectives = ns.QuestLog, ns.DB, ns.Objectives
    if not (QuestLog and QuestLog.GetAll and DB and DB.IsReady and DB.IsReady() and Objectives
            and Objectives.BuildDescriptors and Objectives.SelectDescriptors) then
        return 0
    end
    for questID, entry in pairs(QuestLog.GetAll()) do
        if type(entry) == "table" and entry.isComplete ~= 1 and entry.isComplete ~= -1 then
            local quest = DB.GetQuest(questID)
            if quest then
                local byType = Objectives.BuildDescriptors(DB, quest)
                local ordinals = {}
                for _, objective in ipairs(entry.objectives or {}) do
                    -- Finished objectives still take their positional slot (Objectives.BuildForQuest).
                    local ordinal = (ordinals[objective.type] or 0) + 1
                    ordinals[objective.type] = ordinal
                    if M.Wanted(objective) then
                        for _, desc in ipairs(Objectives.SelectDescriptors(DB, objective, ordinal, byType, {})) do
                            addDescriptor(DB, desc, questID, entry, objective)
                        end
                    end
                end
            end
        end
    end
    return count
end

--- Get(npcID) -> { { questID, title, have, need }, ... } | nil. Shared: never mutate it.
function M.Get(npcID)
    return mobs[tonumber(npcID) or 0]
end

function M.Count()
    return count
end

---------------------------------------------------------------------------
-- Nameplates
---------------------------------------------------------------------------

local function plateFor(token)
    local NamePlates = _G.C_NamePlate
    if not (NamePlates and NamePlates.GetNamePlateForUnit) then return nil end
    local ok, plate = pcall(NamePlates.GetNamePlateForUnit, token)
    if not ok or type(plate) ~= "table" then return nil end
    -- Friendly plates in an instance are forbidden to addons; parenting to one would be an error.
    if plate.IsForbidden and plate:IsForbidden() then return nil end
    return plate
end

local function npcOf(token)
    local guid = _G.UnitGUID and _G.UnitGUID(token)
    return guid and Util.NpcIdFromGuid(guid) or nil
end

local function applyIcon(icon)
    local choice = M.ICONS[profile().icon] or M.ICONS.quest
    local done = false
    if choice.atlas and icon.texture.SetAtlas then
        local ok, set = pcall(icon.texture.SetAtlas, icon.texture, choice.atlas)
        done = ok and set ~= false
    end
    if not done then icon.texture:SetTexture(choice.texture or choice.fallback) end
    icon.texture:SetTexCoord(0, 1, 0, 1)
    local size = ICON_SIZE * (tonumber(profile().size) or 1)
    icon:SetSize(size, size)
end

local function acquire(plate)
    local icon = table.remove(pool)
    if not icon then
        icon = CreateFrame("Frame", nil, plate)
        icon.texture = icon:CreateTexture(nil, "OVERLAY")
        icon.texture:SetAllPoints(icon)
        icon.tint = icon:CreateTexture(nil, "OVERLAY")
        icon.tint:SetColorTexture(1, 0.82, 0.2, 0.35)
        if icon.tint.SetBlendMode then icon.tint:SetBlendMode("ADD") end
    else
        icon:SetParent(plate)
    end
    icon:ClearAllPoints()
    icon:SetPoint("BOTTOM", plate, "TOP", 0, -2)
    icon:SetFrameLevel((plate.GetFrameLevel and plate:GetFrameLevel() or 0) + 10)
    applyIcon(icon)
    -- The tint lies over Blizzard's health bar only when that bar is the one on screen; a nameplate
    -- addon that hides it gets the icon alone.
    icon.tint:Hide()
    icon.tint:ClearAllPoints()
    local unitFrame = plate.UnitFrame
    local bar = type(unitFrame) == "table" and (unitFrame.healthBar or unitFrame.HealthBar) or nil
    if profile().tint and type(bar) == "table" and bar.IsVisible and bar:IsVisible() then
        icon.tint:SetAllPoints(bar)
        icon.tint:Show()
    end
    icon:Show()
    return icon
end

local function release(token)
    local icon = active[token]
    if not icon then return end
    active[token] = nil
    icon:Hide()
    icon:ClearAllPoints()
    icon:SetParent(UIParent)
    pool[#pool + 1] = icon
end

--- PlateAdded(token): one nameplate came on screen (NAME_PLATE_UNIT_ADDED).
function M.PlateAdded(token)
    if type(token) ~= "string" then return end
    release(token)
    if not running() then return end
    local npcID = npcOf(token)
    if not (npcID and mobs[npcID]) then return end
    local plate = plateFor(token)
    if not plate then return end
    active[token] = acquire(plate)
    M.stats.shown = M.stats.shown + 1
end

--- PlateRemoved(token): NAME_PLATE_UNIT_REMOVED.
function M.PlateRemoved(token)
    release(token)
end

local function eachToken(fn)
    local NamePlates = _G.C_NamePlate
    if NamePlates and NamePlates.GetNamePlates then
        local ok, plates = pcall(NamePlates.GetNamePlates)
        if ok and type(plates) == "table" then
            local seen = false
            for _, plate in pairs(plates) do
                local token = type(plate) == "table" and plate.namePlateUnitToken
                if type(token) == "string" then
                    seen = true
                    fn(token)
                end
            end
            if seen then return end
        end
    end
    for i = 1, MAX_NAMEPLATES do
        local token = "nameplate" .. i
        if not _G.UnitExists or _G.UnitExists(token) then fn(token) end
    end
end

--- Redraw(): every icon off, then on again for the plates on screen whose NPC is in the set.
function M.Redraw()
    for token in pairs(active) do release(token) end
    if not running() then return end
    eachToken(M.PlateAdded)
end

--- ActivePlates() -> token -> true for the plates that carry an icon (tests).
function M.ActivePlates()
    local out = {}
    for token in pairs(active) do out[token] = true end
    return out
end

---------------------------------------------------------------------------
-- Tooltip
---------------------------------------------------------------------------

-- Quests Map/Tooltips.lua already lists for this NPC (the objectives the navigation built), so the
-- same quest is not printed twice on one tooltip.
local function listedByTooltips(npcID)
    local Tooltips, Targets = ns.Tooltips, ns.Targets
    if not (Tooltips and Tooltips.IsEnabled and Tooltips:IsEnabled() and ns.IsModuleWanted("Tooltips")) then return nil end
    if not (Targets and Targets.GetAll) then return nil end
    local out
    for _, target in ipairs(Targets.GetAll() or {}) do
        if target.entityType == "npc" and target.entityID == npcID and target.objectiveIndex then
            out = out or {}
            out[target.questID] = true
        end
    end
    return out
end

--- TooltipLines(npcID) -> { "Quest: Moth-Ridden (3/8)", ... }
function M.TooltipLines(npcID)
    local list = mobs[tonumber(npcID) or 0]
    if not list then return nil end
    local skip = listedByTooltips(npcID)
    local out = {}
    for _, item in ipairs(list) do
        if not (skip and skip[item.questID]) then
            if (item.need or 0) > 0 then
                out[#out + 1] = format(L["Quest: %s (%d/%d)"], item.title, item.have or 0, item.need)
            else
                out[#out + 1] = format(L["Quest: %s"], item.title)
            end
        end
    end
    return out
end

function M.OnTooltipSetUnit(tooltip)
    if not (running() and profile().tooltip ~= false) then return end
    if not (tooltip and tooltip.GetUnit) then return end
    local _, unit = tooltip:GetUnit()
    if not unit then return end
    local npcID = npcOf(unit)
    local lines = npcID and M.TooltipLines(npcID)
    if not (lines and #lines > 0) then return end
    for i = 1, #lines do tooltip:AddLine(lines[i], 1, 0.82, 0) end
    if tooltip.Show then tooltip:Show() end
end

local hooked = false
local function hookTooltip()
    if hooked then return end
    local tooltip = _G.GameTooltip
    if not (tooltip and tooltip.HookScript) then return end
    hooked = true
    tooltip:HookScript("OnTooltipSetUnit", function(self)
        local ok, err = pcall(M.OnTooltipSetUnit, self)
        if not ok then Log.Error("QuestMobs", "tooltip line failed: %s", tostring(err)) end
    end)
end

---------------------------------------------------------------------------
-- Options ("Quest mobs" under Navigation)
---------------------------------------------------------------------------

local function set(key, value)
    local Options = ns.Options
    if not (Options and Options.Set and Options.Set("questMobs." .. key, value)) then
        profile()[key] = value
    end
    M.Redraw()
end

function M.BuildOptions()
    local function off() return not ns.IsModuleWanted("QuestMobs") end
    local icons = {}
    for _, key in ipairs(M.ICON_ORDER) do
        icons[key] = ({ quest = L["Quest mark (!)"], swords = L["Crossed swords"], slay = L["PandaQuest's kill pin"] })[key]
    end
    return {
        type = "group", order = 3.6, name = L["Quest mobs"], args = {
            info = { type = "description", order = 0, fontSize = "medium",
                name = L["Marks the NPCs your unfinished quests need you to kill, on their nameplates and tooltips."]
                    .. " " .. L["Turn on enemy nameplates (V) to see the marks."] },
            enabled = { type = "toggle", order = 1, width = "full", name = L["Mark quest mobs"],
                get = function() return ns.IsModuleWanted("QuestMobs") end,
                set = function(_, value)
                    local Options = ns.Options
                    if Options and Options.Set then Options.Set("modules.QuestMobs", value and true or false) end
                end },
            icon = { type = "select", order = 2, name = L["Icon"], values = icons, sorting = M.ICON_ORDER,
                disabled = off, get = function() return profile().icon end,
                set = function(_, value) set("icon", value) end },
            size = { type = "range", order = 3, name = L["Size"], min = 0.5, max = 2, step = 0.05, isPercent = true,
                disabled = off, get = function() return profile().size or 1 end,
                set = function(_, value) set("size", value) end },
            tint = { type = "toggle", order = 4, width = "full", name = L["Tint the health bar"],
                desc = L["A gold wash over the nameplate's health bar, with Blizzard's own nameplates."],
                disabled = off, get = function() return profile().tint and true or false end,
                set = function(_, value) set("tint", value and true or false) end },
            tooltip = { type = "toggle", order = 5, width = "full", name = L["Show the quest on the tooltip"],
                disabled = off, get = function() return profile().tooltip ~= false end,
                set = function(_, value) set("tooltip", value and true or false) end },
        },
    }
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

local function refresh()
    M.Rebuild()
    M.Redraw()
end
M.Refresh = refresh

function M.OnInitialize()
    if ns.Options and ns.Options.AddSection then ns.Options.AddSection("questmobs", M.BuildOptions) end
end

function M.OnEnable()
    hookTooltip()
    M:RegisterBucketMessage({ "PQ_QUESTLOG_CHANGED", "PQ_DB_READY" }, BUCKET_SECONDS, refresh)
    M:RegisterEvent("NAME_PLATE_UNIT_ADDED", function(_, token) M.PlateAdded(token) end)
    M:RegisterEvent("NAME_PLATE_UNIT_REMOVED", function(_, token) M.PlateRemoved(token) end)
    refresh()
end

function M.OnDataReady()
    refresh()
end

function M.OnProfileChanged()
    M.Redraw()
end

-- Switched off: the events and the bucket are gone (AceEvent/AceBucket); the icons go too.
function M.OnDisable()
    for token in pairs(active) do release(token) end
    wipe(mobs)
    count = 0
end
