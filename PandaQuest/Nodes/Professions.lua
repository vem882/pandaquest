-- Nodes/Professions.lua: mines, herbs, fishing pools, chests and rares on the map (docs/10 D).
--
-- Three jobs, in the order the document puts them:
--
--   D1  Draw them. ns.Data.professionNodes says what an id *is* ("mine", skill 75, "Copper Vein");
--       the object and creature spawn tables in Database/Data say *where* it is. This file joins
--       the two and hands ns.Pins a "profession" layer of specs.
--   D2  Filter them by skill. A vein the character cannot mine is not a route, it is noise, so the
--       default is to draw only what this character could actually gather. `showUngatherable`
--       brings the rest back faded, which is what a player wants when planning the next 25 points.
--   D3  Collect them. Pandaria's ore and herbs are in no source we can reach (docs/10 A4), so they
--       are measured from play: the loot window opening over a game object is one node, at one
--       place, at one time. That record is also where a respawn measurement starts, so it goes to
--       ns.Respawn rather than being counted twice here. With consent it also goes out as one
--       NODE event, the hub clusters everybody's into positions, and they come back through
--       ns.Overrides.community.nodes - which is the third source this file draws from, after the
--       seed and after what this character gathered itself.
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

local type, pairs, tostring, format = type, pairs, tostring, string.format
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

-- SkillLineIDs as GetProfessionInfo returns them (its 7th return). All three are in Blizzard's own
-- 5.5.4 code: Blizzard_FrameXMLBase/Classic/Constants.lua's WORLD_QUEST_ICONS_BY_PROFESSION maps
-- 182 to herbalism, 186 to mining and 356 to fishing, and Blizzard_GlueXML's professionsMap names
-- 182 and 186 the same way. The English name is still checked as well, so a wrong id would degrade
-- to "no profession" rather than to a wrong rank.
local SKILL_LINE = { mining = 186, herbalism = 182, fishing = 356 }

-- Lower-cased English skill-line names, the fallback match for SKILL_LINE.
local SKILL_NAME = { mining = "mining", herbalism = "herbalism", fishing = "fishing" }

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
local MAX_SPAWNS_PER_NODE = 80      -- one Copper Vein id carries hundreds of coordinates
local GATHER_WINDOW = 8             -- s: how long a gathering cast still explains a loot window
local DEDUPE_WINDOW = 60            -- s: LOOT_OPENED can fire twice for one object
local MAX_LEARNED_NODES = 500       -- caps on what play teaches us, so the saved variable stays small
local MAX_LEARNED_SPAWNS = 60

-- Gathering spells, by id and (because the ids are not in any reference on this box) by the name
-- the client reports for them. "Mining" is also the skill-line name, so the name match finds it in
-- every locale; "Herb Gathering" is not, which is why the id is still worth carrying.
local GATHER_SPELLS = { [2575] = "mine", [2366] = "herb" }
M.GATHER_SPELLS = GATHER_SPELLS

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local mapIndex = nil                -- uiMapID -> { {id = , unit = }, ... }; nil until built
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
    local indices = { a, b, c, d, e, f }
    for i = 1, #indices do
        local index = indices[i]
        if type(index) == "number" then
            local okInfo, name, _, rank, _, _, _, skillLine = pcall(GetProfessionInfo, index)
            if okInfo and type(rank) == "number" then
                if skillLine == wantLine or (type(name) == "string" and name:lower() == wantName) then
                    return rank
                end
            end
        end
    end
    return nil
end

-- The fallback docs/10 D2 names. GetSkillLineInfo(index) -> name, isHeader, isExpanded, skillRank,
-- ... (Blizzard_UIPanels_Game/Classic/SkillFrame.lua). Header rows carry no rank and are skipped.
local function rankFromSkillLines(profession)
    if type(GetNumSkillLines) ~= "function" or type(GetSkillLineInfo) ~= "function" then return nil end
    local okCount, count = pcall(GetNumSkillLines)
    if not okCount or type(count) ~= "number" then return nil end
    local wantName = SKILL_NAME[profession]
    for i = 1, count do
        local ok, name, isHeader, _, rank = pcall(GetSkillLineInfo, i)
        if ok and not isHeader and type(name) == "string" and type(rank) == "number" then
            if name:lower() == wantName then return rank end
        end
    end
    return nil
end

