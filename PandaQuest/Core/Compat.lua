-- Core/Compat.lua: guarded wrappers around APIs that moved to C_* namespaces in 5.5.4, and the bridges
-- between the four clients PandaQuest runs in (Core/Game.lua): MoP Classic 5.5.4, Classic Era 1.15,
-- TBC Anniversary 2.5 and WoW Forever 1.60. Era, TBC and MoP share the classic API; Forever is a
-- Mainline-family client, where the quest log, spells, reputation, tooltips and super tracking moved
-- into C_* namespaces and some globals are gone. Every wrapper checks that the underlying function
-- exists before calling it, and prefers the classic global where both exist, so MoP calls exactly what
-- it always called.
local _, ns = ...

local Compat = {}
ns.Compat = Compat

local _G = _G
local type, pcall, pairs, tonumber, floor, setmetatable = type, pcall, pairs, tonumber, math.floor, setmetatable

-- IsAddOnLoaded(name) -> bool (first return value of C_AddOns.IsAddOnLoaded)
function Compat.IsAddOnLoaded(name)
    if C_AddOns and C_AddOns.IsAddOnLoaded then
        local loaded = C_AddOns.IsAddOnLoaded(name)
        return loaded and true or false
    elseif _G.IsAddOnLoaded then
        local loaded = _G.IsAddOnLoaded(name)
        return loaded and true or false
    end
    return false
end

function Compat.GetAddOnMetadata(name, field)
    if C_AddOns and C_AddOns.GetAddOnMetadata then
        return C_AddOns.GetAddOnMetadata(name, field)
    elseif _G.GetAddOnMetadata then
        return _G.GetAddOnMetadata(name, field)
    end
    return nil
end

-- GetItemInfo(itemIDOrLink) -> name, link, quality, itemLevel, requiredLevel, class, subClass, ... (C_Item order)
function Compat.GetItemInfo(item)
    if C_Item and C_Item.GetItemInfo then
        return C_Item.GetItemInfo(item)
    elseif _G.GetItemInfo then
        return _G.GetItemInfo(item)
    end
    return nil
end

function Compat.GetItemCount(item, includeBank, includeUses)
    if C_Item and C_Item.GetItemCount then
        return C_Item.GetItemCount(item, includeBank, includeUses) or 0
    elseif _G.GetItemCount then
        return _G.GetItemCount(item, includeBank, includeUses) or 0
    end
    return 0
end

function Compat.GetContainerNumSlots(bag)
    if C_Container and C_Container.GetContainerNumSlots then
        return C_Container.GetContainerNumSlots(bag) or 0
    elseif _G.GetContainerNumSlots then
        return _G.GetContainerNumSlots(bag) or 0
    end
    return 0
end

-- GetContainerItemInfo(bag, slot) -> info table { iconFileID, stackCount, isLocked, quality, itemID, hyperlink, ... }|nil
-- The legacy global returned positional values; they are normalised into the C_Container table shape.
function Compat.GetContainerItemInfo(bag, slot)
    if C_Container and C_Container.GetContainerItemInfo then
        return C_Container.GetContainerItemInfo(bag, slot)
    elseif _G.GetContainerItemInfo then
        local icon, count, locked, quality, readable, lootable, link, isFiltered, noValue, itemID = _G.GetContainerItemInfo(bag, slot)
        if not icon then return nil end
        return { iconFileID = icon, stackCount = count, isLocked = locked, quality = quality, isReadable = readable,
                 hasLoot = lootable, hyperlink = link, isFiltered = isFiltered, hasNoValue = noValue, itemID = itemID }
    end
    return nil
end

function Compat.IsSpellKnown(spellID, isPet)
    if C_SpellBook and C_SpellBook.IsSpellKnown then
        return C_SpellBook.IsSpellKnown(spellID, isPet) and true or false
    elseif _G.IsSpellKnown then
        return _G.IsSpellKnown(spellID, isPet) and true or false
    elseif _G.IsPlayerSpell then
        return _G.IsPlayerSpell(spellID) and true or false
    end
    return false
end

-- Addon convention (SexyMap and friends); Blizzard does not define it.
function Compat.GetMinimapShape()
    if _G.GetMinimapShape then
        local shape = _G.GetMinimapShape()
        if type(shape) == "string" then return shape end
    end
    return "ROUND"
end

-- Player facing in radians; nil when unavailable (e.g. while the camera is unavailable).
function Compat.GetPlayerFacing()
    if _G.GetPlayerFacing then
        local ok, facing = pcall(_G.GetPlayerFacing)
        if ok and type(facing) == "number" then return facing end
    end
    return nil
end

