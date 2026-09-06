-- Core/Log.lua: levelled chat logging. Levels: 0 Error, 1 Warn, 2 Info, 3 Debug, 4 Trace.
-- The active level comes from profile.debug.level once AceDB exists; Log.SetLevel overrides it.
local _, ns = ...

local Log = {}
ns.Log = Log

local Const = ns.Const
local format, tostring, select, pcall = string.format, tostring, select, pcall

Log.ERROR, Log.WARN, Log.INFO, Log.DEBUG, Log.TRACE = 0, 1, 2, 3, 4
local LEVEL_NAMES = { [0] = "ERROR", [1] = "WARN", [2] = "INFO", [3] = "DEBUG", [4] = "TRACE" }
local LEVEL_COLORS = { [0] = "ffff4040", [1] = "ffffc040", [2] = "ff5fd7ff", [3] = "ffa0a0a0", [4] = "ff707070" }
Log.LEVEL_NAMES = LEVEL_NAMES

local ERROR_RATE_SECONDS = 10       -- Log.Error prints at most once per key per 10 s
local lastErrorAt = {}              -- key -> GetTime()
local overrideLevel                 -- set by Log.SetLevel (nil = follow the profile)
local history = {}                  -- last messages for /pq status and tests
local HISTORY_MAX = 50
Log.history = history

local function now()
    return GetTime and GetTime() or 0
end

function Log.GetLevel()
    if overrideLevel then return overrideLevel end
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    local level = profile and profile.debug and profile.debug.level
    if type(level) == "number" then return level end
    return ns.DEFAULTS.profile.debug.level
end

-- SetLevel(n) forces a level; SetLevel(nil) returns to the profile value.
function Log.SetLevel(level)
    if level ~= nil then
        level = tonumber(level)
        if not level then return end
        if level < 0 then level = 0 elseif level > 4 then level = 4 end
    end
    overrideLevel = level
    local PQ = ns.PQ
    if level and PQ and PQ.db and PQ.db.profile and PQ.db.profile.debug then
        PQ.db.profile.debug.level = level
        overrideLevel = nil
    end
end

function Log.IsEnabled(level)
    return level <= Log.GetLevel()
end

local function safeFormat(fmt, ...)
    if select("#", ...) == 0 then return tostring(fmt) end
    local ok, text = pcall(format, tostring(fmt), ...)
    if ok then return text end
    -- Formatting failed: concatenate the arguments so that nothing is lost.
    local parts = { tostring(fmt) }
    for i = 1, select("#", ...) do parts[#parts + 1] = tostring((select(i, ...))) end
    return table.concat(parts, " ")
end

local function output(text)
    if DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.AddMessage then
        DEFAULT_CHAT_FRAME:AddMessage(text)
    elseif print then
        print(text)
    end
end

local function emit(level, module, fmt, ...)
    local text = safeFormat(fmt, ...)
    history[#history + 1] = { t = now(), level = level, module = module, text = text }
    if #history > HISTORY_MAX then table.remove(history, 1) end
    local tag = "|c" .. LEVEL_COLORS[level] .. LEVEL_NAMES[level] .. "|r"
    output(format("%s [%s] %s: %s", Const.CHAT_PREFIX, tag, tostring(module or "?"), text))
    return text
end

function Log.Error(module, fmt, ...)
    -- Errors are rate-limited per (module, fmt) so a repeating failure never spams the chat.
    local key = tostring(module) .. "|" .. tostring(fmt)
    local t = now()
    local last = lastErrorAt[key]
    if last and (t - last) < ERROR_RATE_SECONDS then
        return nil
    end
    lastErrorAt[key] = t
    return emit(0, module, fmt, ...)
end

function Log.Warn(module, fmt, ...)
    if Log.GetLevel() < 1 then return nil end
    return emit(1, module, fmt, ...)
end

function Log.Info(module, fmt, ...)
    if Log.GetLevel() < 2 then return nil end
    return emit(2, module, fmt, ...)
end

function Log.Debug(module, fmt, ...)
    if Log.GetLevel() < 3 then return nil end
    return emit(3, module, fmt, ...)
end

function Log.Trace(module, fmt, ...)
    if Log.GetLevel() < 4 then return nil end
    return emit(4, module, fmt, ...)
end

-- Plain user-facing chat line with the addon prefix (not level filtered, not rate limited).
function Log.Print(fmt, ...)
    local text = safeFormat(fmt, ...)
    output(Const.CHAT_PREFIX .. ": " .. text)
    return text
end

-- Testing / debugging helper: clears the error rate-limit table.
function Log.ResetRateLimits()
    for k in pairs(lastErrorAt) do lastErrorAt[k] = nil end
end
