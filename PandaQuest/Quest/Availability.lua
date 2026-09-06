-- Quest/Availability.lua: which of the ~17 700 quests in the database could the player pick up now
-- (docs/06 section 8, docs/liitteet/A section 4).
--
-- The whole database is scanned, so the order of the checks IS the performance story: table lookups
-- and raw positional fields first, the decoded quest (and its chain of pre-quests) only for the few
-- percent of quests that survive. The pass runs in a Core/Thread coroutine at 24 quests per yield and
-- a second request while a pass is running is QUEUED, never cancelled - exactly like Questie, whose
-- cancel-and-restart behaviour used to drop updates on a busy login.
local _, ns = ...

local M = {}
ns.Availability = M

local Log, Thread, Schema = ns.Log, ns.Thread, ns.Schema

local type, pairs, ipairs, tostring = type, pairs, ipairs, tostring
local floor = math.floor
local wipe = wipe or table.wipe

local QUESTS_PER_YIELD = 24

-- Own AceEvent object (see Quest/Player.lua): the shared ns.PQ registry is keyed by target, so two
-- modules listening to the same event on it would overwrite each other.
local listener = {}
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
end
M.listener = listener

local band = bit and bit.band

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local available = {}                -- questID -> true (published through GetAvailable)
local scratch = {}                  -- the pass builds into this and swaps at the end
local handle                        -- running Thread handle
local passQueued = false
local lastReason

---------------------------------------------------------------------------
-- Helpers
---------------------------------------------------------------------------

local function db()
    local DB = ns.DB
    if DB and DB.IsReady and DB.IsReady() then return DB end
    return nil
end

local function profile()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.profile or nil
end

local function charDB()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.char or nil
end

--- True when the required bitmask and the player's bitmask share at least one bit.
-- A required mask of 0/nil means "no restriction".
local function masksOverlap(required, playerMask)
    if not required or required == 0 then return true end
    if not playerMask or playerMask == 0 then return false end
    if band then
        return band(required, playerMask) ~= 0
    end
    -- Lua-only fallback (the test runtime has a bit shim, but never rely on it).
    local rest, weight = playerMask, 1
    while rest > 0 do
        if (rest % 2) == 1 and (floor(required / weight) % 2) == 1 then
            return true
        end
        rest = floor(rest / 2)
        weight = weight * 2
    end
    return false
end
M.MasksOverlap = masksOverlap

-- Profession skillLine -> the spell that teaches it, so the localized skill name can be resolved
-- with GetSpellInfo instead of shipping a translation table (Questie does the same).
local PROFESSION_SPELLS = {
    [129] = 3273,     -- First Aid
    [164] = 2018,     -- Blacksmithing
    [165] = 2108,     -- Leatherworking
    [171] = 2259,     -- Alchemy
    [182] = 2366,     -- Herbalism
    [185] = 2550,     -- Cooking
    [186] = 2575,     -- Mining
    [197] = 3908,     -- Tailoring
    [202] = 4036,     -- Engineering
    [333] = 7411,     -- Enchanting
    [356] = 7620,     -- Fishing
    [393] = 8613,     -- Skinning
    [755] = 25229,    -- Jewelcrafting
    [762] = 33388,    -- Riding
    [773] = 45357,    -- Inscription
    [794] = 78670,    -- Archaeology
}
local professionNames = {}

local function professionName(skillLine)
    local cached = professionNames[skillLine]
    if cached ~= nil then return cached or nil end
    local spellID = PROFESSION_SPELLS[skillLine]
    local name
    if spellID and GetSpellInfo then
        name = GetSpellInfo(spellID)
    end
    professionNames[skillLine] = name or false
    return name
end

---------------------------------------------------------------------------
-- Level window
---------------------------------------------------------------------------

--- IsLevelOk(questID) -> bool
-- requiredLevel <= playerLevel, and the quest must not be below the green range
-- (profile.map.lowLevelQuests turns the lower bound off).
function M.IsLevelOk(questID)
    local DB = db()
    if not DB then return false end
    local Player = ns.Player
    local level = (Player and Player.GetLevel and Player.GetLevel()) or 0

    local requiredLevel = DB.GetQuestField(questID, "requiredLevel") or 0
    if requiredLevel > level then return false end

    local prof = profile()
    if prof and prof.map and prof.map.lowLevelQuests then return true end

    local questLevel = DB.GetQuestField(questID, "questLevel") or 0
    if questLevel <= 0 then return true end          -- scaling / unknown: always show

    local green = 5
    if GetQuestGreenRange then
        local ok, value = pcall(GetQuestGreenRange, "player")
        if ok and type(value) == "number" then green = value end
    end
    return questLevel >= (level - green)
end

---------------------------------------------------------------------------
-- IsDoable
---------------------------------------------------------------------------

local function anyCompleted(list, completed)
    if type(list) ~= "table" then return false end
    for i = 1, #list do
        if completed[list[i]] then return true end
    end
    return false
end

