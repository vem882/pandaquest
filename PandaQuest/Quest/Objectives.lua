-- Quest/Objectives.lua: turns a quest into navigable Targets (docs/06 sections 8, 9.1 and 9.3).
--
-- The quest log tells us WHAT is missing ("Dappled Moth slain: 3/8"); the database tells us WHERE
-- ("npc 57232 spawns at areaID 5785, 56.2/60.8"). This module joins the two and produces the Target
-- tables the whole navigation layer speaks. It sends no messages and keeps no state beyond caches -
-- Nav/Targets.lua owns the lifecycle.
--
-- Spawn lists can hold thousands of points, so every entity is reduced to ONE representative point
-- by density: the coordinate with the most neighbours inside a +-5 % box wins, and the neighbour
-- count becomes the arrival radius hint (`count`). Map addons commonly cluster this way.
local _, ns = ...
local L = ns.L

local M = {}
ns.Objectives = M

local Const, Log = ns.Const, ns.Log

local type, pairs, ipairs, pcall = type, pairs, ipairs, pcall
local format, lower = string.format, string.lower
local ceil, huge = math.ceil, math.huge
local tsort = table.sort

local CLUSTER_BOX = 5                   -- +-5 % of the zone
local CLUSTER_SCAN_MAX = 240            -- cap the O(n^2) neighbour scan; larger lists are strided
local MAX_SPAWNS = 60                   -- docs/06 section 9.1: the pin list is thinned to 60 points
local MAX_ITEM_SOURCES = 12             -- one target per drop source, but not for a 200-mob item
local MAX_TARGETS_PER_QUEST = 24
local OTHER_CONTINENT_PENALTY = 500000  -- a target on another continent always sorts after a local one

local PRIORITY = Const.TARGET_PRIORITY or
    { OBJECTIVE = 10, ITEMUSE = 10, EXPLORE = 10, TURNIN = 5, PICKUP = 30, CUSTOM = 10 }

local HBD
local function hbd()
    if HBD == nil then
        HBD = (LibStub and LibStub("HereBeDragons-2.0", true)) or false
    end
    return HBD or nil
end

local function db()
    local DB = ns.DB
    if DB and DB.IsReady and DB.IsReady() then return DB end
    return nil
end

---------------------------------------------------------------------------
-- Spawn handling
---------------------------------------------------------------------------

