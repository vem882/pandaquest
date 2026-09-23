-- Recipes/Scanner.lua: reading the open profession window (docs/11 B1).
--
-- What it collects, per window: the profession and its rank, and per recipe the spell id, the
-- produced item id and how many are made, every reagent's item id and count, and the difficulty
-- THIS character sees at THIS rank. What it never collects: the character's name, its gold, its
-- bags, its other windows -- and never a book that is not this character's own.
--
-- The refusal. IsTradeSkillLinked() true means the window is showing somebody else's recipe book
-- after a |Htrade:|h click (Blizzard_TradeSkillUI/Mists/Blizzard_TradeSkillUI.lua:234, :575). The
-- data is free to read and it is a third party's, collected without their consent, so the scan
-- stops and says so rather than skipping quietly: a silent skip teaches nobody anything and looks
-- exactly like a bug.
--
-- Politeness. The window's own filters and collapsed categories decide what GetNumTradeSkills()
-- returns, so a scan has to clear them and put them back exactly as it found them. It reads the
-- state first and refuses before it touches anything if it could not be restored; it scans once
-- per window opening; and it walks inside a ns.Thread job so the game does not stutter. The one
-- thing the player can see is the window redrawing while the filters are off, which is why the
-- scan is a fraction of a second and not a minute.
--
-- Which API, and why not the other one. C_TradeSkillUI on 5.5.4 is four functions and no recipe
-- data at all: Blizzard's own generated documentation for this build
-- (Blizzard_APIDocumentationGenerated/TradeSkillUIDocumentation.lua) declares
-- GetItemReagentQualityInfo, GetTradeSkillDisplayName, GetTradeSkillTexture and
-- IsGuildTradeSkillsEnabled, then only events -- no GetRecipeInfo, no GetAllRecipeIDs, no
-- GetRecipeSchematic. The recipe data is in the old globals, and Blizzard's own Mists window is
-- written against them. Every call below is cited to a line of that file; the ones the 5.5.4 UI
-- never calls itself are cited to Ketho's 5.5.4 global dump and said to be so.
--
--   GetNumTradeSkills()                        :202
--   GetTradeSkillLine()   -> name, rank, maxRank    :204, :466 (three returns, not four)
--   GetTradeSkillInfo(i)  -> skillName, skillType, numAvailable, isExpanded, altVerb, ...   :253
--   GetTradeSkillNumMade(i)      -> minMade, maxMade     :487
--   GetTradeSkillNumReagents(i)                          :502
--   GetTradeSkillReagentInfo(i, n)                       :511
--   IsTradeSkillLinked()                                 :234, :575
--   ExpandTradeSkillSubClass(i) / CollapseTradeSkillSubClass(i)   :449-451, :650-657
--   GetTradeSkillItemLink(i), GetTradeSkillReagentItemLink(i, n), GetTradeSkillRecipeLink(i)
--                                               GlobalAPI_classic.lua:4182, :4190, :4191
--
-- Item ids come out of links, and a link that has not arrived is asked for by name through
-- ns.Compat.GetItemInfo -- never _G.GetItemInfo, which does not exist on this client
-- (Core/Compat.lua, docs/02 B8).
local _, ns = ...
local L = ns.L

local Const, Log, Thread, Util = ns.Const, ns.Log, ns.Thread, ns.Util
local Compat = ns.Compat
local Store = ns.RecipeStore

local M = {}
ns.RecipeScanner = M

local type, pairs, pcall, tonumber, tostring = type, pairs, pcall, tonumber, tostring

local ROWS_PER_YIELD = 40       -- Thread granularity; the 8 ms frame budget is the real limit.
--- How many times the walk is allowed to expand a layer of categories before it gives up. A
-- category collapsed inside another collapsed category is not in the list at all until its parent
-- is open, so "expand everything" is a loop, not a call. MoP's lists are two deep; four rounds is
-- room for a list that is not.
local MAX_EXPAND_ROUNDS = 4
--- How many times an automatic scan re-reads a window whose list has not arrived yet.
-- TRADE_SKILL_SHOW is the server saying the window is coming, not that it is here.
local MAX_ARM_ATTEMPTS = 40

--- The word `/pq scan` hands to this module. Everything else stays the auction scanner's.
local PROFESSION_WORDS = { professions = true, profession = true, prof = true }

-- Link types GetTradeSkillRecipeLink may answer with. No file in Blizzard's 5.5.4 UI calls that
-- function, so the source cannot prove which one a given profession returns; `enchant` is a live
-- link type on this client (Blizzard_UIPanels_Game/Classic/ItemRef.lua:38) and is what the call is
-- documented to give. `spell` and `trade` are accepted as well, so a profession that answers
-- differently is read rather than dropped -- which of the three each one really uses is something
-- only the live game can settle (docs/11 A3).
local SPELL_LINK_TYPES = { enchant = true, spell = true, trade = true }

