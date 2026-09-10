-- Core/Util.lua: small pure helpers shared by every module (docs/06 section 5).
local _, ns = ...

local Util = {}
ns.Util = Util

local floor, abs, sqrt, huge = math.floor, math.abs, math.sqrt, math.huge
local format, tostring, tonumber, type, pairs = string.format, tostring, tonumber, type, pairs

local YARDS_PER_METER = ns.Const.YARDS_PER_METER

function Util.YardsToMeters(yards)
    return yards / YARDS_PER_METER
end

function Util.MetersToYards(meters)
    return meters * YARDS_PER_METER
end

function Util.Round(x, decimals)
    local mult = 10 ^ (decimals or 0)
    return floor(x * mult + 0.5) / mult
end

function Util.Clamp(x, lo, hi)
    if x < lo then return lo end
    if x > hi then return hi end
    return x
end

function Util.Euclid(x1, y1, x2, y2)
    local dx, dy = x2 - x1, y2 - y1
    return sqrt(dx * dx + dy * dy)
end

-- Returns the configured distance unit ("meters"|"yards"), defaulting to meters before the DB exists.
function Util.GetUnits()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    local units = profile and profile.units
    if units == "yards" then return "yards" end
    return "meters"
end

-- "2340" -> "2 340" (thin thousands grouping used for yard values).
local function groupThousands(n)
    local s = tostring(n)
    local head, digits = s:match("^(%-?)(%d+)$")
    if not digits then return s end
    local out = digits:reverse():gsub("(%d%d%d)", "%1 "):reverse()
    out = out:gsub("^ ", "")
    return head .. out
end

-- Rounds a distance value: below 10 one decimal, otherwise an integer.
local function roundDistance(v)
    if v < 10 then
        return format("%.1f", Util.Round(v, 1))
    end
    return tostring(floor(v + 0.5))
end

-- FormatDistance(yards [, units]) -> "123 m" | "1.2 km" | "2 340 yd"
function Util.FormatDistance(yards, units)
    if type(yards) ~= "number" or yards ~= yards or yards == huge or yards == -huge then
        return "--"
    end
    if yards < 0 then yards = 0 end
    units = units or Util.GetUnits()
    if units == "yards" then
        if yards < 10 then
            return roundDistance(yards) .. " yd"
        end
        return groupThousands(floor(yards + 0.5)) .. " yd"
    end
    local meters = yards / YARDS_PER_METER
    if meters >= 1000 then
        return format("%.1f km", Util.Round(meters / 1000, 1))
    end
    return roundDistance(meters) .. " m"
end

-- FormatTime(seconds) -> "45 s" | "1 min 20 s" | "12 min" | "1 h 5 min"; nil/inf/nan -> "--"
function Util.FormatTime(seconds)
    if type(seconds) ~= "number" or seconds ~= seconds or seconds == huge or seconds == -huge then
        return "--"
    end
    if seconds < 0 then seconds = 0 end
    seconds = floor(seconds + 0.5)
    if seconds < 60 then
        return format("%d s", seconds)
    end
    local minutes = floor(seconds / 60)
    if seconds < 600 then
        local rest = seconds - minutes * 60
        if rest == 0 then
            return format("%d min", minutes)
        end
        return format("%d min %d s", minutes, rest)
    end
    if seconds < 3600 then
        return format("%d min", minutes)
    end
    local hours = floor(seconds / 3600)
    local restMin = minutes - hours * 60
    if restMin == 0 then
        return format("%d h", hours)
    end
    return format("%d h %d min", hours, restMin)
end

-- FormatRespawn(seconds) -> "45 Secs" | "6 Mins 53 Secs" | "1 Hour 5 Mins"; nil for a value we do
-- not have (docs/10 B3: an unknown line is left out, never rendered as "?" or 0).
--
-- This is deliberately not FormatTime: the respawn line copies pfQuest's wording from the owner's
-- screenshot, where the units are spelled out and pluralised. ns.L is read at call time because
-- Core/Util.lua loads before Locales/ (and /pq lang rewrites the table in place).
local RESPAWN_UNITS = {
    sec = { "%d Sec", "%d Secs" },
    min = { "%d Min", "%d Mins" },
    hour = { "%d Hour", "%d Hours" },
}

local function respawnUnit(value, unit)
    local forms = RESPAWN_UNITS[unit]
    local key = forms[value == 1 and 1 or 2]
    local L = ns.L
    local pattern = (L and L[key]) or key
    return format(pattern, value)
end