-- UnitSpeed() -> currentSpeed, runSpeed, flightSpeed, swimSpeed (yards/s); zeros when unavailable.
function Compat.UnitSpeed(unit)
    if _G.GetUnitSpeed then
        local current, run, flight, swim = _G.GetUnitSpeed(unit or "player")
        return current or 0, run or ns.Const.RUN_SPEED, flight or 0, swim or 0
    end
    return 0, ns.Const.RUN_SPEED, 0, 0
end

function Compat.IsMounted()
    if _G.IsMounted then
        return _G.IsMounted() and true or false
    end
    return false
end

function Compat.IsFlying()
    if _G.IsFlying then
        return _G.IsFlying() and true or false
    end
    return false
end

function Compat.InCombatLockdown()
    if _G.InCombatLockdown then
        return _G.InCombatLockdown() and true or false
    end
    return false
end

function Compat.IsInPetBattle()
    if C_PetBattles and C_PetBattles.IsInBattle then
        return C_PetBattles.IsInBattle() and true or false
    end
    return false
end

function Compat.UnitOnTaxi(unit)
    if _G.UnitOnTaxi then
        return _G.UnitOnTaxi(unit or "player") and true or false
    end
    return false
end

-- High resolution millisecond clock for time budgets (falls back to GetTime()).
function Compat.NowMs()
    if _G.debugprofilestop then
        return _G.debugprofilestop()
    end
    return (GetTime and GetTime() or 0) * 1000
end


---------------------------------------------------------------------------
-- Between the clients (Core/Game.lua names them)
---------------------------------------------------------------------------

--- Compat.RegisterEvent(target, event, handler) -> bool
-- AceEvent's RegisterEvent raises for an event the client does not know (Forever has no
-- AUCTION_ITEM_LIST_UPDATE, for one), and the error would abort the module's OnEnable halfway. This
-- registers what exists and returns false for what does not.
function Compat.RegisterEvent(target, event, handler)
    if type(target) ~= "table" or type(target.RegisterEvent) ~= "function" then return false end
    local ok = pcall(target.RegisterEvent, target, event, handler)
    return ok and true or false
end

--- Compat.IsSecret(value) -> bool
-- Forever's Mainline engine hands out "secret values" for some unit facts in restricted contexts
-- (UnitGUID, UnitName, UnitClass, ...): comparing, concatenating or doing arithmetic on one raises.
-- issecretvalue exists in every client this addon supports; where it does not, nothing is secret.
function Compat.IsSecret(value)
    local test = _G.issecretvalue
    if type(test) ~= "function" then return false end
    local ok, secret = pcall(test, value)
    return ok and secret and true or false
end

--- Compat.Plain(value) -> value, or nil when it is a secret value nothing may be done with.
function Compat.Plain(value)
    if Compat.IsSecret(value) then return nil end
    return value
end

-- The quest log. Era, TBC and MoP have GetNumQuestLogEntries/GetQuestLogTitle with the same 17
-- returns; Forever only has C_QuestLog.GetNumQuestLogEntries/GetInfo, mapped here onto that shape.

function Compat.HasQuestLog()
    if _G.GetNumQuestLogEntries and _G.GetQuestLogTitle then return true end
    local api = _G.C_QuestLog
    return (api and api.GetNumQuestLogEntries and api.GetInfo) and true or false
end

--- Compat.GetNumQuestLogEntries() -> numEntries, numQuests
function Compat.GetNumQuestLogEntries()
    if _G.GetNumQuestLogEntries then return _G.GetNumQuestLogEntries() end
    local api = _G.C_QuestLog
    if api and api.GetNumQuestLogEntries then return api.GetNumQuestLogEntries() end
    return 0, 0
end

--- Compat.GetQuestLogTitle(index) -> title, level, suggestedGroup|tag, isHeader, isCollapsed, isComplete,
--  frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isBounty, isStory, isHidden,
--  isScaling. isComplete is 1 (complete), -1 (failed) or nil, as the classic function returns it.
function Compat.GetQuestLogTitle(index)
    if _G.GetQuestLogTitle then return _G.GetQuestLogTitle(index) end
    local api = _G.C_QuestLog
    if not (api and api.GetInfo) then return nil end
    local info = api.GetInfo(index)
    if type(info) ~= "table" then return nil end
    local questID = info.questID
    local complete
    if not info.isHeader and type(questID) == "number" and questID > 0 then
        if api.IsFailed and api.IsFailed(questID) then
            complete = -1
        elseif api.IsComplete and api.IsComplete(questID) then
            complete = 1
        end
    end
    return info.title, info.level, info.suggestedGroup, info.isHeader, info.isCollapsed, complete,
        info.frequency, questID, info.startEvent, info.displayQuestID, info.isOnMap, info.hasLocalPOI,
        info.isTask, info.isBounty, info.isStory, info.isHidden, info.isScaling
end

