-- Quest/Player.lua: everything the navigator needs to know about the player (docs/06 section 8).
-- Position, movement speed, level, race/class bitmasks, completed quests, skills, spells and reputation.
--
-- Two things matter for the rest of the addon:
--   * GetPosition() returns nil inside instances. That is the documented signal Router/Arrow use to
--     stop navigating - C_Map.GetPlayerMapPosition has no answer there and UnitPosition() is dead too.
--   * The position table is allocated ONCE and refilled, because Arrow/Router poll it every frame.
local _, ns = ...

local M = {}
ns.Player = M

local Const, Compat, Log, Schema = ns.Const, ns.Compat, ns.Log, ns.Schema

local type, pcall = type, pcall
local wipe = wipe or table.wipe

local RUN_SPEED = Const.RUN_SPEED or 7
local POS_CACHE_SECONDS = 0.05          -- docs/06 section 8: the position is cached for at most 0.05 s
local SPEED_TAU = 0.5                   -- EMA time constant for GetSpeed
local COMPLETED_REFRESH_DELAY = 2       -- QUEST_TURNED_IN + 2 s (the server updates the flag late)

-- Own AceEvent/AceTimer object instead of ns.PQ: AceEvent keys its registry by target, so two
-- modules registering the same event on ns.PQ would silently overwrite each other (QUEST_TURNED_IN
-- and PLAYER_ENTERING_WORLD are wanted by several modules).
local listener = {}
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
    local AceTimer = LibStub and LibStub("AceTimer-3.0", true)
    if AceTimer then AceTimer:Embed(listener) end
end
M.listener = listener

local HBD                               -- HereBeDragons-2.0, resolved lazily (Libs load before us, but be safe)

local function hbd()
    if HBD == nil then
        if LibStub then
            HBD = LibStub("HereBeDragons-2.0", true) or false
        else
            HBD = false
        end
    end
    return HBD or nil
end

---------------------------------------------------------------------------
-- Static player facts
---------------------------------------------------------------------------

function M.GetLevel()
    if UnitLevel then
        return UnitLevel("player") or 0
    end
    return 0
end

--- GetFaction() -> "Alliance"|"Horde"|"Neutral". A Pandaren who has not picked a side is "Neutral".
function M.GetFaction()
    if not UnitFactionGroup then return "Neutral" end
    local group = UnitFactionGroup("player")
    if group == "Alliance" or group == "Horde" then return group end
    return "Neutral"
end

local function raceFile()
    if not UnitRace then return nil end
    local _, file = UnitRace("player")
    return file
end

function M.IsNeutralPandaren()
    return raceFile() == "Pandaren" and M.GetFaction() == "Neutral"
end

--- GetRaceMask() -> bitmask matching Quest.requiredRaces (Schema.raceKeys).
-- Pandaren need two bits: the neutral PANDAREN bit for the starting-zone quests and the faction
-- specific bit, because ALL_ALLIANCE / ALL_HORDE contain PANDAREN_ALLIANCE / PANDAREN_HORDE only.
function M.GetRaceMask()
    local file = raceFile()
    local mask = file and Schema.raceFileToMask[file] or 0
    if file == "Pandaren" then
        local faction = M.GetFaction()
        if faction == "Alliance" then
            mask = mask + Schema.raceKeys.PANDAREN_ALLIANCE
        elseif faction == "Horde" then
            mask = mask + Schema.raceKeys.PANDAREN_HORDE
        end
    end
    return mask
end

--- GetClassMask() -> bitmask matching Quest.requiredClasses (Schema.classKeys).
function M.GetClassMask()
    local file
    if UnitClassBase then
        file = UnitClassBase("player")
    elseif UnitClass then
        local _, classFile = UnitClass("player")
        file = classFile
    end
    return (file and Schema.classFileToMask[file]) or 0
end

--- IsInInstance() -> bool. Only real instances count; "none" is the open world.
function M.IsInInstance()
    if not IsInInstance then return false end
    local inInstance, instanceType = IsInInstance()
    if not inInstance then return false end
    return instanceType ~= nil and instanceType ~= "none"
end

function M.IsMounted()
    return Compat.IsMounted()
end

function M.IsFlying()
    return Compat.IsFlying()
end

---------------------------------------------------------------------------
-- Position
---------------------------------------------------------------------------

-- One table, refilled in place. Callers must not keep it across frames.
local pos = { uiMapID = nil, x = 0, y = 0, worldX = nil, worldY = nil, instanceID = nil, areaID = nil, t = 0 }
local posCheckedAt, posValid = nil, false