local function allCompleted(list, completed)
    if type(list) ~= "table" or #list == 0 then return true end
    for i = 1, #list do
        if not completed[list[i]] then return false end
    end
    return true
end

--- IsDoable(questID, verbose) -> bool, reasonCode|nil
-- Follows Questie's IsDoable chain (docs/liitteet/A section 4) but ordered cheapest-first.
function M.IsDoable(questID, verbose)
    local function fail(code)
        if verbose then
            Log.Debug("Availability", "quest %s not doable: %s", tostring(questID), code)
        end
        return false, code
    end

    if type(questID) ~= "number" then return fail("badId") end

    -- 1. Pure table lookups.
    local char = charDB()
    if char and char.hiddenQuests and char.hiddenQuests[questID] then return fail("hidden") end

    local DB = db()
    if not DB then return fail("noDatabase") end
    if DB.IsQuestHidden(questID) then return fail("blacklist") end

    local QuestLog = ns.QuestLog
    if QuestLog and QuestLog.IsOnQuest and QuestLog.IsOnQuest(questID) then return fail("inLog") end

    local Player = ns.Player
    local completed = (Player and Player.GetCompleted and Player.GetCompleted()) or {}
    if completed[questID] then
        -- Repeatable quests come back; everything else is done for good.
        local specialFlags = DB.GetQuestField(questID, "specialFlags")
        if not Schema.HasFlag(specialFlags, Schema.specialFlags.REPEATABLE) then
            local questFlags = DB.GetQuestField(questID, "questFlags")
            if not (Schema.HasFlag(questFlags, Schema.questFlags.DAILY)
                or Schema.HasFlag(questFlags, Schema.questFlags.WEEKLY)
                or Schema.HasFlag(questFlags, Schema.questFlags.MONTHLY)) then
                return fail("completed")
            end
        end
    end

    -- 2. Raw positional fields: no decoding, no allocation.
    if not DB.GetQuestName(questID) then return fail("noData") end

    local requiredRaces = DB.GetQuestField(questID, "requiredRaces")
    if not masksOverlap(requiredRaces, Player and Player.GetRaceMask and Player.GetRaceMask() or 0) then
        return fail("race")
    end

    local requiredClasses = DB.GetQuestField(questID, "requiredClasses")
    if not masksOverlap(requiredClasses, Player and Player.GetClassMask and Player.GetClassMask() or 0) then
        return fail("class")
    end

    if not M.IsLevelOk(questID) then return fail("level") end

    -- 3. Decoded quest: the chain checks.
    local quest = DB.GetQuest(questID)
    if not quest then return fail("noData") end

    local level = (Player and Player.GetLevel and Player.GetLevel()) or 0
    if quest.requiredMaxLevel and quest.requiredMaxLevel > 0 and level > quest.requiredMaxLevel then
        return fail("maxLevel")
    end

    if quest.disabledByQuest and completed[quest.disabledByQuest] then return fail("disabled") end

    if quest.nextQuestInChain and quest.nextQuestInChain ~= 0 and completed[quest.nextQuestInChain] then
        return fail("chainDone")
    end

    if type(quest.exclusiveTo) == "table" then
        for _, otherID in ipairs(quest.exclusiveTo) do
            if completed[otherID] or (QuestLog and QuestLog.IsOnQuest and QuestLog.IsOnQuest(otherID)) then
                return fail("exclusive")
            end
        end
    end

    if type(quest.preQuestSingle) == "table" and #quest.preQuestSingle > 0
        and not anyCompleted(quest.preQuestSingle, completed) then
        return fail("preQuest")
    end

    if type(quest.preQuestGroup) == "table" and #quest.preQuestGroup > 0
        and not allCompleted(quest.preQuestGroup, completed) then
        return fail("preQuestGroup")
    end

    if quest.parentQuest and quest.parentQuest ~= 0 then
        local parentActive = (QuestLog and QuestLog.IsOnQuest and QuestLog.IsOnQuest(quest.parentQuest))
            or completed[quest.parentQuest]
        if not parentActive then return fail("parent") end
    end

    -- A breadcrumb is pointless once its target quest is done or already in the log.
    if quest.breadcrumbForQuestId and quest.breadcrumbForQuestId ~= 0 then
        local targetID = quest.breadcrumbForQuestId
        if completed[targetID] or (QuestLog and QuestLog.IsOnQuest and QuestLog.IsOnQuest(targetID)) then
            return fail("breadcrumb")
        end
    end

    -- 4. Player state that needs an API call.
    if quest.requiredMinRep or quest.requiredMaxRep then
        local getRep = Player and Player.GetReputation
        if getRep then
            local min, max = quest.requiredMinRep, quest.requiredMaxRep
            if type(min) == "table" and min[1] then
                local value = getRep(min[1]) or 0
                if value < (min[2] or 0) then return fail("reputation") end
            end
            if type(max) == "table" and max[1] then
                local value = getRep(max[1]) or 0
                if value >= (max[2] or 0) then return fail("reputation") end
            end
        end
    end

    if type(quest.requiredSkill) == "table" and quest.requiredSkill[1] then
        local name = professionName(quest.requiredSkill[1])
        if name and Player and Player.GetSkills then
            local rank = Player.GetSkills()[name]
            if not rank or rank < (quest.requiredSkill[2] or 0) then return fail("skill") end
        end
    end

    if type(quest.requiredSpell) == "number" and quest.requiredSpell ~= 0 then
        local spellID, wanted = quest.requiredSpell, true
        if spellID < 0 then spellID, wanted = -spellID, false end
        local known = Player and Player.HasSpell and Player.HasSpell(spellID) or false
        if known ~= wanted then return fail("spell") end
    end

    return true, nil