--- Compat.GetNumQuestWatches() -> number of watched quests (0 when the client cannot say)
function Compat.GetNumQuestWatches()
    local fn = _G.GetNumQuestWatches or (_G.C_QuestLog and _G.C_QuestLog.GetNumQuestWatches)
    if type(fn) ~= "function" then return 0 end
    local ok, count = pcall(fn)
    return (ok and tonumber(count)) or 0
end

--- Compat.GetCompletedQuests(into) -> into, filled { [questID] = true }
-- Classic fills the table it is given; C_QuestLog.GetAllCompletedQuestIDs (Forever) returns an array.
function Compat.GetCompletedQuests(into)
    into = into or {}
    if _G.GetQuestsCompleted then
        pcall(_G.GetQuestsCompleted, into)
        return into
    end
    local api = _G.C_QuestLog
    if api and api.GetAllCompletedQuestIDs then
        local ok, ids = pcall(api.GetAllCompletedQuestIDs)
        if ok and type(ids) == "table" then
            for i = 1, #ids do into[ids[i]] = true end
        end
    end
    return into
end

--- Compat.GetQuestTagInfo(questID) -> tagID|nil, tagName|nil
function Compat.GetQuestTagInfo(questID)
    if _G.GetQuestTagInfo then
        local ok, tagID, tagName = pcall(_G.GetQuestTagInfo, questID)
        if ok then return tagID, tagName end
        return nil
    end
    local api = _G.C_QuestLog
    if api and api.GetQuestTagInfo then
        local ok, info = pcall(api.GetQuestTagInfo, questID)
        if ok and type(info) == "table" then return info.tagID, info.tagName end
    end
    return nil
end

--- Compat.GetQuestGreenRange() -> levels below the player's at which a quest still gives experience, or nil
function Compat.GetQuestGreenRange()
    if _G.GetQuestGreenRange then
        local ok, value = pcall(_G.GetQuestGreenRange, "player")
        if ok and type(value) == "number" then return value end
    end
    if _G.UnitQuestTrivialLevelRange then
        local ok, value = pcall(_G.UnitQuestTrivialLevelRange, "player")
        if ok and type(value) == "number" then return value end
    end
    return nil
end

--- Compat.GetSuperTrackedQuestID() -> questID|nil (0 counts as none)
function Compat.GetSuperTrackedQuestID()
    local fn = _G.GetSuperTrackedQuestID or (_G.C_SuperTrack and _G.C_SuperTrack.GetSuperTrackedQuestID)
    if type(fn) ~= "function" then return nil end
    local ok, questID = pcall(fn)
    if ok and type(questID) == "number" and questID > 0 then return questID end
    return nil
end

--- The events that say the super-tracked quest changed: SUPER_TRACKED_QUEST_CHANGED in the classic
-- clients, SUPER_TRACKING_CHANGED in Forever's Mainline one. Register both through Compat.RegisterEvent.
Compat.SUPER_TRACK_EVENTS = { "SUPER_TRACKED_QUEST_CHANGED", "SUPER_TRACKING_CHANGED" }

--- Compat.GetSpellName(spellID) -> localized name|nil
-- C_Spell.GetSpellName exists in every supported client; GetSpellInfo is gone from Forever.
function Compat.GetSpellName(spellID)
    if type(spellID) ~= "number" then return nil end
    local api = _G.C_Spell
    if api and api.GetSpellName then
        local ok, name = pcall(api.GetSpellName, spellID)
        if ok and type(name) == "string" then return name end
    end
    if _G.GetSpellInfo then
        local ok, name = pcall(_G.GetSpellInfo, spellID)
        if ok and type(name) == "string" then return name end
    end
    return nil
end

--- Compat.GetFactionInfoByID(factionID) -> name, standingID, barValue (the reputation total) | nil
-- Classic's GetFactionInfoByID, or C_Reputation.GetFactionDataByID in Forever.
function Compat.GetFactionInfoByID(factionID)
    if type(factionID) ~= "number" then return nil end
    if _G.GetFactionInfoByID then
        local ok, name, _, standingID, _, _, barValue = pcall(_G.GetFactionInfoByID, factionID)
        if ok and name then return name, standingID, barValue end
        return nil
    end
    local api = _G.C_Reputation
    if api and api.GetFactionDataByID then
        local ok, data = pcall(api.GetFactionDataByID, factionID)
        if ok and type(data) == "table" and data.name then
            return data.name, data.reaction, data.currentStanding
        end
    end
    return nil
end

