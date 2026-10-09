-- Map/NodeTooltip.lua: the pfQuest-style node tooltip block.
--
-- The structure copied from the owner's screenshot:
--
--     Ferocious Grizzled Bear                  <- name, coloured by type
--     Level:                           11-12   <- a range when the NPC has one, a single number otherwise
--     Type:                             Unit   <- Unit | Object | Item | Area
--     Respawn:                6 Mins 53 Secs   <- only when ns.Respawn knows it
--     [!] A Recipe For Death                   <- quest name in its difficulty colour, status icon
--      - Grizzled Bear Heart: 0/6 (80%)        <- objective, live progress, drop rate if known
--
-- Two rules outrank the layout. A line whose value we do not have is left out entirely - never
-- "?", never "-", never 0. And progress comes from the
-- live quest log, not from the database, so a finished objective reads as finished.
--
-- The countdown is the one moving part: when ns.Respawn saw this spawn die, the respawn line
-- becomes "Respawn in 2 Mins 14 Secs" and keeps counting while the tooltip is open. It rewrites
-- that single font string (_G[name .. "TextRight" .. i], the same handle Blizzard's own
-- TooltipUtil.lua uses) instead of rebuilding the tooltip, and it only allocates when the whole
-- second changes - at most one string per second, nothing per frame.
local _, ns = ...

local Util, Log = ns.Util, ns.Log

local M = {}
ns.NodeTooltip = M

local type, pairs, format = type, pairs, string.format
local floor = math.floor
local wipe = wipe or function(t) for k in pairs(t) do t[k] = nil end return t end

local MAX_QUESTS = 6                -- a busy spawn can serve a dozen quests; keep the tooltip readable
local MAX_OBJECTIVES = 6            -- per quest
local MAX_NAME_CHARS = 42           -- long names wrap the tooltip into a paragraph otherwise
local MAX_OBJECTIVE_CHARS = 38
local TICK = 0.2                    -- countdown OnUpdate throttle

-- Line colours. The label/value pair matches the screenshot (plain white); the extras say where a
-- number came from without adding a word: grey for an estimate, gold for a running countdown.
local COLOR_LABEL = { 1, 1, 1 }
local COLOR_VALUE = { 1, 1, 1 }
local COLOR_ESTIMATE = { 0.75, 0.75, 0.75 }
local COLOR_COUNTDOWN = { 1, 0.82, 0 }
local COLOR_QUEST = { 1, 0.82, 0 }
local COLOR_OBJECTIVE = { 0.8, 0.8, 0.8 }
local COLOR_COMPLETE = { 0.2, 1, 0.2 }
local COLOR_DIM = { 0.5, 0.5, 0.5 }

local NAME_COLOR = {
    npc = { 1, 0.85, 0.3 },
    object = { 0.55, 0.9, 1 },
    item = { 0.85, 0.7, 1 },
    area = { 0.6, 1, 0.75 },
}

local TYPE_KEY = { npc = "Unit", object = "Object", item = "Item", area = "Area" }

local function tr(key)
    local L = ns.L
    return (L and L[key]) or key
end

---------------------------------------------------------------------------
-- Line records
---------------------------------------------------------------------------

local linePool = {}
local sharedLines = {}

local function newLine(lines)
    local n = #lines + 1
    local rec = linePool[n]
    if not rec then
        rec = {}
        linePool[n] = rec
    else
        wipe(rec)
    end
    lines[n] = rec
    return rec
end

local function addLine(lines, text, color, wrap, kind)
    if not text then return nil end
    color = color or COLOR_OBJECTIVE
    local rec = newLine(lines)
    rec.left, rec.kind, rec.wrap = text, kind, wrap and true or false
    rec.r, rec.g, rec.b = color[1], color[2], color[3]
    return rec
end

local function addDouble(lines, label, value, valueColor, kind)
    if not value then return nil end
    valueColor = valueColor or COLOR_VALUE
    local rec = newLine(lines)
    rec.left, rec.right, rec.kind = label, value, kind
    rec.r, rec.g, rec.b = COLOR_LABEL[1], COLOR_LABEL[2], COLOR_LABEL[3]
    rec.rr, rec.rg, rec.rb = valueColor[1], valueColor[2], valueColor[3]
    return rec
end