end

---------------------------------------------------------------------------
-- Option filters (docs/06 section 8)
---------------------------------------------------------------------------

local DUNGEON_TAGS = { [81] = true, [85] = true }
local RAID_TAGS = { [62] = true, [88] = true, [89] = true }
local PVP_TAGS = { [41] = true }
local PET_BATTLE_TAGS = { [258] = true }

local function passesFilters(questID, prof)
    if not prof or not prof.map then return true end
    local map = prof.map
    local DB = db()
    if not DB then return true end

    if map.showRepeatable == false then
        local specialFlags = DB.GetQuestField(questID, "specialFlags")
        local questFlags = DB.GetQuestField(questID, "questFlags")
        if Schema.HasFlag(specialFlags, Schema.specialFlags.REPEATABLE)
            or Schema.HasFlag(questFlags, Schema.questFlags.DAILY)
            or Schema.HasFlag(questFlags, Schema.questFlags.WEEKLY)
            or Schema.HasFlag(questFlags, Schema.questFlags.MONTHLY) then
            return false
        end
    end

    local tagID = DB.GetQuestTagInfo(questID)
    if tagID then
        if not map.showDungeon and DUNGEON_TAGS[tagID] then return false end
        if not map.showRaid and RAID_TAGS[tagID] then return false end
        if not map.showPvP and PVP_TAGS[tagID] then return false end
        if map.showPetBattle == false and PET_BATTLE_TAGS[tagID] then return false end
    end

    local zoneOrSort = DB.GetQuestField(questID, "zoneOrSort")
    if type(zoneOrSort) == "number" and zoneOrSort < 0 then
        if not map.showPvP and zoneOrSort == Schema.sortKeys.BATTLEGROUNDS then return false end
        if map.showPetBattle == false and zoneOrSort == Schema.sortKeys.PET_BATTLE then return false end
    end

    return true
end
M.PassesFilters = passesFilters

---------------------------------------------------------------------------
-- The pass
---------------------------------------------------------------------------

local function publish(reason)
    wipe(available)
    for questID in pairs(scratch) do available[questID] = true end
    local count = 0
    for _ in pairs(available) do count = count + 1 end
    Log.Debug("Availability", "%s: %d quests available", tostring(reason), count)
    if ns.PQ and ns.PQ.SendMessage then
        ns.PQ:SendMessage("PQ_AVAILABLE_UPDATED", available)
    end
end

local function runPass()
    local DB = db()
    if not DB then return end
    wipe(scratch)
    local prof = profile()
    local seen = 0
    for questID in DB.IterateQuestIDs() do
        if M.IsDoable(questID) and passesFilters(questID, prof) then
            scratch[questID] = true
        end
        seen = seen + 1
        Thread.Yield()
    end
    Log.Trace("Availability", "scanned %d quests", seen)
end

local function onPassDone(ok, err)
    handle = nil
    if ok then
        publish(lastReason)
    else
        Log.Error("Availability", "pass failed: %s", tostring(err))
    end
    if passQueued then
        passQueued = false
        M.Recalculate("queued")
    end
end

--- Recalculate(reason): starts (or queues) one full availability pass.
function M.Recalculate(reason)
    if not db() then return false end
    if handle and Thread.IsRunning(handle) then
        passQueued = true
        return false
    end
    lastReason = reason or "manual"
    handle = Thread.Run(runPass, {
        name = "Availability",
        ticksPerYield = QUESTS_PER_YIELD,
        pauseInCombat = true,
        onDone = onPassDone,
    })
    return true
end

--- GetAvailable() -> { [questID] = true }. Shared table: never mutate it.
function M.GetAvailable()
    return available
end

function M.IsAvailable(questID)
    return available[questID] == true
end

function M.IsRunning()
    return handle ~= nil and Thread.IsRunning(handle)
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
end

function M.Enable()
    if not listener.RegisterEvent then return end
    listener:RegisterMessage("PQ_QUESTLOG_CHANGED", function() M.Recalculate("PQ_QUESTLOG_CHANGED") end)
    listener:RegisterEvent("PLAYER_LEVEL_UP", function() M.Recalculate("PLAYER_LEVEL_UP") end)
    listener:RegisterEvent("SKILL_LINES_CHANGED", function() M.Recalculate("SKILL_LINES_CHANGED") end)
end

function M.OnDataReady()
    M.Recalculate("PQ_DB_READY")
end

function M.OnProfileChanged()
    M.Recalculate("profile")
end
