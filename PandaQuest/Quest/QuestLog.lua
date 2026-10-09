-- Quest/QuestLog.lua: the ONE reader of the Blizzard quest log.
-- Nothing else in the addon calls GetQuestLogTitle / C_QuestLog.GetQuestObjectives; every module
-- consumes the Entry tables published here and the PQ_QUESTLOG_CHANGED message.
--
-- Three details of the 5.5.4 API drive the implementation:
--   * GetQuestLogTitle(i) returns 17 values. `questTag` (3) is a LOCALIZED STRING, `isComplete` (6)
--     is a NUMBER (>0 complete, <0 failed) and `questID` sits at position 8.
--   * During a zone transition the log briefly reports zero entries / nil titles. Reporting those as
--     removals would tear down every target, so a suspicious scan is dropped and retried.
--   * QUEST_TURNED_IN arrives BEFORE QUEST_REMOVED, which is the only way to tell a completed quest
--     from an abandoned one.
local _, ns = ...

local M = {}
ns.QuestLog = M

local Log = ns.Log

local type, pairs, ipairs, next, pcall, tonumber, tostring = type, pairs, ipairs, next, pcall, tonumber, tostring
local gsub, match, sub = string.gsub, string.match, string.sub
local concat = table.concat
local wipe = wipe or table.wipe

-- Own AceEvent/AceTimer/AceBucket object: AceEvent keys its registry by target, so registering
-- QUEST_TURNED_IN or PLAYER_ENTERING_WORLD on the shared ns.PQ would overwrite another module's
-- handler for the same event.
local listener = {}
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
    local AceTimer = LibStub and LibStub("AceTimer-3.0", true)
    if AceTimer then AceTimer:Embed(listener) end
    local AceBucket = LibStub and LibStub("AceBucket-3.0", true)
    if AceBucket then AceBucket:Embed(listener) end
end
M.listener = listener

local BUCKET_SECONDS = 0.3              -- QUEST_LOG_UPDATE bucket
local RETRY_SECONDS = 1                 -- zone-transition retry delay
local MAX_RETRIES = 5
local TURNIN_MEMORY = 30                -- how long a QUEST_TURNED_IN stays pending before it expires

---------------------------------------------------------------------------
-- Objective text parsing
---------------------------------------------------------------------------

-- Turns a Blizzard format string such as "%s slain: %d/%d" into a Lua capture pattern
-- "(.+) slain: (%d+)/(%d+)". The string is read once, left to right: a conversion (`%s`, `%d`,
-- optionally positional as `%1$s`) becomes a capture, a character that is magic in a Lua pattern
-- is escaped, anything else is copied.
local MAGIC = {}
for ch in ("^$()%.[]*+-?"):gmatch(".") do MAGIC[ch] = true end