---------------------------------------------------------------------------
-- The entity a node stands on
---------------------------------------------------------------------------

-- A loot objective's Target carries the item as its entity and the mob that drops it as its
-- source; the pin sits on the mob, so that is what the header describes (the screenshot's
-- "Ferocious Grizzled Bear" over "Grizzled Bear Heart").
local function entityFromTarget(target)
    if type(target) ~= "table" then return nil end
    if target.entityType == "item" and target.sourceType and target.sourceID then
        return target.sourceType, target.sourceID, target.sourceName
    end
    if target.entityType then
        return target.entityType, target.entityID, target.entityName
    end
    return nil
end

local function dbName(kind, id)
    local DB = ns.DB
    if not DB or type(id) ~= "number" then return nil end
    if kind == "npc" and DB.GetNpcName then return DB.GetNpcName(id) end
    if kind == "object" and DB.GetObjectName then return DB.GetObjectName(id) end
    if kind == "item" and DB.GetItemName then return DB.GetItemName(id) end
    return nil
end

--- NodeTooltip.ResolveEntity(node) -> kind, id, name. Accepts a Target, a Pins spec (spec.targets)
-- or a profession node ({objectId, kind = "mine", skill, name}).
function M.ResolveEntity(node)
    if type(node) ~= "table" then return nil end
    if type(node.objectId) == "number" then
        return "object", node.objectId, node.name or dbName("object", node.objectId)
    end
    local targets = node.targets
    if type(targets) == "table" then
        for i = 1, #targets do
            local kind, id, name = entityFromTarget(targets[i])
            if kind then return kind, id, name or dbName(kind, id) end
        end
    end
    local kind, id, name = entityFromTarget(node)
    if kind then return kind, id, name or dbName(kind, id) end
    return nil
end

---------------------------------------------------------------------------
-- Header lines
---------------------------------------------------------------------------

-- Levels are missing far more often than they are present (Questie stores 0 for "unknown"), and a
-- "Level: 0" line would be exactly the guess this tooltip never makes.
local function levelText(kind, id, node)
    local level = node.level
    if type(level) == "number" and level > 0 then return format("%d", level) end
    local lo, hi = node.minLevel, node.maxLevel
    if lo == nil and hi == nil and kind == "npc" then
        local DB = ns.DB
        if DB and DB.GetNpcField and type(id) == "number" then
            lo, hi = DB.GetNpcField(id, "minLevel"), DB.GetNpcField(id, "maxLevel")
        end
    end
    if type(lo) ~= "number" or lo <= 0 then lo = nil end
    if type(hi) ~= "number" or hi <= 0 then hi = nil end
    if lo and hi and hi > lo then return format("%d-%d", lo, hi) end
    if lo then return format("%d", lo) end
    if hi then return format("%d", hi) end
    return nil
end

-- A spawn key is always in uiMapID space. A node that only carried an areaID is converted here
-- rather than leaving two numbering schemes in the same field: ns.Respawn then matches the map
-- strictly, and a kill in one zone can no longer count down an identical coordinate in another.
local function spawnKeyFor(node)
    if type(node.spawnKey) == "string" then return node.spawnKey end
    local map = node.uiMapID
    if type(map) ~= "number" and type(node.areaID) == "number" then
        local Zones = ns.Zones
        if Zones and type(Zones.GetUiMapIdByAreaId) == "function" then
            local ok, uiMapID = pcall(Zones.GetUiMapIdByAreaId, node.areaID)
            if ok and type(uiMapID) == "number" then map = uiMapID end
        end
        if type(map) ~= "number" then map = node.areaID end
    end
    if type(map) ~= "number" or type(node.x) ~= "number" or type(node.y) ~= "number" then return nil end
    return Util.SpawnKey(map, node.x, node.y)
end

-- ns.Respawn belongs to another module and may not be loaded (or may have no answer). Every call
-- is guarded so the tooltip degrades to "no respawn line" rather than erroring.
local function respawnFor(kind, id)
    local Respawn = ns.Respawn
    if not Respawn or type(Respawn.Get) ~= "function" or type(id) ~= "number" then return nil end
    local ok, seconds, source, samples = pcall(Respawn.Get, kind, id)
    if not ok or type(seconds) ~= "number" or seconds <= 0 then return nil end
    return seconds, source, (type(samples) == "number" and samples > 0) and samples or nil