--- Compat.GetSkillLines() -> { {name = , rank = , maxRank = }, ... } of the skills the client lists
-- Classic lists every skill (GetNumSkillLines/GetSkillLineInfo); Forever's Mainline API only has the
-- professions (GetProfessions/GetProfessionInfo), which is what a quest's required skill can be.
function Compat.GetSkillLines()
    local out = {}
    if _G.GetNumSkillLines and _G.GetSkillLineInfo then
        local ok, count = pcall(_G.GetNumSkillLines)
        for i = 1, (ok and tonumber(count)) or 0 do
            local okLine, name, isHeader, _, rank, _, _, maxRank = pcall(_G.GetSkillLineInfo, i)
            if okLine and name and not isHeader and type(rank) == "number" then
                out[#out + 1] = { name = name, rank = rank, maxRank = maxRank }
            end
        end
        return out
    end
    if _G.GetProfessions and _G.GetProfessionInfo then
        local ok, a, b, c, d, e, f = pcall(_G.GetProfessions)
        if ok then
            for _, index in pairs({ a, b, c, d, e, f }) do
                local okInfo, name, _, rank, maxRank = pcall(_G.GetProfessionInfo, index)
                if okInfo and name and type(rank) == "number" then
                    out[#out + 1] = { name = name, rank = rank, maxRank = maxRank }
                end
            end
        end
    end
    return out
end

--- Compat.HookTooltip(tooltip, kind, handler)
-- kind is "Unit" or "Item"; handler(tooltip) runs after the tooltip filled itself. The classic clients
-- fire OnTooltipSetUnit/OnTooltipSetItem; Forever's Mainline engine has TooltipDataProcessor instead,
-- whose post-calls run for every tooltip, so this one only answers for the tooltip it was asked about.
-- Forever's UI.xsd still declares the two script handlers although nothing fires them, so the game
-- decides, not HasScript: TooltipDataProcessor in Forever, the script hook everywhere else (Era does not
-- load TooltipDataProcessor at all, and TBC's fires alongside the scripts).
local postCalls = {}                    -- kind -> { [tooltip] = { handler, ... } }
local function dispatch(kind)
    return function(tooltip)
        local byTooltip = postCalls[kind]
        local handlers = byTooltip and byTooltip[tooltip]
        if not handlers then return end
        for i = 1, #handlers do handlers[i](tooltip) end
    end
end
function Compat.HookTooltip(tooltip, kind, handler)
    if type(tooltip) ~= "table" or type(handler) ~= "function" then return false end
    local script = "OnTooltipSet" .. kind
    local processor = _G.TooltipDataProcessor
    local types = _G.Enum and _G.Enum.TooltipDataType
    local mainline = ns.Game and ns.Game.id == ns.Game.FOREVER
    if not (mainline and processor and processor.AddTooltipPostCall and types and types[kind]) then
        local ok, has = false, false
        if tooltip.HasScript then ok, has = pcall(tooltip.HasScript, tooltip, script) end
        if ok and has and tooltip.HookScript then
            tooltip:HookScript(script, handler)
            return true
        end
    end
    if processor and processor.AddTooltipPostCall and types and types[kind] then
        if not postCalls[kind] then
            postCalls[kind] = setmetatable({}, { __mode = "k" })
            processor.AddTooltipPostCall(types[kind], dispatch(kind))
        end
        local handlers = postCalls[kind][tooltip]
        if not handlers then
            handlers = {}
            postCalls[kind][tooltip] = handlers
        end
        handlers[#handlers + 1] = handler
        return true
    end
    return false
end

---------------------------------------------------------------------------
-- 64-bit masks
---------------------------------------------------------------------------
-- WoW Forever's Skyborne race uses race-mask bits 32 and 33 (4294967296, 8589934592). The `bit` library
-- works on 32 bits, so bit.band(requiredRaces, mask) silently drops them. Lua 5.1 numbers are doubles and
-- hold every mask exactly (below 2^53); these split a mask into its 32-bit halves.

local TWO32 = 4294967296

local function band32(a, b)
    local band = _G.bit and _G.bit.band
    if band then
        local r = band(a, b)
        if r < 0 then r = r + TWO32 end
        return r
    end
    local r, w = 0, 1
    while a > 0 and b > 0 do
        if a % 2 == 1 and b % 2 == 1 then r = r + w end
        a, b, w = floor(a / 2), floor(b / 2), w * 2
    end
    return r
end

--- Compat.Band64(a, b) -> a AND b over 64 bits (both non-negative integers below 2^53)
function Compat.Band64(a, b)
    a, b = tonumber(a) or 0, tonumber(b) or 0
    if a < 0 then a = a + TWO32 end
    if b < 0 then b = b + TWO32 end
    local ah, bh = floor(a / TWO32), floor(b / TWO32)
    local high = (ah > 0 and bh > 0) and band32(ah, bh) or 0
    return high * TWO32 + band32(a % TWO32, b % TWO32)
end

--- Compat.MasksOverlap(a, b) -> true when the two masks share a bit (a 0/nil mask shares none)
function Compat.MasksOverlap(a, b)
    if not a or not b or a == 0 or b == 0 then return false end
    return Compat.Band64(a, b) ~= 0
end
