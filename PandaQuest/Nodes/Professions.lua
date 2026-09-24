-- Nodes/Professions.lua: mines, herbs, fishing pools, chests and rares on the map (docs/10 D).
--
-- Three jobs, in the order the document puts them:
--
--   D1  Draw them. A node is drawn only where one was actually taken: by this character (the
--       saved record D3 makes) or by somebody else (the hub's clustered sightings, which exist
--       only because a player gathered there). ns.Data.professionNodes is the dictionary that says
--       what an id *is* ("mine", skill 75, "Copper Vein") and nothing more - it never places a pin.
--   D2  Filter them by skill. A vein the character cannot mine is not a route, it is noise, so the
--       default is to draw only what this character could actually gather. `showUngatherable`
--       brings the rest back faded, which is what a player wants when planning the next 25 points.
--   D3  Collect them. The loot window opening over a game object is one node, at one place, at one
--       time; the loot window over a rare's corpse is the same fact about a rare. That record is
--       also where a respawn measurement starts, so it goes to ns.Respawn rather than being counted
--       twice here. With consent a gather also goes out as one NODE event, the hub clusters
--       everybody's into positions, and they come back through ns.Overrides.community.nodes.
--
-- Why the seed's spawn tables stopped placing pins. They used to: every coordinate the object
-- database holds for an ore id, up to 80 per id. The owner played a Mining character through
-- Kalimdor in 5.5.4 and reported the map full of mining spots that do not exist. Measured against
-- what that character really gathered (the hub's NODE rows, k = "mine"): in Stonetalon Mountains
-- (uiMap 65) this file drew 183 veins for a rank-150 miner - 49 Copper, 60 Tin, 53 Silver, 21 Iron
-- - where 9 were gathered, only 15 of the 183 were within 2% of any of them, and 3 of those 9
-- real veins had no pin within 2% at all; in Desolace (66) it drew 125, none within 2% of the 3
-- veins gathered there. The coordinates are not stale Vanilla ones (none of the 144 Tin Vein
-- points in Stonetalon matches pfQuest's Vanilla list); they are every point each ore was ever
-- recorded at, and the ores share them - 227 of the zone's 340 mine coordinates lie within 0.5%
-- of a coordinate listed under a different ore. The server fills a few of those shared points at a
-- time, so a table of all of them is a map of where a vein could be, drawn as if one were there.
-- Nothing in it says which, and play does: so play is the only thing that places a node now.
--
-- Two rules from docs/10 apply throughout. A node we cannot classify is not recorded at all (an
-- "unknown" kind would poison the hub's aggregate), and a skill requirement we do not have is
-- absent rather than zero - a node with no `skill` is gatherable by anyone who has the profession.
--
-- API notes, all checked against Blizzard's own 5.5.4 code before use:
--
--   * `GetProfessions()` / `GetProfessionInfo(index)` - Blizzard_UIPanels_Game/Mists/SpellBookFrame
--     .lua calls both, and unpacks `skillLine` as the 7th return. That id is locale independent,
--     which the skill *name* is not, so it is the primary way we find Mining and Herbalism.
--   * `GetNumSkillLines()` / `GetSkillLineInfo(index)` - Blizzard_UIPanels_Game/Classic/SkillFrame
--     .lua: `name, header, isExpanded, skillRank, ...`. The fallback, and the one docs/10 D2 names.
--   * `GetLootSourceInfo(slot) -> guid, quantity` - in Ketho's 5.5.4 global dump and in Questie's
--     WoW-API annotations. Blizzard's own LootFrame.lua never calls it (it titles the window from
--     the loot itself), so the GUID is the only handle we have on *which* object was looted.
--   * `IsFishingLoot()` - Blizzard_UIPanels_Game/Classic/LootFrame.lua:319.
local _, ns = ...
local L = ns.L

local Util, Log = ns.Util, ns.Log

local M = {}
ns.Professions = M

local type, pairs, tostring, tonumber, format = type, pairs, tostring, tonumber, string.format
local floor, sort, tremove = math.floor, table.sort, table.remove
local wipe = wipe or function(t) for k in pairs(t) do t[k] = nil end return t end

---------------------------------------------------------------------------
-- Contract constants
---------------------------------------------------------------------------

--- Professions.KINDS: the five kinds ns.Data.professionNodes uses, in a stable order.
local KINDS = { "mine", "herb", "fish", "chest", "rare" }
M.KINDS = KINDS

-- kind -> the profile.professions key that turns it on and off.
local KIND_SETTING = { mine = "mining", herb = "herbalism", fish = "fishing", chest = "chests", rare = "rares" }
M.KIND_SETTING = KIND_SETTING

-- kind -> the gathering skill it needs. A chest and a rare need none, and that is why they are
-- absent here rather than mapped to a skill with requirement 0.
local KIND_PROFESSION = { mine = "mining", herb = "herbalism", fish = "fishing" }
M.KIND_PROFESSION = KIND_PROFESSION

-- SkillLineIDs as GetProfessionInfo returns them (its 7th return). All of them are in Blizzard's own
-- 5.5.4 code: Blizzard_FrameXMLBase/Classic/Constants.lua's WORLD_QUEST_ICONS_BY_PROFESSION maps
-- 182 to herbalism, 186 to mining, 356 to fishing and 794 to archaeology, and Blizzard_GlueXML's
-- professionsMap names 182 and 186 the same way. The English name is still checked as well, so a
-- wrong id would degrade to "no profession" rather than to a wrong rank.
--
-- Archaeology is here and NOT in PROFESSIONS/KIND_PROFESSION below, which is the whole distinction
-- this file draws: those two tables say "this skill decides whether a map node may be drawn", and
-- archaeology draws no node at all -- Blizzard's own Mists world map already places the dig sites
-- (Blizzard_WorldMap_Mists.toc loads Cata/Blizzard_WorldMap.lua, whose :219 adds
-- DigSiteDataProviderMixin; the same line is commented out on Vanilla, TBC and Wrath). What this
-- table says is only "how is the rank of this skill found", and that question has one answer for
-- every profession, cached and invalidated on SKILL_LINES_CHANGED in one place. ns.Archaeology asks
-- it for the rank it writes into PandaQuestProf.
local SKILL_LINE = { mining = 186, herbalism = 182, fishing = 356, archaeology = 794 }

-- Lower-cased English skill-line names, the fallback match for SKILL_LINE.
local SKILL_NAME = { mining = "mining", herbalism = "herbalism", fishing = "fishing",
                     archaeology = "archaeology" }

-- The gathering skills, and only those: this is the list that filters pins (D2).
local PROFESSIONS = { "mining", "herbalism", "fishing" }
M.PROFESSIONS = PROFESSIONS

-- Telemetry event code for one observed node (docs/10 A4/D3). Kept as a constant so the hub and
-- the tests share one spelling even before ns.Telemetry lists it in CODES.
local NODE_CODE = "NODE"
M.NODE_CODE = NODE_CODE

local LAYER = "profession"
M.LAYER = LAYER

local UNGATHERABLE_ALPHA = 0.4      -- how faint `showUngatherable` draws a node out of reach
local DEPLETED_ALPHA = 0.35         -- and a node this session already emptied (respawnCountdown)

local MAX_NODES_PER_MAP = 250       -- ns.Pins caps at 300 pins total; quests are added first
--- The floor a kind keeps when the map's budget has to be shared. Without it a zone with three
-- thousand herb places and eleven ore veins spends the whole budget on herbs and a Mining
-- character never sees a vein: the cap silently decided what a gathering zone looks like, in
-- pairs() order rather than by anything about the zone.
local MIN_NODES_PER_KIND = 20
--- How many candidates of one kind are collected before the budget is shared out. It has to be
-- comfortably above the budget itself, because the sort that decides which ones survive (nearest
-- to the player) can only sort what was collected -- and the ids arrive in hash order, so a
-- ceiling equal to the budget would let iteration order pick the winners all over again.
local COLLECT_PER_KIND = MAX_NODES_PER_MAP * 3
local GATHER_WINDOW = 8             -- s: how long a gathering cast still explains a loot window
local DEDUPE_WINDOW = 60            -- s: LOOT_OPENED can fire twice for one object
local MAX_LEARNED_NODES = 500       -- caps on what play teaches us, so the saved variable stays small
--- Distinct places kept per id. It was 60, and a place over the cap was silently not remembered,
-- which matters now that a vein nobody recorded is not drawn at all. One ore id really does stand
-- in hundreds of places - even clustered to 2%, Tin Vein's
-- coordinates in the object database fall into 1,464 places over 38 areas, and its busiest area
-- alone lists 282 points - so a miner working through a continent would stop learning Tin veins in
-- the second zone. 400 places at about twenty bytes each is still a few kilobytes per id.
local MAX_LEARNED_SPAWNS = 400

--- How close two records have to be, in map percent, to be the same node. 2% is the hub's cell
-- (platform/server/pandaquest_hub/nodes.py GRID = 0.02) and ns.Respawn's MATCH_RADIUS, so the
-- player's own records, the community's and the respawn countdown all agree on what "the same
-- place" is. It has to be that coarse because a record is where the *player* stood when the loot
-- window opened, which is a few yards off the vein and a different few yards every time: keyed on
-- the exact position, ten gathers of one vein were saved as ten places and drawn as ten pins.
local SAME_NODE_RADIUS = 2.0

-- Gathering spells, by id and (because the ids are not in any reference on this box) by the name
-- the client reports for them. "Mining" is also the skill-line name, so the name match finds it in
-- every locale; "Herb Gathering" is not, which is why the id is still worth carrying.
local GATHER_SPELLS = { [2575] = "mine", [2366] = "herb" }
M.GATHER_SPELLS = GATHER_SPELLS

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local nodeCache = {}                -- uiMapID -> the array NodesForMap returns
local skillCache = {}               -- profession -> rank; wiped on SKILL_LINES_CHANGED
local skillCacheValid = false

local lastGather = { kind = nil, at = 0 }
local lastLoot = { guid = nil, at = 0 }
local observations = {}             -- this session's gathers, newest last (introspection + tests)
local MAX_OBSERVATIONS = 200

local function profile()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.profile
end

--- Professions.GetSettings() -> profile.professions, or nil before AceDB exists.
function M.GetSettings()
    local p = profile()
    return p and p.professions
end

local function globalStore()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.global
end

---------------------------------------------------------------------------
-- Skill (docs/10 D2)
---------------------------------------------------------------------------

-- GetProfessions() -> prof1, prof2, archaeology, fishing, cooking, firstAid: spell-book indices,
-- any of which may be nil. GetProfessionInfo(index) -> name, texture, rank, maxRank, numSpells,
-- spellOffset, skillLine, ...
local function rankFromProfessionInfo(profession)
    if type(GetProfessions) ~= "function" or type(GetProfessionInfo) ~= "function" then return nil end
    local ok, a, b, c, d, e, f = pcall(GetProfessions)
    if not ok then return nil end
    local wantLine, wantName = SKILL_LINE[profession], SKILL_NAME[profession]
    -- Counted to six, never with the length operator. GetProfessions() hands back six slots and any
    -- of them may be nil, so `{ a, b, c, d, e, f }` is a table with holes, and `#` on such a table
    -- returns *a* border rather than the count -- which one is unspecified. Measured on this box's
    -- Lua 5.1 over all 64 shapes the six slots can take (tools/tests/test_professions.py names the
    -- test): 24 (slot, shape) pairs come out past the length and would go unread, among them
    -- `{1, nil, nil, 4, nil, nil}` whose length is 1 -- a character with one primary profession and
    -- fishing, whose fishing is then invisible. Slot 3, archaeology
    -- (Blizzard_UIPanels_Game/Mists/SpellBookFrame.lua:700), is in none of the 24 on this build,
    -- and that is luck rather than a guarantee: the client's Lua is not this one and any border is
    -- a legal answer. Six slots, counted to six.
    local indices = { a, b, c, d, e, f }
    for i = 1, 6 do
        local index = indices[i]
        if type(index) == "number" then
            local okInfo, name, _, rank, maxRank, _, _, skillLine = pcall(GetProfessionInfo, index)
            if okInfo and type(rank) == "number" then
                if skillLine == wantLine or (type(name) == "string" and name:lower() == wantName) then
                    return rank, (type(maxRank) == "number" and maxRank) or nil
                end
            end
        end
    end
    return nil
end

-- The fallback docs/10 D2 names. GetSkillLineInfo(index) -> name, isHeader, isExpanded, skillRank,
-- numTempPoints, skillModifier, skillMaxRank, ... (Blizzard_UIPanels_Game/Classic/SkillFrame.lua:26
-- names all seven). Header rows carry no rank and are skipped.
local function rankFromSkillLines(profession)
    if type(GetNumSkillLines) ~= "function" or type(GetSkillLineInfo) ~= "function" then return nil end
    local okCount, count = pcall(GetNumSkillLines)
    if not okCount or type(count) ~= "number" then return nil end
    local wantName = SKILL_NAME[profession]
    for i = 1, count do
        local ok, name, isHeader, _, rank, _, _, maxRank = pcall(GetSkillLineInfo, i)
        if ok and not isHeader and type(name) == "string" and type(rank) == "number" then
            if name:lower() == wantName then return rank, (type(maxRank) == "number" and maxRank) or nil end
        end
    end
    return nil
end

--- Professions.GetSkillRank(profession) -> rank|nil, source ("profession"|"skillLine"), maxRank|nil
-- nil means "this character does not have the profession", which is a different answer from 0
-- ("has it, has learned nothing yet") and the two are filtered differently (onlyMyProfessions).
--
-- maxRank is the third return rather than the second because every caller in this file wants the
-- rank alone, and it is nil on its own terms: a client that answered a rank and no ceiling has told
-- us one number, not two, and ns.Archaeology writes down the one it was given rather than a 0 or a
-- 600 nobody measured.
function M.GetSkillRank(profession)
    if type(profession) ~= "string" then return nil end
    if skillCacheValid then
        local cached = skillCache[profession]
        if cached ~= nil then
            if cached == false then return nil end
            return cached[1], cached[2], cached[3]
        end
    else
        wipe(skillCache)
        skillCacheValid = true
    end
    local source = "profession"
    local rank, maxRank = rankFromProfessionInfo(profession)
    if rank == nil then
        source = "skillLine"
        rank, maxRank = rankFromSkillLines(profession)
    end
    if rank == nil then
        skillCache[profession] = false
        return nil
    end
    skillCache[profession] = { rank, source, maxRank }
    return rank, source, maxRank
end

--- Professions.InvalidateSkills(): the next GetSkillRank asks the client again.
function M.InvalidateSkills()
    skillCacheValid = false
    wipe(skillCache)
end

--- Professions.IsGatherable(node) -> bool, reason
--   true, "noSkill"     nothing is required (a chest, a rare, or a node with no recorded skill)
--   true, "skill"       the character's rank reaches node.skill
--   false, "rank"       the character has the profession but not enough of it
--   false, "profession" the character does not have the profession at all
function M.IsGatherable(node)
    if type(node) ~= "table" then return false, "profession" end
    local profession = KIND_PROFESSION[node.kind]
    if not profession then return true, "noSkill" end
    local rank = M.GetSkillRank(profession)
    if rank == nil then return false, "profession" end
    local need = node.skill
    if type(need) ~= "number" or need <= 0 then return true, "noSkill" end
    if rank >= need then return true, "skill" end
    return false, "rank"
end

---------------------------------------------------------------------------
-- Settings
---------------------------------------------------------------------------

local function settingOn(key, default)
    local settings = M.GetSettings()
    if not settings then return default end
    local value = settings[key]
    if value == nil then return default end
    return value and true or false
end

--- Professions.IsEnabled() -> bool. The whole layer.
function M.IsEnabled()
    return settingOn("enabled", true)
end

--- Professions.KindEnabled(kind) -> bool. One toggle per kind (docs/10 D2).
function M.KindEnabled(kind)
    local key = KIND_SETTING[kind]
    if not key then return false end
    return settingOn(key, true)
end

--- Professions.ShowUngatherable() -> bool
function M.ShowUngatherable()
    return settingOn("showUngatherable", false)
end

--- Professions.OnlyMyProfessions() -> bool. On (the default) a profession the character has not
-- learned contributes nothing at all - not even a faded node, because "you could gather this at
-- 150 Mining" is only useful advice to somebody who is actually levelling Mining.
function M.OnlyMyProfessions()
    return settingOn("onlyMyProfessions", true)
end

--- Professions.RespawnCountdown() -> bool
function M.RespawnCountdown()
    return settingOn("respawnCountdown", true)
end

---------------------------------------------------------------------------
-- Where the nodes are
---------------------------------------------------------------------------

--- The dictionary: ns.Data.professionNodes, from Database/Data/Seed.lua. It classifies an id and
-- nothing else (see the header for why its spawn tables no longer place anything).
local function definitions()
    local Data = ns.Data
    local nodes = Data and Data.professionNodes
    if type(nodes) ~= "table" then return nil end
    return nodes
end

--- The dictionary's entry for `id` as a creature (`unit`) or as a game object, or nil.
--
-- The table is keyed by bare id and holds both namespaces - a rare is a creature id, everything
-- else an object id - and 31 of its 442 rares share their number with an unrelated game object.
-- Object 2744 is a Giant Clam on the Stranglethorn coast and creature 2744 is the rare Shadowforge
-- Commander, so looking the id up without asking which kind of thing it is recorded every clam a
-- player opened as that rare, at the clam's position, and uploaded it that way.
local function dictionaryFor(id, unit)
    local defs = definitions()
    local def = defs and type(id) == "number" and defs[id] or nil
    if type(def) ~= "table" or not KIND_SETTING[def.kind] then return nil end
    if (def.unit and true or false) ~= (unit and true or false) then return nil end
    return def
end

--- Only a rare is a creature and a rare is only ever a creature. A record that says otherwise was
-- classified through the id collision above, and has no honest kind to fall back on.
local function kindFitsEntity(kind, unit)
    return (kind == "rare") == (unit and true or false)
end

--- What a node of `id` is, for drawing: the dictionary's word first, then what the record itself
-- carries (a Pandarian vein is in no dictionary; its gathering cast named it). nil when neither
-- is a kind this file draws.
local function describe(id, unit, kind, skill, name)
    local def = dictionaryFor(id, unit)
    if def then return def end
    if not KIND_SETTING[kind] or not kindFitsEntity(kind, unit) then return nil end
    if type(name) ~= "string" and not unit then
        local DB = ns.DB
        if DB and DB.GetObjectName then
            local ok, got = pcall(DB.GetObjectName, id)
            if ok and type(got) == "string" then name = got end
        end
    end
    return { kind = kind, skill = skill, name = name }
end

--- Professions.ResetCache(): drops every per-map node list. Called when the database finishes
-- loading, when the profile changes and when a new node is learned from play.
function M.ResetCache()
    wipe(nodeCache)
end

--- Professions.ResetMapCache(): the same thing, under the name the map hooks use.
--
-- There used to be a second, expensive cache here - an index of which seeded ids appear on which
-- map, a full pass over every profession id and its spawn table - and this was the call that kept
-- it. With the seed no longer placing nodes there is nothing to keep, but the two names say two
-- different things at their call sites (the map moved, or what we know changed) and stay separate.
function M.ResetMapCache()
    wipe(nodeCache)
end

-- What play has taught us, kept in the saved variable so a node is on the map again the next time
-- the player opens it - hub or no hub (docs/10 A4). `PQ.db.global.nodes` is AceDB's global section
-- of PandaQuestDB, which PandaQuest.toc declares under `## SavedVariables`, so it outlives /reload
-- and logout.
local function learnedStore()
    local store = globalStore()
    if not store then return nil end
    if type(store.nodes) ~= "table" then store.nodes = {} end
    return store.nodes
end

local function sameMapDistance2(ax, ay, bx, by)
    local dx, dy = ax - bx, ay - by
    return dx * dx + dy * dy
end

local function roundTenth(value)
    return floor(value * 10 + 0.5) / 10
end

--- Folds `items` into clusters of SAME_NODE_RADIUS and returns the survivors, each carrying what
-- it absorbed. `items` must already be in priority order: the first item of a cluster is the one
-- that stays, so the caller decides what "the best record of this place" means by sorting.
--
-- Every item needs `x`, `y` and a map (`map`, or a node's `uiMapID`). The grid is a hash of cells
-- one radius wide, so a candidate only looks at its own cell and the eight around it rather than at
-- every survivor so far - this runs over every record of an id at login and over a whole map's
-- nodes on every rebuild.
local R2 = SAME_NODE_RADIUS * SAME_NODE_RADIUS
local function cluster(items, absorb)
    local kept, grid = {}, {}
    for i = 1, #items do
        local item = items[i]
        local map = item.map or item.uiMapID
        local cx, cy = floor(item.x / SAME_NODE_RADIUS), floor(item.y / SAME_NODE_RADIUS)
        local host, hostDistance = nil, R2
        for gx = cx - 1, cx + 1 do
            for gy = cy - 1, cy + 1 do
                local cell = grid[map * 10000 + (gx + 1) * 100 + (gy + 1)]
                if cell then
                    for j = 1, #cell do
                        local other = cell[j]
                        local d = sameMapDistance2(other.x, other.y, item.x, item.y)
                        if d <= hostDistance then host, hostDistance = other, d end
                    end
                end
            end
        end
        if host then
            absorb(host, item)
        else
            local key = map * 10000 + (cx + 1) * 100 + (cy + 1)
            local cell = grid[key]
            if not cell then cell = {}; grid[key] = cell end
            cell[#cell + 1] = item
            kept[#kept + 1] = item
        end
    end
    return kept
end

local function byMostGathered(a, b)
    if a.n ~= b.n then return a.n > b.n end
    return a.key < b.key
end

local function absorbPlace(host, place)
    host.n = host.n + place.n
end

--- The places of one saved record, cleaned: `{ [spawnKey] = timesGathered }` with every place a
-- real gather count on a real map position, and no two places of the record within
-- SAME_NODE_RADIUS of each other. nil when nothing survives.
--
-- A place kept is the one gathered most often in its cluster, the hub's modal rule
-- (nodes.py `_modal`): a spot a player really stood on rather than an average nobody stood on.
local function cleanPlaces(places)
    local list = {}
    for key, count in pairs(places) do
        local map, x, y = Util.SplitAreaSpawnKey(key)
        if map and map > 0 and x >= 0 and x <= 100 and y >= 0 and y <= 100
           and type(count) == "number" and count >= 1 and count == floor(count) then
            list[#list + 1] = { key = key, map = map, x = x, y = y, n = count }
        end
    end
    if #list == 0 then return nil end
    sort(list, byMostGathered)
    local out = {}
    local kept = cluster(list, absorbPlace)
    for i = 1, #kept do out[kept[i].key] = kept[i].n end
    return out
end

--- Professions.CleanLearned() -> kept, dropped. Runs once per load, from Init.
--
-- The saved variable outlives every build that wrote to it, so what is in it is checked rather than
-- trusted before anything is drawn from it. A record is kept only when it is what D3 writes: an id,
-- a kind this file draws that fits the kind of thing the id is, and places that each carry a count
-- of gathers. Anything else is dropped rather than repaired, because the one thing a phantom and a
-- corrupt record have in common is that nobody gathered there:
--
--   * a game object saved under a rare's kind. Up to commit aed1abf ClassifyLoot looked the
--     looted object's id up in the dictionary without asking whether the entry was a creature, so
--     every Giant Clam (object 2744) a player opened was saved as the rare Shadowforge Commander
--     (creature 2744) - the dictionary's classification, at a place no rare has ever stood;
--   * a place without a positive whole gather count, or off the map - whatever an older build, a
--     hand edit or a truncated file left there, a coordinate that was not gathered stays off the
--     map;
--   * places of one record within SAME_NODE_RADIUS of each other. Not dropped but merged: that
--     build keyed a place on the unrounded player position, so one vein gathered ten times is ten
--     places in a real saved variable today, and would be ten pins.
function M.CleanLearned()
    local store = globalStore()
    if not store then return 0, 0 end
    if type(store.nodes) ~= "table" then
        store.nodes = {}
        return 0, 0
    end
    local learned = store.nodes
    local kept, dropped = 0, 0
    -- Clearing an existing field during pairs() is allowed in Lua 5.1; adding one is not, and
    -- nothing here adds.
    for id, entry in pairs(learned) do
        local places = nil
        if type(id) == "number" and id > 0 and floor(id) == id and type(entry) == "table"
           and KIND_SETTING[entry.k] and kindFitsEntity(entry.k, entry.u)
           and type(entry.p) == "table" then
            places = cleanPlaces(entry.p)
        end
        if places then
            entry.p = places
            kept = kept + 1
        else
            learned[id] = nil
            dropped = dropped + 1
        end
    end
    if dropped > 0 then Log.Debug("Professions", "dropped %d saved node records", dropped) end
    return kept, dropped
end

-- `source` says whose record a node is: "learned" is this character gathering it, "community" is
-- the hub's aggregate of everybody's gathers. `gathered` (how many times this character took it)
-- and `sightings` (how many NODE events the hub counted there) travel with it, so a place found
-- once is not presented as a place forty people agree on.
-- Candidates are collected per kind and the map's budget is shared out between the kinds
-- afterwards (see `shareTheBudget`), so `out` here is one kind's bucket rather than the map's
-- whole list, bounded by COLLECT_PER_KIND so a store or an export with thousands of places of one
-- kind cannot turn this into unbounded work.
local function addNode(out, id, def, uiMapID, x, y, unit, source, sightings, gathered)
    if #out >= COLLECT_PER_KIND then return false end
    if type(x) ~= "number" or type(y) ~= "number" then return true end
    if x < 0 or x > 100 or y < 0 or y > 100 then return true end
    -- Absent, not zero. pfQuest's meta stores "requires skill 1" as 0 and the seed copies that
    -- through (Silverleaf and nine other starter herbs); a `skill` of 0 on a node would put
    -- "Skill: 0" one careless caller away from the tooltip docs/10 B3 forbids.
    local skill = def.skill
    if type(skill) ~= "number" or skill <= 0 then skill = nil end
    local node = {
        id = id, kind = def.kind, skill = skill, name = def.name,
        uiMapID = uiMapID, x = x, y = y, unit = unit and true or false,
        source = source,
        learned = source == "learned",
    }
    if type(sightings) == "number" and sightings > 0 then node.sightings = sightings end
    if type(gathered) == "number" and gathered > 0 then node.gathered = gathered end
    -- The shared contract calls the identifier `objectId`; a rare is a creature and honestly has
    -- none, so it carries `npcId` instead and ns.NodeTooltip resolves it through entityType.
    if unit then
        node.npcId = id
        node.entityType, node.entityID = "npc", id
    else
        node.objectId = id
        node.entityType, node.entityID = "object", id
    end
    local gatherable, reason = M.IsGatherable(node)
    -- docs/10 D2 and Const.lua's own words: `onlyMyProfessions` "draws nothing rather than a zone
    -- full of veins nobody here can touch". That has to be decided here, before the node takes a
    -- place in the map's budget and before `showUngatherable` gets a say - the two settings are
    -- about different things. "Show nodes above my skill" is for planning where to level a skill
    -- you have; it was never meant to fill a rogue's map with ore and herbs.
    if reason == "profession" and M.OnlyMyProfessions() then return true end
    node.gatherable = gatherable
    out[#out + 1] = node
    return true
end

--- The bucket one kind's candidates go into, created on demand.
local function bucketFor(buckets, kind)
    local bucket = buckets[kind]
    if not bucket then
        bucket = {}
        buckets[kind] = bucket
    end
    return bucket
end

local function appendLearned(buckets, uiMapID)
    local learned = learnedStore()
    if not learned then return end
    for id, entry in pairs(learned) do
        if type(id) == "number" and type(entry) == "table" and type(entry.p) == "table" then
            local unit = entry.u and true or false
            local def = describe(id, unit, entry.k, entry.s, entry.n)
            if def and M.KindEnabled(def.kind) then
                local bucket = bucketFor(buckets, def.kind)
                for key, count in pairs(entry.p) do
                    local map, x, y = Util.SplitAreaSpawnKey(key)
                    if map == uiMapID and type(count) == "number" and count >= 1 then
                        -- A full bucket ends this id, not the whole map: another kind may still
                        -- have room, and it is not this one's to spend.
                        if not addNode(bucket, id, def, uiMapID, x, y, unit, "learned", nil, count) then
                            break
                        end
                    end
                end
            end
        end
    end
end

-- The second source, after this character's own gathers: everybody else's, aggregated by the hub
-- (docs/10 D3; platform/server/pandaquest_hub/nodes.py builds it). Shape:
--
--   ns.Overrides.community.nodes[objectId] = { k = kind, n = sightings,
--                                              p = { { m = uiMapID, x = 0..1, y = 0..1, n = 4 } } }
--
-- x and y are map fractions there, like every other exported point, and percentages here.
local function communityNodes()
    local overrides = ns.Overrides
    local community = overrides and overrides.community
    local found = type(community) == "table" and community.nodes or nil
    if type(found) ~= "table" then return nil end
    return found
end

local function appendCommunity(buckets, uiMapID)
    local found = communityNodes()
    if not found then return end
    for id, entry in pairs(found) do
        if type(id) == "number" and type(entry) == "table" and type(entry.k) == "string" then
            -- No skill and no name travel with a community node: the hub aggregates positions, not
            -- the skill requirement it would have to invent, and the object's name is whatever
            -- this client's own database calls it in this client's own locale. The dictionary
            -- supplies both when it knows the id; otherwise an absent skill means IsGatherable
            -- falls through to "anyone with the profession", which is the honest answer rather
            -- than a guess at 275 Mining. Every hub node is a game object (the hub is only ever
            -- sent a loot window over one), so a "rare" in the export is the clam collision above.
            local def = describe(id, false, entry.k, nil, nil)
            local places = entry.p
            if def and type(places) == "table" and M.KindEnabled(def.kind) then
                local bucket = bucketFor(buckets, def.kind)
                for i = 1, #places do
                    local place = places[i]
                    if type(place) == "table" and place.m == uiMapID
                       and type(place.x) == "number" and type(place.y) == "number" then
                        if not addNode(bucket, id, def, uiMapID, place.x * 100, place.y * 100,
                                       false, "community", place.n) then
                            break
                        end
                    end
                end
            end
        end
    end
end

local function byNode(a, b)
    if a.id ~= b.id then return a.id < b.id end
    if a.x ~= b.x then return a.x < b.x end
    return a.y < b.y
end

-- The record a place is drawn as when several describe it. A node the character can gather comes
-- first, so a spot where both a vein it can mine and one it cannot were found is not hidden by the
-- one it cannot. Then this character's own gathers, most first - where the player stood beats an
-- aggregate of strangers - then the hub's, best corroborated first.
local function byEvidence(a, b)
    if a.gatherable ~= b.gatherable then return a.gatherable and true or false end
    local ga, gb = a.gathered or 0, b.gathered or 0
    if ga ~= gb then return ga > gb end
    local sa, sb = a.sightings or 0, b.sightings or 0
    if sa ~= sb then return sa > sb end
    return byNode(a, b)
end

-- One place, one node. The counts add up, because they are counts of the same place; the ids are
-- kept because a spawn point in 5.5.4 is shared between ores (see the header - 227 of Stonetalon's
-- 340 mine coordinates), so the dot a player gathered Tin at one day and Silver at the next is
-- still one dot, and its tooltip says both.
local function absorbNode(host, node)
    if node.gathered then host.gathered = (host.gathered or 0) + node.gathered end
    if node.sightings then host.sightings = (host.sightings or 0) + node.sightings end
    if node.id ~= host.id then
        local ids = host.ids
        if not ids then ids = { host.id }; host.ids = ids end
        local known = false
        for i = 1, #ids do
            if ids[i] == node.id then known = true break end
        end
        if not known then
            ids[#ids + 1] = node.id
            local name = node.name
            if type(name) == "string" and name ~= host.name then
                local also = host.alsoHere
                if not also then also = {}; host.alsoHere = also end
                local listed = false
                for i = 1, #also do
                    if also[i] == name then listed = true break end
                end
                if not listed then also[#also + 1] = name end
            end
        end
    end
end

local function mergeBucket(bucket)
    sort(bucket, byEvidence)
    return cluster(bucket, absorbNode)
end

-- Nearest first when the player is standing on this map, and by id otherwise so that what a cap
-- keeps is at least reproducible rather than a product of table iteration order.
local function byNearness(a, b)
    local da, db = a.dist, b.dist
    if da and db and da ~= db then return da < db end
    return byNode(a, b)
end

--- The player's position on `uiMapID` in map percent, or nil when they are somewhere else.
local function playerPointOn(uiMapID)
    local Player = ns.Player
    local pos = Player and Player.GetPosition and Player.GetPosition() or nil
    if not pos or pos.uiMapID ~= uiMapID or type(pos.x) ~= "number" or type(pos.y) ~= "number" then
        return nil
    end
    return pos.x * 100, pos.y * 100
end

--- Shares MAX_NODES_PER_MAP out between the kinds that have candidates and copies the survivors
-- into `out`.
--
-- An equal split first, capped by what each kind actually has, and the change handed round until
-- it is gone. That is what keeps a zone with three thousand herb places from spending the whole
-- budget before the ore veins - the character's own profession - are ever looked at.
local function shareTheBudget(buckets, out, uiMapID)
    local total, present = 0, 0
    for i = 1, #KINDS do
        local bucket = buckets[KINDS[i]]
        local count = bucket and #bucket or 0
        if count > 0 then
            total = total + count
            present = present + 1
        end
    end
    if total == 0 then return out end

    if total <= MAX_NODES_PER_MAP then
        for i = 1, #KINDS do
            local bucket = buckets[KINDS[i]]
            for j = 1, (bucket and #bucket or 0) do out[#out + 1] = bucket[j] end
        end
        return out
    end

    local px, py = playerPointOn(uiMapID)
    local base = floor(MAX_NODES_PER_MAP / present)
    if base < MIN_NODES_PER_KIND then base = MIN_NODES_PER_KIND end

    local quota, spent = {}, 0
    for i = 1, #KINDS do
        local kind = KINDS[i]
        local bucket = buckets[kind]
        local count = bucket and #bucket or 0
        if count > 0 then
            local share = count < base and count or base
            quota[kind] = share
            spent = spent + share
        end
    end
    -- Round robin so the remainder goes where there is something left to show, a pin at a time.
    local left = MAX_NODES_PER_MAP - spent
    while left > 0 do
        local gave = false
        for i = 1, #KINDS do
            local kind = KINDS[i]
            local bucket = buckets[kind]
            if left > 0 and quota[kind] and bucket and quota[kind] < #bucket then
                quota[kind] = quota[kind] + 1
                left = left - 1
                gave = true
            end
        end
        if not gave then break end
    end

    for i = 1, #KINDS do
        local kind = KINDS[i]
        local bucket = buckets[kind]
        local share = quota[kind]
        if bucket and share and share > 0 then
            if #bucket > share then
                if px then
                    for j = 1, #bucket do
                        local node = bucket[j]
                        local dx, dy = node.x - px, node.y - py
                        node.dist = dx * dx + dy * dy
                    end
                end
                sort(bucket, byNearness)
            end
            for j = 1, share do
                local node = bucket[j]
                node.dist = nil                 -- scratch, not part of the node contract
                out[#out + 1] = node
            end
        end
    end
    return out
end

--- Professions.NodesForMap(uiMapID) -> { {objectId, x, y, kind, skill, name, gatherable}, ... }
-- Always an array: a map with no profession data returns an empty one rather than nil, so the
-- caller never has to ask twice. The array is cached per map and rebuilt by ResetCache.
--
-- Only observed places are in it: this character's saved gathers, then the hub's sightings, folded
-- so that one place is one node whichever of the two - or both - recorded it.
--
-- One consequence of the cache is worth stating: when the zone has more candidates than the map
-- budget, which ones survive is decided by distance from the player *at the moment the list was
-- built*, and walking across the zone does not rebuild it (only a zone change, a map change or a
-- setting does). The minimap's own cap is re-ranked four times a second on top of this, so what
-- the player is standing next to is still drawn there; this is the coarse cut, and re-running it
-- on every step would mean a full rebuild per step, which is the thing being fixed elsewhere.
function M.NodesForMap(uiMapID)
    if type(uiMapID) ~= "number" then return {} end
    local cached = nodeCache[uiMapID]
    if cached then return cached end

    local out = {}
    nodeCache[uiMapID] = out
    local buckets = {}
    appendLearned(buckets, uiMapID)
    appendCommunity(buckets, uiMapID)
    for i = 1, #KINDS do
        local kind = KINDS[i]
        if buckets[kind] then buckets[kind] = mergeBucket(buckets[kind]) end
    end
    shareTheBudget(buckets, out, uiMapID)
    sort(out, byNode)
    return out
end

--- Professions.GetLearned() -> the saved-variable table of nodes learned from play (or nil).
function M.GetLearned()
    return learnedStore()
end

---------------------------------------------------------------------------
-- The pin layer (docs/10 D1)
---------------------------------------------------------------------------

-- Faded, and why. A node out of reach is dim because the player cannot take it; a node this
-- session already emptied is dim because it is not there. Both are docs/10: "the node is drawn
-- faint until it comes back". A place several ores were gathered at is emptied when any of them
-- was: the spawn point is one, whichever ore the server put in it.
local function alphaFor(node, spawnKey)
    if not node.gatherable then return UNGATHERABLE_ALPHA end
    if not M.RespawnCountdown() then return 1 end
    local Respawn = ns.Respawn
    if not Respawn or type(Respawn.GetRemaining) ~= "function" then return 1 end
    local kind = node.unit and "npc" or "object"
    local ids = node.ids
    for i = 1, (ids and #ids or 1) do
        local id = ids and ids[i] or node.id
        local ok, remaining = pcall(Respawn.GetRemaining, kind, id, spawnKey)
        if ok and type(remaining) == "number" and remaining > 0 then return DEPLETED_ALPHA end
    end
    return 1
end

local function addSpecsForMap(specs, byKey, maxPins, uiMapID, showUngatherable)
    local nodes = M.NodesForMap(uiMapID)
    local added = 0
    for i = 1, #nodes do
        local node = nodes[i]
        if node.gatherable or showUngatherable then
            local key = format("prof:%d:%.1f:%.1f", node.id, node.x, node.y)
            if not byKey[key] then
                if type(maxPins) == "number" and #specs >= maxPins then break end
                local spawnKey = Util.SpawnKey(uiMapID, node.x, node.y)
                node.key = key
                local spec = {
                    key = key, uiMapID = uiMapID, x = node.x, y = node.y,
                    layer = LAYER, rank = 5, count = 1,
                    targets = { node }, keys = { [key] = true },
                    -- What ns.NodeTooltip.Fill reads straight off the spec (docs/10 B3).
                    kind = node.kind, skill = node.skill, name = node.name,
                    gatherable = node.gatherable, spawnKey = spawnKey,
                    source = node.source, sightings = node.sightings,
                    gathered = node.gathered, alsoHere = node.alsoHere,
                    entityType = node.entityType, entityID = node.entityID,
                    node = node,
                }
                if not node.unit then spec.objectId = node.id end
                spec.alpha = alphaFor(node, spawnKey)
                byKey[key] = spec
                specs[#specs + 1] = spec
                added = added + 1
            end
        end
    end
    return added
end

--- Professions.BuildSpecs(specs, byKey, maxPins) -> how many specs were added.
-- Called by Map/Pins.lua while it rebuilds its spec list, with the array and the coordinate index
-- it is filling. Nothing else in this file touches a frame: Pins owns placement, pooling and the
-- minimap cap, and this only says what should be there.
function M.BuildSpecs(specs, byKey, maxPins)
    if type(specs) ~= "table" or type(byKey) ~= "table" then return 0 end
    if not M.IsEnabled() then return 0 end
    local playerMap, openMap = M.CurrentMaps()
    if not playerMap and not openMap then return 0 end
    local showUngatherable = M.ShowUngatherable()
    local added = 0
    if playerMap then
        added = added + addSpecsForMap(specs, byKey, maxPins, playerMap, showUngatherable)
    end
    -- The open world map is built as well as - not instead of - the map the player stands on, or
    -- looking up a neighbouring zone would empty the minimap of the ore you are standing next to.
    if openMap and openMap ~= playerMap then
        added = added + addSpecsForMap(specs, byKey, maxPins, openMap, showUngatherable)
    end
    return added
end

--- Professions.CurrentMaps() -> playerMapID|nil, openWorldMapID|nil
function M.CurrentMaps()
    local playerMap, openMap
    local Player = ns.Player
    local pos = Player and Player.GetPosition and Player.GetPosition() or nil
    if pos and type(pos.uiMapID) == "number" then playerMap = pos.uiMapID end
    local frame = _G and _G.WorldMapFrame
    if frame and frame.IsShown and frame:IsShown() and frame.GetMapID then
        local ok, id = pcall(frame.GetMapID, frame)
        if ok and type(id) == "number" and id > 0 then openMap = id end
    end
    return playerMap, openMap
end

--- Professions.OnPinClick(spec, button): a profession node is not a quest target, so the router
-- has nothing to route to and Map/Pins hands the click here instead. Shift still sends the point
-- to TomTom, which is the one thing a player actually wants from an ore vein.
function M.OnPinClick(spec, button)
    local node = spec and spec.targets and spec.targets[1]
    if not node then return false end
    if button == "RightButton" then
        local Wowhead = ns.Wowhead
        if Wowhead and Wowhead.ShowCopyDialog then
            local url = node.unit and Wowhead.NpcUrl and Wowhead.NpcUrl(node.id)
                or (Wowhead.ObjectUrl and Wowhead.ObjectUrl(node.id))
            if url then
                Wowhead.ShowCopyDialog(url)
                return true
            end
        end
        return false
    end
    local shift = IsShiftKeyDown and IsShiftKeyDown()
    if shift then
        local TomTom = ns.TomTomBridge
        if TomTom and TomTom.IsAvailable and TomTom.IsAvailable() and TomTom.SetWaypoint then
            TomTom.SetWaypoint(node)
            return true
        end
        Log.Print(L["TomTom is not loaded."])
        return false
    end
    return false
end

---------------------------------------------------------------------------
-- Collection (docs/10 D3)
---------------------------------------------------------------------------

local function now()
    return (GetTime and GetTime()) or 0
end

--- Professions.NoteGatherCast(spellID [, spellName]): remembers that a gathering cast just
-- succeeded, so the loot window that follows can be classified. Called from
-- UNIT_SPELLCAST_SUCCEEDED; exposed because that is also how the tests drive it.
function M.NoteGatherCast(spellID, spellName)
    local kind = GATHER_SPELLS[spellID]
    if not kind and type(spellName) == "string" then
        local lowered = spellName:lower()
        if lowered == SKILL_NAME.mining then
            kind = "mine"
        elseif lowered == SKILL_NAME.herbalism then
            kind = "herb"
        end
    end
    if not kind then return false end
    lastGather.kind, lastGather.at = kind, now()
    return true
end

local function recentGatherKind()
    if not lastGather.kind then return nil end
    local age = now() - lastGather.at
    if age < 0 or age > GATHER_WINDOW then return nil end
    return lastGather.kind
end

--- The first GUID in the loot window that `parse` turns into an id: id, guid.
-- GetLootSourceInfo(slot) returns (guid, quantity) pairs, one per slot.
local function lootSource(parse, accept)
    if type(GetNumLootItems) ~= "function" or type(GetLootSourceInfo) ~= "function" then return nil end
    local okCount, count = pcall(GetNumLootItems)
    if not okCount or type(count) ~= "number" then return nil end
    if count < 1 then count = 1 end                 -- an emptied node still reports its source
    for slot = 1, count do
        local ok, guid = pcall(GetLootSourceInfo, slot)
        if ok and type(guid) == "string" then
            local id = parse(guid)
            if id and (not accept or accept(id)) then return id, guid end
        end
    end
    return nil
end

--- Professions.SourceFromLoot() -> objectId|nil, guid|nil
-- The first GameObject GUID in the window is the thing that was gathered. A creature corpse has a
-- Creature GUID and is not a gathering node - a mob dying is the respawn module's business, not
-- this one's. The one creature this file does want is a rare, and RareFromLoot asks for it.
function M.SourceFromLoot()
    return lootSource(Util.ObjectIdFromGuid)
end

local function isRare(npcId)
    local def = dictionaryFor(npcId, true)
    return def ~= nil and def.kind == "rare"
end

--- Professions.RareFromLoot() -> npcId|nil, guid|nil
-- A rare's corpse in the loot window. The rare kind has no other honest observation: its spawn
-- list in the database is the same union of every recorded position the ore tables are (see the
-- header), and the corpse is within loot range of where the rare really was.
function M.RareFromLoot()
    return lootSource(Util.NpcIdFromGuid, isRare)
end

local function isFishingLoot()
    if type(IsFishingLoot) ~= "function" then return false end
    local ok, fishing = pcall(IsFishingLoot)
    return ok and fishing and true or false
end

--- Professions.ClassifyLoot(objectId) -> kind|nil, skill|nil, name|nil
-- The dictionary first (it knows the skill and the name), then an earlier record of the same
-- object, then the gathering cast, then the fishing flag. Nothing else: an unclassifiable game
-- object is a quest crate as often as it is a treasure, and docs/10's rule is that a value we do
-- not have is absent rather than guessed. Every lookup asks for a game object, never a creature:
-- that is the Giant Clam that was saved as a rare (dictionaryFor).
function M.ClassifyLoot(objectId)
    local def = dictionaryFor(objectId, false)
    if def then
        return def.kind, def.skill, def.name
    end
    local learned = learnedStore()
    local known = learned and objectId and learned[objectId]
    if type(known) == "table" and not known.u and KIND_SETTING[known.k]
       and kindFitsEntity(known.k, false) then
        return known.k, known.s, known.n
    end
    local kind = recentGatherKind()
    if kind then
        local DB = ns.DB
        local name = (DB and DB.GetObjectName and objectId) and DB.GetObjectName(objectId) or nil
        return kind, nil, name
    end
    if isFishingLoot() then return "fish", nil, nil end
    return nil
end

local function rememberLearned(id, kind, skill, name, unit, uiMapID, x, y)
    local learned = learnedStore()
    if not learned then return false end
    local entry = learned[id]
    if not entry then
        local count = 0
        for _ in pairs(learned) do count = count + 1 end
        if count >= MAX_LEARNED_NODES then return false end
        entry = { k = kind, p = {} }
        if skill then entry.s = skill end
        if name then entry.n = name end
        if unit then entry.u = true end
        learned[id] = entry
    end
    entry.k = kind or entry.k
    if type(entry.p) ~= "table" then entry.p = {} end
    -- The same vein gathered again is the same place, counted, not a new one: the nearest saved
    -- place within SAME_NODE_RADIUS takes the gather.
    local places = entry.p
    local nearest, nearestDistance, spawnCount = nil, R2, 0
    for key in pairs(places) do
        spawnCount = spawnCount + 1
        local map, px, py = Util.SplitAreaSpawnKey(key)
        if map == uiMapID then
            local d = sameMapDistance2(px, py, x, y)
            if d <= nearestDistance then nearest, nearestDistance = key, d end
        end
    end
    if nearest then
        places[nearest] = (tonumber(places[nearest]) or 0) + 1
        return false
    end
    if spawnCount >= MAX_LEARNED_SPAWNS then return false end
    -- A tenth of a percent, the precision Map/Pins and ns.Respawn write their keys at. The
    -- unrounded position is noise below what a map can show, and it is what made every key unique.
    places[Util.SpawnKey(uiMapID, roundTenth(x), roundTenth(y))] = 1
    return true
end

--- Professions.RespawnOwnsLoot() -> bool. True when ns.Respawn watches the loot window itself.
--
-- It does (Nodes/Respawn.lua registers LOOT_OPENED and calls NoteSeen *then* NoteDeath on the same
-- object, which is how one gather both closes the previous interval and opens the next). Calling
-- NoteDeath a second time from here would be harmless if the two handlers always ran in the same
-- order - and they do not, because AceEvent gives no ordering guarantee. Running ours first would
-- stamp the death time before its NoteSeen read it, and the interval it was about to measure would
-- come out as zero and be thrown away. So: one owner of that bookkeeping, and this is the check
-- that says which module it is.
function M.RespawnOwnsLoot()
    local Respawn = ns.Respawn
    return Respawn ~= nil and type(Respawn.OnLootOpened) == "function"
end

--- Professions.ForwardToRespawn(kind, id, uiMapID, x, y) -> bool. Hands a gather to
-- ns.Respawn.NoteDeath unless that module already saw the same loot window (RespawnOwnsLoot).
function M.ForwardToRespawn(kind, id, uiMapID, x, y)
    if M.RespawnOwnsLoot() then return false end
    local Respawn = ns.Respawn
    if not Respawn or type(Respawn.NoteDeath) ~= "function" then return false end
    local ok = pcall(Respawn.NoteDeath, kind, id, uiMapID, x, y)
    return ok and true or false
end

--- Professions.RecordGather(id, kind, uiMapID, x, y [, unit, skill, name]) -> observation|nil
--
-- One gather: one local record, one respawn measurement, one telemetry event. The respawn
-- bookkeeping is deliberately not repeated here - ns.Respawn.NoteDeath is the single place a
-- "this is gone, start the clock" fact lives (docs/10 C2/D3), and this calls it.
--
-- x and y are percentages (0-100), the same scale ns.Pins and ns.Util.SpawnKey use.
function M.RecordGather(id, kind, uiMapID, x, y, unit, skill, name)
    if type(id) ~= "number" or type(kind) ~= "string" then return nil end
    if type(uiMapID) ~= "number" or type(x) ~= "number" or type(y) ~= "number" then return nil end

    local observation = { id = id, kind = kind, uiMapID = uiMapID, x = x, y = y,
                          unit = unit and true or false, t = now() }
    observations[#observations + 1] = observation
    -- Oldest out, in place: the array is handed out by GetObservations, so it has to stay the
    -- same table rather than being replaced by a trimmed copy.
    while #observations > MAX_OBSERVATIONS do
        tremove(observations, 1)
    end

    -- The node lists go either way: a new place is a new node, and a place gathered again carries
    -- a new count its tooltip shows. Dropping them costs nothing until the next redraw asks.
    rememberLearned(id, kind, skill, name, unit, uiMapID, x, y)
    M.ResetCache()

    if M.ForwardToRespawn(unit and "npc" or "object", id, uiMapID, x, y) then
        observation.forwarded = true
    end

    -- The consent gate. Telemetry.Record is itself a no-op while telemetry is off (docs/07 B1),
    -- but asking first keeps the event table from being built at all for a player who said no.
    local Telemetry = ns.Telemetry
    if Telemetry and Telemetry.IsEnabled and Telemetry.IsEnabled() and Telemetry.Record then
        Telemetry.Record(NODE_CODE, { k = kind, o = id, m = uiMapID,
                                      x = floor(x * 10 + 0.5) / 1000, y = floor(y * 10 + 0.5) / 1000 })
        observation.sent = true
    end

    Log.Debug("Professions", "gathered %s %d at %d (%.1f, %.1f)", kind, id, uiMapID, x, y)
    return observation
end

--- Professions.RecordRare(npcId, uiMapID, x, y [, name]) -> observation|nil
--
-- A rare's corpse was opened here, so the rare stood here: the same saved record a gather makes,
-- and nothing else. It is not a respawn measurement - Nodes/Respawn has the death from the combat
-- log or the target frame at the moment it happened, and a second NoteDeath at the moment the
-- corpse was opened would restart that clock late. And it is not sent as NODE, because the hub
-- reads every NODE id as a game object (routers/nodemap.py looks the respawn of one up under
-- "object"), and a creature id there would be looked up as the wrong thing.
function M.RecordRare(npcId, uiMapID, x, y, name)
    if type(npcId) ~= "number" or type(uiMapID) ~= "number" then return nil end
    if type(x) ~= "number" or type(y) ~= "number" then return nil end
    local observation = { id = npcId, kind = "rare", uiMapID = uiMapID, x = x, y = y,
                          unit = true, t = now() }
    observations[#observations + 1] = observation
    while #observations > MAX_OBSERVATIONS do
        tremove(observations, 1)
    end
    rememberLearned(npcId, "rare", nil, name, true, uiMapID, x, y)
    M.ResetCache()
    Log.Debug("Professions", "looted rare %d at %d (%.1f, %.1f)", npcId, uiMapID, x, y)
    return observation
end

--- Professions.GetObservations() -> this session's gathers, oldest first. Read-only.
function M.GetObservations()
    return observations
end

--- Professions.OnLootOpened() -> observation|nil. The LOOT_OPENED handler, split out so a test
-- can call it directly and read what it decided.
function M.OnLootOpened()
    local objectId, guid = M.SourceFromLoot()
    local rareId
    if not objectId then
        rareId, guid = M.RareFromLoot()
        if not rareId then return nil end
    end

    -- LOOT_OPENED fires again when the window is re-shown for the same object; one gather is one
    -- observation, so the same GUID inside a minute is ignored.
    local at = now()
    if lastLoot.guid == guid and (at - lastLoot.at) >= 0 and (at - lastLoot.at) < DEDUPE_WINDOW then
        return nil
    end
    lastLoot.guid, lastLoot.at = guid, at

    local kind, skill, name
    if rareId then
        local def = dictionaryFor(rareId, true)
        kind, name = "rare", def and def.name
    else
        kind, skill, name = M.ClassifyLoot(objectId)
        if not kind then return nil end
    end

    local Player = ns.Player
    local pos = Player and Player.GetPosition and Player.GetPosition() or nil
    if not pos or not pos.uiMapID or type(pos.x) ~= "number" then return nil end

    if rareId then
        return M.RecordRare(rareId, pos.uiMapID, pos.x * 100, pos.y * 100, name)
    end
    return M.RecordGather(objectId, kind, pos.uiMapID, pos.x * 100, pos.y * 100, false, skill, name)
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

-- The map moved: which map's nodes are wanted changed, nothing else. It goes through
-- Pins.RequestRedraw rather than Pins.Redraw because Blizzard calls OnMapChanged from SetMapID,
-- which is the same user action that shows the frame -- both hooks fire for one map open, and
-- calling Redraw directly ran the entire node and pin pipeline twice in a single frame.
local function askPinsToRedraw()
    local Pins = ns.Pins
    if Pins and Pins.RequestRedraw then
        Pins.RequestRedraw()
    elseif Pins and Pins.Redraw then
        Pins.Redraw()
    end
end

local function mapMoved()
    M.ResetMapCache()
    askPinsToRedraw()
end

--- Professions.Redraw(): a setting changed, not the map. The node lists have to go, because a kind
-- toggle or a skill filter changes which nodes are in them at all (UI/Options calls this).
function M.Redraw()
    M.ResetCache()
    askPinsToRedraw()
end

function M.Init()
    -- Init runs from OnInitialize, after AceDB has read PandaQuestDB and before anything draws: the
    -- one moment a record left by an older build can be checked before it becomes a pin.
    M.CleanLearned()
    M.ResetCache()
    M.InvalidateSkills()
    wipe(observations)
    lastGather.kind, lastGather.at = nil, 0
    lastLoot.guid, lastLoot.at = nil, 0
end

function M.Enable()
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if not AceEvent then return end
    -- One AceEvent object per module (docs/06): ns.PQ holds a single callback per message, so a
    -- module that shares it silently overwrites another module's handler.
    AceEvent:Embed(M)
    M:RegisterEvent("LOOT_OPENED", function()
        local ok, err = pcall(M.OnLootOpened)
        if not ok then Log.Error("Professions", "LOOT_OPENED failed: %s", tostring(err)) end
    end)
    M:RegisterEvent("SKILL_LINES_CHANGED", function()
        M.InvalidateSkills()
        M.Redraw()
    end)
    M:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", function(_, unit, _castGUID, spellID)
        if unit ~= "player" then return end
        local name = nil
        if type(GetSpellInfo) == "function" then
            local ok, spellName = pcall(GetSpellInfo, spellID)
            if ok then name = spellName end
        end
        M.NoteGatherCast(spellID, name)
    end)
    -- The nodes are built for the map the player is on and the map that is open, so both of those
    -- moving is a redraw. ZONE_CHANGED_NEW_AREA covers walking; the two hooks below cover opening
    -- the map and paging to another zone in it. Neither replaces a Blizzard script (HookScript and
    -- hooksecurefunc both run *after* the original), which is docs/10 E4's rule: we do not compete
    -- with a map addon for the same hook.
    M:RegisterEvent("ZONE_CHANGED_NEW_AREA", mapMoved)
    local frame = _G and _G.WorldMapFrame
    if frame then
        if frame.HookScript then pcall(frame.HookScript, frame, "OnShow", mapMoved) end
        if type(frame.OnMapChanged) == "function" and hooksecurefunc then
            pcall(hooksecurefunc, frame, "OnMapChanged", mapMoved)
        end
    end
    Log.Debug("Professions", "enabled (%s)", M.IsEnabled() and "on" or "off")
end

function M.OnDataReady()
    M.ResetCache()
end

function M.OnProfileChanged()
    M.InvalidateSkills()
    M.ResetCache()
end

M.UNGATHERABLE_ALPHA = UNGATHERABLE_ALPHA
M.DEPLETED_ALPHA = DEPLETED_ALPHA
M.MAX_NODES_PER_MAP = MAX_NODES_PER_MAP
M.GATHER_WINDOW = GATHER_WINDOW
M.DEDUPE_WINDOW = DEDUPE_WINDOW
M.MAX_LEARNED_NODES = MAX_LEARNED_NODES
M.MAX_LEARNED_SPAWNS = MAX_LEARNED_SPAWNS
