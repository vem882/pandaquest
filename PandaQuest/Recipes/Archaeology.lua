-- Recipes/Archaeology.lua: reading the archaeology window (docs/11 B5).
--
-- What it collects, per reading: the character's archaeology rank, and per race the keystone item
-- id, the localised race name, the three fragment counts the client reports, and the artifacts that
-- race lists. What it never collects: anything belonging to another character or another account --
-- and there is nothing else to collect, because unlike the trade skill window archaeology has no
-- "somebody else's book" to open. IsTradeSkillLinked() has no counterpart here (there is no link
-- type that opens another player's archaeology), so the recipe scanner's loudest refusal simply has
-- nothing to refuse; that is said out loud rather than left as a silence, because a reader
-- comparing the two modules is owed the reason one of them is shorter.
--
-- It is also shorter for a second reason: there is nothing to put back. The archaeology window on
-- 5.5.4 has no filter API and no collapsible categories -- the whole politeness apparatus of
-- Recipes/Scanner.lua (read the state, clear it, restore it, refuse if it could not be restored)
-- exists because GetNumTradeSkills() answers differently depending on how the player left their
-- window, and GetNumArchaeologyRaces() does not. Nothing here touches the player's UI at all.
--
-- ARCHAEOLOGY_TOGGLE fires on OPEN **and** on CLOSE. It is one event with no payload at all
-- (Blizzard_APIDocumentationGenerated/ResearchInfoDocumentation.lua:62 declares it with no Payload
-- block) and Blizzard's own handler treats it as a toggle: show the frame if it is hidden, hide it
-- if it is shown (Blizzard_UIParent/Mists/UIParent.lua:1139-1145). So this module cannot know which
-- direction it was, and deliberately does not try: it snapshots on both.
--
-- That is a choice, not an accident, and the reason is that the close-side reading is the better
-- one. A player opens the window, sockets a keystone, solves an artifact and closes it; the
-- open-side snapshot is of the state before all of that and the close-side snapshot is of the state
-- after. Taking only the open-side one would store a reading that was already stale when it was
-- written. Taking both costs one extra pass over a bounded list and leaves the newest reading in
-- the file, which is what "replaced, never merged" means (Recipes/Store.lua). ARCHAEOLOGY_CLOSED
-- fires as well on a close and is deliberately NOT registered: it would be a second snapshot of the
-- same instant, and the debounce below would drop it anyway.
--
-- Which API, and why not the other one. Everything below is on the list this client really has,
-- checked in Blizzard's own 5.5.4 tree and in Ketho's global dump:
--
--   GetNumArchaeologyRaces()           -> numRaces
--   GetArchaeologyRaceInfo(raceIndex)  -> raceName, raceTexture, raceItemID,
--                                         numFragmentsCollected, numFragmentsRequired, maxFragments
--   GetNumArtifactsByRace(raceIndex)   -> numProjects
--   GetArtifactInfoByRace(raceIndex, artifactIndex)
--                                      -> name, description, rarity, icon, hoverDescription,
--                                         keystoneCount, bgTexture, firstCompletionTime,
--                                         completionCount
--   IsArtifactCompletionHistoryAvailable() -> bool
--
-- GetNumArchaeologySites, GetArchaeologySiteInfo, IsInResearchSite, C_ArchaeologyUI and
-- RequestArtifactCompletionHistory are **not** on this client and are never called. The last of
-- those is the one that costs us something: when the completion history has not arrived,
-- GetArtifactInfoByRace's last two returns are not trustworthy and nothing can ask the server for
-- them, so this module leaves `completed` and `firstAt` out of every artifact and records
-- `historyAvailable = false` beside them. A zero written where a measurement is missing is the one
-- mistake this project does not make.
--
-- The artifact has no id. GetArtifactInfoByRace returns a NAME, in the player's language, and no
-- item id -- there is no GetArtifactItemID on any client. The name is therefore the only handle an
-- artifact has, it cannot be joined across locales, and that is recorded as a limitation rather
-- than papered over with a lookup table this repository has not measured. The RACE does have a
-- locale-independent id: its keystone item (raceItemID), which is what a reader should key on.
local _, ns = ...
local L = ns.L

local Const, Log, Util = ns.Const, ns.Log, ns.Util
local Store = ns.RecipeStore

local M = {}
ns.Archaeology = M

local type, pcall, tonumber, tostring = type, pcall, tonumber, tostring

--- The word `/pq scan` hands to this module.
local COMMAND_WORDS = { archaeology = true, arch = true, archeology = true, dig = true }

--- Two ARCHAEOLOGY_TOGGLEs closer together than this are one snapshot. The client sends exactly
-- one per click, so this is not a throttle on the player -- it is a guard against a second event
-- for the same instant (a UI that toggles twice, an addon that fires it) writing a second entry
-- with the same numbers and a newer timestamp.
local MIN_INTERVAL = 0.5

--- The calls without which there is no snapshot at all.
local REQUIRED_CALLS = { "GetNumArchaeologyRaces", "GetArchaeologyRaceInfo" }

local lastResult                -- { ok, reason, entry, at } of the last snapshot this session
local lastAt = 0                -- GetTime() of the last snapshot, for MIN_INTERVAL

local function unixNow()
    return (time and time()) or 0
end

local function clock()
    return (GetTime and GetTime()) or 0
end

local function setting(key)
    local PQ = ns.PQ
    local archaeology = PQ and PQ.db and PQ.db.profile and PQ.db.profile.archaeology
    if not archaeology then return ns.DEFAULTS.profile.archaeology[key] end
    return archaeology[key]
end

---------------------------------------------------------------------------
-- Reading one race
---------------------------------------------------------------------------

--- ReadArtifacts(raceIndex, history) -> array, truncated.
-- `history` is IsArtifactCompletionHistoryAvailable(), read once for the whole snapshot rather than
-- per artifact: it is one fact about the connection, and asking it thirty times would invite thirty
-- different answers into one reading.
local function readArtifacts(raceIndex, history)
    if type(GetNumArtifactsByRace) ~= "function" or type(GetArtifactInfoByRace) ~= "function" then
        -- Not "this race has no artifacts": this client cannot be asked. An empty list would be a
        -- claim about the game made out of a missing function.
        return nil, false
    end
    local okCount, count = pcall(GetNumArtifactsByRace, raceIndex)
    if not okCount then return nil, false end
    count = tonumber(count) or 0
    local truncated = false
    if count > Store.LIMITS.maxArtifacts then
        count = Store.LIMITS.maxArtifacts
        truncated = true
    end
    local out = {}
    for i = 1, count do
        local ok, name, _, rarity, _, _, keystones, _, firstAt, completed =
            pcall(GetArtifactInfoByRace, raceIndex, i)
        if ok and type(name) == "string" and name ~= "" then
            local artifact = {
                name = name,
                rarity = tonumber(rarity),
                keystones = tonumber(keystones),
            }
            if history then
                -- Only when the server has sent the history. Without it these two returns are not a
                -- measurement of anything, and 0 would read as "never completed".
                artifact.completed = tonumber(completed)
                artifact.firstAt = tonumber(firstAt)
            end
            out[#out + 1] = artifact
        end
    end
    return out, truncated
end

--- ReadRaces(snapshot) -> array of races.
local function readRaces(snapshot, history)
    local okCount, count = pcall(GetNumArchaeologyRaces)
    if not okCount then return {} end
    count = tonumber(count) or 0
    if count > Store.LIMITS.maxRaces then
        count = Store.LIMITS.maxRaces
        snapshot.truncated = true
    end
    local races = {}
    for i = 1, count do
        local ok, name, _, itemID, fragments, required, maxFragments = pcall(GetArchaeologyRaceInfo, i)
        if not ok or type(name) ~= "string" or name == "" then
            -- The client counted a race it then had no name for. Counted rather than invented: a
            -- race with no name and no keystone is not a row, it is a gap, and saying how many gaps
            -- there were is the only honest thing to write about it.
            snapshot.skipped = snapshot.skipped + 1
        else
            local race = {
                keystone = tonumber(itemID),
                name = name,
                fragments = tonumber(fragments),
                required = tonumber(required),
                max = tonumber(maxFragments),
            }
            if not race.keystone then
                -- The keystone item id is the only locale-independent handle a race has. Without it
                -- the row is a name in one language; it is still written down, because the player's
                -- own fragments are worth keeping, but it is counted so that a reader joining on
                -- ids knows how many rows it cannot join.
                snapshot.unkeyed = snapshot.unkeyed + 1
            end
            local artifacts, truncated = readArtifacts(i, history)
            race.artifacts = artifacts
            if truncated then snapshot.truncated = true end
            races[#races + 1] = race
        end
    end
    return races
end

---------------------------------------------------------------------------
-- The snapshot
---------------------------------------------------------------------------

--- CanSnapshot() -> ok, reason. reason is "unsupported" when the client does not have the calls.
function M.CanSnapshot()
    for i = 1, #REQUIRED_CALLS do
        if type(_G[REQUIRED_CALLS[i]]) ~= "function" then return false, "unsupported" end
    end
    return true
end

--- Archaeology.Snapshot() -> entry|nil, reason.
-- reason is "unsupported" (this client has no archaeology API), "empty" (it has one and this
-- character has no races in it) or nil on success. It runs in one frame on purpose, where the
-- recipe walk does not: this is a bounded read of a few dozen numbers with no link parsing and no
-- player UI to disturb, and a job spread over frames would be more machinery than the work.
function M.Snapshot()
    local ok, reason = M.CanSnapshot()
    if not ok then
        lastResult = { ok = false, reason = reason, at = unixNow() }
        return nil, reason
    end

    local history = false
    if type(IsArtifactCompletionHistoryAvailable) == "function" then
        local okHistory, available = pcall(IsArtifactCompletionHistoryAvailable)
        history = okHistory and available and true or false
    end

    local snapshot = { skipped = 0, unkeyed = 0, truncated = false }
    local races = readRaces(snapshot, history)
    if #races == 0 then
        -- Not one race could be read. Stored, that would be "this character has no archaeology",
        -- which is a claim about the character rather than about this reading -- the same refusal
        -- Recipes/Scanner.lua makes for a book whose every row failed, and the auction scanner for
        -- an empty listing (docs/08 B1).
        lastResult = { ok = false, reason = "empty", at = unixNow() }
        return nil, "empty"
    end

    local name, realm, faction = Store.CurrentCharacter()
    local scannedAt = unixNow()
    local version, build
    if GetBuildInfo then version, build = GetBuildInfo() end
    -- The rank comes from ns.Professions.GetSkillRank, which is the addon's one answer to "what
    -- rank is this character at profession X": it reads GetProfessionInfo's locale-independent
    -- SkillLineID (794), falls back to the skill lines by name, caches the answer and drops the
    -- cache on SKILL_LINES_CHANGED. A second implementation here would be a second answer.
    local rank, _, maxRank
    if ns.Professions and ns.Professions.GetSkillRank then
        rank, _, maxRank = ns.Professions.GetSkillRank("archaeology")
    end
    local entry = {
        id = Store.ScanId(realm, Store.ARCHAEOLOGY_SKILL_LINE, "Archaeology", scannedAt),
        realm = realm, faction = faction,
        -- Local only, for the recipe book's reason (docs/11 C1.2): two characters of one account
        -- dig separately, and without the name the second would overwrite the first.
        character = name,
        skillLine = Store.ARCHAEOLOGY_SKILL_LINE,
        -- Absent, not zero, when the client did not answer. A character who has never learned
        -- archaeology and one sitting at rank 0 are different facts.
        rank = rank, maxRank = maxRank,
        scannedAt = scannedAt,
        addonVersion = Const.VERSION,
        clientBuild = version and (build and (version .. "." .. build) or version) or nil,
        -- False means every artifact below is missing `completed` and `firstAt`, and says why.
        historyAvailable = history,
        races = races,
        skipped = snapshot.skipped,
        unkeyed = snapshot.unkeyed,
        truncated = snapshot.truncated,
    }
    Store.SetArchaeology(entry)
    lastResult = { ok = true, entry = entry, at = scannedAt }
    return entry
end

--- GetLastResult() -> { ok, reason, entry, at } of the last snapshot this session, or nil.
function M.GetLastResult()
    return lastResult
end

--- GetLast() -> this character's stored snapshot, or nil.
function M.GetLast()
    local name, realm = Store.CurrentCharacter()
    return Store.GetArchaeology(name, realm)
end

--- CountArtifacts(entry) -> how many artifact rows the entry carries, across every race. The one
-- number a player asks for after a snapshot, and the one a test can check without walking the
-- table by hand.
function M.CountArtifacts(entry)
    if type(entry) ~= "table" or type(entry.races) ~= "table" then return 0 end
    local total = 0
    for i = 1, #entry.races do
        local artifacts = entry.races[i].artifacts
        if type(artifacts) == "table" then total = total + #artifacts end
    end
    return total
end

---------------------------------------------------------------------------
-- Reporting
---------------------------------------------------------------------------

local function reasonText(reason)
    if reason == "unsupported" then return L["This client does not offer the archaeology data PandaQuest reads."] end
    if reason == "empty" then return L["This character has no archaeology races to read yet."] end
    return nil
end

local function report(reason)
    local text = reasonText(reason)
    if text then Log.Print("%s", text) end
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------

--- OnToggle(): the automatic snapshot. Fires on the window opening and on it closing, which is one
-- event either way; see the file header for why both are taken.
local function onToggle()
    if not setting("snapshotOnOpen") then return end
    local now = clock()
    if lastAt > 0 and (now - lastAt) < MIN_INTERVAL then return end
    lastAt = now
    local entry = M.Snapshot()
    if not entry then
        -- Said out loud only for a client that cannot be read at all, and only once per session:
        -- "empty" is what a character who has never picked up archaeology sees every time they open
        -- somebody else's dig, and a line of chat about it would be noise about nothing they can do.
        local result = lastResult
        if result and result.reason == "unsupported" and not M.warnedUnsupported then
            M.warnedUnsupported = true
            report("unsupported")
        end
    end
end
M.OnToggle = onToggle

---------------------------------------------------------------------------
-- Commands
---------------------------------------------------------------------------

local function statusLines()
    local entry = M.GetLast()
    if not entry then
        Log.Print("%s", L["No archaeology has been read on this character yet."])
        return
    end
    Log.Print(L["Archaeology %d/%d: %d races, %d artifacts, read %s ago."],
        entry.rank or 0, entry.maxRank or 0, #(entry.races or {}), M.CountArtifacts(entry),
        Util.FormatTime(unixNow() - (entry.scannedAt or 0)))
    if entry.historyAvailable == false then
        Log.Print("%s", L["The server has not sent your artifact history, so completion counts were left out."])
    end
end

--- ChatCommand(arg): what is left of `/pq scan archaeology [status]`.
function M.ChatCommand(arg)
    arg = tostring(arg or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")
    if arg == "status" then
        statusLines()
        return
    end
    local entry, reason = M.Snapshot()
    if not entry then
        report(reason)
        return
    end
    Log.Print(L["Archaeology read: %d races, %d artifacts."], #(entry.races or {}), M.CountArtifacts(entry))
    if entry.historyAvailable == false then
        Log.Print("%s", L["The server has not sent your artifact history, so completion counts were left out."])
    end
end

---------------------------------------------------------------------------
-- Module lifecycle
---------------------------------------------------------------------------

function M.Init()
    local PQ = ns.PQ
    if not (PQ and PQ.commands) then return end
    -- The same relay Recipes/Scanner.lua builds on the auction scanner's /pq scan: take the one
    -- word this module owns off the front and hand everything else straight back, so /pq scan,
    -- /pq scan professions and their sub-words all still reach their owners. This module is after
    -- RecipeScanner in ns.MODULE_ORDER, so `previous` here is the recipe scanner's wrapper.
    local previous = PQ.commands.scan
    PQ.commands.scan = function(rest)
        local text = tostring(rest or "")
        local word, tail = text:match("^(%S*)%s*(.-)$")
        if word and COMMAND_WORDS[word:lower()] then
            return M.ChatCommand(tail)
        end
        if previous then return previous(rest) end
    end
end

function M.Enable()
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if not AceEvent then return end
    AceEvent:Embed(M)
    -- One event, both directions, and ARCHAEOLOGY_CLOSED deliberately not registered beside it.
    M:RegisterEvent("ARCHAEOLOGY_TOGGLE", onToggle)
end
