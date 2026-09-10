-- Map/Pins.lua: world-map and minimap pins through HereBeDragons-Pins-2.0 (docs/06 section 10).
--
-- Model (Questie's QuestieMap, see docs/liitteet/A section 5): targets are folded into "specs",
-- one per coordinate, so several quests that share a spawn become a single pin with one tooltip.
-- The specs are then drained by a draw queue that creates at most PINS_PER_FRAME frames per
-- OnUpdate, which keeps a 300-pin zone from freezing the client for a second.
local _, ns = ...
local L = ns.L

local Const, Util, Log = ns.Const, ns.Util, ns.Log

local M = {}
ns.Pins = M

local type, pairs, tostring, format = type, pairs, tostring, string.format
local tremove, tsort, floor, sqrt, huge = table.remove, table.sort, math.floor, math.sqrt, math.huge
local wipe = wipe or function(t) for k in pairs(t) do t[k] = nil end return t end

local PINS_PER_FRAME = 24           -- docs/06 section 10: max 24 pins drawn per frame
local MAX_PINS = 300                -- hard cap; a zone with more spawns than this is unreadable anyway
local REDRAW_DELAY = 0.2            -- coalesce redraw bursts (three messages can arrive in one frame)
local HBD_REF = "PandaQuest"

-- docs/10 B2: the minimap. The pins are re-ranked and re-faded four times a second rather than
-- every frame -- the player cannot move far enough in 250 ms for it to show, and the work is
-- proportional to the number of pins.
local MINIMAP_TICK = 0.25
local DEFAULT_MINIMAP_MAX_NODES = 50
local DEFAULT_MINIMAP_FADE = 0.6    -- pins inside this fraction of the minimap radius stay opaque
local EDGE_MIN_ALPHA = 0.30         -- how faint a pin gets right on the edge
local EDGE_MIN_SCALE = 0.65         -- and how much it shrinks (pfQuest's fade_range does both)

-- docs/10 C2: a spawn this session watched die is drawn faint until it is back. The same value
-- Nodes/Professions.lua uses for an emptied vein, so the two layers fade alike.
local RESPAWN_PENDING_ALPHA = 0.35

-- Layer per Target.kind (docs/06 section 10).
local KIND_LAYER = {
    OBJECTIVE = "objective", ITEMUSE = "objective", EXPLORE = "objective",
    TURNIN = "turnin", PICKUP = "available", CUSTOM = "custom",
}
local LAYERS = { "available", "objective", "turnin", "custom", "profession" }
-- Layers that mirror a profile key; "custom" is always on (the player placed it by hand).
local LAYER_PROFILE_KEY = { available = "showAvailable", objective = "showObjectives", turnin = "showTurnIn" }
-- Which icon wins when two targets share a coordinate: turn-ins first, then objectives.
-- "profession" sorts last: an ore vein must never take a pin slot from a quest objective when the
-- MAX_PINS cap bites (docs/10 D1). Nodes/Professions.lua owns its own visibility (the whole
-- profile.professions block), so it has no LAYER_PROFILE_KEY entry - only a runtime override.
local LAYER_RANK = { turnin = 1, objective = 2, custom = 3, available = 4, profession = 5 }

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local specs = {}                    -- array of pin specs, rebuilt on Redraw
local queue = {}                    -- specs waiting for a frame
local queueIndex = 1
local activeWorld = {}              -- pin frame -> spec
local activeMinimap = {}
local placed = {}                   -- spec key -> { spec = spec, world = pin, mini = pin }
local pool = {}                     -- free pin frames
local pinCount = 0
local currentKey = nil              -- Router's current target key (highlight)
local redrawPending = false
local driver                        -- OnUpdate frame that drains the queue
local layerOverride = {}            -- runtime SetLayerVisible values (nil = follow the profile)
local minimapDriver                 -- OnUpdate frame for the minimap rank/fade tick
local minimapElapsed = 0
local rankScratch = {}              -- reused by rankMinimapSpecs: an OnUpdate must not allocate
local nextRespawnAt                 -- GetTime() at which the soonest drawn countdown runs out

local function profile()
    local PQ = ns.PQ
    return PQ and PQ.db and PQ.db.profile
end

local function mapProfile()
    local p = profile()
    return p and p.map
end

local function hbdPins()
    if not LibStub then return nil end
    local ok, lib = pcall(LibStub, "HereBeDragons-Pins-2.0", true)
    if ok then return lib end
    return nil
end

local function hbd()
    if not LibStub then return nil end
    local ok, lib = pcall(LibStub, "HereBeDragons-2.0", true)
    if ok and type(lib) == "table" then return lib end
    return nil
end

---------------------------------------------------------------------------
-- Layers
---------------------------------------------------------------------------

--- Pins.IsLayerVisible(layer) -> bool. Runtime overrides win over the profile keys.
function M.IsLayerVisible(layer)
    if layerOverride[layer] ~= nil then return layerOverride[layer] end
    local key = LAYER_PROFILE_KEY[layer]
    if not key then return true end                 -- "custom" and unknown layers stay on
    local map = mapProfile()
    if not map then return true end
    return map[key] ~= false
end

--- Pins.SetLayerVisible(layer, visible): toggles a layer and redraws. Layers that own a profile
-- key write it back so the choice survives a reload; the rest live for this session only.
function M.SetLayerVisible(layer, visible)
    if not LAYER_RANK[layer] then return false end
    visible = visible and true or false
    local key = LAYER_PROFILE_KEY[layer]
    local map = mapProfile()
    if key and map then
        map[key] = visible
        layerOverride[layer] = nil
        local PQ = ns.PQ
        if PQ and PQ.SendMessage then PQ:SendMessage("PQ_SETTING_CHANGED", "map." .. key, visible) end
    else
        layerOverride[layer] = visible
    end
    M.Redraw()
    return true
end

--- Pins.GetLayers() -> the four layer names, in draw order.
function M.GetLayers()
    return LAYERS
end

---------------------------------------------------------------------------
-- Pin frames
---------------------------------------------------------------------------

local onEnter, onLeave, onClick

local function acquirePin()
    local pin = tremove(pool)
    if pin then return pin end
    if not CreateFrame then return nil end
    pinCount = pinCount + 1
    pin = CreateFrame("Button", "PandaQuestPin" .. pinCount, UIParent)
    pin:SetSize(16, 16)
    -- The three layers of a dot (docs/10 B1), back to front: the highlight glow, the dark ring
    -- that makes the dot readable on snow, sand and grass alike, and the dot (or glyph) itself.
    -- The ring is a texture of its own rather than part of node.tga because the dot is tinted per
    -- quest and a baked-in rim would be tinted with it.
    pin.glow = pin:CreateTexture(nil, "BACKGROUND")
    pin.glow:SetPoint("CENTER", pin, "CENTER", 0, 0)
    pin.glow:SetTexture(ns.Icons and ns.Icons.Get("glow") or nil)
    pin.glow:Hide()
    pin.outline = pin:CreateTexture(nil, "BORDER")
    pin.outline:SetPoint("CENTER", pin, "CENTER", 0, 0)
    pin.outline:Hide()
    pin.texture = pin:CreateTexture(nil, "OVERLAY")
    pin.texture:SetPoint("CENTER", pin, "CENTER", 0, 0)
    pin.count = pin:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmallOutline")
    pin.count:SetPoint("CENTER", pin, "CENTER", 0, 0)
    pin.count:Hide()
    if pin.RegisterForClicks then pin:RegisterForClicks("LeftButtonUp", "RightButtonUp") end
    pin:SetScript("OnEnter", onEnter)
    pin:SetScript("OnLeave", onLeave)
    pin:SetScript("OnClick", onClick)
    return pin
end

local function releasePin(pin)
    if not pin then return end
    pin.spec = nil
    pin.data = nil
    pin.context = nil
    pin.miniRank = nil
    pin.baseSize = nil
    if pin.glow then pin.glow:Hide() end
    if pin.outline then pin.outline:Hide() end
    if pin.count then pin.count:Hide() end
    if pin.SetAlpha then pin:SetAlpha(1) end
    if pin.EnableMouse then pin:EnableMouse(true) end
    pin:Hide()
    pool[#pool + 1] = pin
end

--- Draws one pin's look: the dot or the glyph, its ring, its cluster count and its size. All of
-- that lives in Map/Icons.lua; this is the one call site so a redraw and a rescale agree.
local function applyLook(pin, spec, minimap)
    local Icons = ns.Icons
    if not Icons then return end
    if Icons.ApplyNode then
        local _, size = Icons.ApplyNode(pin, spec, minimap)
        pin.baseSize = size
    elseif Icons.Apply then
        Icons.Apply(pin.texture, spec and spec.targets and spec.targets[1], minimap, pin)
    end
    -- A spec may ask to be drawn faint: docs/10 D2's ungatherable node, and a profession node this
    -- session already emptied. Written on every apply, not only when it is below 1, so a node that
    -- has come back stops being faint without waiting for a fresh frame out of the pool.
    if pin.SetAlpha then pin:SetAlpha((spec and spec.alpha) or 1) end
end

local function applyHighlight(pin)
    if not pin or not pin.glow then return end
    local spec = pin.spec
    local on = false
    if currentKey and spec and spec.keys then
        on = spec.keys[currentKey] and true or false
    end
    if on then
        local size = (pin:GetWidth() or 16) * 1.8
        pin.glow:SetSize(size, size)
        pin.glow:Show()
    else
        pin.glow:Hide()
    end
end

---------------------------------------------------------------------------
-- Spec building
---------------------------------------------------------------------------

local function isHidden(questID)
    if not questID then return false end
    local PQ = ns.PQ
    local char = PQ and PQ.db and PQ.db.char
    if char and char.hiddenQuests and char.hiddenQuests[questID] then return true end
    if ns.DB and ns.DB.IsQuestHiddenOnMap and ns.DB.IsQuestHiddenOnMap(questID) then return true end
    return false
end

local function uiMapFor(target, spawn)
    local uiMapID = spawn and spawn.uiMapID or nil
    if not uiMapID and spawn and spawn.areaID and ns.Zones and ns.Zones.GetUiMapIdByAreaId then
        uiMapID = ns.Zones.GetUiMapIdByAreaId(spawn.areaID)
    end
    return uiMapID or target.uiMapID
end

-- Coordinate merge key. clusterSpawns rounds to whole percent (~1 % of the zone), which folds a
-- pack of mobs into one pin; without it the key keeps a tenth of a percent.
local function coordKey(uiMapID, x, y, cluster)
    if cluster then
        return format("%d:%d:%d", uiMapID, floor(x + 0.5), floor(y + 0.5))
    end
    return format("%d:%.1f:%.1f", uiMapID, x, y)
end

local function addSpawn(byKey, target, layer, uiMapID, x, y, cluster)
    if type(uiMapID) ~= "number" or type(x) ~= "number" or type(y) ~= "number" then return end
    if x < 0 or x > 100 or y < 0 or y > 100 then return end
    local key = coordKey(uiMapID, x, y, cluster)
    local spec = byKey[key]
    if not spec then
        if #specs >= MAX_PINS then return end
        spec = { key = key, uiMapID = uiMapID, x = x, y = y, layer = layer,
                 rank = LAYER_RANK[layer] or 9, count = 0, targets = {}, keys = {} }
        byKey[key] = spec
        specs[#specs + 1] = spec
    end
    spec.count = spec.count + 1
    if not spec.keys[target.key] then
        spec.keys[target.key] = true
        spec.targets[#spec.targets + 1] = target
    end
    local rank = LAYER_RANK[layer] or 9
    if rank < spec.rank then
        spec.rank, spec.layer = rank, layer
    end
end

--- Rebuilds `specs` from ns.Targets. Allocates, so it only runs from Redraw, never per frame.
local function buildSpecs()
    wipe(specs)
    local byKey = {}
    local Targets = ns.Targets
    local list = Targets and Targets.GetAll and Targets.GetAll() or nil
    if type(list) ~= "table" then return 0 end
    local map = mapProfile()
    local cluster = not map or map.clusterSpawns ~= false
    for i = 1, #list do
        local target = list[i]
        local layer = target and (KIND_LAYER[target.kind] or "objective")
        if target and M.IsLayerVisible(layer) and not isHidden(target.questID) then
            local spawns = target.spawns
            if type(spawns) == "table" and #spawns > 0 then
                for j = 1, #spawns do
                    local spawn = spawns[j]
                    addSpawn(byKey, target, layer, uiMapFor(target, spawn), spawn.x, spawn.y, cluster)
                end
            else
                addSpawn(byKey, target, layer, target.uiMapID, target.x, target.y, cluster)
            end
        end
    end
    -- docs/10 D1: the profession layer contributes specs of its own (mines, herbs, fishing pools,
    -- chests, rares). It is added last so the quest pins have already claimed their slots, and it
    -- does its own filtering - Pins only places what it is handed.
    local Professions = ns.Professions
    if Professions and Professions.BuildSpecs and M.IsLayerVisible("profession") then
        local ok, err = pcall(Professions.BuildSpecs, specs, byKey, MAX_PINS)
        if not ok then Log.Debug("Pins", "profession specs failed: %s", tostring(err)) end
    end
    -- docs/10 C2 and acceptance criterion 3: a spawn this session watched die is drawn faint until
    -- ns.Respawn says it is back. The profession layer has already stamped its own alpha (it also
    -- fades a node the character cannot gather), so this only fills in the quest layers.
    M.ApplyRespawnFade(specs)
    return #specs
end

---------------------------------------------------------------------------
-- The respawn fade (docs/10 C2)
---------------------------------------------------------------------------

--- Pins.RespawnFadeEnabled() -> bool. The same switch that dims an emptied ore vein
-- (profile.professions.respawnCountdown, "Fade nodes you have emptied") governs a killed mob:
-- there is one countdown in this addon and one toggle for it. Missing module means on, because
-- the fade is a consequence of an observation the player just made.
function M.RespawnFadeEnabled()
    local Professions = ns.Professions
    if Professions and type(Professions.RespawnCountdown) == "function" then
        local ok, on = pcall(Professions.RespawnCountdown)
        if ok then return on and true or false end
    end
    return true
end

--- Pins.ApplyRespawnFade(list) -> how many specs were dimmed. Stamps `spec.alpha` on every spec
-- whose entity ns.Respawn is counting down, and clears it again when the countdown has run out --
-- written on every rebuild rather than only when it is below 1, so a spawn that came back is not
-- left faint until something else happens to redraw it.
function M.ApplyRespawnFade(list)
    list = list or specs
    nextRespawnAt = nil
    local Respawn = ns.Respawn
    if type(Respawn) ~= "table" or type(Respawn.GetRemaining) ~= "function" then return 0 end
    if not M.RespawnFadeEnabled() then return 0 end
    local NodeTooltip = ns.NodeTooltip
    if not (NodeTooltip and NodeTooltip.ResolveEntity) then return 0 end
    local t = (GetTime and GetTime()) or 0
    local dimmed = 0
    for i = 1, #list do
        local spec = list[i]
        -- The profession layer answers for its own nodes: it knows whether the character can
        -- gather them at all, which this cannot see.
        if spec.layer ~= "profession" then
            local ok, kind, id = pcall(NodeTooltip.ResolveEntity, spec)
            if ok and (kind == "npc" or kind == "object") and type(id) == "number" then
                local key = spec.spawnKey or Util.SpawnKey(spec.uiMapID, spec.x, spec.y)
                spec.spawnKey = key
                local safe, remaining = pcall(Respawn.GetRemaining, kind, id, key)
                if safe and type(remaining) == "number" and remaining > 0 then
                    spec.alpha = RESPAWN_PENDING_ALPHA
                    dimmed = dimmed + 1
                    -- When the soonest of these runs out nothing in the game fires an event -- the
                    -- spawn is back whether or not the player is looking at it -- so the moment is
                    -- remembered and the 4 Hz tick below turns it into one redraw.
                    if not nextRespawnAt or t + remaining < nextRespawnAt then
                        nextRespawnAt = t + remaining
                    end
                else
                    spec.alpha = nil
                end
            end
        end
    end
    return dimmed
end

--- Pins.GetNextRespawnAt() -> GetTime() value|nil. When the soonest drawn countdown runs out.
function M.GetNextRespawnAt()
    return nextRespawnAt
end

--- Pins.CheckRespawnExpiry() -> true when it asked for a redraw. A countdown reaching zero is the
-- one state change nothing announces, so it is polled -- once per minimap tick, one comparison.
function M.CheckRespawnExpiry()
    if not nextRespawnAt then return false end
    local t = (GetTime and GetTime()) or 0
    if t < nextRespawnAt then return false end
    nextRespawnAt = nil
    M.RequestRedraw()
    return true
end

---------------------------------------------------------------------------
-- Minimap: nearest-first cap and edge fade (docs/10 B2)
---------------------------------------------------------------------------

--- Pins.GetMinimapMaxNodes() -> how many pins the minimap may carry at once.
function M.GetMinimapMaxNodes()
    local map = mapProfile()
    local n = map and map.minimapMaxNodes
    if type(n) ~= "number" or n ~= n then n = DEFAULT_MINIMAP_MAX_NODES end
    n = floor(n)
    if n < 1 then n = 1 end
    if n > MAX_PINS then n = MAX_PINS end
    return n
end

--- Pins.GetMinimapFade() -> 0..0.95. The fraction of the minimap radius inside which a pin is
-- fully opaque; 0 turns the fade off entirely.
function M.GetMinimapFade()
    local map = mapProfile()
    local f = map and map.minimapFade
    if type(f) ~= "number" or f ~= f then f = DEFAULT_MINIMAP_FADE end
    if f < 0 then f = 0 end
    if f > 0.95 then f = 0.95 end
    return f
end

-- The world position of a spec, resolved once per redraw (specs are rebuilt from scratch, so the
-- cache never goes stale). HereBeDragons is the only thing that knows how a zone's percentages
-- map onto continent yards.
local function specWorld(spec, HBD)
    if spec.worldResolved then return spec.worldX, spec.worldY, spec.instanceID end
    spec.worldResolved = true
    if HBD and HBD.GetWorldCoordinatesFromZone then
        local ok, wx, wy, instance = pcall(HBD.GetWorldCoordinatesFromZone, HBD,
            spec.x / 100, spec.y / 100, spec.uiMapID)
        if ok and wx then
            spec.worldX, spec.worldY, spec.instanceID = wx, wy, instance
        end
    end
    return spec.worldX, spec.worldY, spec.instanceID
end

local function playerPos()
    local Player = ns.Player
    local pos = Player and Player.GetPosition and Player.GetPosition() or nil
    if pos and pos.worldX then return pos end
    return nil
end

local function distanceFrom(pos, spec, HBD)
    if not pos then return nil end
    local wx, wy, instance = specWorld(spec, HBD)
    if not wx or instance ~= pos.instanceID then return nil end
    local dx, dy = wx - pos.worldX, wy - pos.worldY
    return sqrt(dx * dx + dy * dy)
end

--- Pins.GetSpecDistance(spec) -> yards|nil. nil means "not comparable" (another continent, or no
-- player position), which sorts last rather than first.
function M.GetSpecDistance(spec)
    if not spec then return nil end
    return distanceFrom(playerPos(), spec, hbd())
end

local function byDistance(a, b)
    local da, db = a.dist or huge, b.dist or huge
    if da == db then return (a.key or "") < (b.key or "") end   -- stable: keys are unique
    return da < db
end

--- Ranks every spec by distance from the player and stamps spec.miniRank (1 = nearest).
-- The scratch array and the comparator are module-level, and the player position and the library
-- are read once rather than per spec, so the 4 Hz tick allocates nothing and stays O(n log n).
local function rankMinimapSpecs()
    wipe(rankScratch)
    local pos, HBD = playerPos(), hbd()
    for i = 1, #specs do
        local spec = specs[i]
        spec.dist = distanceFrom(pos, spec, HBD)
        rankScratch[#rankScratch + 1] = spec
    end
    tsort(rankScratch, byDistance)
    for i = 1, #rankScratch do rankScratch[i].miniRank = i end
    return #rankScratch
end
M.RankMinimapSpecs = rankMinimapSpecs

--- Pins.WantsMinimapPin(spec) -> bool. The cap of docs/10 B2, applied nearest first: a spec with
-- no rank yet (a fresh redraw before the first tick) is allowed, or nothing would ever be drawn.
function M.WantsMinimapPin(spec)
    if not spec then return false end
    local rank = spec.miniRank
    if not rank then return true end
    return rank <= M.GetMinimapMaxNodes()
end

-- How far a placed minimap pin sits from the centre of the minimap, as a fraction of its radius.
-- HereBeDragons anchors every minimap pin with SetPoint("CENTER", Minimap, "CENTER", dx, dy), so
-- the offsets it already computed are the answer; asking for them costs two table lookups and no
-- allocation, where recomputing yards per zoom level would need HBD's private radius tables.
local function edgeRatio(pin)
    if not pin or not pin.GetPoint then return nil end
    local minimap = _G and _G.Minimap
    if not minimap or not minimap.GetWidth then return nil end
    local radius = (minimap:GetWidth() or 0) / 2
    if radius <= 0 then return nil end
    local _, _, _, dx, dy = pin:GetPoint(1)
    if type(dx) ~= "number" or type(dy) ~= "number" then return nil end
    return sqrt(dx * dx + dy * dy) / radius
end

--- Pins.ApplyMinimapFade(pin) -> alpha. Dims and shrinks a pin as it approaches the minimap edge
-- (pfQuest's fade_range), and takes an over-cap pin down to alpha 0 with its mouse off, which is
-- what "not drawn" has to mean for a frame HereBeDragons keeps re-showing every update.
function M.ApplyMinimapFade(pin)
    if not pin then return 1 end
    local alpha, shrink = 1, 1
    local rank = pin.miniRank
    if rank and rank > M.GetMinimapMaxNodes() then
        alpha = 0
    else
        local fade = M.GetMinimapFade()
        if fade > 0 then
            local ratio = edgeRatio(pin)
            if ratio and ratio > fade then
                local t = (ratio - fade) / (1 - fade)
                if t > 1 then t = 1 end
                alpha = 1 - t * (1 - EDGE_MIN_ALPHA)
                shrink = 1 - t * (1 - EDGE_MIN_SCALE)
            end
        end
    end
    -- The spec's own alpha (an ungatherable or already-emptied profession node) multiplies the
    -- edge fade rather than being overwritten by it: both reasons to be faint are still true.
    local spec = pin.spec
    if spec and type(spec.alpha) == "number" then alpha = alpha * spec.alpha end
    -- Always written back, not only while fading: turning the fade off has to put a pin that was
    -- already shrunk back to full size without waiting for the next redraw.
    local base = pin.baseSize
    if base and pin.SetSize then pin:SetSize(base * shrink, base * shrink) end
    if pin.SetAlpha then pin:SetAlpha(alpha) end
    if pin.EnableMouse then pin:EnableMouse(alpha > 0.1) end
    return alpha
end

--- Pins.UpdateMinimapNodes() -> ranked, capped. Re-ranks the specs, fades the placed pins and
-- asks for a redraw when the nearest set changed (a pin came into the cap, or fell out of it).
function M.UpdateMinimapNodes()
    local map = mapProfile()
    if map and map.showOnMinimap == false then return 0, 0 end
    local ranked = rankMinimapSpecs()
    local cap = M.GetMinimapMaxNodes()
    local capped, dirty = 0, false
    for _key, rec in pairs(placed) do
        local spec = rec.spec
        if rec.mini then
            rec.mini.miniRank = spec and spec.miniRank
            local alpha = M.ApplyMinimapFade(rec.mini)
            if alpha <= 0 then capped = capped + 1 end
            if spec and spec.miniRank and spec.miniRank > cap then dirty = true end
        elseif spec and spec.miniRank and spec.miniRank <= cap then
            dirty = true
        end
    end
    if dirty then M.RequestRedraw() end
    return ranked, capped
end

local function onMinimapTick(_, elapsed)
    minimapElapsed = minimapElapsed + (elapsed or 0)
    if minimapElapsed < MINIMAP_TICK then return end
    minimapElapsed = 0
    M.CheckRespawnExpiry()
    M.UpdateMinimapNodes()
end

local function ensureMinimapDriver()
    if minimapDriver or not CreateFrame then return minimapDriver end
    minimapDriver = CreateFrame("Frame", "PandaQuestMinimapDriver", UIParent)
    minimapDriver:SetScript("OnUpdate", onMinimapTick)
    minimapDriver:Hide()
    return minimapDriver
end

---------------------------------------------------------------------------
-- Draw queue
---------------------------------------------------------------------------

local function placePin(spec, minimap)
    local lib = hbdPins()
    if not lib then return nil end
    local pin = acquirePin()
    if not pin then return nil end
    pin.spec = spec
    pin.data = spec.targets[1]
    pin.context = minimap and "minimap" or "world"
    applyLook(pin, spec, minimap)
    local map = mapProfile()
    local ok
    if minimap then
        local float = not map or map.fadeMinimapEdge ~= false
        ok = lib:AddMinimapIconMap(HBD_REF, pin, spec.uiMapID, spec.x / 100, spec.y / 100, false, float)
    else
        ok = lib:AddWorldMapIconMap(HBD_REF, pin, spec.uiMapID, spec.x / 100, spec.y / 100)
    end
    if not ok then
        releasePin(pin)
        return nil
    end
    applyHighlight(pin)
    return pin
end

--- Removes both pins of one spec key from the maps and returns the frames to the pool.
local function removePlaced(key)
    local rec = placed[key]
    if not rec then return end
    local lib = hbdPins()
    if rec.world then
        if lib then lib:RemoveWorldMapIcon(HBD_REF, rec.world) end
        activeWorld[rec.world] = nil
        releasePin(rec.world)
    end
    if rec.mini then
        if lib then lib:RemoveMinimapIcon(HBD_REF, rec.mini) end
        activeMinimap[rec.mini] = nil
        releasePin(rec.mini)
    end
    placed[key] = nil
end

--- Draws up to `budget` queued specs. Returns how many were drawn.
function M.ProcessQueue(budget)
    budget = budget or PINS_PER_FRAME
    local map = mapProfile()
    local wantMinimap = not map or map.showOnMinimap ~= false
    local drawn = 0
    while drawn < budget and queueIndex <= #queue do
        local spec = queue[queueIndex]
        queueIndex = queueIndex + 1
        local rec = placed[spec.key]
        if not rec then
            rec = { spec = spec }
            placed[spec.key] = rec
        end
        rec.spec = spec
        -- A spec can be queued for its missing half only (the minimap was switched back on).
        if not rec.world then
            local world = placePin(spec, false)
            if world then
                activeWorld[world] = spec
                rec.world = world
            end
        end
        if wantMinimap and M.WantsMinimapPin(spec) and not rec.mini then
            local mini = placePin(spec, true)
            if mini then
                activeMinimap[mini] = spec
                rec.mini = mini
            end
        end
        if not rec.world and not rec.mini then placed[spec.key] = nil end
        drawn = drawn + 1
    end
    if queueIndex > #queue then
        wipe(queue)
        queueIndex = 1
        if driver then driver:Hide() end
    end
    return drawn
end

local function ensureDriver()
    if driver or not CreateFrame then return driver end
    driver = CreateFrame("Frame", "PandaQuestPinDriver", UIParent)
    driver:Hide()
    driver:SetScript("OnUpdate", function()
        -- No allocations here: ProcessQueue only pulls from the pre-built queue.
        M.ProcessQueue(PINS_PER_FRAME)
    end)
    return driver
end

---------------------------------------------------------------------------
-- Public draw API
---------------------------------------------------------------------------

--- Pins.Clear(): removes every pin from both maps and returns the frames to the pool.
function M.Clear()
    local lib = hbdPins()
    if lib then
        lib:RemoveAllWorldMapIcons(HBD_REF)
        lib:RemoveAllMinimapIcons(HBD_REF)
    end
    for pin in pairs(activeWorld) do releasePin(pin) end
    for pin in pairs(activeMinimap) do releasePin(pin) end
    wipe(activeWorld)
    wipe(activeMinimap)
    wipe(placed)
    wipe(queue)
    queueIndex = 1
    if driver then driver:Hide() end
    if minimapDriver then minimapDriver:Hide() end
    nextRespawnAt = nil
end

--- Pins.Redraw([immediate]) -> number of specs. Rebuilds the pin set as a DIFF against what is
-- already on the maps: a redraw arrives on every quest-log tick, and clearing everything first made
-- the whole zone blink while the queue refilled it 24 pins per frame. Only the pins whose
-- coordinate disappeared are removed; unchanged ones are refreshed in place and never re-created.
-- Without `immediate` the new pins are spread over the following frames (24 each); with it they
-- are all drawn at once (used by tests and /pq reset).
function M.Redraw(immediate)
    redrawPending = false
    local p = profile()
    if not p then return 0 end
    local count = buildSpecs()
    local map = mapProfile()
    local wantMinimap = not map or map.showOnMinimap ~= false
    -- docs/10 B2: which minimap pins survive the cap is decided here, nearest first, before a
    -- single frame is taken out of the pool -- an arbitrary slice of the spec list would drop the
    -- spawn the player is standing next to as readily as the one across the zone.
    if wantMinimap then rankMinimapSpecs() end

    local byKey = {}
    for i = 1, count do byKey[specs[i].key] = specs[i] end
    for key, rec in pairs(placed) do
        local spec = byKey[key]
        if not spec or spec.uiMapID ~= rec.spec.uiMapID or spec.x ~= rec.spec.x or spec.y ~= rec.spec.y then
            removePlaced(key)
        end
    end

    wipe(queue)
    queueIndex = 1
    local kept, lib = 0, hbdPins()
    for i = 1, count do
        local spec = specs[i]
        local rec = placed[spec.key]
        if rec then
            -- Same coordinate: the quests behind it (and therefore icon and tooltip) may still have
            -- changed, so the existing frames are re-pointed instead of being torn down.
            rec.spec = spec
            if rec.world then
                activeWorld[rec.world] = spec
                rec.world.spec, rec.world.data = spec, spec.targets[1]
                applyLook(rec.world, spec, false)
                applyHighlight(rec.world)
            end
            if rec.mini and not (wantMinimap and M.WantsMinimapPin(spec)) then
                if lib then lib:RemoveMinimapIcon(HBD_REF, rec.mini) end
                activeMinimap[rec.mini] = nil
                releasePin(rec.mini)
                rec.mini = nil
            elseif rec.mini then
                activeMinimap[rec.mini] = spec
                rec.mini.spec, rec.mini.data = spec, spec.targets[1]
                applyLook(rec.mini, spec, true)
                applyHighlight(rec.mini)
            end
            kept = kept + 1
            if wantMinimap and M.WantsMinimapPin(spec) and not rec.mini then queue[#queue + 1] = spec end
        else
            queue[#queue + 1] = spec
        end
    end

    local pending = #queue
    if pending == 0 then
        if driver then driver:Hide() end
    elseif immediate then
        M.ProcessQueue(pending * 2 + 1)
    else
        local d = ensureDriver()
        if d then d:Show() else M.ProcessQueue(pending * 2 + 1) end
    end
    local mini = select(2, M.GetPinCount())
    local ticker = ensureMinimapDriver()
    if ticker then
        -- The tick also polls the respawn countdown (docs/10 C2), so it has to run while one is
        -- outstanding even when the minimap layer itself is off.
        if (wantMinimap and (mini > 0 or pending > 0)) or nextRespawnAt then
            ticker:Show()
        else
            ticker:Hide()
        end
    end
    Log.Debug("Pins", "redraw: %d pins (%d kept, %d queued)", count, kept, pending)
    return count
end

-- Coalesces the redraw bursts that arrive when Targets, Availability and Router all update.
local function requestRedraw()
    if redrawPending then return end
    redrawPending = true
    if C_Timer and C_Timer.After then
        C_Timer.After(REDRAW_DELAY, function()
            if redrawPending then M.Redraw() end
        end)
    else
        M.Redraw()
    end
end
M.RequestRedraw = requestRedraw

--- Pins.SetCurrent(target|nil): highlights the pins that carry the router's current target.
function M.SetCurrent(target)
    local key = target and target.key or nil
    if key == currentKey then return end
    currentKey = key
    for pin in pairs(activeWorld) do applyHighlight(pin) end
    for pin in pairs(activeMinimap) do applyHighlight(pin) end
end

--- Pins.ShowTarget(target): opens the world map on the target's zone (Arrow's "Show on map").
function M.ShowTarget(target)
    if not target or not target.uiMapID then return false end
    local frame = _G and _G.WorldMapFrame
    if not frame then return false end
    if frame.SetMapID then pcall(frame.SetMapID, frame, target.uiMapID) end
    if not frame:IsShown() and frame.Show then frame:Show() end
    M.SetCurrent(target)
    return true
end

---------------------------------------------------------------------------
-- Map geometry (docs/10 section E)
---------------------------------------------------------------------------

--- Pins.RefreshSizes() -> how many pins were resized. Re-applies every pin's look at the map's
-- current effective scale. No frame is created or released, which is the whole point: a map addon
-- that rescales the canvas while the map is open must not churn the pool.
function M.RefreshSizes()
    local n = 0
    for pin, spec in pairs(activeWorld) do
        applyLook(pin, spec, false)
        applyHighlight(pin)
        n = n + 1
    end
    for pin, spec in pairs(activeMinimap) do
        applyLook(pin, spec, true)
        applyHighlight(pin)
        M.ApplyMinimapFade(pin)
        n = n + 1
    end
    return n
end

--- Pins.ReanchorWorld() -> how many pins were re-anchored.
--
-- The world map's pin positions are computed from the canvas' width at the moment the pin is
-- acquired (MapCanvasMixin:SetPinPosition). When something resizes the canvas without going
-- through Blizzard -- which is exactly what a `WorldMapFrame:SetSize` from another addon does,
-- since WorldMapFrame has no OnSizeChanged script in 5.5.4 -- those positions are left behind.
-- Handing the same frame back to HereBeDragons makes the provider acquire it again against the
-- canvas as it is now. Nothing here touches a Blizzard frame (docs/10 E4).
function M.ReanchorWorld()
    local lib = hbdPins()
    if not lib then return 0 end
    local n = 0
    for _key, rec in pairs(placed) do
        local pin, spec = rec.world, rec.spec
        if pin and spec then
            lib:RemoveWorldMapIcon(HBD_REF, pin)
            if lib:AddWorldMapIconMap(HBD_REF, pin, spec.uiMapID, spec.x / 100, spec.y / 100) then
                n = n + 1
            end
        end
    end
    return n
end

--- Pins.OnMapGeometryChanged(reason): the ns.MapCompat listener. Sizes first (they are derived
-- from the effective scale), then the anchors.
function M.OnMapGeometryChanged(reason)
    M.RefreshSizes()
    M.ReanchorWorld()
    Log.Debug("Pins", "map geometry changed (%s)", tostring(reason))
end

---------------------------------------------------------------------------
-- Introspection (options UI, tests)
---------------------------------------------------------------------------

function M.GetSpecs() return specs end
function M.GetPinCount()
    local world, mini = 0, 0
    for _ in pairs(activeWorld) do world = world + 1 end
    for _ in pairs(activeMinimap) do mini = mini + 1 end
    return world, mini
end
function M.GetQueueLength() return #queue - (queueIndex - 1) end
function M.GetCurrentKey() return currentKey end
function M.GetPoolSize() return #pool end
--- Pins.GetCreatedCount() -> how many pin frames have ever been created. Constant across a
-- rescale/redraw cycle is what "does not leak frames" means (docs/10 E6).
function M.GetCreatedCount() return pinCount end
--- Pins.GetDetachedCount() -> how many pins ON a map still hang off UIParent (docs/10 E5). Zero.
function M.GetDetachedCount()
    local Compat = ns.MapCompat
    if not Compat or not Compat.IsDetached then return 0 end
    local n = 0
    for pin in pairs(activeWorld) do
        if Compat.IsDetached(pin) then n = n + 1 end
    end
    for pin in pairs(activeMinimap) do
        if Compat.IsDetached(pin) then n = n + 1 end
    end
    return n
end
--- Pins.GetPin(key, minimap) -> the placed frame for one spec key (tests).
function M.GetPin(key, minimap)
    local rec = placed[key]
    if not rec then return nil end
    if minimap then return rec.mini end
    return rec.world
end
M.DEFAULT_MINIMAP_MAX_NODES = DEFAULT_MINIMAP_MAX_NODES
M.DEFAULT_MINIMAP_FADE = DEFAULT_MINIMAP_FADE
M.MINIMAP_TICK = MINIMAP_TICK
M.PINS_PER_FRAME = PINS_PER_FRAME
M.MAX_PINS = MAX_PINS

---------------------------------------------------------------------------
-- Tooltip
---------------------------------------------------------------------------

--- Fills `lines` (an array, reused) with the tooltip text for a spec. Kept separate from the
-- tooltip frame so tests and the options preview can read the same text.
function M.BuildTooltipLines(spec, lines)
    lines = lines or {}
    wipe(lines)
    if not spec then return lines end
    local targets = spec.targets
    for i = 1, #targets do
        local target = targets[i]
        local title = target.questTitle or (target.questID and format("#%d", target.questID)) or L["Custom target"]
        if target.questLevel then
            title = Util.ColorText(format("[%d] %s", target.questLevel, title),
                Util.QuestDifficultyColorHex(target.questLevel))
        end
        lines[#lines + 1] = title
        if target.text then
            lines[#lines + 1] = "  " .. target.text
        end
    end
    local Router = ns.Router
    local distance = Router and Router.GetDistanceTo and Router.GetDistanceTo(targets[1]) or nil
    if distance then
        lines[#lines + 1] = Util.FormatDistance(distance)
    end
    if spec.count and spec.count > 1 then
        lines[#lines + 1] = format(L["%d spawns here"], spec.count)
    end
    lines[#lines + 1] = L["Left-click: navigate here"]
    lines[#lines + 1] = L["Shift-click: send to TomTom"]
    lines[#lines + 1] = L["Right-click: more options"]
    return lines
end

local tooltipLines = {}

--- Pins.HINTS: the three click hints, in order. Shown under either tooltip body.
local HINTS = { "Left-click: navigate here", "Shift-click: send to TomTom", "Right-click: more options" }

function onEnter(self)
    local spec = self.spec
    if not spec or not GameTooltip then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:ClearLines()
    GameTooltip:AddLine(Const.CHAT_PREFIX)
    -- docs/10 B3: the pfQuest-style block (name, level, type, respawn, quests with their drop
    -- rates) is Map/NodeTooltip's job. It takes a spec directly. When it has nothing to say --
    -- a custom waypoint, say -- the plain line list below is still the right answer.
    local NodeTooltip = ns.NodeTooltip
    if NodeTooltip and NodeTooltip.Fill and NodeTooltip.Fill(GameTooltip, spec) then
        for i = 1, #HINTS do
            GameTooltip:AddLine(L[HINTS[i]], 1, 1, 1, true)
        end
        GameTooltip:Show()
        return
    end
    local lines = M.BuildTooltipLines(spec, tooltipLines)
    for i = 1, #lines do
        GameTooltip:AddLine(lines[i], 1, 1, 1, true)
    end
    GameTooltip:Show()
end

function onLeave()
    if GameTooltip and GameTooltip.Hide then GameTooltip:Hide() end
end

---------------------------------------------------------------------------
-- Clicks
---------------------------------------------------------------------------

--- Builds the right-click menu for a spec (docs/06 section 10: hide quest, Wowhead).
function M.BuildMenu(spec)
    local target = spec and spec.targets[1]
    local menu = {
        { text = Const.CHAT_PREFIX, isTitle = true, notCheckable = true },
    }
    if target then
        menu[#menu + 1] = { text = L["Set as target"], notCheckable = true, func = function()
            if ns.Router and ns.Router.SetManualTarget then ns.Router.SetManualTarget(target) end
        end }
    end
    for i = 1, (spec and #spec.targets or 0) do
        local t = spec.targets[i]
        if t.questID then
            menu[#menu + 1] = { text = format(L["Hide quest: %s"], t.questTitle or tostring(t.questID)),
                notCheckable = true, func = function()
                    local db = ns.PQ and ns.PQ.db
                    if db then db.char.hiddenQuests[t.questID] = true end
                    if ns.Targets and ns.Targets.Rebuild then ns.Targets.Rebuild("pinHide") end
                    M.Redraw()
                end }
            menu[#menu + 1] = { text = format(L["Wowhead: %s"], t.questTitle or tostring(t.questID)),
                notCheckable = true, func = function()
                    if ns.Wowhead and ns.Wowhead.ShowCopyDialog and ns.Wowhead.QuestUrl then
                        ns.Wowhead.ShowCopyDialog(ns.Wowhead.QuestUrl(t.questID))
                    end
                end }
        end
    end
    menu[#menu + 1] = { text = L["Close"], notCheckable = true, func = function() end }
    return menu
end

--- Pins.OpenMenu(spec, owner): right-click menu for a pin. 5.5.4 has no EasyMenu (it was removed
-- with the old dropdown builders), so the entries go through the shared MenuUtil shim in Nav/Arrow,
-- which falls back to chat when even MenuUtil is missing.
function M.OpenMenu(spec, owner)
    local menu = M.BuildMenu(spec)
    M.lastMenu = menu
    local Arrow = ns.Arrow
    if Arrow and Arrow.ShowContextMenu then
        M.lastMenuMode = Arrow.ShowContextMenu(owner, menu)
    end
    return menu
end

function onClick(self, button)
    local spec = self.spec
    -- A profession node is not a quest target, so there is nothing for the router to route to and
    -- Nodes/Professions.lua decides what a click means (docs/10 D1).
    if spec and spec.layer == "profession" then
        local Professions = ns.Professions
        if Professions and Professions.OnPinClick then pcall(Professions.OnPinClick, spec, button) end
        return
    end
    local target = spec and spec.targets[1]
    if not target then return end
    if button == "RightButton" then
        M.OpenMenu(spec, self)
        return
    end
    local shift = IsShiftKeyDown and IsShiftKeyDown()
    if shift then
        local TomTom = ns.TomTomBridge
        if TomTom and TomTom.IsAvailable and TomTom.IsAvailable() and TomTom.SetWaypoint then
            TomTom.SetWaypoint(target)
            return
        end
        Log.Print(L["TomTom is not loaded."])
        return
    end
    if ns.Router and ns.Router.SetManualTarget then
        ns.Router.SetManualTarget(target)
    end
end

M.OnPinClick = onClick
M.OnPinEnter = onEnter

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    wipe(layerOverride)
end

function M.Enable()
    -- docs/10 E2: a scale or canvas-size change has to reach the pins that are already drawn.
    -- ns.MapCompat owns the detection; Pins only says what to do about it.
    local Compat = ns.MapCompat
    if Compat and Compat.RegisterListener then Compat.RegisterListener(M.OnMapGeometryChanged) end

    -- AceEvent keeps one callback per (object, message), and every module would otherwise share
    -- ns.PQ as that object and silently overwrite each other. Each module embeds its own.
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if not AceEvent then return end
    AceEvent:Embed(M)
    M:RegisterMessage("PQ_TARGETS_UPDATED", function() requestRedraw() end)
    M:RegisterMessage("PQ_AVAILABLE_UPDATED", function() requestRedraw() end)
    M:RegisterMessage("PQ_CURRENT_TARGET_CHANGED", function(_, target) M.SetCurrent(target) end)
    -- docs/10 C2: ns.Respawn announces a death and a return once, from the event that noticed it,
    -- and this is what turns that into a fade appearing and going away again. It goes through the
    -- same coalescing redraw as everything else, so a pull that kills six mobs is one rebuild.
    M:RegisterMessage("PQ_RESPAWN_CHANGED", function() requestRedraw() end)
    Log.Debug("Pins", "enabled (HBD pins %s)", hbdPins() and "ready" or "missing")
end

function M.OnDataReady()
    requestRedraw()
end

function M.OnProfileChanged()
    wipe(layerOverride)
    M.Redraw()
end