end

local function remainingFor(kind, id, spawnKey)
    local Respawn = ns.Respawn
    if not Respawn or type(Respawn.GetRemaining) ~= "function" or type(id) ~= "number" then return nil end
    local ok, seconds = pcall(Respawn.GetRemaining, kind, id, spawnKey)
    if not ok or type(seconds) ~= "number" or seconds <= 0 then return nil end
    return seconds
end

--- NodeTooltip.RespawnText(kind, id) -> text|nil, colour. "6 Mins 53 Secs" when the seed knows it,
-- "~6 Mins 53 Secs (12)" when the number is a community median over 12 samples.
function M.RespawnText(kind, id)
    local seconds, source, samples = respawnFor(kind, id)
    if not seconds then return nil end
    local text = Util.FormatRespawn(seconds)
    if not text then return nil end
    if source == "community" or source == "observed" then
        if samples then
            return format(tr("~%s (%d)"), text, samples), COLOR_ESTIMATE
        end
        return "~" .. text, COLOR_ESTIMATE
    end
    return text, COLOR_VALUE
end

--- `allowCountdown` is false where a countdown would be a lie: the unit tooltip of a creature that
-- is standing in front of the player alive (Map/Tooltips.lua). Absent means true.
local function addRespawn(lines, kind, id, spawnKey, allowCountdown)
    local staticText, staticColor = M.RespawnText(kind, id)
    local remaining = allowCountdown ~= false and remainingFor(kind, id, spawnKey) or nil
    if remaining then
        -- Floor, not round: the countdown ticks over when the whole second changes, so the first
        -- text has to agree with what Tick() will write a second later.
        local text = Util.FormatRespawn(floor(remaining))
        if text then
            local rec = addDouble(lines, tr("Respawn in:"), text, COLOR_COUNTDOWN, "respawn")
            if rec then
                rec.live = true
                rec.entityKind, rec.entityID, rec.spawnKey = kind, id, spawnKey
                rec.staticText = staticText
            end
            return
        end
    end
    if staticText then
        addDouble(lines, tr("Respawn:"), staticText, staticColor, "respawn")
    end
end

---------------------------------------------------------------------------
-- Quests and objectives
---------------------------------------------------------------------------

-- pfQuest's progress gradient: red at nothing done, yellow halfway, green when full.
local function progressColor(have, need, out)
    if not need or need <= 0 then
        out[1], out[2], out[3] = COLOR_OBJECTIVE[1], COLOR_OBJECTIVE[2], COLOR_OBJECTIVE[3]
        return out
    end
    local perc = Util.Clamp((have or 0) / need, 0, 1)
    local r1, g1, b1, r2, g2, b2
    if perc <= 0.5 then
        perc = perc * 2
        r1, g1, b1, r2, g2, b2 = 1, 0.2, 0.2, 1, 1, 0.3
    else
        perc = perc * 2 - 1
        r1, g1, b1, r2, g2, b2 = 1, 1, 0.3, 0.3, 1, 0.3
    end
    out[1] = r1 + (r2 - r1) * perc
    out[2] = g1 + (g2 - g1) * perc
    out[3] = b1 + (b2 - b1) * perc
    return out
end

local gradient = { 1, 1, 1 }

--- NodeTooltip.DropRate(itemID, sourceKind, sourceID) -> percent|nil. Absent is absent: the
-- contract's ns.Data.dropRates only carries what pfQuest's db/items.lua measured.
function M.DropRate(itemID, sourceKind, sourceID)
    local Data = ns.Data
    local rates = Data and Data.dropRates
    if type(rates) ~= "table" or type(itemID) ~= "number" then return nil end
    local entry = rates[itemID]
    if type(entry) ~= "table" then return nil end
    local bucket = entry[sourceKind]
    if type(bucket) ~= "table" then return nil end
    local pct = bucket[sourceID]
    if type(pct) ~= "number" or pct <= 0 then return nil end
    return pct
end