local sanitizeCache = {}
local function sanitizePattern(pattern)
    if type(pattern) ~= "string" then return nil end
    local cached = sanitizeCache[pattern]
    if cached then return cached end

    local out, i, n = {}, 1, #pattern
    while i <= n do
        local ch = sub(pattern, i, i)
        if ch == "%" then
            local j = i + 1
            local position = match(pattern, "^%d+%$", j)
            if position then j = j + #position end
            local conversion = sub(pattern, j, j)
            if conversion == "s" then
                out[#out + 1] = "(.+)"
            elseif conversion == "d" then
                out[#out + 1] = "(%d+)"
            elseif conversion == "%" then
                out[#out + 1] = "%%"
            elseif match(conversion, "%a") then
                out[#out + 1] = "(%" .. conversion .. "+)"
            else
                out[#out + 1] = "%%"
                j = j - 1
            end
            i = j + 1
        else
            out[#out + 1] = MAGIC[ch] and ("%" .. ch) or ch
            i = i + 1
        end
    end

    -- "(.+)(%d+)" would let the text swallow the digits; make the text give way to the number.
    local result = concat(out):gsub("%(%.%+%)%(%%d%+%)", "(.-)(%%d+)")
    sanitizeCache[pattern] = result
    return result
end
M.SanitizePattern = sanitizePattern

local patterns                          -- built on first use (the globals exist from FrameXML on)

local function buildPatterns()
    if patterns then return patterns end
    patterns = {}
    local sources = {
        monster = _G and _G.QUEST_MONSTERS_KILLED,
        object = _G and _G.QUEST_OBJECTS_FOUND,
        item = _G and _G.QUEST_ITEMS_NEEDED,
    }
    for kind, raw in pairs(sources) do
        local pattern = sanitizePattern(raw)
        if pattern then patterns[kind] = pattern end
    end
    -- Order matters: the most specific pattern ("%s slain: %d/%d") has to be tried first.
    patterns.order = { patterns.monster, patterns.object, patterns.item }
    patterns.generic = "^(.-):%s*(%d+)%s*/%s*(%d+)$"
    return patterns
end
M.BuildPatterns = buildPatterns

-- Some locales use a fullwidth colon; normalise it so one pattern set is enough.
local function normalize(text)
    if type(text) ~= "string" then return nil end
    return (gsub(text, "\239\188\154", ":"))
end

--- ParseObjectiveText(text, objType) -> name|nil, numFulfilled|nil, numRequired|nil
-- Used when C_QuestLog.GetQuestObjectives is unavailable and to recover the target NAME, which the
-- structured API never gives us.
function M.ParseObjectiveText(text, objType)
    text = normalize(text)
    if not text then return nil end
    local p = buildPatterns()
    local candidates = {}
    if objType and p[objType] then candidates[#candidates + 1] = p[objType] end
    for _, pattern in ipairs(p.order) do candidates[#candidates + 1] = pattern end
    candidates[#candidates + 1] = p.generic
    for _, pattern in ipairs(candidates) do
        local name, have, need = match(text, pattern)
        if name and have then
            name = gsub(name, "%s+$", "")
            if name ~= "" then
                return name, tonumber(have), tonumber(need)
            end
        end
    end
    -- No counter at all ("Speak to Lorewalker Cho"); the whole line is the description.
    return nil, nil, nil
end

local KNOWN_TYPES = {
    monster = true, item = true, object = true, event = true, reputation = true,
    player = true, spell = true, progressbar = true,
}

local function normalizeType(objType)
    if type(objType) == "string" and KNOWN_TYPES[objType] then return objType end
    if objType == "log" then return "event" end
    return "unknown"
end

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local current = {}                      -- questID -> Entry (published through GetAll)
local logOrder = {}                     -- array of questIDs, log order
local turnedInPending = {}              -- questID -> GetTime() of QUEST_TURNED_IN
local retries = 0
local hasScanned = false
local retryScheduled = false
local removalSignalled = false          -- QUEST_REMOVED/QUEST_TURNED_IN seen: an empty log is real

local function now()
    return (GetTime and GetTime()) or 0
end

local function acceptedStore()
    local PQ = ns.PQ
    local char = PQ and PQ.db and PQ.db.char
    if not char then return nil end
    char.questAcceptedAt = char.questAcceptedAt or {}
    return char.questAcceptedAt
end

---------------------------------------------------------------------------
-- Scanning
---------------------------------------------------------------------------

local function readObjectives(questID, logIndex, out)
    local api = C_QuestLog and C_QuestLog.GetQuestObjectives
    local list
    if api then
        local ok, result = pcall(api, questID)
        if ok then list = result end
    end
    if type(list) == "table" and #list > 0 then
        for i = 1, #list do
            local o = list[i]
            local text = normalize(o.text) or ""
            local name = M.ParseObjectiveText(text, o.type)
            out[i] = {
                index = i,
                text = text,
                type = normalizeType(o.type),
                finished = o.finished and true or false,
                numFulfilled = o.numFulfilled or 0,
                numRequired = o.numRequired or 0,
                name = name,
            }
        end
        return out
    end

    -- Fallback: the classic leader board, parsed with the sanitised patterns.
    if not (GetNumQuestLeaderBoards and GetQuestLogLeaderBoard) then return out end
    local count = GetNumQuestLeaderBoards(logIndex) or 0
    for i = 1, count do
        local text, objType, finished = GetQuestLogLeaderBoard(i, logIndex)
        if text then
            text = normalize(text) or ""
            local name, have, need = M.ParseObjectiveText(text, objType)
            out[i] = {
                index = i,
                text = text,
                type = normalizeType(objType),
                finished = finished and true or false,
                numFulfilled = have or (finished and 1 or 0),
                numRequired = need or 1,
                name = name,
            }
        end
    end
    return out
end

--- Reads the whole Blizzard log into `dest`. Returns false when the scan looks like zone-transition
-- garbage (no entries or nil titles while we know the player has quests).
-- `trustEmpty` is true when the game told us a quest really left the log (QUEST_REMOVED /
-- QUEST_TURNED_IN) or the retries ran out; abandoning your last quest must not be ignored forever.
local function scan(dest, orderOut, trustEmpty)
    if not (GetNumQuestLogEntries and GetQuestLogTitle) then return false end
    local numEntries, numQuests = GetNumQuestLogEntries()
    numEntries = numEntries or 0
    numQuests = numQuests or 0

    local hadQuests = next(current) ~= nil

    if numEntries == 0 and hadQuests and not trustEmpty then
        return false
    end

    local header = nil
    local sawNil = false
    for i = 1, numEntries do
        local title, level, questTag, isHeader, _, isComplete, frequency, questID = GetQuestLogTitle(i)
        if title == nil then
            sawNil = true
        elseif isHeader then
            header = title
        elseif type(questID) == "number" and questID > 0 then
            local complete = nil
            if type(isComplete) == "number" then
                if isComplete > 0 then complete = 1 elseif isComplete < 0 then complete = -1 end
            elseif isComplete == true then
                complete = 1
            end
            local entry = {
                questID = questID,
                title = title,
                level = level,
                questTag = (type(questTag) == "string" and questTag ~= "") and questTag or nil,
                isComplete = complete,
                frequency = frequency or 0,
                logIndex = i,
                isHeaderChild = header,
                objectives = {},
                zoneOrSort = nil,
            }
            readObjectives(questID, i, entry.objectives)
            dest[questID] = entry
            orderOut[#orderOut + 1] = questID
        end
    end

    if sawNil and hadQuests and not trustEmpty then
        return false
    end
    if numQuests > 0 and #orderOut == 0 and hadQuests and not trustEmpty then
        return false
    end
    return true
end

---------------------------------------------------------------------------
-- Diffing
---------------------------------------------------------------------------

local function objectivesDiffer(a, b)
    local na, nb = #a, #b
    if na ~= nb then return true end
    for i = 1, na do
        local oa, ob = a[i], b[i]
        if oa.finished ~= ob.finished or oa.numFulfilled ~= ob.numFulfilled
            or oa.numRequired ~= ob.numRequired or oa.text ~= ob.text then
            return true
        end
    end
    return false
end

local function entryChanged(old, new)
    if old.isComplete ~= new.isComplete then return true end
    if old.logIndex ~= new.logIndex then return true end
    if old.title ~= new.title then return true end
    return objectivesDiffer(old.objectives, new.objectives)
end

local function fillDatabaseFields(entry)
    local DB = ns.DB
    if not (DB and DB.IsReady and DB.IsReady()) then return end
    entry.zoneOrSort = DB.GetQuestField and DB.GetQuestField(entry.questID, "zoneOrSort") or nil
end

local function scheduleRetry(reason)
    if retryScheduled or not listener.ScheduleTimer then return end
    retryScheduled = true
    listener:ScheduleTimer(function()
        retryScheduled = false
        M.Refresh(reason .. ":retry" .. retries)
    end, RETRY_SECONDS)
end

--- Refresh(reason) -> changes|nil
-- changes = { accepted = {id...}, removed = {id...}, turnedIn = {id...}, updated = {id...}, initial = bool }
-- Returns nil when the scan was rejected (zone transition); the retry is scheduled automatically.
function M.Refresh(reason)
    local fresh, freshOrder = {}, {}
    local trustEmpty = removalSignalled or retries >= MAX_RETRIES
    if not scan(fresh, freshOrder, trustEmpty) then
        retries = retries + 1
        Log.Debug("QuestLog", "ignoring suspicious quest log scan (%s, attempt %d)", tostring(reason), retries)
        scheduleRetry(tostring(reason or "refresh"))
        return nil
    end
    retries = 0
    removalSignalled = false

    local initial = not hasScanned
    hasScanned = true

    local changes = { accepted = {}, removed = {}, turnedIn = {}, updated = {}, initial = initial }
    local accepted, removed, turnedIn, updated = changes.accepted, changes.removed, changes.turnedIn, changes.updated
    local acceptedAt = acceptedStore()
    local t = now()

    -- Expire stale turn-in markers so an old turn-in never mislabels a later abandon.
    for questID, stamp in pairs(turnedInPending) do
        if (t - stamp) > TURNIN_MEMORY then turnedInPending[questID] = nil end
    end

    for questID, entry in pairs(fresh) do
        local old = current[questID]
        fillDatabaseFields(entry)
        if old then
            entry.acceptedAt = old.acceptedAt or (acceptedAt and acceptedAt[questID]) or nil
            if entryChanged(old, entry) then
                updated[#updated + 1] = questID
            end
        else
            accepted[#accepted + 1] = questID
            if acceptedAt then
                acceptedAt[questID] = acceptedAt[questID] or ((time and time()) or 0)
                entry.acceptedAt = acceptedAt[questID]
            end
        end
    end

    for questID in pairs(current) do
        if not fresh[questID] then
            if turnedInPending[questID] then
                turnedIn[#turnedIn + 1] = questID
                turnedInPending[questID] = nil
            else
                removed[#removed + 1] = questID
            end
            if acceptedAt then acceptedAt[questID] = nil end
        end
    end

    wipe(current)
    for questID, entry in pairs(fresh) do current[questID] = entry end
    wipe(logOrder)
    for i = 1, #freshOrder do logOrder[i] = freshOrder[i] end

    local changed = initial or #accepted > 0 or #removed > 0 or #turnedIn > 0 or #updated > 0
    if changed then
        Log.Debug("QuestLog", "%s: +%d -%d done%d ~%d (%d in log)", tostring(reason),
            #accepted, #removed, #turnedIn, #updated, #logOrder)
        if ns.PQ and ns.PQ.SendMessage then
            ns.PQ:SendMessage("PQ_QUESTLOG_CHANGED", changes)
        end
    end
    return changes
end

---------------------------------------------------------------------------
-- Queries
---------------------------------------------------------------------------

--- GetAll() -> { [questID] = Entry }. Shared table: never mutate it.
function M.GetAll()
    return current
end

--- GetOrder() -> { questID... } in quest-log order.
function M.GetOrder()
    return logOrder
end

function M.GetQuest(questID)
    return current[questID]
end

function M.IsOnQuest(questID)
    return current[questID] ~= nil
end

function M.IsComplete(questID)
    local entry = current[questID]
    return entry ~= nil and entry.isComplete == 1
end

function M.IsFailed(questID)
    local entry = current[questID]
    return entry ~= nil and entry.isComplete == -1
end

function M.GetObjective(questID, index)
    local entry = current[questID]
    if not entry then return nil end
    return entry.objectives[index]
end

function M.GetCount()
    return #logOrder
end

--- GetAcceptedAt(questID) -> unix time|nil (stored per character).
function M.GetAcceptedAt(questID)
    local store = acceptedStore()
    return store and store[questID] or nil
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    buildPatterns()
end

function M.Enable()
    if not listener.RegisterEvent then return end

    -- Classic signature is QUEST_ACCEPTED(logIndex, questID), modern is (questID); we only rescan.
    listener:RegisterEvent("QUEST_ACCEPTED", function() M.Refresh("QUEST_ACCEPTED") end)

    -- QUEST_TURNED_IN arrives before QUEST_REMOVED: remember it so the removal is labelled correctly.
    listener:RegisterEvent("QUEST_TURNED_IN", function(_, questID)
        if type(questID) == "number" then
            turnedInPending[questID] = now()
        end
        removalSignalled = true
    end)

    listener:RegisterEvent("QUEST_REMOVED", function()
        removalSignalled = true
        M.Refresh("QUEST_REMOVED")
    end)
    listener:RegisterEvent("QUEST_WATCH_UPDATE", function() M.Refresh("QUEST_WATCH_UPDATE") end)
    listener:RegisterEvent("UNIT_QUEST_LOG_CHANGED", function(_, unit)
        if unit == "player" then M.Refresh("UNIT_QUEST_LOG_CHANGED") end
    end)
    listener:RegisterEvent("PLAYER_ENTERING_WORLD", function() M.Refresh("PLAYER_ENTERING_WORLD") end)

    -- QUEST_LOG_UPDATE fires in bursts; one refresh per 0.3 s is plenty.
    if listener.RegisterBucketEvent then
        listener:RegisterBucketEvent("QUEST_LOG_UPDATE", BUCKET_SECONDS,
            function() M.Refresh("QUEST_LOG_UPDATE") end)
    else
        listener:RegisterEvent("QUEST_LOG_UPDATE", function() M.Refresh("QUEST_LOG_UPDATE") end)
    end

    M.Refresh("Enable")
end

--- The zoneOrSort field comes from the database, so fill it in once the database is ready.
function M.OnDataReady()
    for _, entry in pairs(current) do
        fillDatabaseFields(entry)
    end
    M.Refresh("PQ_DB_READY")
end