--- Every SkillLineID, from Blizzard's own constants
-- (Blizzard_FrameXMLBase/Classic/Constants.lua:14-30, WORLD_QUEST_ICONS_BY_PROFESSION). Nothing
-- here is invented and nothing is locale dependent, which is the whole point: the id is what the
-- hub joins a recipe to a profession page with, and the name is not.
local SKILL_LINES = { 129, 164, 165, 171, 182, 185, 186, 197, 202, 333, 356, 393, 755, 773, 794 }
M.SKILL_LINES = SKILL_LINES

--- The filters a scan has to be able to put back, each as the pair of calls that reads and writes
-- it. A pair with one half missing is the refusal of docs/11 B1: the scan would be able to clear
-- something it could not restore, so it does not start.
local FILTER_CALLS = {
    { "GetTradeSkillItemNameFilter", "SetTradeSkillItemNameFilter" },
    { "GetTradeSkillItemLevelFilter", "SetTradeSkillItemLevelFilter" },
    { "GetOnlyShowMakeable", "TradeSkillOnlyShowMakeable" },
    { "GetOnlyShowSkillUps", "TradeSkillOnlyShowSkillUps" },
    { "GetTradeSkillSubClassFilter", "SetTradeSkillSubClassFilter" },
    { "GetTradeSkillInvSlotFilter", "SetTradeSkillInvSlotFilter" },
}

--- The calls without which there is no scan at all.
local REQUIRED_CALLS = {
    "GetNumTradeSkills", "GetTradeSkillInfo", "GetTradeSkillLine", "IsTradeSkillLinked",
    "GetTradeSkillNumMade", "GetTradeSkillNumReagents", "GetTradeSkillReagentInfo",
    "GetTradeSkillReagentItemLink", "GetTradeSkillItemLink", "GetTradeSkillRecipeLink",
    "ExpandTradeSkillSubClass", "CollapseTradeSkillSubClass",
}

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local ctx                       -- the running scan, nil when idle
local lastResult                -- { ok, reason, entry, at } of the last scan this session
local windowOpen = false
local armed = false             -- this opening has not been scanned yet
local attempts = 0

local function unixNow()
    return (time and time()) or 0
end

local function clock()
    return (GetTime and GetTime()) or 0
end

local function setting(key)
    local PQ = ns.PQ
    local recipes = PQ and PQ.db and PQ.db.profile and PQ.db.profile.recipes
    if not recipes then return ns.DEFAULTS.profile.recipes[key] end
    return recipes[key]
end

---------------------------------------------------------------------------
-- Links
---------------------------------------------------------------------------

--- ParseSpellID(link) -> the recipe's spell id, or nil.
function M.ParseSpellID(link)
    if type(link) ~= "string" then return nil end
    local kind, id = link:match("|H(%a+):(%d+)")
    if not kind then kind, id = link:match("^(%a+):(%d+)") end
    if not kind or not SPELL_LINK_TYPES[kind] then return nil end
    id = tonumber(id)
    if not id or id <= 0 then return nil end
    return id
end

--- ParseItemID(link [, name]) -> the item id, or nil.
-- The link is nil while the client has not cached the item, which is the same wait
-- Sync/Character.lua meets on the character sheet. The name is the one the trade skill window
-- itself just printed, so the client has that item by name if it has it at all: ask
-- ns.Compat.GetItemInfo, whose second return is the link.
function M.ParseItemID(link, name)
    local id = type(link) == "string" and (tonumber(link:match("Hitem:(%d+)")) or tonumber(link:match("^item:(%d+)")))
    if id and id > 0 then return id end
    if type(name) == "string" and name ~= "" and Compat and Compat.GetItemInfo then
        local _, cached = Compat.GetItemInfo(name)
        id = type(cached) == "string" and tonumber(cached:match("Hitem:(%d+)"))
        if id and id > 0 then return id end
    end
    return nil
end

---------------------------------------------------------------------------
-- The profession behind the window
---------------------------------------------------------------------------

--- ResolveSkillLine(lineName) -> skillLineID or nil.
-- GetTradeSkillLine() gives the window's NAME in the player's language, and the hub joins on ids.
-- GetProfessionInfo's 7th return is the SkillLineID
-- (Blizzard_UIPanels_Game/Mists/SpellBookFrame.lua:586), so the player's own six profession slots
-- answer first; C_TradeSkillUI.GetTradeSkillDisplayName -- one of the four functions that
-- namespace really has on 5.5.4 -- answers second, for a window the spell book did not list.
--
-- It can legitimately fail, and then the entry has no id. Mining's window is called Smelting: its
-- name matches no profession and no display name, and guessing from the rank would be inventing a
-- fact. docs/11 C1.1 says what the hub does with a book that has a name and no id.
function M.ResolveSkillLine(lineName)
    if type(lineName) ~= "string" or lineName == "" then return nil end
    if GetProfessions and GetProfessionInfo then
        local slots = { GetProfessions() }
        for i = 1, #slots do
            local name, _, _, _, _, _, skillLine = GetProfessionInfo(slots[i])
            if name == lineName and type(skillLine) == "number" then return skillLine end
        end
    end
    local api = C_TradeSkillUI
    if type(api) == "table" and type(api.GetTradeSkillDisplayName) == "function" then
        for i = 1, #SKILL_LINES do
            local ok, name = pcall(api.GetTradeSkillDisplayName, SKILL_LINES[i])
            if ok and name == lineName then return SKILL_LINES[i] end
        end
    end
    return nil