local function questIsComplete(questID)
    local QuestLog = ns.QuestLog
    if not QuestLog then return false end
    if QuestLog.IsComplete and QuestLog.IsComplete(questID) then return true end
    local entry = QuestLog.GetQuest and QuestLog.GetQuest(questID) or nil
    local objectives = entry and entry.objectives
    if type(objectives) ~= "table" or #objectives == 0 then return false end
    for i = 1, #objectives do
        if not objectives[i].finished then return false end
    end
    return true
end

local function questTitle(target)
    if target.questTitle then return target.questTitle end
    local QuestLog = ns.QuestLog
    local entry = QuestLog and QuestLog.GetQuest and QuestLog.GetQuest(target.questID) or nil
    if entry and entry.title then return entry.title end
    if ns.DB and ns.DB.GetQuestName then
        local name = ns.DB.GetQuestName(target.questID)
        if name then return name end
    end
    return format("#%d", target.questID)
end

-- "[!] title" / "[?] title": grey brackets, gold symbol, the title itself in its difficulty
-- colour. Embedding the colour in the string (rather than colouring the line) lets the two live
-- side by side, which is what pfQuest does.
local function questLineText(target, complete)
    local symbol = complete and "?" or "!"
    local title = Util.Truncate(questTitle(target), MAX_NAME_CHARS)
    local level = target.questLevel
    if type(level) == "number" and level > 0 then
        title = Util.ColorText(title, Util.QuestDifficultyColorHex(level))
    end
    return "|cff555555[|cffffcc00" .. symbol .. "|cff555555]|r " .. title
end

local function objectiveState(target)
    local QuestLog = ns.QuestLog
    local objective = nil
    if QuestLog and QuestLog.GetObjective and target.objectiveIndex then
        objective = QuestLog.GetObjective(target.questID, target.objectiveIndex)
    end
    local name = (objective and objective.name) or target.entityName
        or (objective and objective.text) or target.objectiveText
    local have = objective and objective.numFulfilled or target.numFulfilled
    local need = objective and objective.numRequired or target.numRequired
    local finished = objective and objective.finished or false
    if not finished and type(need) == "number" and need > 0 and type(have) == "number" then
        finished = have >= need
    end
    return name, have, need, finished
end

local function addObjective(lines, target, headerKind, headerID)
    local name, have, need, finished = objectiveState(target)
    if not name then return false end
    local text = "|cffaaaaaa- |r" .. Util.Truncate(name, MAX_OBJECTIVE_CHARS)
    if type(need) == "number" and need > 0 then
        text = text .. format(": %d/%d", have or 0, need)
    end
    if target.entityType == "item" then
        local pct = M.DropRate(target.entityID, target.sourceType or headerKind,
            target.sourceID or headerID)
        if pct then
            -- Never the digit 0. Eight thousand of the seeded cells are below half a percent
            -- (Burning Charm is 0.32% off a Drywhisker Kobold), and rounding those to an integer
            -- printed "(0%)" - an assertion that the mob cannot drop the item, built out of data
            -- that says it does, which is exactly what this tooltip never does.
            if pct < 1 then
                text = text .. format(" (%.2f%%)", pct)
            else
                text = text .. format(" (%d%%)", floor(pct + 0.5))
            end
        end
    end
    local color = finished and COLOR_COMPLETE or progressColor(have, need, gradient)
    local rec = addLine(lines, text, color, true, "objective")
    if rec then
        rec.finished = finished and true or false
        rec.questID = target.questID
    end
    return true
end

-- Folds the node's targets into quest order, keeping the order they arrived in: one quest line
-- followed by that quest's objectives, then the next quest. The three scratch tables below are
-- pooled between calls, so a mouseover over a busy spawn does not allocate a table per quest.
local questOrder, questBuckets, bucketPool, seenObjectives = {}, {}, {}, {}
local singleton = {}