local function readMapPosition(uiMapID)
    if not (C_Map and C_Map.GetPlayerMapPosition) then return nil end
    local ok, vector = pcall(C_Map.GetPlayerMapPosition, uiMapID, "player")
    if not ok or not vector then return nil end
    if vector.GetXY then
        local x, y = vector:GetXY()
        return x, y
    end
    return vector.x, vector.y
end

--- GetPosition() -> pos|nil
-- pos = { uiMapID, x, y (0..1), worldX, worldY, instanceID, areaID|nil, t = GetTime() }
-- nil means "no position on a world map" - inside an instance, on a loading screen, or on a map
-- without coordinates. Cached for POS_CACHE_SECONDS; the same table comes back every time.
function M.GetPosition()
    local now = GetTime and GetTime() or 0
    if posCheckedAt and (now - posCheckedAt) < POS_CACHE_SECONDS and (now - posCheckedAt) >= 0 then
        return posValid and pos or nil
    end
    posCheckedAt = now
    posValid = false

    if not (C_Map and C_Map.GetBestMapForUnit) then return nil end
    local uiMapID = C_Map.GetBestMapForUnit("player")
    if not uiMapID then return nil end

    local x, y = readMapPosition(uiMapID)
    if not x or not y or (x == 0 and y == 0) then return nil end

    pos.uiMapID = uiMapID
    pos.x = x
    pos.y = y
    pos.t = now

    -- World yards. HereBeDragons prefers UnitPosition() (exact, but dead inside instances) and we
    -- fall back to converting the map position, which works on every map HBD knows.
    local lib = hbd()
    local worldX, worldY, instanceID
    if lib then
        worldX, worldY, instanceID = lib:GetPlayerWorldPosition()
        if not worldX then
            worldX, worldY, instanceID = lib:GetWorldCoordinatesFromZone(x, y, uiMapID)
        end
    end
    pos.worldX, pos.worldY, pos.instanceID = worldX, worldY, instanceID

    local Zones = ns.Zones
    pos.areaID = (Zones and Zones.GetAreaIdByUiMapId and Zones.GetAreaIdByUiMapId(uiMapID)) or nil

    posValid = true
    return pos
end

--- Drops the position cache so the next GetPosition() reads the API again (zone change, teleport).
function M.InvalidatePosition()
    posCheckedAt = nil
    posValid = false
end

---------------------------------------------------------------------------
-- Speed
---------------------------------------------------------------------------

local smoothedSpeed, speedSampledAt = 0, nil

--- GetSpeed() -> yards/s, exponentially smoothed over ~0.5 s so the ETA does not jitter.
-- Standing still on foot returns exactly 0 (the smoothing is reset, not decayed).
function M.GetSpeed()
    local current = Compat.UnitSpeed("player")
    local now = GetTime and GetTime() or 0
    if current <= 0 and not M.IsMounted() then
        smoothedSpeed, speedSampledAt = 0, now
        return 0
    end
    if not speedSampledAt then
        smoothedSpeed, speedSampledAt = current, now
        return smoothedSpeed
    end
    local dt = now - speedSampledAt
    speedSampledAt = now
    if dt <= 0 then return smoothedSpeed end
    if dt >= SPEED_TAU then
        smoothedSpeed = current
    else
        smoothedSpeed = smoothedSpeed + (current - smoothedSpeed) * (dt / SPEED_TAU)
    end
    return smoothedSpeed
end

--- GetExpectedSpeed() -> yards/s used for the ETA: the speed the player would travel at.
-- Standing still must not mean "infinite ETA", so the floor is the run speed of the current form
-- (7 on foot, the mount speed while mounted, the flight speed while flying).
function M.GetExpectedSpeed()
    local _, run, flight = Compat.UnitSpeed("player")
    local base
    if M.IsFlying() then
        base = (flight and flight > 0) and flight or ((run and run > 0) and run or RUN_SPEED)
    elseif M.IsMounted() then
        base = (run and run > 0) and run or RUN_SPEED
    else
        base = RUN_SPEED
    end
    local current = M.GetSpeed()
    if current > base then return current end
    return base
end

---------------------------------------------------------------------------
-- Completed quests
---------------------------------------------------------------------------

local completed = {}
local completedValid = false

--- GetCompleted() -> { [questID] = true }. Shared table: do not mutate it.
function M.GetCompleted()
    if not completedValid then
        wipe(completed)
        if GetQuestsCompleted then
            pcall(GetQuestsCompleted, completed)
        end
        completedValid = true
    end
    return completed
end

function M.IsQuestCompleted(questID)
    return M.GetCompleted()[questID] == true
end

