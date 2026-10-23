-- Quest/QuestMobs.lua: marks the NPCs the player's quests need, on their nameplates and tooltips.
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
-- **Matching an objective to its NPCs** (0.2.242). The log's line names the creature ("Prophet
-- Khar'zul slain: 0/1"), so a name match comes first. A kill-credit objective is usually named after
-- the group ("Muckscale tribe members slain: 0/10"), which no NPC is called, and Objectives.lua then
-- falls back to the objective's position among the quest's creatures -- which counts the creatures
-- other objectives already claimed by name, so the second objective of "Prophet Khar'zul" pointed
-- at the Prophet again and its kill-credit group was never marked. Here the fallback picks only from
-- what no other objective claimed, talk-to targets (the database's talk icon) for a talk objective
-- and everything else for a kill.
--
-- **Beyond kills** (0.2.242, the owner: "highlight the NPCs related to the active quest"), each with
-- its own icon and its own switch: the NPC a talk-to objective names ("talk"), the NPC a quest in the
-- log is turned in to (a yellow "?" once it is complete, a grey one before), and the quest givers
-- of quests the player can pick up now (Quest/Availability.lua's set, a "!").
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
local lower, find = string.lower, string.find
local wipe = wipe or table.wipe

ns.DEFAULTS.profile.questMobs = ns.DEFAULTS.profile.questMobs or {
    icon = "slay",      -- the kill mark: "quest" | "swords" | "slay"
    tint = false,       -- a gold wash over the nameplate's health bar
    tooltip = true,     -- "Quest: <title> (3/8)" on the unit tooltip
    size = 1,
    talk = true,        -- the NPC a talk-to objective names
    turnin = true,      -- the NPC a quest in the log is turned in to
    available = true,   -- quest givers with a quest the player can pick up now
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
-- The marks of the other roles, fixed: the addon's own map pins, and Blizzard's grey "?" for a quest
-- that is not ready to turn in (Classic\QuestFrame.lua sets the same file).
M.ROLE_ICONS = {
    talk = { texture = "Interface\\AddOns\\PandaQuest\\Textures\\pin_talk.tga" },
    done = { texture = "Interface\\AddOns\\PandaQuest\\Textures\\pin_complete.tga" },
    turnin = { texture = "Interface\\GossipFrame\\IncompleteQuestIcon" },
    available = { texture = "Interface\\AddOns\\PandaQuest\\Textures\\pin_available.tga" },
}
-- Which mark a plate shows when one NPC has several roles: what the player can do right now first.
M.ROLE_PRIORITY = { done = 1, talk = 2, kill = 3, available = 4, turnin = 5 }
-- The profile switch of each role; "kill" is the module's own switch.
local ROLE_SETTING = { talk = "talk", done = "turnin", turnin = "turnin", available = "available" }

M.stats = { rebuilds = 0, shown = 0 }   -- read by the tests

local mobs = {}         -- npcID -> { { questID, title, have, need, role }, ... }
local count = 0
local givers = {}       -- npcID -> { { questID, title, role = "available" }, ... }
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

local function addTo(set, npcID, item)
    npcID = tonumber(npcID)
    if not npcID then return false end
    local list = set[npcID]
    local fresh = not list
    if fresh then
        list = {}
        set[npcID] = list
    end
    for i = 1, #list do
        if list[i].questID == item.questID and list[i].role == item.role then return fresh end
    end
    list[#list + 1] = item
    return fresh
end

local function add(npcID, questID, entry, objective, role)
    local item = { questID = questID, title = entry.title or format("#%d", questID), role = role or "kill",
                   have = objective and objective.numFulfilled or 0,
                   need = objective and objective.numRequired or 0 }
    if addTo(mobs, npcID, item) then count = count + 1 end
end

local TALK_ICON = 5     -- Questie's ICON_TYPE_TALK, kept on the database's creature rows

local function addDescriptor(DB, desc, questID, entry, objective, role)
    if desc.kind == "npc" then
        add(desc.id, questID, entry, objective, role)
    elseif desc.kind == "killcredit" then
        local ids = type(desc.ids) == "table" and desc.ids or { desc.id }
        for i = 1, #ids do add(ids[i], questID, entry, objective, role) end
    elseif desc.kind == "item" and DB.GetItemSources then
        local droppers = DB.GetItemSources(desc.id).npcs or {}
        for i = 1, min(#droppers, MAX_DROPPERS) do add(droppers[i], questID, entry, objective, role) end
    end
end

--- Wanted(objective) -> true for an unfinished kill, talk-to or loot objective.
function M.Wanted(objective)
    if type(objective) ~= "table" or objective.finished then return false end
    return objective.type == "monster" or objective.type == "item"
end

--- IsTalk(objective) -> true for a "monster" objective that is a conversation, not a kill: no
-- counter on its line ("Speak to Mishi").
function M.IsTalk(objective)
    return type(objective) == "table" and objective.type == "monster" and objective.name == nil
end

-- The quest's creatures as descriptors, with the database's icon kept (Objectives.BuildDescriptors
-- drops it, and it is what tells a talk-to target from a kill).
local function creatureDescriptors(quest)
    local out = {}
    local objectives = type(quest) == "table" and quest.objectives
    if type(objectives) ~= "table" then return out end
    for _, c in ipairs(objectives.creatures or {}) do
        if c.id then out[#out + 1] = { kind = "npc", id = c.id, icon = c.icon, names = nil } end
    end
    for _, credit in ipairs(objectives.killCredits or {}) do
        local ids = credit.ids
        if type(ids) == "table" and ids[1] then
            out[#out + 1] = { kind = "killcredit", id = credit.baseId or ids[1], ids = ids, icon = credit.icon,
                              text = credit.text }
        end
    end
    return out
end

-- namedBy(DB, desc, wanted, within): the objective's name IS one of the descriptor's names, or with
-- `within` CONTAINS one ("Speak with Mishi" names Mishi).
local function namedBy(DB, desc, wanted, within)
    local function same(name)
        if type(name) ~= "string" or name == "" then return false end
        name = lower(name)
        if within then return find(wanted, name, 1, true) ~= nil end
        return name == wanted
    end
    if same(desc.text) then return true end
    if same(DB.GetNpcName(desc.id)) then return true end
    if desc.kind == "killcredit" then
        for _, id in ipairs(desc.ids) do
            if same(DB.GetNpcName(id)) then return true end
        end
    end
    return false
end

--- MatchCreatures(DB, quest, objectives) -> { [objective index] = { descriptor, ... } } for the
-- quest's "monster" objectives, finished ones included (they still claim their creature). See the
-- header: names first, then the unclaimed rest, talk targets for talk objectives.
function M.MatchCreatures(DB, quest, objectives)
    local descs = creatureDescriptors(quest)
    local out, claimed, pending = {}, {}, {}
    for i, objective in ipairs(objectives or {}) do
        if objective.type == "monster" then
            local found = {}
            -- A talk line has no counter and so no parsed name; its whole text can still contain one.
            local said = objective.name or objective.text
            if type(said) == "string" and said ~= "" then
                local wanted = lower(said)
                for _, within in ipairs({ false, true }) do
                    if #found == 0 and (within or objective.name) then
                        for d, desc in ipairs(descs) do
                            if namedBy(DB, desc, wanted, within) then
                                found[#found + 1] = desc
                                claimed[d] = true
                            end
                        end
                    end
                end
            end
            if #found > 0 then out[i] = found else pending[#pending + 1] = i end
        end
    end
    local taken = { talk = 0, kill = 0 }
    for _, i in ipairs(pending) do
        local talk = M.IsTalk(objectives[i])
        local kind = talk and "talk" or "kill"
        local candidates, fallback = {}, {}
        for d, desc in ipairs(descs) do
            if not claimed[d] then
                fallback[#fallback + 1] = d
                if (desc.icon == TALK_ICON) == talk then candidates[#candidates + 1] = d end
            end
        end
        -- No candidate of the right kind: a lone unclaimed creature is still this objective's (a
        -- one-creature quest), but out of several a guess would mark the wrong NPC.
        if #candidates == 0 and #fallback == 1 then candidates = fallback end
        taken[kind] = taken[kind] + 1
        local pick = candidates[taken[kind]]
        local found = {}
        if pick then
            found[1] = descs[pick]
        elseif #candidates == 1 then
            found[1] = descs[candidates[1]]
        end
        out[i] = found
    end
    return out
end

local function addTurnIn(DB, questID, entry, quest)
    local finishedBy = type(quest.finishedBy) == "table" and quest.finishedBy.npcs
    if type(finishedBy) ~= "table" then return end
    local role = entry.isComplete == 1 and "done" or "turnin"
    for _, npcID in ipairs(finishedBy) do add(npcID, questID, entry, nil, role) end
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
        local quest = type(entry) == "table" and entry.isComplete ~= -1 and DB.GetQuest(questID) or nil
        if quest then
            addTurnIn(DB, questID, entry, quest)
            if entry.isComplete ~= 1 then
                local objectives = entry.objectives or {}
                local creatures = M.MatchCreatures(DB, quest, objectives)
                local byType
                local ordinals = {}
                for i, objective in ipairs(objectives) do
                    -- Finished objectives still take their positional slot (Objectives.BuildForQuest).
                    local ordinal = (ordinals[objective.type] or 0) + 1
                    ordinals[objective.type] = ordinal
                    if M.Wanted(objective) then
                        if objective.type == "monster" then
                            for _, desc in ipairs(creatures[i] or {}) do
                                local role = (M.IsTalk(objective) or desc.icon == TALK_ICON) and "talk" or "kill"
                                addDescriptor(DB, desc, questID, entry, objective, role)
                            end
                        else
                            byType = byType or Objectives.BuildDescriptors(DB, quest)
                            for _, desc in ipairs(Objectives.SelectDescriptors(DB, objective, ordinal, byType, {})) do
                                addDescriptor(DB, desc, questID, entry, objective, "kill")
                            end
                        end
                    end
                end
            end
        end
    end
    return count
end

--- RebuildGivers() -> how many quest givers are marked: the starters of Availability's set.
function M.RebuildGivers()
    wipe(givers)
    local Availability, DB = ns.Availability, ns.DB
    if not (Availability and Availability.GetAvailable and DB and DB.IsReady and DB.IsReady()) then return 0 end
    local n = 0
    for questID in pairs(Availability.GetAvailable() or {}) do
        local quest = DB.GetQuest(questID)
        local npcs = quest and type(quest.startedBy) == "table" and quest.startedBy.npcs
        if type(npcs) == "table" then
            for _, npcID in ipairs(npcs) do
                if addTo(givers, npcID, { questID = questID, title = quest.name or format("#%d", questID),
                                          role = "available" }) then
                    n = n + 1
                end
            end
        end
    end
    return n
end

local function roleOn(role)
    local key = ROLE_SETTING[role]
    if not key then return true end
    return profile()[key] ~= false
end

--- RoleOf(npcID) -> the role whose mark this NPC's plate shows, or nil (no role switched on).
function M.RoleOf(npcID)
    npcID = tonumber(npcID) or 0
    local best, rank
    for _, set in ipairs({ mobs, givers }) do
        for _, item in ipairs(set[npcID] or {}) do
            local r = M.ROLE_PRIORITY[item.role] or 99
            if roleOn(item.role) and (not rank or r < rank) then best, rank = item.role, r end
        end
    end
    return best
end

--- Get(npcID) -> { { questID, title, have, need }, ... } | nil. Shared: never mutate it.
function M.Get(npcID)
    return mobs[tonumber(npcID) or 0]
end

--- GetGiver(npcID) -> { { questID, title, role = "available" }, ... } | nil. Shared too.
function M.GetGiver(npcID)
    return givers[tonumber(npcID) or 0]
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

local function applyIcon(icon, role)
    local choice = M.ROLE_ICONS[role] or M.ICONS[profile().icon] or M.ICONS.slay
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

local function acquire(plate, role)
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
    applyIcon(icon, role)
    icon.role = role
    -- The tint lies over Blizzard's health bar only when that bar is the one on screen; a nameplate
    -- addon that hides it gets the icon alone.
    icon.tint:Hide()
    icon.tint:ClearAllPoints()
    local unitFrame = plate.UnitFrame
    local bar = type(unitFrame) == "table" and (unitFrame.healthBar or unitFrame.HealthBar) or nil
    if role == "kill" and profile().tint and type(bar) == "table" and bar.IsVisible and bar:IsVisible() then
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
    local role = npcID and M.RoleOf(npcID)
    if not role then return end
    local plate = plateFor(token)
    if not plate then return end
    active[token] = acquire(plate, role)
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

--- ActivePlates() -> token -> role for the plates that carry an icon (tests).
function M.ActivePlates()
    local out = {}
    for token, icon in pairs(active) do out[token] = icon.role or true end
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

--- TooltipLines(npcID) -> { "Quest: Moth-Ridden (3/8)", "Turn in: ...", ... }
function M.TooltipLines(npcID)
    npcID = tonumber(npcID) or 0
    local list, offers = mobs[npcID], givers[npcID]
    if not (list or offers) then return nil end
    local skip = listedByTooltips(npcID)
    local out = {}
    for _, item in ipairs(list or {}) do
        if roleOn(item.role) and not (skip and skip[item.questID] and (item.role == "kill" or item.role == "talk")) then
            if item.role == "done" or item.role == "turnin" then
                out[#out + 1] = format(L["Turn in: %s"], item.title)
            elseif item.role == "talk" then
                out[#out + 1] = format(L["Quest: %s (talk to)"], item.title)
            elseif (item.need or 0) > 0 then
                out[#out + 1] = format(L["Quest: %s (%d/%d)"], item.title, item.have or 0, item.need)
            else
                out[#out + 1] = format(L["Quest: %s"], item.title)
            end
        end
    end
    if roleOn("available") then
        for _, item in ipairs(offers or {}) do
            out[#out + 1] = format(L["Quest available: %s"], item.title)
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
    if not tooltip then return end
    hooked = true
    -- OnTooltipSetUnit in the classic clients, TooltipDataProcessor in Forever (Core/Compat.lua).
    ns.Compat.HookTooltip(tooltip, "Unit", function(self)
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
                    .. " " .. L["Turn on enemy nameplates (V) to see the marks."]
                    .. " " .. L["Quest givers and turn-ins are friendly NPCs: their marks need friendly nameplates (Shift-V)."] },
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
            talk = { type = "toggle", order = 6, width = "full", name = L["Mark NPCs to talk to"],
                disabled = off, get = function() return profile().talk ~= false end,
                set = function(_, value) set("talk", value and true or false) end },
            turnin = { type = "toggle", order = 7, width = "full", name = L["Mark where quests are turned in (?)"],
                disabled = off, get = function() return profile().turnin ~= false end,
                set = function(_, value) set("turnin", value and true or false) end },
            available = { type = "toggle", order = 8, width = "full", name = L["Mark quest givers with a quest for you (!)"],
                disabled = off, get = function() return profile().available ~= false end,
                set = function(_, value) set("available", value and true or false) end },
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

local function refreshGivers()
    M.RebuildGivers()
    M.Redraw()
end

function M.OnInitialize()
    if ns.Options and ns.Options.AddSection then ns.Options.AddSection("questmobs", M.BuildOptions) end
end

function M.OnEnable()
    hookTooltip()
    M:RegisterBucketMessage({ "PQ_QUESTLOG_CHANGED", "PQ_DB_READY" }, BUCKET_SECONDS, refresh)
    M:RegisterBucketMessage("PQ_AVAILABLE_UPDATED", BUCKET_SECONDS, refreshGivers)
    M:RegisterEvent("NAME_PLATE_UNIT_ADDED", function(_, token) M.PlateAdded(token) end)
    M:RegisterEvent("NAME_PLATE_UNIT_REMOVED", function(_, token) M.PlateRemoved(token) end)
    M.RebuildGivers()
    refresh()
end

function M.OnDataReady()
    M.RebuildGivers()
    refresh()
end

function M.OnProfileChanged()
    M.Redraw()
end

-- Switched off: the events and the bucket are gone (AceEvent/AceBucket); the icons go too.
function M.OnDisable()
    for token in pairs(active) do release(token) end
    wipe(mobs)
    wipe(givers)
    count = 0
end