--- Professions.GetSkillRank(profession) -> rank|nil, source ("profession"|"skillLine")
-- nil means "this character does not have the profession", which is a different answer from 0
-- ("has it, has learned nothing yet") and the two are filtered differently (onlyMyProfessions).
function M.GetSkillRank(profession)
    if type(profession) ~= "string" then return nil end
    if skillCacheValid then
        local cached = skillCache[profession]
        if cached ~= nil then
            if cached == false then return nil end
            return cached[1], cached[2]
        end
    else
        wipe(skillCache)
        skillCacheValid = true
    end
    local rank, source = rankFromProfessionInfo(profession), "profession"
    if rank == nil then
        rank, source = rankFromSkillLines(profession), "skillLine"
    end
    if rank == nil then
        skillCache[profession] = false
        return nil
    end
    skillCache[profession] = { rank, source }
    return rank, source
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

local function definitions()
    local Data = ns.Data
    local nodes = Data and Data.professionNodes
    if type(nodes) ~= "table" then return nil end
    return nodes
end

local function spawnsFor(id, unit)
    local DB = ns.DB
    if not DB then return nil end
    local getter = unit and DB.GetNpc or DB.GetObject
    if type(getter) ~= "function" then return nil end
    local ok, entry = pcall(getter, id)
    if not ok or type(entry) ~= "table" then return nil end
    local spawns = entry.spawns
    if type(spawns) ~= "table" then return nil end
    return spawns, entry.name
end

local function uiMapFor(areaID)
    local Zones = ns.Zones
    if not Zones or type(Zones.GetUiMapIdByAreaId) ~= "function" then return nil end
    local ok, uiMapID = pcall(Zones.GetUiMapIdByAreaId, areaID)
    if not ok then return nil end
    return uiMapID
end