--- Forces the next GetCompleted() to ask the server flags again.
function M.InvalidateCompleted()
    completedValid = false
end

---------------------------------------------------------------------------
-- Skills, spells, reputation
---------------------------------------------------------------------------

local skills = {}
local skillsValid = false

--- GetSkills() -> { [skillName] = rank }. Shared table: do not mutate it.
function M.GetSkills()
    if not skillsValid then
        wipe(skills)
        if GetNumSkillLines and GetSkillLineInfo then
            local count = GetNumSkillLines() or 0
            for i = 1, count do
                local name, isHeader, _, rank = GetSkillLineInfo(i)
                if name and not isHeader and type(rank) == "number" then
                    skills[name] = rank
                end
            end
        end
        skillsValid = true
    end
    return skills
end

function M.GetSkillRank(skillName)
    return M.GetSkills()[skillName]
end

function M.InvalidateSkills()
    skillsValid = false
end

function M.HasSpell(spellID)
    if type(spellID) ~= "number" then return false end
    return Compat.IsSpellKnown(spellID)
end

--- GetReputation(factionID) -> value, standingID
-- `value` is the raw reputation total the quest database compares against (Questie's barValue).
-- nil means "faction not discovered"; callers treat that as 0 like Questie does.
-- 5.5.4 has no C_Reputation, so GetFactionInfoByID is the only source (docs/02).
function M.GetReputation(factionID)
    if type(factionID) ~= "number" then return nil end
    if GetFactionInfoByID then
        local ok, name, _, standingID, _, _, barValue = pcall(GetFactionInfoByID, factionID)
        if ok and name then
            return barValue, standingID
        end
    end
    return nil
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

local lastZoneMapID, lastZoneAreaID

local function announceZone(reason)
    M.InvalidatePosition()
    local uiMapID = (C_Map and C_Map.GetBestMapForUnit and C_Map.GetBestMapForUnit("player")) or nil
    local Zones = ns.Zones
    local areaID = (uiMapID and Zones and Zones.GetAreaIdByUiMapId and Zones.GetAreaIdByUiMapId(uiMapID)) or nil
    lastZoneMapID, lastZoneAreaID = uiMapID, areaID
    Log.Debug("Player", "zone changed (%s): uiMapID=%s areaID=%s", tostring(reason), tostring(uiMapID), tostring(areaID))
    if ns.PQ and ns.PQ.SendMessage then
        ns.PQ:SendMessage("PQ_PLAYER_ZONE_CHANGED", uiMapID, areaID)
    end
end

function M.GetZone()
    return lastZoneMapID, lastZoneAreaID
end

function M.Init()
    -- Nothing that needs the world; the caches build themselves on first use.
end

-- Frame:RegisterEvent errors on an event name the client does not know, and AceEvent forwards that
-- straight out of Enable(). One bad name would then strip every handler registered after it, so
-- each registration is isolated: a miss costs that one handler and is logged, nothing else.
local function safeRegister(event, handler)
    local ok, err = pcall(listener.RegisterEvent, listener, event, handler)
    if not ok then
        Log.Error("Player", "RegisterEvent(%s) failed: %s", tostring(event), tostring(err))
    end
    return ok
end
M.SafeRegister = safeRegister

function M.Enable()
    if not listener.RegisterEvent then return end

    safeRegister("ZONE_CHANGED_NEW_AREA", function() announceZone("ZONE_CHANGED_NEW_AREA") end)
    safeRegister("PLAYER_ENTERING_WORLD", function()
        M.InvalidateCompleted()
        M.InvalidateSkills()
        announceZone("PLAYER_ENTERING_WORLD")
    end)

    -- The completed-quest flags are set server side a moment after the turn-in, so the immediate
    -- optimistic mark is followed by a real refresh two seconds later (docs/06 section 8).
    safeRegister("QUEST_TURNED_IN", function(_, questID)
        if type(questID) == "number" then
            M.GetCompleted()[questID] = true
        end
        if listener.ScheduleTimer then
            listener:ScheduleTimer(M.InvalidateCompleted, COMPLETED_REFRESH_DELAY)
        else
            M.InvalidateCompleted()
        end
    end)

    safeRegister("PLAYER_LEVEL_UP", function() M.InvalidateSkills() end)
    safeRegister("SKILL_LINES_CHANGED", function() M.InvalidateSkills() end)
    -- 5.5.4 spelling (docs/02 A5): LEARNED_SPELL_IN_TAB is a Retail-only event and errors here.
    safeRegister("LEARNED_SPELL_IN_SKILL_LINE", function() M.InvalidateSkills() end)
end

function M.OnProfileChanged()
    M.InvalidatePosition()
end