function Util.FormatRespawn(seconds)
    if type(seconds) ~= "number" or seconds ~= seconds or seconds == huge or seconds == -huge then
        return nil
    end
    if seconds < 0 then seconds = 0 end
    seconds = floor(seconds + 0.5)
    if seconds < 60 then
        return respawnUnit(seconds, "sec")
    end
    if seconds < 3600 then
        local minutes = floor(seconds / 60)
        local rest = seconds - minutes * 60
        if rest == 0 then return respawnUnit(minutes, "min") end
        return respawnUnit(minutes, "min") .. " " .. respawnUnit(rest, "sec")
    end
    local hours = floor(seconds / 3600)
    local minutes = floor((seconds - hours * 3600) / 60)
    if minutes == 0 then return respawnUnit(hours, "hour") end
    return respawnUnit(hours, "hour") .. " " .. respawnUnit(minutes, "min")
end

-- GUID field 6 holds the creature/object id: "Creature-0-4379-870-8-57232-0000123456".
local function guidField(guid, prefixes)
    if type(guid) ~= "string" then return nil end
    local unitType, fields = guid:match("^(%a+)%-(.+)$")
    if not unitType or not prefixes[unitType] then return nil end
    local i, id = 1, nil
    for field in fields:gmatch("[^%-]+") do
        i = i + 1
        if i == 6 then
            id = tonumber(field)
            break
        end
    end
    return id
end

local NPC_GUID_TYPES = { Creature = true, Vehicle = true, Pet = true }
local OBJECT_GUID_TYPES = { GameObject = true }

function Util.NpcIdFromGuid(guid)
    return guidField(guid, NPC_GUID_TYPES)
end

function Util.ObjectIdFromGuid(guid)
    return guidField(guid, OBJECT_GUID_TYPES)
end

-- ColorText(text, r, g, b) with 0..1 components, or ColorText(text, "ff00ff00").
function Util.ColorText(text, r, g, b)
    local hex
    if type(r) == "string" then
        hex = r
        if #hex == 6 then hex = "ff" .. hex end
    elseif type(r) == "number" then
        hex = format("ff%02x%02x%02x", floor(Util.Clamp(r, 0, 1) * 255 + 0.5),
            floor(Util.Clamp(g or 0, 0, 1) * 255 + 0.5), floor(Util.Clamp(b or 0, 0, 1) * 255 + 0.5))
    else
        return tostring(text)
    end
    return "|c" .. hex .. tostring(text) .. "|r"
end

-- Quest difficulty colour as "ffRRGGBB"; white when the API is unavailable.
function Util.QuestDifficultyColorHex(level)
    if GetQuestDifficultyColor and type(level) == "number" then
        local ok, color = pcall(GetQuestDifficultyColor, level)
        if ok and type(color) == "table" and color.r then
            return format("ff%02x%02x%02x", floor(color.r * 255 + 0.5), floor(color.g * 255 + 0.5),
                floor(color.b * 255 + 0.5))
        end
    end
    return "ffffffff"
end

-- UTF-8 aware truncation; appends "..." when the text was cut.
function Util.Truncate(text, maxChars)
    text = tostring(text or "")
    if not maxChars or maxChars < 1 then return text end
    local count, cut = 0, nil
    for pos in text:gmatch("()[%z\1-\127\194-\244][\128-\191]*") do
        count = count + 1
        if count == maxChars + 1 then
            cut = pos
            break
        end
    end
    if not cut then return text end
    local keep = text:sub(1, cut - 1)
    -- Drop the last kept character(s) to make room for the ellipsis when possible.
    if maxChars > 3 then
        local n, lastPos = 0, 1
        for pos in keep:gmatch("()[%z\1-\127\194-\244][\128-\191]*") do
            n = n + 1
            if n == maxChars - 2 then lastPos = pos end
        end
        keep = keep:sub(1, lastPos - 1)
    end
    return keep .. "..."
end

function Util.CopyTable(t, deep)
    if type(t) ~= "table" then return t end
    local out = {}
    for k, v in pairs(t) do
        if deep and type(v) == "table" then
            out[k] = Util.CopyTable(v, true)
        else
            out[k] = v
        end
    end
    return out
end

-- Empties dst in place and shallow-copies src into it; returns dst (reuses tables, no allocation).
function Util.WipeAndFill(dst, src)
    if wipe then
        wipe(dst)
    else
        for k in pairs(dst) do dst[k] = nil end
    end
    if src then
        for k, v in pairs(src) do dst[k] = v end
    end
    return dst
end

function Util.SpawnKey(areaID, x, y)
    return format("%d:%s:%s", areaID, tostring(x), tostring(y))
end

function Util.SplitAreaSpawnKey(key)
    if type(key) ~= "string" then return nil end
    local areaID, x, y = key:match("^(%-?%d+):(%-?[%d%.]+):(%-?[%d%.]+)$")
    if not areaID then return nil end
    return tonumber(areaID), tonumber(x), tonumber(y)
end

function Util.Now()
    return GetTime()
end

function Util.UnixNow()
    return time()
end

-- Plain absolute difference, handy for change detection without allocations.
function Util.Approx(a, b, eps)
    return abs(a - b) <= (eps or 1e-6)
end