-- uiMapID -> which node ids appear on it. Only the ids, not their coordinates: one ore vein id
-- carries hundreds of spawn points and there are hundreds of ids, so materialising every
-- coordinate up front would be megabytes for the sake of one zone's worth of pins.
local function buildIndex()
    mapIndex = {}
    local defs = definitions()
    if not defs then return mapIndex end
    local seen = 0
    for id, def in pairs(defs) do
        if type(def) == "table" and type(id) == "number" then
            local spawns = spawnsFor(id, def.unit)
            if spawns then
                for areaID in pairs(spawns) do
                    local uiMapID = uiMapFor(areaID)
                    if uiMapID then
                        local bucket = mapIndex[uiMapID]
                        if not bucket then bucket = {}; mapIndex[uiMapID] = bucket end
                        bucket[#bucket + 1] = { id = id, unit = def.unit and true or false, areaID = areaID }
                    end
                end
                seen = seen + 1
            end
        end
    end
    Log.Debug("Professions", "index built: %d nodes with spawns", seen)
    return mapIndex
end

--- Professions.ResetCache(): drops the id index and every per-map node list. Called when the
-- database finishes loading, when the profile changes and when a new node is learned from play.
function M.ResetCache()
    mapIndex = nil
    wipe(nodeCache)
end

-- What play has taught us, kept in the saved variable so a MoP ore vein is on the map again the
-- next time the player opens it - hub or no hub (docs/10 A4).
local function learnedStore()
    local store = globalStore()
    if not store then return nil end
    if type(store.nodes) ~= "table" then store.nodes = {} end
    return store.nodes
end

-- `source` says where the node came from and is the one thing that separates the three: "seed" is
-- pfQuest's classic data, "learned" is this character gathering it, "community" is the hub's
-- aggregate of everybody else's gathers. `sightings` travels with the last of those, so a place
-- one person found once is not presented as a place forty people agree on.
local function addNode(out, id, def, uiMapID, x, y, unit, source, sightings)
    if #out >= MAX_NODES_PER_MAP then return false end
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
        source = source or "seed",
        learned = source == "learned",
    }
    if type(sightings) == "number" and sightings > 0 then node.sightings = sightings end
    -- The shared contract calls the identifier `objectId`; a rare is a creature and honestly has
    -- none, so it carries `npcId` instead and ns.NodeTooltip resolves it through entityType.
    if unit then
        node.npcId = id
        node.entityType, node.entityID = "npc", id
    else
        node.objectId = id
        node.entityType, node.entityID = "object", id
    end
    node.gatherable = M.IsGatherable(node)
    out[#out + 1] = node
    return true
end

local function appendLearned(out, uiMapID, wanted)
    local learned = learnedStore()
    if not learned then return end
    for id, entry in pairs(learned) do
        if type(entry) == "table" and (not wanted or wanted[id] == nil) and M.KindEnabled(entry.k) then
            local def = { kind = entry.k, skill = entry.s, name = entry.n }
            local spawns = entry.p
            if type(spawns) == "table" then
                for key in pairs(spawns) do
                    local map, x, y = Util.SplitAreaSpawnKey(key)
                    if map == uiMapID then
                        if not addNode(out, id, def, uiMapID, x, y, entry.u, "learned") then return end
                    end
                end
            end
        end
    end
end

-- The third source, after the pfQuest seed and this character's own gathers: everybody else's,
-- aggregated by the hub (docs/10 D3; platform/server/pandaquest_hub/nodes.py builds it). Shape:
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

local function appendCommunity(out, uiMapID, wanted)
    local found = communityNodes()
    if not found then return end
    local learned = learnedStore()
    local DB = ns.DB
    for id, entry in pairs(found) do
        local mine = learned and learned[id]
        if type(id) == "number" and type(entry) == "table" and type(entry.k) == "string"
           and (not wanted or wanted[id] == nil) and not mine and M.KindEnabled(entry.k) then
            local places = entry.p
            if type(places) == "table" then
                -- No skill and no name travel with a community node: the hub aggregates positions,
                -- not the skill requirement it would have to invent, and the object's name is
                -- whatever this client's own database calls it in this client's own locale. An
                -- absent skill means IsGatherable falls through to "anyone with the profession",
                -- which is the honest answer rather than a guess at 275 Mining.
                local name = nil
                if DB and DB.GetObjectName then
                    local ok, got = pcall(DB.GetObjectName, id)
                    if ok and type(got) == "string" then name = got end
                end
                local def = { kind = entry.k, skill = nil, name = name }
                for i = 1, #places do
                    local place = places[i]
                    if type(place) == "table" and place.m == uiMapID
                       and type(place.x) == "number" and type(place.y) == "number" then
                        if not addNode(out, id, def, uiMapID, place.x * 100, place.y * 100,
                                       false, "community", place.n) then
                            return
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

--- Professions.NodesForMap(uiMapID) -> { {objectId, x, y, kind, skill, name, gatherable}, ... }
-- Always an array: a map with no profession data returns an empty one rather than nil, so the
-- caller never has to ask twice. The array is cached per map and rebuilt by ResetCache.
function M.NodesForMap(uiMapID)
    if type(uiMapID) ~= "number" then return {} end
    local cached = nodeCache[uiMapID]
    if cached then return cached end

    local out = {}
    nodeCache[uiMapID] = out
    local defs = definitions()
    local index = mapIndex or buildIndex()
    local bucket = index[uiMapID]
    local wanted = nil
    if bucket and defs then
        wanted = {}
        for i = 1, #bucket do
            local entry = bucket[i]
            local def = defs[entry.id]
            if def and M.KindEnabled(def.kind) then
                wanted[entry.id] = true
                local spawns = spawnsFor(entry.id, entry.unit)
                local coords = spawns and spawns[entry.areaID]
                if type(coords) == "table" then
                    local limit = #coords
                    if limit > MAX_SPAWNS_PER_NODE then limit = MAX_SPAWNS_PER_NODE end
                    for j = 1, limit do
                        local c = coords[j]
                        if type(c) == "table" then
                            if not addNode(out, entry.id, def, uiMapID, c[1], c[2], entry.unit, "seed") then break end
                        end
                    end
                end
            end
        end
    end
    appendLearned(out, uiMapID, wanted)
    appendCommunity(out, uiMapID, wanted)
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

local ICON_FALLBACK = "custom"

local function iconFor(kind)
    local Icons = ns.Icons
    local map = Icons and Icons.PROFESSION_ICONS
    local name = map and map[kind]
    if type(name) == "string" then return name end
    return ICON_FALLBACK
end

-- Faded, and why. A node out of reach is dim because the player cannot take it; a node this
-- session already emptied is dim because it is not there. Both are docs/10: "the node is drawn
-- faint until it comes back".
local function alphaFor(node, spawnKey)
    if not node.gatherable then return UNGATHERABLE_ALPHA end
    if not M.RespawnCountdown() then return 1 end
    local Respawn = ns.Respawn
    if not Respawn or type(Respawn.GetRemaining) ~= "function" then return 1 end
    local kind = node.unit and "npc" or "object"
    local ok, remaining = pcall(Respawn.GetRemaining, kind, node.id, spawnKey)
    if ok and type(remaining) == "number" and remaining > 0 then return DEPLETED_ALPHA end
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
                node.icon = iconFor(node.kind)
                node.key = key
                local spec = {
                    key = key, uiMapID = uiMapID, x = node.x, y = node.y,
                    layer = LAYER, rank = 5, count = 1,
                    targets = { node }, keys = { [key] = true },
                    -- What ns.NodeTooltip.Fill reads straight off the spec (docs/10 B3).
                    kind = node.kind, skill = node.skill, name = node.name,
                    gatherable = node.gatherable, spawnKey = spawnKey,
                    source = node.source, sightings = node.sightings,
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

--- Professions.SourceFromLoot() -> objectId|nil, guid|nil
-- GetLootSourceInfo(slot) returns (guid, quantity) pairs; the first GameObject GUID in the window
-- is the thing that was gathered. A creature corpse has a Creature GUID and is deliberately not a
-- node - a mob dying is the respawn module's business, not this one's.
function M.SourceFromLoot()
    if type(GetNumLootItems) ~= "function" or type(GetLootSourceInfo) ~= "function" then return nil end
    local okCount, count = pcall(GetNumLootItems)
    if not okCount or type(count) ~= "number" then return nil end
    if count < 1 then count = 1 end                 -- an emptied node still reports its source
    for slot = 1, count do
        local ok, guid = pcall(GetLootSourceInfo, slot)
        if ok and type(guid) == "string" then
            local id = Util.ObjectIdFromGuid(guid)
            if id then return id, guid end
        end
    end
    return nil
end

local function isFishingLoot()
    if type(IsFishingLoot) ~= "function" then return false end
    local ok, fishing = pcall(IsFishingLoot)
    return ok and fishing and true or false
end

--- Professions.ClassifyLoot(objectId) -> kind|nil, skill|nil, name|nil
-- Seed first (it knows the skill and the name), then the gathering cast, then the fishing flag.
-- Nothing else: an unclassifiable game object is a quest crate as often as it is a treasure, and
-- docs/10's rule is that a value we do not have is absent rather than guessed.
function M.ClassifyLoot(objectId)
    local defs = definitions()
    local def = defs and objectId and defs[objectId]
    if type(def) == "table" and def.kind then
        return def.kind, def.skill, def.name
    end
    local learned = learnedStore()
    local known = learned and objectId and learned[objectId]
    if type(known) == "table" and known.k then
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
    local key = Util.SpawnKey(uiMapID, x, y)
    if entry.p[key] then
        entry.p[key] = entry.p[key] + 1
        return false
    end
    local spawnCount = 0
    for _ in pairs(entry.p) do spawnCount = spawnCount + 1 end
    if spawnCount >= MAX_LEARNED_SPAWNS then return false end
    entry.p[key] = 1
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

    local isNew = rememberLearned(id, kind, skill, name, unit, uiMapID, x, y)
    if isNew then M.ResetCache() end

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

--- Professions.GetObservations() -> this session's gathers, oldest first. Read-only.
function M.GetObservations()
    return observations
end

--- Professions.OnLootOpened() -> observation|nil. The LOOT_OPENED handler, split out so a test
-- can call it directly and read what it decided.
function M.OnLootOpened()
    local objectId, guid = M.SourceFromLoot()
    if not objectId then return nil end

    -- LOOT_OPENED fires again when the window is re-shown for the same object; one gather is one
    -- observation, so the same GUID inside a minute is ignored.
    local at = now()
    if lastLoot.guid == guid and (at - lastLoot.at) >= 0 and (at - lastLoot.at) < DEDUPE_WINDOW then
        return nil
    end
    lastLoot.guid, lastLoot.at = guid, at

    local kind, skill, name = M.ClassifyLoot(objectId)
    if not kind then return nil end

    local Player = ns.Player
    local pos = Player and Player.GetPosition and Player.GetPosition() or nil
    if not pos or not pos.uiMapID or type(pos.x) ~= "number" then return nil end

    return M.RecordGather(objectId, kind, pos.uiMapID, pos.x * 100, pos.y * 100, false, skill, name)
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

local function redraw()
    M.ResetCache()
    local Pins = ns.Pins
    if Pins and Pins.Redraw then Pins.Redraw() end
end
M.Redraw = redraw

function M.Init()
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
        redraw()
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
    M:RegisterEvent("ZONE_CHANGED_NEW_AREA", redraw)
    local frame = _G and _G.WorldMapFrame
    if frame then
        if frame.HookScript then pcall(frame.HookScript, frame, "OnShow", redraw) end
        if type(frame.OnMapChanged) == "function" and hooksecurefunc then
            pcall(hooksecurefunc, frame, "OnMapChanged", redraw)
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