local function collectQuests(node)
    wipe(questOrder)
    for questID in pairs(questBuckets) do questBuckets[questID] = nil end
    local list = node.targets
    if type(list) ~= "table" or #list == 0 then
        if not node.questID then return end
        singleton[1] = node
        list = singleton
    end
    for i = 1, #list do
        local target = list[i]
        if type(target) == "table" and target.questID then
            local bucket = questBuckets[target.questID]
            if not bucket and #questOrder < MAX_QUESTS then
                local n = #questOrder + 1
                bucket = bucketPool[n]
                if bucket then wipe(bucket) else bucket = {}; bucketPool[n] = bucket end
                questBuckets[target.questID] = bucket
                questOrder[n] = target.questID
            end
            -- A quest past the cap is dropped, but the ones already listed keep collecting.
            if bucket then bucket[#bucket + 1] = target end
        end
    end
end

local function addQuests(lines, node, headerKind, headerID)
    collectQuests(node)
    for i = 1, #questOrder do
        local questID = questOrder[i]
        local bucket = questBuckets[questID]
        local complete = questIsComplete(questID)
        local head = addLine(lines, questLineText(bucket[1], complete), COLOR_QUEST, true, "quest")
        if head then head.questID = questID end
        -- One line per objective, not per Target: a quest item that drops off two mobs makes two
        -- Targets with the same objectiveIndex, and both stand on this node.
        wipe(seenObjectives)
        local shown = 0
        for j = 1, #bucket do
            if shown >= MAX_OBJECTIVES then break end
            local target = bucket[j]
            local key = target.objectiveIndex or ("t" .. j)
            if not seenObjectives[key] then
                seenObjectives[key] = true
                if addObjective(lines, target, headerKind, headerID) then
                    shown = shown + 1
                end
            end
        end
    end
end

---------------------------------------------------------------------------
-- Build
---------------------------------------------------------------------------

--- NodeTooltip.BuildLines(node [, lines]) -> { {left, right, r,g,b, rr,rg,rb, wrap, kind}, ... }
-- The whole pfQuest-style block as data, so the tests and /pq dump read exactly what the tooltip
-- shows. Both the array and the line records are pooled between calls: read what you need before
-- the next call, and copy anything you keep.
function M.BuildLines(node, lines)
    lines = lines or {}
    wipe(lines)
    if type(node) ~= "table" then return lines end

    local kind, id, name = M.ResolveEntity(node)
    name = name or node.name or node.entityName
    if name then
        local color = NAME_COLOR[kind] or COLOR_VALUE
        if node.gatherable == false then color = COLOR_DIM end
        addLine(lines, Util.Truncate(name, MAX_NAME_CHARS), color, false, "name")
    end

    local level = levelText(kind, id, node)
    if level then addDouble(lines, tr("Level:"), level, COLOR_VALUE, "level") end

    local typeKey = TYPE_KEY[kind]
    if typeKey then addDouble(lines, tr("Type:"), tr(typeKey), COLOR_VALUE, "type") end

    -- Profession nodes carry the skill their vein or herb needs; a node with no
    -- requirement recorded simply has no line.
    if type(node.skill) == "number" and node.skill > 0 then
        addDouble(lines, tr("Skill:"), format("%d", node.skill),
            node.gatherable == false and COLOR_DIM or COLOR_VALUE, "skill")
    end

    if kind and id then addRespawn(lines, kind, id, spawnKeyFor(node)) end

    -- A gathering node is drawn only where somebody took one (Nodes/Professions.lua), so these two
    -- lines are its evidence, and the evidence is what tells a player the dot is real. "Found by
    -- you" is how many times this character took it here, from its own saved records.
    if type(node.gathered) == "number" and node.gathered > 0 then
        addDouble(lines, tr("Found by you:"), format("%d", floor(node.gathered)), COLOR_VALUE, "gathered")
    end

    -- A community place is one other players reported, and how many reports are behind it is
    -- the difference between "forty people gather here" and "one loot window was misread once".
    -- It is labelled "Sightings" rather than "players" because that is what the hub counts
    -- (the portal counts NODE events). Only the portal's export carries
    -- a sighting count, so the line follows the count rather than the node's source: a place this
    -- character gathered and the hub also reported is drawn once, and keeps both lines.
    if type(node.sightings) == "number" and node.sightings > 0 then
        addDouble(lines, tr("Sightings:"), format("%d", floor(node.sightings)),
            node.sightings > 1 and COLOR_VALUE or COLOR_ESTIMATE, "sightings")
    end

    -- One spawn point serves several ores in 5.5.4, and the node module folds every record of one
    -- place into one dot; the name above is the best-evidenced of them, and these are the rest.
    local also = node.alsoHere
    if type(also) == "table" and #also > 0 then
        local text = also[1]
        for i = 2, #also do text = text .. ", " .. also[i] end
        addDouble(lines, tr("Also here:"), Util.Truncate(text, MAX_NAME_CHARS), COLOR_VALUE, "also")
    end

    addQuests(lines, node, kind, id)
    return lines
end

---------------------------------------------------------------------------
-- Live countdown
---------------------------------------------------------------------------

-- `label` and `owner` are what make the line ours rather than "line 4 of whatever is showing".
-- GameTooltip is shared: it is routinely re-populated without ever being hidden (moving between
-- two action buttons, a bag item, another addon's SetOwner + ClearLines), and a driver that
-- remembers only a line *index* goes on writing into whatever now occupies that number.
local countdown = {
    active = false, tooltip = nil, name = nil, index = nil,
    kind = nil, id = nil, spawnKey = nil, staticText = nil,
    label = nil, owner = nil,
    lastWhole = nil, elapsed = 0,
}
local driver
local hooked = false

-- The two halves of the one line we own. Blizzard's own TooltipUtil.lua reads them the same way
-- (_G[tooltipName .. "TextRight" .. i]), which is what makes rewriting a single line possible at
-- all - a tooltip has no SetLine.
local function lineFontString(side)
    if not countdown.name or not countdown.index then return nil end
    local g = _G
    if not g then return nil end
    return g[countdown.name .. "Text" .. side .. countdown.index]
end

--- NodeTooltip.StopCountdown(): the tooltip closed, the spawn came back, or a new node took over.
function M.StopCountdown()
    countdown.active = false
    countdown.tooltip, countdown.name, countdown.index = nil, nil, nil
    countdown.kind, countdown.id, countdown.spawnKey = nil, nil, nil
    countdown.staticText, countdown.lastWhole = nil, nil
    countdown.label, countdown.owner = nil, nil
    countdown.elapsed = 0
    if driver then driver:Hide() end
end

--- True while the remembered line is still the line this module wrote. Two independent checks,
-- because neither alone is enough: the label catches a re-populated tooltip that kept its owner
-- (SetOwner is not called again when the same frame re-fills it), and the owner catches the case
-- where another consumer happens to write a line with the same label.
local function stillOurs()
    local tooltip = countdown.tooltip
    if countdown.owner ~= nil and tooltip and tooltip.GetOwner then
        local ok, owner = pcall(tooltip.GetOwner, tooltip)
        if ok and owner ~= countdown.owner then return false end
    end
    if not countdown.label then return true end
    local label = lineFontString("Left")
    if not label or not label.GetText then return false end
    return label:GetText() == countdown.label
end

--- NodeTooltip.Tick(): rewrites the countdown line. Called by the OnUpdate driver (throttled) and
-- directly by the tests. Allocates only when the displayed second changes.
function M.Tick()
    if not countdown.active then return false end
    local tooltip = countdown.tooltip
    if not tooltip or (tooltip.IsShown and not tooltip:IsShown()) then
        M.StopCountdown()
        return false
    end
    if not stillOurs() then
        -- Somebody else owns that line now. Walk away from it without touching it: overwriting an
        -- item's sell price with a respawn timer is our bug, not theirs.
        M.StopCountdown()
        return false
    end
    local remaining = remainingFor(countdown.kind, countdown.id, countdown.spawnKey)
    local fs = lineFontString("Right")
    if not fs or not fs.SetText then
        M.StopCountdown()
        return false
    end
    if not remaining then
        -- It is back. The line becomes the plain respawn time again - label included, so it never
        -- reads "Respawn in: 6 Mins 53 Secs" - and blanks out entirely when there is no seed.
        local label = lineFontString("Left")
        if label and label.SetText then
            label:SetText(countdown.staticText and tr("Respawn:") or "")
        end
        fs:SetText(countdown.staticText or "")
        M.StopCountdown()
        return false
    end
    local whole = floor(remaining)
    if whole == countdown.lastWhole then return true end
    countdown.lastWhole = whole
    fs:SetText(Util.FormatRespawn(whole))
    return true
end

local function onUpdate(_, elapsed)
    -- Nothing is allocated here: the accumulator is a field on a table that already exists, and
    -- Tick only builds a string when the whole second changed.
    countdown.elapsed = countdown.elapsed + (elapsed or 0)
    if countdown.elapsed < TICK then return end
    countdown.elapsed = 0
    M.Tick()
end

local function ensureDriver()
    if driver or not CreateFrame then return driver end
    driver = CreateFrame("Frame", "PandaQuestNodeTooltipDriver", UIParent)
    driver:Hide()
    driver:SetScript("OnUpdate", onUpdate)
    return driver
end

local function hookHide(tooltip)
    if not tooltip or not tooltip.HookScript then return end
    tooltip:HookScript("OnHide", M.StopCountdown)
    -- OnTooltipCleared is the signal a tooltip gives when its contents are thrown away without it
    -- being hidden, which is the common case: ClearLines and SetOwner both fire it. It exists on
    -- 5.5.4 (Blizzard_SharedXML/Classic/GameTooltipTemplate.xml:155 binds it on GameTooltip).
    tooltip:HookScript("OnTooltipCleared", M.StopCountdown)
end

local function ensureHooks()
    if hooked then return end
    hooked = true
    hookHide(_G and _G.GameTooltip)
end

local function startCountdown(tooltip, index, rec)
    M.StopCountdown()
    if not index or not tooltip.GetName then return end
    local name = tooltip:GetName()
    if not name then return end
    countdown.active = true
    countdown.tooltip, countdown.name, countdown.index = tooltip, name, index
    countdown.kind, countdown.id, countdown.spawnKey = rec.entityKind, rec.entityID, rec.spawnKey
    countdown.staticText, countdown.lastWhole, countdown.elapsed = rec.staticText, nil, 0
    countdown.label = rec.left
    if tooltip.GetOwner then
        local ok, owner = pcall(tooltip.GetOwner, tooltip)
        countdown.owner = ok and owner or nil
    end
    if ensureDriver() then driver:Show() end
end

--- NodeTooltip.IsCountdownActive() -> bool
function M.IsCountdownActive()
    return countdown.active
end

--- NodeTooltip.GetCountdownLine() -> tooltip line index|nil
function M.GetCountdownLine()
    return countdown.active and countdown.index or nil
end

---------------------------------------------------------------------------
-- Rendering
---------------------------------------------------------------------------

local function render(tooltip, lines)
    local numLines = tooltip.NumLines and tooltip:NumLines() or nil
    for i = 1, #lines do
        local rec = lines[i]
        if rec.right then
            tooltip:AddDoubleLine(rec.left, rec.right, rec.r, rec.g, rec.b, rec.rr, rec.rg, rec.rb)
        else
            tooltip:AddLine(rec.left, rec.r, rec.g, rec.b, rec.wrap)
        end
        if numLines then
            numLines = numLines + 1
            if rec.kind == "respawn" and rec.live then
                startCountdown(tooltip, numLines, rec)
            end
        end
    end
end

--- NodeTooltip.Fill(tooltip, node) -> bool. Appends the whole block to an already-owned tooltip
-- (the caller keeps its own header line) and starts the countdown when the node has one.
function M.Fill(tooltip, node)
    if type(tooltip) ~= "table" or not tooltip.AddLine or not tooltip.AddDoubleLine then return false end
    local lines = M.BuildLines(node, sharedLines)
    if #lines == 0 then return false end
    ensureHooks()
    M.StopCountdown()
    render(tooltip, lines)
    if tooltip.Show then tooltip:Show() end
    return true
end

--- NodeTooltip.AppendRespawn(tooltip, kind, id [, spawnKey [, allowCountdown]]) -> bool. The unit
-- tooltip already has the name, the level and the type from Blizzard, so only the respawn line is
-- missing there. Pass `allowCountdown = false` for a unit that is alive under the cursor: the
-- static line is about the creature, but "Respawn in: 5 Mins" over a mob that is standing there is
-- an invented fact.
function M.AppendRespawn(tooltip, kind, id, spawnKey, allowCountdown)
    if type(tooltip) ~= "table" or not tooltip.AddDoubleLine then return false end
    local lines = wipe(sharedLines)
    addRespawn(lines, kind, id, spawnKey, allowCountdown)
    if #lines == 0 then return false end
    ensureHooks()
    M.StopCountdown()
    render(tooltip, lines)
    return true
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Enable()
    ensureHooks()
    Log.Debug("NodeTooltip", "enabled")
end

function M.OnProfileChanged()
    M.StopCountdown()
end