end

---------------------------------------------------------------------------
-- Filters: read, clear, restore
---------------------------------------------------------------------------

--- MissingCall() -> name, kind. kind is "required" for a call without which there is no scan at
-- all and "filter" for the half of a filter pair whose other half is there. The two are different
-- refusals and the player is owed the right one: a reader the client does not have is not
-- something the addon is declining to put back.
-- A filter whose reader and writer are BOTH missing is not a filter this client has, so there is
-- nothing to clear and nothing to restore; one half on its own is the refusal.
function M.MissingCall()
    for i = 1, #REQUIRED_CALLS do
        if type(_G[REQUIRED_CALLS[i]]) ~= "function" then return REQUIRED_CALLS[i], "required" end
    end
    for i = 1, #FILTER_CALLS do
        local getter, setter = FILTER_CALLS[i][1], FILTER_CALLS[i][2]
        local hasGet, hasSet = type(_G[getter]) == "function", type(_G[setter]) == "function"
        if hasGet ~= hasSet then
            return (hasGet and setter or getter), "filter"
        end
    end
    return nil
end

local function selectedIndices(count, getter)
    local out = {}
    if type(getter) ~= "function" then return out end
    for i = 1, count do
        if getter(i) == 1 then out[#out + 1] = i end
    end
    return out
end

--- ReadFilters() -> the window's filter state as the getters report it.
function M.ReadFilters()
    local filters = {
        name = (GetTradeSkillItemNameFilter and GetTradeSkillItemNameFilter()) or "",
        makeable = (GetOnlyShowMakeable and GetOnlyShowMakeable()) and true or false,
        skillUps = (GetOnlyShowSkillUps and GetOnlyShowSkillUps()) and true or false,
    }
    if GetTradeSkillItemLevelFilter then
        local minLevel, maxLevel = GetTradeSkillItemLevelFilter()
        filters.minLevel, filters.maxLevel = tonumber(minLevel) or 0, tonumber(maxLevel) or 0
    else
        filters.minLevel, filters.maxLevel = 0, 0
    end
    local subClasses = GetTradeSkillSubClasses and { GetTradeSkillSubClasses() } or {}
    local invSlots = GetTradeSkillInvSlots and { GetTradeSkillInvSlots() } or {}
    filters.subClass = selectedIndices(#subClasses, GetTradeSkillSubClassFilter)
    filters.invSlot = selectedIndices(#invSlots, GetTradeSkillInvSlotFilter)
    return filters
end

local function sameList(a, b)
    if #a ~= #b then return false end
    for i = 1, #a do
        if a[i] ~= b[i] then return false end
    end
    return true
end

--- FiltersEqual(a, b) -> bool. What "restored exactly" means, in one place.
function M.FiltersEqual(a, b)
    if not a or not b then return false end
    return a.name == b.name and a.minLevel == b.minLevel and a.maxLevel == b.maxLevel
        and a.makeable == b.makeable and a.skillUps == b.skillUps
        and sameList(a.subClass, b.subClass) and sameList(a.invSlot, b.invSlot)
end

local function clearFilters()
    -- Blizzard's own menu clears one axis before it selects on the other (:110-127), and index 0
    -- is how it clears (:110, :123).
    if SetTradeSkillSubClassFilter then SetTradeSkillSubClassFilter(0) end
    if SetTradeSkillInvSlotFilter then SetTradeSkillInvSlotFilter(0) end
    if TradeSkillOnlyShowMakeable then TradeSkillOnlyShowMakeable(false) end
    if TradeSkillOnlyShowSkillUps then TradeSkillOnlyShowSkillUps(false) end
    if SetTradeSkillItemLevelFilter then SetTradeSkillItemLevelFilter(0, 0) end
    if SetTradeSkillItemNameFilter then SetTradeSkillItemNameFilter("") end
end

local function applyFilters(filters)
    if SetTradeSkillSubClassFilter then
        SetTradeSkillSubClassFilter(0)
        for i = 1, #filters.subClass do SetTradeSkillSubClassFilter(filters.subClass[i], 1, 1) end
    end
    if SetTradeSkillInvSlotFilter then
        SetTradeSkillInvSlotFilter(0)
        for i = 1, #filters.invSlot do SetTradeSkillInvSlotFilter(filters.invSlot[i], 1, 1) end
    end
    if TradeSkillOnlyShowMakeable then TradeSkillOnlyShowMakeable(filters.makeable) end
    if TradeSkillOnlyShowSkillUps then TradeSkillOnlyShowSkillUps(filters.skillUps) end
    if SetTradeSkillItemLevelFilter then SetTradeSkillItemLevelFilter(filters.minLevel, filters.maxLevel) end
    if SetTradeSkillItemNameFilter then SetTradeSkillItemNameFilter(filters.name) end
end

---------------------------------------------------------------------------
-- Categories: expand every layer, remember which ones were closed
---------------------------------------------------------------------------

local function headerRows()
    local rows = {}
    local count = tonumber(GetNumTradeSkills()) or 0
    for i = 1, count do
        local name, skillType, _, isExpanded = GetTradeSkillInfo(i)
        if name and Store.HEADER_TYPE[skillType] then
            rows[#rows + 1] = { index = i, name = name, expanded = isExpanded and true or false }
        end
        Thread.Yield()
    end
    return rows
end

--- ExpandAll(scan) -> true when categories were still closing after MAX_EXPAND_ROUNDS.
-- CollapseTradeSkillSubClass(0) and ExpandTradeSkillSubClass(0) do every category at once
-- (:650-657) and one call would show every row -- but it would also lose the state we promised to
-- give back, because a category closed inside a closed category is not in the list until its
-- parent opens. So one visible layer is expanded at a time and the next round finds what that
-- uncovered.
--
-- Descending order matters: expanding a row inserts its children immediately after it, so every
-- lower index still means what it meant and every higher one does not.
local function expandAll(scan)
    for _ = 1, MAX_EXPAND_ROUNDS do
        local found = {}
        local rows = headerRows()
        for i = 1, #rows do
            if not rows[i].expanded then found[#found + 1] = rows[i] end
        end
        if #found == 0 then return false end
        for i = #found, 1, -1 do
            -- Written into the scan before the call, not collected and handed over after the last
            -- round: this loop yields (headerRows does), so the player closing the window or a
            -- client call raising can end the job here. A scan that ends mid-expand still has to
            -- know what it opened, or the restore closes nothing, finds nothing to disagree about
            -- and reports success over a window left standing open (docs/11 B1 point 5).
            scan.collapsed[#scan.collapsed + 1] = found[i].name
            ExpandTradeSkillSubClass(found[i].index)
        end
    end
    -- Still finding closed categories after MAX_EXPAND_ROUNDS: stop opening the player's window.
    return true
end

--- CollapseAgain(names) -> true when every name was found and closed.
-- Descending again, and for a second reason as well as the first: a nested category always has a
-- higher index than the one holding it, so closing from the end shuts the child before the parent
-- hides it.
local function collapseAgain(names)
    if #names == 0 then return true end
    local want, wanted = {}, 0
    for i = 1, #names do
        if not want[names[i]] then wanted = wanted + 1 end
        want[names[i]] = true
    end
    local rows, found = {}, {}
    local count = tonumber(GetNumTradeSkills()) or 0
    for i = 1, count do
        local name, skillType = GetTradeSkillInfo(i)
        if name and Store.HEADER_TYPE[skillType] and want[name] then
            rows[#rows + 1] = i
            found[name] = true
        end
    end
    for i = #rows, 1, -1 do
        CollapseTradeSkillSubClass(rows[i])
    end
    local seen = 0
    for _ in pairs(found) do seen = seen + 1 end
    return seen == wanted
end

---------------------------------------------------------------------------
-- The walk
---------------------------------------------------------------------------

--- ReadRecipe(scan, index, skillName, skillType, altVerb) -> encoded string or nil.
local function readRecipe(scan, index, skillName, skillType, altVerb)
    local difficulty = Store.DIFFICULTY[skillType]
    if not difficulty then
        -- A difficulty we cannot name is not a sample. Nodes/Professions.lua's rule for a node it
        -- cannot classify, applied to a row: an "unknown" would poison the hub's aggregate.
        scan.skipped = scan.skipped + 1
        return nil
    end
    local spellID = M.ParseSpellID(GetTradeSkillRecipeLink(index))
    if not spellID then
        -- Without the spell id the row is a name in one language, and a name is exactly what this
        -- project refuses to key on.
        scan.skipped = scan.skipped + 1
        return nil
    end
    if scan.seen[spellID] then
        -- One spellID appears once in a book (docs/11 C1.1). A second row for the same recipe is
        -- the client repeating itself, not a second sample of anything.
        scan.skipped = scan.skipped + 1
        return nil
    end
    local itemID = M.ParseItemID(GetTradeSkillItemLink(index), skillName)
    if not itemID and not altVerb then
        -- A missing product and an enchant look identical from the link alone, and altVerb is what
        -- tells them apart: Blizzard's own window shows Create and a count box when it is nil and
        -- the verb ("Enchant") when it is not (Blizzard_TradeSkillUI/Mists/Blizzard_TradeSkillUI
        -- .lua:586-596). Recording a craft whose item had not loaded as "produces nothing" would be
        -- the missing-reagent mistake with a different name, so the row waits for the next read.
        scan.incomplete = scan.incomplete + 1
        return nil
    end
    local minMade, maxMade = GetTradeSkillNumMade(index)
    minMade = Store.Amount(minMade, 1)
    maxMade = Store.Amount(maxMade, minMade)
    if maxMade < minMade then maxMade = minMade end
    if maxMade > Store.MAX_AMOUNT then
        -- Out of the range the contract's grammar can carry (docs/11 C1.1). Dropped rather than
        -- clamped, for the reason the missing reagent below is dropped: a number the client made
        -- up, written down as if it were the recipe, is a crafting cost that is wrong and looks
        -- right -- and one bad row is the whole book rejected at ingest.
        scan.skipped = scan.skipped + 1
        return nil
    end

    local numReagents = tonumber(GetTradeSkillNumReagents(index)) or 0
    if numReagents > Store.LIMITS.maxReagents then
        -- MAX_TRADE_SKILL_REAGENTS is 8 (Blizzard_TradeSkillUI/Mists/Blizzard_TradeSkillUI.lua:2)
        -- and the window draws no more, so this only ever fires on a client answering nonsense --
        -- which is exactly when keeping the first eight of nine and calling it the recipe is worst.
        scan.skipped = scan.skipped + 1
        return nil
    end
    local reagents, seen = {}, {}
    for n = 1, numReagents do
        -- Return 4 is playerReagentCount: how many of it are in the player's bags right now. It is
        -- dropped at the call rather than at ingest, because docs/07 B2 puts minimisation where
        -- the data is created and not where it is used.
        local reagentName, _, reagentCount = GetTradeSkillReagentInfo(index, n)
        local reagentID = M.ParseItemID(GetTradeSkillReagentItemLink(index, n), reagentName)
        if not reagentID then
            -- A reagent list with one line missing is a crafting cost that is wrong and looks
            -- right, which is worse than no recipe at all. The row is left out and counted, and
            -- the player is told they can read the window again once the client has the item.
            scan.incomplete = scan.incomplete + 1
            return nil
        end
        local amount = Store.Amount(reagentCount, 1)
        if seen[reagentID] or amount > Store.MAX_AMOUNT then
            -- One reagent listed twice, or wanted in a quantity the grammar has no room for. No
            -- recipe in the game is either, so the client is the thing that is wrong, and a wrong
            -- crafting cost is the one thing this walk refuses to write down.
            scan.skipped = scan.skipped + 1
            return nil
        end
        seen[reagentID] = true
        reagents[n] = { reagentID, amount }
        Thread.Yield()
    end
    -- Written down only now: a row that failed further down is not one this book has already read.
    scan.seen[spellID] = true
    return Store.EncodeRecipe({ spellID = spellID, itemID = itemID, minMade = minMade,
                                maxMade = maxMade, difficulty = difficulty, reagents = reagents })
end

local function walk(scan)
    local count = tonumber(GetNumTradeSkills()) or 0
    local limit = Store.LIMITS.maxRecipes
    local rows = scan.rows
    for i = 1, count do
        -- Returns 3 and 4 are numAvailable and isExpanded: how many the player could make out of
        -- their own bags, and how the window happens to be drawn. Neither is a fact about the
        -- recipe, so both are discarded at the call. Return 5, altVerb, is: it is the only thing
        -- that says a recipe produces no item rather than one the client has not loaded.
        local skillName, skillType, _, _, altVerb = GetTradeSkillInfo(i)
        if not skillName then
            -- GetNumTradeSkills() counted the row before GetTradeSkillInfo had a name for it: the
            -- half-arrived list TRADE_SKILL_SHOW warns about, which Blizzard's own window guards
            -- for the same way (Blizzard_TradeSkillUI/Mists/Blizzard_TradeSkillUI.lua:441-444).
            -- Counted apart from skipped, because this is the one failure worth reading again --
            -- the list is coming, and nothing about the row was wrong.
            scan.unnamed = scan.unnamed + 1
        elseif not Store.HEADER_TYPE[skillType] then
            if #rows >= limit then
                scan.truncated = true
                break
            end
            local encoded = readRecipe(scan, i, skillName, skillType, altVerb)
            if encoded then rows[#rows + 1] = encoded end
        end
        Thread.Yield()
    end
end

local function buildEntry(scan)
    local name, realm, faction = Store.CurrentCharacter()
    local lineName, rank, maxRank = GetTradeSkillLine()
    local version, build
    if GetBuildInfo then version, build = GetBuildInfo() end
    local entry = {
        id = Store.ScanId(realm, scan.skillLine, scan.profession, scan.startedAt),
        realm = realm, faction = faction,
        -- Local only. The companion does not send it and the hub has no field for it
        -- (docs/11 C1.2); it is here because two characters of one account own two different books
        -- of the same profession, and without it the second would overwrite the first.
        character = name,
        profession = scan.profession, skillLine = scan.skillLine,
        rank = tonumber(rank) or scan.rank or 0, maxRank = tonumber(maxRank) or scan.maxRank or 0,
        scannedAt = scan.startedAt,
        addonVersion = Const.VERSION,
        clientBuild = version and (build and (version .. "." .. build) or version) or nil,
        -- A row whose name had not arrived counts as incomplete, because that is what incomplete
        -- means to whoever reads it: a row the next read of this window will have. skipped is the
        -- other kind -- a row reading it again will not help with.
        recipes = #scan.rows, skipped = scan.skipped,
        incomplete = scan.incomplete + scan.unnamed,
        truncated = scan.truncated and true or false,
        r = scan.rows,
    }
    if lineName and lineName ~= "" then entry.profession = lineName end
    Store.SetProfession(entry)
    return entry
end

---------------------------------------------------------------------------
-- Reporting
---------------------------------------------------------------------------

-- Looked up when printed, not when the file loads: /pq lang rewrites ns.L in place after load.
local function reasonText(reason)
    if reason == "running" then return L["A profession scan is already running."] end
    if reason == "closed" then return L["Open a profession window first, then type /pq scan professions."] end
    if reason == "unsupported" then return L["This client does not offer the recipe list PandaQuest reads."] end
    if reason == "linked" then return L["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] end
    if reason == "empty" then return L["This profession window lists no recipes."] end
    if reason == "nothing" then return L["Nothing was saved: not one recipe in this window could be read whole."] end
    -- "pending" deliberately has no text: the list had not arrived, the scan is armed again, and a
    -- line per attempt would be chat about something the player cannot do anything about.
    if reason == "windowClosed" then return L["Profession scan cancelled: the window was closed."] end
    if reason == "stopped" then return L["Profession scan stopped. Nothing was saved."] end
    return nil
end

local function report(reason)
    local text = reasonText(reason)
    if text then Log.Print("%s", text) end
end

---------------------------------------------------------------------------
-- Restoring, which happens whatever became of the scan
---------------------------------------------------------------------------

-- The restore runs in one frame on purpose, where the walk does not. A walk spread over frames
-- costs the player nothing; a restore spread over frames is a window that is half the player's and
-- half ours for as long as it takes, and if anything goes wrong in between it stays that way.
local function restore(scan)
    if not scan.touched then return true end
    local ok, err = pcall(function()
        -- Categories first and filters second, which is the reading order of docs/11 B1 point 2
        -- run backwards. A category is found by name in 1..GetNumTradeSkills(), and a filter
        -- decides what is in that list: with the player's filter already back on, a category it
        -- hides is not there to be closed, so it would be left open and the scan would say so on
        -- every read of every filtered window. What can only be read with the filters off can only
        -- be written with the filters off.
        scan.collapseOk = collapseAgain(scan.collapsed)
        applyFilters(scan.filters)
        scan.filtersOk = M.FiltersEqual(scan.filters, M.ReadFilters())
    end)
    if not ok then
        Log.Error("RecipeScanner", "restoring the profession window failed: %s", tostring(err))
        return false
    end
    return scan.filtersOk and scan.collapseOk
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

--- CanScan() -> ok, reason. reason is "running", "closed", "unsupported", "linked" or the name of
-- the missing call when the window's state could not be put back.
function M.CanScan()
    if ctx then return false, "running" end
    if not windowOpen then return false, "closed" end
    local missing, kind = M.MissingCall()
    if missing then
        if kind == "required" then return false, "unsupported" end
        return false, "restore", missing
    end
    -- Before anything at all is touched: this is the one refusal that is about somebody else.
    if IsTradeSkillLinked() then return false, "linked" end
    return true
end

local function finish(scan, ok, reason)
    if ctx ~= scan then return end
    local restored = restore(scan)
    ctx = nil
    lastResult = { ok = ok, reason = reason, entry = scan.entry, at = unixNow() }
    -- A list that had not arrived is not a refusal and not a scan either, so the opening goes back
    -- on the arm and the next TRADE_SKILL_UPDATE reads it. tryAutomatic's own attempt ceiling is
    -- what stops this being a loop; without the re-arm, "once per opening" would spend the one
    -- read on a window that had nothing in it yet.
    if reason == "pending" and windowOpen then armed = true end
    -- A window the player already closed has nothing left to put back, and saying so would be
    -- blaming the addon for the player's own click.
    if not restored and windowOpen then
        Log.Print("%s", L["PandaQuest could not put your profession window back exactly as you left it."])
    end
    if ok then
        local entry = scan.entry
        Log.Print(L["Profession scan finished: %s %d/%d, %d recipes in %s."], tostring(entry.profession),
            entry.rank or 0, entry.maxRank or 0, entry.recipes or 0,
            Util.FormatTime(clock() - scan.startedClock))
    else
        report(reason)
    end
    -- Said for a scan that was stored and for one that was not: it is the same fact about the
    -- client either way, and it is the one the player can do something about. Not said for
    -- "pending", where nothing was read and the addon is going to try again by itself.
    local waiting = scan.incomplete + scan.unnamed
    if reason ~= "pending" and waiting > 0 then
        Log.Print(L["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."],
            waiting)
    end
    if not ok then return end
    local entry = scan.entry
    if entry.truncated then
        Log.Print(L["The scan stopped at %d recipes to keep the saved file small."], entry.recipes or 0)
    end
end

--- Start() -> ok, reason. Reads the open window once.
function M.Start()
    local ok, reason, detail = M.CanScan()
    if not ok then
        if reason == "restore" then
            Log.Print(L["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."],
                tostring(detail))
        else
            report(reason)
        end
        return false, reason
    end

    local lineName, rank, maxRank = GetTradeSkillLine()
    local scan = {
        startedAt = unixNow(), startedClock = clock(),
        profession = (lineName ~= "" and lineName) or "Unknown",
        rank = tonumber(rank) or 0, maxRank = tonumber(maxRank) or 0,
        rows = {}, collapsed = {}, seen = {},
        skipped = 0, incomplete = 0, unnamed = 0, truncated = false,
        filtersOk = true, collapseOk = true,
    }
    scan.skillLine = M.ResolveSkillLine(lineName)
    -- Read the state before clearing it, and clear it before looking at the categories: a name
    -- filter hides whole categories, so what is collapsed can only be read honestly once the
    -- filters are off.
    scan.filters = M.ReadFilters()
    ctx = scan
    armed = false
    scan.touched = true
    clearFilters()

    scan.handle = Thread.Run(function()
        local incomplete = expandAll(scan)
        if incomplete then
            Log.Warn("RecipeScanner", "categories were still collapsing after %d rounds", MAX_EXPAND_ROUNDS)
        end
        local count = tonumber(GetNumTradeSkills()) or 0
        if count == 0 then return "empty" end
        walk(scan)
        if #scan.rows == 0 then
            -- Not one row survived. Stored, that would be a profession with no recipes -- a claim
            -- about the game rather than about this read, and the auction scanner refuses an empty
            -- listing for the same reason (docs/08 B1). The rule holds however the rows were lost,
            -- counted failures or not: a list whose names have not arrived produces no recipe and
            -- no failure either, and is exactly the case that used to be stored as a real book.
            if scan.unnamed > 0 and (scan.skipped + scan.incomplete) == 0 then
                -- Nothing was wrong with the window; it was read too early. Not a refusal and not
                -- worth a line of chat, so it says nothing and goes back on the arm.
                return "pending"
            end
            -- The one client behaviour that would fail every row at once is a reagent read that
            -- needs its recipe selected first, which is docs/11 A3's open question.
            return "nothing"
        end
        scan.entry = buildEntry(scan)
        return nil
    end, {
        name = "RecipeScan",
        ticksPerYield = ROWS_PER_YIELD,
        -- The window cannot be opened in combat, but a scan can be running when combat starts, and
        -- a paused job would leave the player's filters cleared for the length of the fight. The
        -- walk is a fraction of a second: finishing it is politer than pausing it.
        pauseInCombat = false,
        onDone = function(jobOk, result)
            if ctx ~= scan then return end
            if not jobOk then
                -- Thread reports a cancelled job the same way it reports a failed one, and only
                -- the reason Stop() wrote down tells a job that was ended on purpose -- the window
                -- was closed, the player said stop -- from one that broke.
                if scan.stopReason then
                    finish(scan, false, scan.stopReason)
                else
                    finish(scan, false, "error")
                    Log.Error("RecipeScanner", "profession scan failed: %s", tostring(result))
                end
                return
            end
            if result then
                finish(scan, false, result)
                return
            end
            finish(scan, true)
        end,
    })
    return true
end

--- Stop(reason) -> bool. Cancels the running scan; the restore happens either way, because the
-- player's window is not ours to leave half open.
function M.Stop(reason)
    local scan = ctx
    if not scan then return false end
    scan.stopReason = reason or "stopped"
    if scan.handle and Thread.IsRunning(scan.handle) then
        Thread.Cancel(scan.handle)
    end
    if ctx == scan then
        finish(scan, false, scan.stopReason)
    end
    return true
end

function M.IsScanning()
    return ctx ~= nil
end

--- GetLastResult() -> { ok, reason, entry, at } of the last scan this session, or nil.
function M.GetLastResult()
    return lastResult
end

--- GetLastScan() -> the newest stored book of this character, or nil.
function M.GetLastScan()
    local name, realm = Store.CurrentCharacter()
    return Store.NewestFor(name, realm)
end

function M.IsWindowOpen()
    return windowOpen
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------

-- TRADE_SKILL_SHOW is the server saying the list is coming, not that it is here
-- (Blizzard_UIParent/Mists/UIParent.lua:980-982 only loads the window on it), so the opening is
-- armed and every list update is another chance to read it. `armed` is also what "once per window
-- opening" means: the first successful start clears it and only a new opening sets it again.
local function tryAutomatic()
    if ctx or not armed or not windowOpen then return end
    if not setting("scanOnOpen") then return end
    attempts = attempts + 1
    if attempts > MAX_ARM_ATTEMPTS then
        armed = false
        return
    end
    if IsTradeSkillLinked and IsTradeSkillLinked() then
        -- Said once per opening, not once per list update.
        armed = false
        report("linked")
        return
    end
    if type(GetNumTradeSkills) ~= "function" or (tonumber(GetNumTradeSkills()) or 0) == 0 then
        return
    end
    if not M.Start() then
        -- Every refusal reachable here -- a filter that cannot be put back, a call this client does
        -- not have -- is true for as long as this window is open, and Blizzard's own window fires
        -- TRADE_SKILL_UPDATE freely while it is (Blizzard_TradeSkillUI/Mists/
        -- Blizzard_TradeSkillUI.lua:176-181), every filter setter and every expand among them. Said
        -- once per opening like the linked-book refusal next to it, not forty times.
        armed = false
    end
end

local function onShow()
    windowOpen = true
    armed = true
    attempts = 0
    tryAutomatic()
end

local function onUpdate()
    if not windowOpen then return end
    tryAutomatic()
end

local function onClose()
    windowOpen = false
    armed = false
    attempts = 0
    if ctx then M.Stop("windowClosed") end
end

---------------------------------------------------------------------------
-- Commands
---------------------------------------------------------------------------

local function statusLines()
    local running = M.IsScanning()
    if running then
        Log.Print("%s", L["A profession scan is already running."])
    end
    local last = M.GetLastScan()
    if last then
        Log.Print(L["Last scan of %s (%d/%d): %d recipes, %s ago."], tostring(last.profession),
            last.rank or 0, last.maxRank or 0, last.recipes or 0,
            Util.FormatTime(unixNow() - (last.scannedAt or 0)))
    elseif not running then
        Log.Print("%s", L["No profession has been scanned on this character yet."])
    end
end

--- ChatCommand(arg): what is left of `/pq scan professions [status]`.
function M.ChatCommand(arg)
    arg = tostring(arg or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")
    -- The auction scanner's own word, and it has to mean the same thing here: a player who learned
    -- `stop` from `/pq scan` and typed it at `/pq scan professions` was starting a scan instead.
    if arg == "stop" then
        if not M.Stop("stopped") then Log.Print("%s", L["No scan is running."]) end
        return
    end
    if arg == "status" then
        statusLines()
        return
    end
    -- A scan the player asked for is not the addon deciding to scan, so it is allowed even when
    -- the automatic one has already read this opening -- which is how a scan cut short by items
    -- the client had not loaded gets finished.
    M.Start()
end

---------------------------------------------------------------------------
-- Module lifecycle
---------------------------------------------------------------------------

function M.Init()
    local PQ = ns.PQ
    if not (PQ and PQ.commands) then return end
    -- `/pq scan` is the auction scanner's command (docs/08 B1). Rather than move it, this module
    -- takes the one word it owns off the front and hands everything else straight back, so
    -- /pq scan, /pq scan stop and /pq scan status still reach the auction house unchanged.
    local previous = PQ.commands.scan
    PQ.commands.scan = function(rest)
        local text = tostring(rest or "")
        local word, tail = text:match("^(%S*)%s*(.-)$")
        if word and PROFESSION_WORDS[word:lower()] then
            return M.ChatCommand(tail)
        end
        if previous then return previous(rest) end
        Log.Print("%s", L["Open a profession window first, then type /pq scan professions."])
    end
end

function M.Enable()
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if not AceEvent then return end
    AceEvent:Embed(M)
    M:RegisterEvent("TRADE_SKILL_SHOW", onShow)
    M:RegisterEvent("TRADE_SKILL_UPDATE", onUpdate)
    M:RegisterEvent("TRADE_SKILL_LIST_UPDATE", onUpdate)
    M:RegisterEvent("TRADE_SKILL_CLOSE", onClose)
end