--- collectSpawns({[areaID] = {{x,y[,phase]},...}}, out) -> out = { {areaID=, x=, y=}, ... }
-- {-1,-1} means "inside this instance"; Zones.ResolveSpawn turns it into the instance portal.
local function collectSpawns(spawns, out)
    if type(spawns) ~= "table" then return out end
    local Zones = ns.Zones
    for areaID, list in pairs(spawns) do
        if type(areaID) == "number" and type(list) == "table" then
            for i = 1, #list do
                local coord = list[i]
                if type(coord) == "table" and type(coord[1]) == "number" and type(coord[2]) == "number" then
                    local a, x, y = areaID, coord[1], coord[2]
                    if x == -1 and y == -1 then
                        if Zones and Zones.ResolveSpawn then
                            a, x, y = Zones.ResolveSpawn(areaID, x, y)
                        else
                            a = nil
                        end
                    end
                    if a and x and y then
                        out[#out + 1] = { areaID = a, x = x, y = y }
                    end
                end
            end
        end
    end
    return out
end
M.CollectSpawns = collectSpawns

local function uiMapFor(areaID)
    local Zones = ns.Zones
    if Zones and Zones.GetUiMapIdByAreaId then
        return Zones.GetUiMapIdByAreaId(areaID)
    end
    return nil
end

--- worldFor(areaID, x, y) -> uiMapID|nil, worldX|nil, worldY|nil, instanceID|nil (x,y in 0..100)
local function worldFor(areaID, x, y)
    local uiMapID = uiMapFor(areaID)
    if not uiMapID then return nil end
    local lib = hbd()
    if not lib then return uiMapID end
    local wx, wy, instanceID = lib:GetWorldCoordinatesFromZone(x / 100, y / 100, uiMapID)
    return uiMapID, wx, wy, instanceID
end
M.WorldFor = worldFor

--- pickCluster(points, from, to) -> representative point, neighbour count
-- The point with the most neighbours inside a +-CLUSTER_BOX square; a stride thins very long lists.
local function pickCluster(points, from, to)
    local n = to - from + 1
    if n <= 0 then return nil, 0 end
    if n == 1 then return points[from], 1 end
    local stride = 1
    if n > CLUSTER_SCAN_MAX then stride = ceil(n / CLUSTER_SCAN_MAX) end
    local best, bestCount = points[from], 0
    for i = from, to, stride do
        local p = points[i]
        local xmin, xmax = p.x - CLUSTER_BOX, p.x + CLUSTER_BOX
        local ymin, ymax = p.y - CLUSTER_BOX, p.y + CLUSTER_BOX
        local count = 0
        for j = from, to, stride do
            local q = points[j]
            if q.x > xmin and q.x < xmax and q.y > ymin and q.y < ymax then
                count = count + 1
            end
        end
        if count > bestCount then
            best, bestCount = p, count
        end
    end
    return best, bestCount * stride
end

--- Groups the flat spawn list by areaID, clusters each area and returns the best candidate.
-- "Best" is the cluster nearest to the player when the player has a world position, otherwise the
-- densest one - a mob that lives in three zones should route you to the zone you are standing in.
local function chooseRepresentative(points)
    local n = #points
    if n == 0 then return nil, 0 end

    -- Sort by areaID so each area is one contiguous run (no extra tables per area).
    tsort(points, function(a, b)
        if a.areaID ~= b.areaID then return a.areaID < b.areaID end
        if a.x ~= b.x then return a.x < b.x end
        return a.y < b.y
    end)

    local Player = ns.Player
    local pos = Player and Player.GetPosition and Player.GetPosition() or nil
    local px, py, pInstance
    if pos then px, py, pInstance = pos.worldX, pos.worldY, pos.instanceID end

    local bestPoint, bestCount, bestScore = nil, 0, huge
    local from = 1
    for i = 1, n + 1 do
        if i > n or points[i].areaID ~= points[from].areaID then
            local rep, count = pickCluster(points, from, i - 1)
            if rep then
                local score
                if px and py then
                    local _, wx, wy, instanceID = worldFor(rep.areaID, rep.x, rep.y)
                    if wx and wy then
                        local dx, dy = wx - px, wy - py
                        score = (dx * dx + dy * dy) ^ 0.5
                        if instanceID ~= pInstance then score = OTHER_CONTINENT_PENALTY + score end
                    end
                end
                if score then
                    if score < bestScore then bestPoint, bestCount, bestScore = rep, count, score end
                elseif bestScore == huge and count > bestCount then
                    bestPoint, bestCount = rep, count
                end
            end
            from = i
        end
    end
    if not bestPoint then
        bestPoint, bestCount = points[1], 1
    end
    return bestPoint, bestCount
end
M.ChooseRepresentative = chooseRepresentative

--- Thins a spawn list down to MAX_SPAWNS evenly spread points, keeping the representative.
local function thinSpawns(points, keep)
    local n = #points
    if n <= MAX_SPAWNS then return points end
    local out, stride = {}, ceil(n / MAX_SPAWNS)
    local kept = false
    for i = 1, n, stride do
        local p = points[i]
        out[#out + 1] = p
        if p == keep then kept = true end
    end
    if keep and not kept then
        out[#out] = keep
    end
    return out
end

---------------------------------------------------------------------------
-- Target construction
---------------------------------------------------------------------------

local function newTarget(kind, questID, entry)
    return {
        key = nil,
        kind = kind,
        questID = questID,
        questTitle = entry and entry.title or (db() and ns.DB.GetQuestName(questID)) or nil,
        questLevel = entry and entry.level or (db() and ns.DB.GetQuestField(questID, "questLevel")) or nil,
        objectiveIndex = nil,
        objectiveText = nil,
        entityType = nil,
        entityID = nil,
        entityName = nil,
        areaID = nil,
        uiMapID = nil,
        x = nil,
        y = nil,
        count = 1,
        spawns = nil,
        worldX = nil,
        worldY = nil,
        instanceID = nil,
        text = nil,
        icon = nil,
        priority = PRIORITY[kind] or 10,
        distance = nil,
        communityAvgTime = nil,
        communityHotspot = nil,
    }
end

--- Places a target on the map from a flat spawn list. Returns false when nothing is placeable.
local function placeTarget(target, points)
    local rep, count = chooseRepresentative(points)
    if not rep then return false end
    local uiMapID, wx, wy, instanceID = worldFor(rep.areaID, rep.x, rep.y)
    if not uiMapID then return false end
    target.areaID = rep.areaID
    target.uiMapID = uiMapID
    target.x = rep.x
    target.y = rep.y
    target.worldX, target.worldY, target.instanceID = wx, wy, instanceID
    target.count = count > 0 and count or 1
    target.spawns = thinSpawns(points, rep)
    return true
end

---------------------------------------------------------------------------
-- Action texts (docs/06 section 9.3)
---------------------------------------------------------------------------

local function counts(target)
    local have = target.numFulfilled or 0
    local need = target.numRequired or 0
    return have, need
end

--- DescribeTarget(target) -> localized action string.
function M.DescribeTarget(target)
    if type(target) ~= "table" then return "" end
    local name = target.entityName or target.objectiveText or ""
    local have, need = counts(target)
    local withCount = need and need > 0

    if target.kind == "TURNIN" then
        return format(L["Turn in to %s"], name)
    elseif target.kind == "PICKUP" then
        return format(L["Pick up quest from %s"], name)
    elseif target.kind == "EXPLORE" then
        return format(L["Explore %s"], name)
    elseif target.kind == "ITEMUSE" then
        return format(L["Use %s on %s"], target.entityName or "", target.sourceName or target.objectiveText or "")
    elseif target.kind == "CUSTOM" then
        return target.text or name
    end

    -- OBJECTIVE
    if target.entityType == "npc" then
        if target.isTalk then
            return format(L["Talk to %s"], name)
        end
        if withCount then
            return format(L["Kill %s (%d/%d)"], name, have, need)
        end
        return format(L["Kill %s"], name)
    elseif target.entityType == "object" then
        if withCount then
            return format(L["Use %s (%d/%d)"], name, have, need)
        end
        return format(L["Use %s (%d/%d)"], name, have, need > 0 and need or 1)
    elseif target.entityType == "item" then
        local source = target.sourceName or ""
        if target.sourceType == "object" then
            if withCount then
                return format(L["Collect %s from %s (%d/%d)"], name, source, have, need)
            end
            return format(L["Loot %s from %s"], name, source)
        end
        if withCount then
            return format(L["Loot %s from %s (%d/%d)"], name, source, have, need)
        end
        return format(L["Loot %s from %s"], name, source)
    elseif target.entityType == "area" then
        return format(L["Explore %s"], name)
    end

    -- Blizzard POI fallback and anything we could not identify: the raw objective line.
    return target.objectiveText or name
end

local function finishTarget(target)
    target.text = M.DescribeTarget(target)
    return target
end

---------------------------------------------------------------------------
-- Database descriptors
---------------------------------------------------------------------------

local function descriptorName(DB, desc)
    if desc.kind == "npc" then
        return DB.GetNpcName(desc.id) or desc.text
    elseif desc.kind == "object" then
        return DB.GetObjectName(desc.id) or desc.text
    elseif desc.kind == "item" then
        return DB.GetItemName(desc.id) or desc.text
    elseif desc.kind == "killcredit" then
        return DB.GetNpcName(desc.id) or desc.text
    end
    return desc.text
end

--- Builds the per-type descriptor lists of a quest: what the database says this quest wants.
local function buildDescriptors(DB, quest)
    local byType = { monster = {}, object = {}, item = {}, event = {}, spell = {}, unknown = {}, extras = {} }
    if not quest then return byType end
    local objectives = quest.objectives
    if type(objectives) == "table" then
        for _, c in ipairs(objectives.creatures or {}) do
            if c.id then byType.monster[#byType.monster + 1] = { kind = "npc", id = c.id, text = c.text } end
        end
        for _, credit in ipairs(objectives.killCredits or {}) do
            local ids = credit.ids
            if type(ids) == "table" and ids[1] then
                byType.monster[#byType.monster + 1] =
                    { kind = "killcredit", id = credit.baseId or ids[1], ids = ids, text = credit.text }
            end
        end
        for _, o in ipairs(objectives.objects or {}) do
            if o.id then byType.object[#byType.object + 1] = { kind = "object", id = o.id, text = o.text } end
        end
        for _, item in ipairs(objectives.items or {}) do
            if item.id then byType.item[#byType.item + 1] = { kind = "item", id = item.id, text = item.text } end
        end
        for _, spell in ipairs(objectives.spells or {}) do
            byType.spell[#byType.spell + 1] =
                { kind = "spell", id = spell.spellId, itemId = spell.itemId, text = spell.text }
        end
    end
    if quest.triggerEnd then
        local area = { kind = "area", keyPart = "area", text = quest.triggerEnd.text,
                       coords = quest.triggerEnd.coords }
        byType.event[#byType.event + 1] = area
        byType.unknown[#byType.unknown + 1] = area
    end

    -- extraObjectives = {{spawnlist, icon, text, objectiveIndex, {{type, id},...}},...}: hand curated
    -- spawn lists that the normal creature/object/item tables do not cover.
    local extras = byType.extras
    if type(quest.extraObjectives) == "table" then
        for i, entry in ipairs(quest.extraObjectives) do
            if type(entry) == "table" and type(entry[1]) == "table" then
                extras[#extras + 1] = {
                    kind = "area",
                    keyPart = "extra" .. i,
                    coords = entry[1],
                    icon = type(entry[2]) == "string" and entry[2] or nil,
                    text = entry[3],
                    objectiveIndex = entry[4],
                }
            end
        end
    end

    return byType
end

--- Chooses the descriptors that belong to one log objective: by parsed name first (the only reliable
-- link), then positionally inside the objective's own type, and finally "everything of that type".
local function selectDescriptors(DB, objective, ordinal, byType, out)
    local list = byType[objective.type]
    if not list or #list == 0 then
        -- "event"/"unknown"/"progressbar" objectives may still be covered by an area trigger.
        list = byType.unknown
        if not list or #list == 0 then return out end
    end

    if objective.name then
        local wanted = lower(objective.name)
        for _, desc in ipairs(list) do
            local name = descriptorName(DB, desc)
            if name and lower(name) == wanted then
                out[#out + 1] = desc
            end
        end
        if #out > 0 then return out end
    end

    if list[ordinal] then
        out[#out + 1] = list[ordinal]
        return out
    end
    for _, desc in ipairs(list) do
        out[#out + 1] = desc
    end
    return out
end

---------------------------------------------------------------------------
-- Objective -> Targets
---------------------------------------------------------------------------

local function npcSpawns(DB, ids, out)
    for i = 1, #ids do
        local npc = DB.GetNpc(ids[i])
        if npc then collectSpawns(npc.spawns, out) end
    end
    return out
end

local function applyObjectiveFields(target, objective)
    target.objectiveIndex = objective.index
    target.objectiveText = objective.text
    target.numFulfilled = objective.numFulfilled
    target.numRequired = objective.numRequired
end

local function targetsForDescriptor(DB, questID, entry, objective, desc, out)
    local kind = "OBJECTIVE"
    if type(desc) ~= "table" or not desc.kind then return out end

    if desc.kind == "npc" or desc.kind == "killcredit" then
        local ids = desc.ids or { desc.id }
        local points = npcSpawns(DB, ids, {})
        if #points == 0 then return out end
        local target = newTarget(kind, questID, entry)
        applyObjectiveFields(target, objective)
        target.entityType = "npc"
        target.entityID = desc.id
        target.entityName = descriptorName(DB, desc) or objective.name or objective.text
        -- A "monster" objective without a counter in its text is a talk-to, not a kill.
        target.isTalk = (objective.name == nil)
        target.icon = target.isTalk and "talk" or "slay"
        target.key = format("q%d:o%d:npc%d", questID, objective.index, desc.id)
        if placeTarget(target, points) then out[#out + 1] = finishTarget(target) end
        return out
    end

    if desc.kind == "object" then
        local object = DB.GetObject(desc.id)
        if not object then return out end
        local points = collectSpawns(object.spawns, {})
        if #points == 0 then return out end
        local target = newTarget(kind, questID, entry)
        applyObjectiveFields(target, objective)
        target.entityType = "object"
        target.entityID = desc.id
        target.entityName = descriptorName(DB, desc) or objective.name or objective.text
        target.icon = "object"
        target.key = format("q%d:o%d:object%d", questID, objective.index, desc.id)
        if placeTarget(target, points) then out[#out + 1] = finishTarget(target) end
        return out
    end

    if desc.kind == "item" or desc.kind == "spell" then
        local itemID = desc.kind == "item" and desc.id or desc.itemId
        if not itemID then return out end
        local itemName = DB.GetItemName(itemID) or objective.name or desc.text
        local sources = DB.GetItemSources(itemID)
        local made = 0
        local function addSource(sourceType, sourceID)
            if made >= MAX_ITEM_SOURCES then return end
            local points
            if sourceType == "npc" then
                local npc = DB.GetNpc(sourceID)
                if not npc then return end
                points = collectSpawns(npc.spawns, {})
            else
                local object = DB.GetObject(sourceID)
                if not object then return end
                points = collectSpawns(object.spawns, {})
            end
            if #points == 0 then return end
            local target = newTarget(kind, questID, entry)
            applyObjectiveFields(target, objective)
            target.entityType = "item"
            target.entityID = itemID
            target.entityName = itemName
            target.sourceType = sourceType
            target.sourceID = sourceID
            target.sourceName = (sourceType == "npc" and DB.GetNpcName(sourceID)) or DB.GetObjectName(sourceID)
            target.icon = "loot"
            target.key = format("q%d:o%d:item%d:%s%d", questID, objective.index, itemID, sourceType, sourceID)
            if placeTarget(target, points) then
                out[#out + 1] = finishTarget(target)
                made = made + 1
            end
        end
        for _, npcID in ipairs(sources.npcs or {}) do addSource("npc", npcID) end
        for _, objectID in ipairs(sources.objects or {}) do addSource("object", objectID) end
        if made == 0 then
            for _, vendorID in ipairs(sources.vendors or {}) do addSource("npc", vendorID) end
        end
        return out
    end

    if desc.kind == "area" then
        local points = collectSpawns(desc.coords, {})
        if #points == 0 then return out end
        local target = newTarget("EXPLORE", questID, entry)
        applyObjectiveFields(target, objective)
        target.entityType = "area"
        target.entityName = desc.text or objective.text
        target.icon = desc.icon or "explore"
        target.key = format("q%d:o%d:%s", questID, objective.index, desc.keyPart or "area")
        if placeTarget(target, points) then out[#out + 1] = finishTarget(target) end
        return out
    end

    return out
end

-- C_QuestLog.SetMapForQuestPOIs mutates the client's SHARED quest-POI selection: Blizzard's own
-- QuestMapFrame draws its blobs and buttons from it (Wrath/QuestMapFrame.lua:31), so pointing it at
-- the player's zone from inside a rebuild would silently corrupt an open world map of another zone.
-- The list is therefore fetched at most once per second per map, and whatever selection Blizzard
-- had is restored immediately afterwards.
local poiCache = { uiMapID = nil, at = -1, list = nil }
local POI_CACHE_SECONDS = 1.0

local function questPoiList(uiMapID)
    local t = (GetTime and GetTime()) or 0
    if poiCache.uiMapID == uiMapID and (t - poiCache.at) < POI_CACHE_SECONDS then
        return poiCache.list
    end

    local previous
    if C_QuestLog.GetMapForQuestPOIs then
        local gotPrevious, prev = pcall(C_QuestLog.GetMapForQuestPOIs)
        if gotPrevious then previous = prev end
    end
    local switched = false
    if C_QuestLog.SetMapForQuestPOIs and previous ~= uiMapID then
        switched = pcall(C_QuestLog.SetMapForQuestPOIs, uiMapID)
        if switched and QuestMapUpdateAllQuests then pcall(QuestMapUpdateAllQuests) end
    end

    local ok, list = pcall(C_QuestLog.GetQuestsOnMap, uiMapID)

    if switched and previous then
        pcall(C_QuestLog.SetMapForQuestPOIs, previous)
        if QuestMapUpdateAllQuests then pcall(QuestMapUpdateAllQuests) end
    end

    poiCache.uiMapID = uiMapID
    poiCache.at = t
    poiCache.list = (ok and type(list) == "table") and list or nil
    return poiCache.list
end
M.InvalidatePoiCache = function() poiCache.uiMapID, poiCache.at, poiCache.list = nil, -1, nil end

--- Blizzard POI fallback (docs/06 section 8): when the database knows no spawn we still know the
-- blob the Blizzard map draws for this quest.
local function buildPoiTarget(questID, entry, objective)
    if not (C_QuestLog and C_QuestLog.GetQuestsOnMap) then return nil end
    local Player = ns.Player
    local pos = Player and Player.GetPosition and Player.GetPosition() or nil
    local uiMapID = pos and pos.uiMapID
    if not uiMapID and C_Map and C_Map.GetBestMapForUnit then
        uiMapID = C_Map.GetBestMapForUnit("player")
    end
    if not uiMapID then return nil end

    local list = questPoiList(uiMapID)
    if type(list) ~= "table" then return nil end
    for i = 1, #list do
        local poi = list[i]
        if poi and poi.questID == questID and poi.x and poi.y then
            local target = newTarget("OBJECTIVE", questID, entry)
            if objective then applyObjectiveFields(target, objective) end
            target.entityType = nil
            target.entityID = nil
            target.entityName = nil
            target.count = 1
            target.uiMapID = uiMapID
            target.x = poi.x * 100
            target.y = poi.y * 100
            local Zones = ns.Zones
            target.areaID = (Zones and Zones.GetAreaIdByUiMapId and Zones.GetAreaIdByUiMapId(uiMapID)) or nil
            local lib = hbd()
            if lib then
                target.worldX, target.worldY, target.instanceID = lib:GetWorldCoordinatesFromZone(poi.x, poi.y, uiMapID)
            end
            target.spawns = { { areaID = target.areaID, x = target.x, y = target.y } }
            target.icon = "event"
            target.key = format("q%d:o%d:poi", questID, objective and objective.index or 0)
            target.text = (objective and objective.text) or target.questTitle or ""
            return target
        end
    end
    return nil
end
M.BuildPoiTarget = buildPoiTarget

--- BuildForQuest(questID) -> { Target... } for every UNFINISHED objective of a quest in the log.
function M.BuildForQuest(questID)
    local out = {}
    if type(questID) ~= "number" then return out end
    local QuestLog = ns.QuestLog
    local entry = QuestLog and QuestLog.GetQuest and QuestLog.GetQuest(questID) or nil
    if not entry then return out end

    local DB = db()
    local quest = DB and DB.GetQuest(questID) or nil
    local byType = buildDescriptors(DB, quest)

    local ordinals = {}
    local objectives = entry.objectives or {}

    if #objectives == 0 then
        -- Some quests (pure exploration, "go there and talk") have no leader board at all.
        if DB then
            local pseudo = { index = 1, text = entry.title, type = "event",
                             finished = false, numFulfilled = 0, numRequired = 0 }
            local area = byType.unknown[1]
            if area then
                pseudo.text = area.text or entry.title
                targetsForDescriptor(DB, questID, entry, pseudo, area, out)
            end
            for _, extra in ipairs(byType.extras) do
                targetsForDescriptor(DB, questID, entry, pseudo, extra, out)
            end
        end
        if #out == 0 then
            local poi = buildPoiTarget(questID, entry, nil)
            if poi then out[#out + 1] = poi end
        end
        return out
    end

    for _, objective in ipairs(objectives) do
        if not objective.finished then
            local ordinal = (ordinals[objective.type] or 0) + 1
            ordinals[objective.type] = ordinal
            local before = #out
            if DB then
                local selected = selectDescriptors(DB, objective, ordinal, byType, {})
                for _, desc in ipairs(selected) do
                    if #out >= MAX_TARGETS_PER_QUEST then break end
                    targetsForDescriptor(DB, questID, entry, objective, desc, out)
                end
                -- extraObjectives are addressed by objective index (nil = applies to every objective).
                for _, extra in ipairs(byType.extras) do
                    if (not extra.objectiveIndex or extra.objectiveIndex == objective.index)
                        and #out < MAX_TARGETS_PER_QUEST then
                        targetsForDescriptor(DB, questID, entry, objective, extra, out)
                    end
                end
            end
            if #out == before then
                local poi = buildPoiTarget(questID, entry, objective)
                if poi then out[#out + 1] = poi end
            end
        else
            -- Finished objectives still consume their positional slot.
            ordinals[objective.type] = (ordinals[objective.type] or 0) + 1
        end
    end

    return out
end

---------------------------------------------------------------------------
-- Turn-in and pickup
---------------------------------------------------------------------------

local function bestGiver(DB, npcIDs, objectIDs)
    local best, bestPoints, bestScore = nil, nil, huge
    local Player = ns.Player
    local pos = Player and Player.GetPosition and Player.GetPosition() or nil

    local function consider(kind, id)
        local points
        if kind == "npc" then
            local npc = DB.GetNpc(id)
            if not npc then return end
            points = collectSpawns(npc.spawns, {})
        else
            local object = DB.GetObject(id)
            if not object then return end
            points = collectSpawns(object.spawns, {})
        end
        if #points == 0 then return end
        local score = huge
        if pos and pos.worldX then
            -- Score the SAME point the placement will use. points[1] comes out of pairs() over the
            -- spawn table, so for a giver that stands in several zones it can be a copy on another
            -- continent while another copy is next to the player.
            local rep = chooseRepresentative(points)
            if rep then
                local _, wx, wy, instanceID = worldFor(rep.areaID, rep.x, rep.y)
                if wx then
                    local dx, dy = wx - pos.worldX, wy - pos.worldY
                    score = (dx * dx + dy * dy) ^ 0.5
                    if instanceID ~= pos.instanceID then score = OTHER_CONTINENT_PENALTY + score end
                end
            end
        end
        if not best or score < bestScore then
            best, bestPoints, bestScore = { kind = kind, id = id }, points, score
        end
    end

    -- NPC and object givers compete in one pass: a quest that can be handed in at an object right
    -- next to the player must not route to an NPC across the zone just because NPCs are tried first.
    for _, id in ipairs(npcIDs or {}) do consider("npc", id) end
    for _, id in ipairs(objectIDs or {}) do consider("object", id) end
    return best, bestPoints
end

local function buildGiverTarget(questID, kind, npcIDs, objectIDs, icon)
    local DB = db()
    if not DB then return nil end
    local QuestLog = ns.QuestLog
    local entry = QuestLog and QuestLog.GetQuest and QuestLog.GetQuest(questID) or nil

    -- A quest handed out by an item (startedBy.items) has no world position of its own.
    local giver, points = bestGiver(DB, npcIDs, objectIDs)
    if not giver then return nil end

    local target = newTarget(kind, questID, entry)
    target.entityType = giver.kind
    target.entityID = giver.id
    target.entityName = (giver.kind == "npc" and DB.GetNpcName(giver.id)) or DB.GetObjectName(giver.id) or ""
    target.icon = icon
    target.key = format("q%d:%s", questID, kind == "TURNIN" and "turnin" or "pickup")
    if not placeTarget(target, points) then return nil end
    return finishTarget(target)
end

--- BuildTurnIn(questID) -> Target|nil (kind "TURNIN", priority 5).
function M.BuildTurnIn(questID)
    if type(questID) ~= "number" then return nil end
    local DB = db()
    local quest = DB and DB.GetQuest(questID)
    if not quest then return nil end
    local finishedBy = quest.finishedBy or {}
    return buildGiverTarget(questID, "TURNIN", finishedBy.npcs, finishedBy.objects, "complete")
end

--- BuildPickup(questID) -> Target|nil (kind "PICKUP", priority 30).
function M.BuildPickup(questID)
    if type(questID) ~= "number" then return nil end
    local DB = db()
    local quest = DB and DB.GetQuest(questID)
    if not quest then return nil end
    local startedBy = quest.startedBy or {}
    return buildGiverTarget(questID, "PICKUP", startedBy.npcs, startedBy.objects, "available")
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
end

function M.Enable()
    Log.Debug("Objectives", "ready (cluster box %d%%, max %d spawns per target)", CLUSTER_BOX, MAX_SPAWNS)
end
