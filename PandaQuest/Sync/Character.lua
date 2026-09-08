-- Sync/Character.lua: what the player is wearing and how strong they are (docs/06 section 13).
--
-- One snapshot of the character sheet, written into the SavedVariable as the telemetry event
-- `GEAR`. Four rules shape this file:
--
--   * It costs nothing while telemetry is off. Request() returns on its first line, no timer is
--     scheduled and no inventory slot is read -- the same single-switch discipline as
--     Sync/Telemetry.lua's `active`.
--   * It never blocks the frame. An item the client has not cached yet has a link but no name,
--     quality or item level; the snapshot then asks for that data with
--     C_Item.RequestLoadItemDataByID and finishes from GET_ITEM_INFO_RECEIVED instead of
--     spinning or writing half a snapshot. A hard deadline (ITEM_WAIT) means a server that never
--     answers costs one incomplete snapshot, not a stuck module.
--   * It is debounced and rate limited. Swapping ten pieces of gear fires
--     PLAYER_EQUIPMENT_CHANGED ten times and produces exactly one event, and at most one snapshot
--     per `gearInterval` seconds (default 60) reaches the saved variable.
--   * Privacy: only the character sheet. No bag contents, no gold unless the operator turns
--     `gearMoney` on (default off -- nothing the hub shows needs it), no names of anyone else.
local _, ns = ...

local M = {}
ns.CharacterSheet = M

local Log = ns.Log

local type, tonumber, tostring, pcall = type, tonumber, tostring, pcall
local floor = math.floor
local tconcat = table.concat
local wipe = wipe or table.wipe

--- Bumped whenever the shape of the payload changes; the hub validates against it.
local PAYLOAD_VERSION = 1
M.PAYLOAD_VERSION = PAYLOAD_VERSION

--- Equipment slots 1..19 = INVSLOT_HEAD..INVSLOT_TABARD (Blizzard's Constants.lua). The INVSLOT_*
-- globals are not part of this client's documented global list, so the numbers are written out
-- rather than read from names that may not exist.
local FIRST_SLOT, LAST_SLOT = 1, 19

--- Seconds a burst of equipment changes is collapsed over.
local DEBOUNCE = 2
--- Seconds the snapshot waits for the client to hand over item data before giving up.
local ITEM_WAIT = 10
--- Longest item link kept. A MoP link is ~120 characters; anything longer is not a link.
local MAX_LINK = 160
--- Most combat ratings recorded, so a future client that adds twenty more cannot grow the event.
local MAX_RATINGS = 24

--- The combat rating constants this addon knows about. MoP defines these as engine globals and
-- not every one of them exists on every build, so each is looked up by name and only the ones
-- that resolve to a number are recorded: "the combat ratings that exist on this client" is a
-- question only the client can answer. The stored key is the name without the `CR_` prefix.
local RATING_NAMES = {
    "CR_DEFENSE_SKILL", "CR_DODGE", "CR_PARRY", "CR_BLOCK",
    "CR_HIT_MELEE", "CR_HIT_RANGED", "CR_HIT_SPELL",
    "CR_CRIT_MELEE", "CR_CRIT_RANGED", "CR_CRIT_SPELL",
    "CR_HASTE_MELEE", "CR_HASTE_RANGED", "CR_HASTE_SPELL",
    "CR_EXPERTISE", "CR_ARMOR_PENETRATION", "CR_MASTERY", "CR_PVP_POWER",
    "CR_RESILIENCE_CRIT_TAKEN", "CR_RESILIENCE_PLAYER_DAMAGE_TAKEN",
}

--- UnitStat(unit, i) for i = 1..5, under the names the hub stores them by.
local STAT_KEYS = { "str", "agi", "sta", "int", "spi" }

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------

local pendingItems = {}         -- itemID -> true, items whose data the client still owes us
local pendingCount = 0
local debounceTimer, waitTimer
local lastFingerprint           -- the gear half of the last recorded snapshot, as a string
local lastRecordedAt = 0        -- GetTime() of the last recorded snapshot (0 = never)
local lastSnapshot              -- the payload of the last recorded snapshot
local waitingForItems = false
local snapshotCount = 0
--- Item ids a *forced* (incomplete) snapshot is still owed. Non-nil means "an incomplete snapshot
-- has been recorded and a corrected one is owed the moment the client answers".
local awaitingCorrection = nil

-- Own AceEvent/AceTimer object: AceEvent keys its registry by target, so registering
-- PLAYER_LEVEL_UP on ns.PQ or on Telemetry's listener would collide with them.
local listener = {}
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
    local AceTimer = LibStub and LibStub("AceTimer-3.0", true)
    if AceTimer then AceTimer:Embed(listener) end
end
M.listener = listener

---------------------------------------------------------------------------
-- Settings
---------------------------------------------------------------------------

local DEFAULT_CFG = ns.DEFAULTS.global.telemetry

--- The global.telemetry table, or the defaults before AceDB exists (same helper as Telemetry).
local function settings()
    local PQ = ns.PQ
    local global = PQ and PQ.db and PQ.db.global
    local cfg = global and global.telemetry
    if type(cfg) == "table" then return cfg end
    return DEFAULT_CFG
end
M.GetSettings = settings

--- IsEnabled() -> bool. Gear snapshots need telemetry itself on *and* `gear` not turned off.
-- Both are checked here so there is exactly one place that decides whether anything happens.
function M.IsEnabled()
    local Telemetry = ns.Telemetry
    if not (Telemetry and Telemetry.IsEnabled and Telemetry.IsEnabled()) then return false end
    return settings().gear ~= false
end

--- IsMoneyEnabled() -> bool. Off unless the operator opted in: the site shows nothing that needs
-- a character's gold, and money is the one field here that reads as a target rather than a stat.
function M.IsMoneyEnabled()
    return settings().gearMoney == true
end

local function snapshotInterval()
    local value = tonumber(settings().gearInterval)
    if not value or value <= 0 then value = tonumber(DEFAULT_CFG.gearInterval) or 60 end
    return value
end
M.GetInterval = snapshotInterval

---------------------------------------------------------------------------
-- Small helpers
---------------------------------------------------------------------------

local function clock()
    return (GetTime and GetTime()) or 0
end

local function unixNow()
    return (time and time()) or 0
end

--- One decimal, which is all an item level average or a haste percentage is ever read to.
local function round1(value)
    value = tonumber(value)
    if not value then return nil end
    return floor(value * 10 + 0.5) / 10
end

local function asInt(value)
    value = tonumber(value)
    if not value then return nil end
    return floor(value + 0.5)
end

--- A positive integer, or nil. Item links spell "nothing here" as 0, which is not data.
local function positive(value)
    value = tonumber(value)
    if not value or value <= 0 then return nil end
    return floor(value)
end

---------------------------------------------------------------------------
-- Item links
---------------------------------------------------------------------------

--- ParseItemLink(link) -> { id, ench, gems = {..}, suffix, upgrade } or nil.
--
-- A MoP item link is
--   |cffRRGGBB|Hitem:id:enchant:gem1:gem2:gem3:gem4:suffix:unique:level:spec:upgrade:...|h[..]|h|r
-- so the interesting ids are read positionally out of the colon separated payload. Anything the
-- client appends after `upgrade` is ignored on purpose: this parser must never fail on a longer
-- link than it was written for.
function M.ParseItemLink(link)
    if type(link) ~= "string" then return nil end
    local payload = link:match("|Hitem:([%-%d:]+)|h") or link:match("^item:([%-%d:]+)$")
    if not payload then return nil end

    local fields, count = {}, 0
    for value in (payload .. ":"):gmatch("([^:]*):") do
        count = count + 1
        fields[count] = tonumber(value)
        if count >= 12 then break end
    end

    local itemID = positive(fields[1])
    if not itemID then return nil end

    local gems
    for index = 3, 6 do
        local gem = positive(fields[index])
        if gem then
            gems = gems or {}
            gems[#gems + 1] = gem
        end
    end

    return {
        id = itemID,
        ench = positive(fields[2]),
        gems = gems,
        suffix = positive(fields[7]),
        upgrade = positive(fields[11]),
    }
end

local ParseItemLink = M.ParseItemLink

--- Is everything the snapshot wants to read about this item already in the client's cache?
local function itemDataReady(itemID)
    local C = _G.C_Item
    if C and C.IsItemDataCachedByID then
        local ok, cached = pcall(C.IsItemDataCachedByID, itemID)
        if ok then return cached and true or false end
    end
    local getInfo = (C and C.GetItemInfo) or _G.GetItemInfo
    if getInfo then
        local ok, name = pcall(getInfo, itemID)
        if ok then return name ~= nil end
    end
    -- No way to ask: treat it as ready rather than waiting forever for an answer nobody sends.
    return true
end

local function requestItemData(itemID)
    local C = _G.C_Item
    if C and C.RequestLoadItemDataByID then
        pcall(C.RequestLoadItemDataByID, itemID)
    end
end

--- itemLevelAndQuality(link, slot) -> ilvl, quality.
-- GetDetailedItemLevelInfo is the only call that accounts for MoP's item upgrades, so it wins;
-- GetItemInfo is the fallback and the only source of quality when the slot API is missing.
local function itemLevelAndQuality(link, slot)
    local ilvl, quality
    local C = _G.C_Item

    if C and C.GetDetailedItemLevelInfo then
        local ok, effective = pcall(C.GetDetailedItemLevelInfo, link)
        if ok then ilvl = asInt(effective) end
    end

    if GetInventoryItemQuality and slot then
        local ok, value = pcall(GetInventoryItemQuality, "player", slot)
        if ok then quality = asInt(value) end
    end

    if ilvl == nil or quality == nil then
        local getInfo = (C and C.GetItemInfo) or _G.GetItemInfo
        if getInfo then
            local ok, _, _, itemQuality, itemLevel = pcall(getInfo, link)
            if ok then
                if quality == nil then quality = asInt(itemQuality) end
                if ilvl == nil then ilvl = asInt(itemLevel) end
            end
        end
    end

    return ilvl, quality
end

---------------------------------------------------------------------------
-- Reading the character sheet
---------------------------------------------------------------------------

--- CollectItems() -> items, missing
-- `items` is one entry per equipped slot; `missing` is the item ids whose data the client has not
-- cached yet. The entries are built either way, so a snapshot forced by the deadline still says
-- what is equipped -- it simply has no item level for the pieces that never arrived.
function M.CollectItems()
    local items, missing = {}, nil
    if not GetInventoryItemID then return items, missing end

    for slot = FIRST_SLOT, LAST_SLOT do
        local ok, itemID = pcall(GetInventoryItemID, "player", slot)
        itemID = ok and positive(itemID) or nil
        if itemID then
            local link
            if GetInventoryItemLink then
                local gotLink, value = pcall(GetInventoryItemLink, "player", slot)
                if gotLink and type(value) == "string" and value ~= "" then link = value end
            end

            local parsed = link and ParseItemLink(link) or nil
            local entry = {
                s = slot,
                id = itemID,
                ench = parsed and parsed.ench or nil,
                gems = parsed and parsed.gems or nil,
                suffix = parsed and parsed.suffix or nil,
                up = parsed and parsed.upgrade or nil,
            }
            if link then entry.link = link:sub(1, MAX_LINK) end

            if itemDataReady(itemID) then
                entry.ilvl, entry.q = itemLevelAndQuality(link or itemID, slot)
            else
                missing = missing or {}
                missing[#missing + 1] = itemID
            end

            items[#items + 1] = entry
        end
    end

    return items, missing
end

--- CollectRatings() -> { [name without CR_] = rating } or nil.
function M.CollectRatings()
    if not GetCombatRating then return nil end
    local ratings, count = nil, 0
    for index = 1, #RATING_NAMES do
        if count >= MAX_RATINGS then break end
        local name = RATING_NAMES[index]
        local constant = tonumber(_G[name])
        if constant then
            local ok, value = pcall(GetCombatRating, constant)
            value = ok and asInt(value) or nil
            if value and value ~= 0 then
                ratings = ratings or {}
                ratings[name:sub(4)] = value
                count = count + 1
            end
        end
    end
    return ratings
end

local function collectSpec(payload)
    local getSpec = _G.GetSpecialization
        or (_G.C_SpecializationInfo and _G.C_SpecializationInfo.GetSpecialization)
    if not getSpec then return end
    local ok, index = pcall(getSpec)
    index = ok and tonumber(index) or nil
    if not index then return end

    local getInfo = _G.GetSpecializationInfo
        or (_G.C_SpecializationInfo and _G.C_SpecializationInfo.GetSpecializationInfo)
    if not getInfo then
        payload.spec = index
        return
    end
    local gotInfo, id, name, _, _, role = pcall(getInfo, index)
    if not gotInfo then return end
    payload.spec = positive(id) or index
    if type(name) == "string" and name ~= "" then payload.specName = name:sub(1, 32) end
    if type(role) == "string" and role ~= "" then payload.role = role:sub(1, 16) end
end

--- Build() -> payload, missing
-- The whole character sheet as one plain table. `missing` is non-nil when the client still owes
-- item data; the caller decides whether to wait for it or to record what there is.
function M.Build()
    local payload = { v = PAYLOAD_VERSION, ts = unixNow() }

    payload.lvl = (ns.Player and ns.Player.GetLevel and ns.Player.GetLevel())
        or (UnitLevel and UnitLevel("player")) or nil

    if GetAverageItemLevel then
        local ok, overall, equipped = pcall(GetAverageItemLevel)
        if ok then
            payload.ilvl = round1(overall)
            payload.ilvlEq = round1(equipped)
        end
    end

    if UnitStat then
        local stats
        for index = 1, 5 do
            local ok, _, effective = pcall(UnitStat, "player", index)
            local value = ok and asInt(effective) or nil
            if value then
                stats = stats or {}
                stats[STAT_KEYS[index]] = value
            end
        end
        payload.stats = stats
    end

    if UnitArmor then
        local ok, _, effective = pcall(UnitArmor, "player")
        if ok then payload.armor = asInt(effective) end
    end

    if UnitAttackPower then
        local ok, base, positiveBuff, negativeBuff = pcall(UnitAttackPower, "player")
        if ok and tonumber(base) then
            payload.ap = asInt(base + (tonumber(positiveBuff) or 0) + (tonumber(negativeBuff) or 0))
        end
    end

    if UnitSpellHaste then
        local ok, haste = pcall(UnitSpellHaste, "player")
        if ok then payload.haste = round1(haste) end
    end

    if GetMasteryEffect then
        local ok, mastery = pcall(GetMasteryEffect)
        if ok then payload.mastery = round1(mastery) end
    end

    if UnitHealthMax then
        local ok, health = pcall(UnitHealthMax, "player")
        if ok then payload.hp = asInt(health) end
    end

    if UnitPowerMax then
        local ok, power = pcall(UnitPowerMax, "player")
        if ok then payload.power = asInt(power) end
    end

    payload.ratings = M.CollectRatings()
    collectSpec(payload)

    -- Opt-in only. Everything above describes how strong the character is; this does not.
    if M.IsMoneyEnabled() and GetMoney then
        local ok, money = pcall(GetMoney)
        if ok then payload.money = asInt(money) end
    end

    local items, missing = M.CollectItems()
    payload.items = items
    return payload, missing
end

--- Fingerprint(payload) -> string. The *gear* half of a snapshot: what is equipped, at what item
-- level, and the character's level. Stats move with every buff and food, so they are deliberately
-- not part of it -- "when it changes" means the equipment changed, not that a flask ran out.
function M.Fingerprint(payload)
    local parts = {
        "L", tostring(payload.lvl or 0),
        "I", tostring(payload.ilvlEq or payload.ilvl or 0),
        "P", payload.partial and "1" or "0",
    }
    local items = payload.items or {}
    for index = 1, #items do
        local entry = items[index]
        local gems = entry.gems
        parts[#parts + 1] = tconcat({
            tostring(entry.s), tostring(entry.id), tostring(entry.ench or 0),
            tostring(entry.up or 0), tostring(entry.suffix or 0), tostring(entry.ilvl or 0),
            gems and tconcat(gems, ",") or "",
        }, "/")
    end
    return tconcat(parts, "|")
end

---------------------------------------------------------------------------
-- Recording
---------------------------------------------------------------------------

local function clearPending()
    wipe(pendingItems)
    pendingCount = 0
    awaitingCorrection = nil
    if waitingForItems then
        waitingForItems = false
        if listener.UnregisterEvent then listener:UnregisterEvent("GET_ITEM_INFO_RECEIVED") end
    end
    if waitTimer and listener.CancelTimer then
        listener:CancelTimer(waitTimer, true)
    end
    waitTimer = nil
end

--- markPartial(payload): say out loud that this snapshot was taken before the client had finished
-- loading the player's items.
--
-- Two things go wrong without it and both end up on the hub's character page as plain fact.
-- `payload.ilvl` comes from GetAverageItemLevel(), which returns 0 or a stale average while item
-- data is still loading, and the page prints it beside the paper doll as "Item level 0" for a
-- 450 character. And the slots whose data never arrived have no item level at all, which the page
-- renders as two blank squares with nothing saying why. So the numbers the client could not
-- actually compute are dropped rather than sent, and the flag and the slot list are sent instead:
-- absent is absent, which is the same rule the hub's own stat block follows.
local function markPartial(payload)
    payload.partial = true
    payload.ilvl, payload.ilvlEq = nil, nil
    local slots
    local items = payload.items or {}
    for index = 1, #items do
        if items[index].ilvl == nil then
            slots = slots or {}
            slots[#slots + 1] = items[index].s
        end
    end
    payload.partialSlots = slots
end

--- Writes the payload as a GEAR event, unless the gear has not changed since the last one.
-- Returns the event, or nil with a reason.
local function record(payload, forced)
    local fingerprint = M.Fingerprint(payload)
    if lastFingerprint == fingerprint then
        return nil, "unchanged"
    end

    local Telemetry = ns.Telemetry
    if not (Telemetry and Telemetry.Record) then return nil, "no telemetry" end

    -- `v` sits on the event itself so a reader can tell the payload version without unpacking it;
    -- `g` is the payload. Telemetry.Record takes ownership of this table and stamps e/t into it.
    local event = Telemetry.Record(Telemetry.CODES.GEAR, { v = PAYLOAD_VERSION, g = payload })
    if not event then return nil, "telemetry off" end

    lastFingerprint = fingerprint
    lastRecordedAt = clock()
    lastSnapshot = payload
    snapshotCount = snapshotCount + 1
    Log.Debug("CharacterSheet", "gear snapshot %d recorded (%d items%s)",
        snapshotCount, #(payload.items or {}), forced and ", incomplete" or "")
    return event
end

--- Capture(forced) -> event|nil, reason
-- Builds the snapshot now. When item data is missing and `forced` is false the snapshot is
-- postponed: the ids are requested, GET_ITEM_INFO_RECEIVED finishes it, and ITEM_WAIT is the
-- deadline after which whatever is known is recorded anyway.
function M.Capture(forced)
    if not M.IsEnabled() then
        clearPending()
        return nil, "disabled"
    end

    local payload, missing = M.Build()

    if missing and not forced then
        clearPending()
        for index = 1, #missing do
            local itemID = missing[index]
            if not pendingItems[itemID] then
                pendingItems[itemID] = true
                pendingCount = pendingCount + 1
                requestItemData(itemID)
            end
        end
        if pendingCount > 0 then
            waitingForItems = true
            if listener.RegisterEvent then
                listener:RegisterEvent("GET_ITEM_INFO_RECEIVED", M.OnItemInfoReceived)
            end
            if listener.ScheduleTimer then
                waitTimer = listener:ScheduleTimer(function()
                    waitTimer = nil
                    Log.Debug("CharacterSheet", "item data never arrived for %d item(s); recording anyway",
                        pendingCount)
                    M.Capture(true)
                end, ITEM_WAIT)
            end
            Log.Debug("CharacterSheet", "waiting for %d item(s) before the gear snapshot", pendingCount)
            return nil, "waiting"
        end
    end

    local stillMissing = missing and forced and missing or nil
    clearPending()
    if stillMissing then
        markPartial(payload)
        -- Do not go quiet. The deadline recorded what was known; the client usually answers a
        -- second or two later, and until this the snapshot the hub kept for the whole evening was
        -- the incomplete one -- fire() is only reached from Request(), and Request() is only
        -- called by an equipment change, a level, a login or a settings change, none of which a
        -- player questing in the same gear does again for hours. So the listener stays on for the
        -- ids that never arrived, and their arrival asks for one corrected snapshot through the
        -- normal debounce and interval limiter.
        awaitingCorrection = true
        for index = 1, #stillMissing do
            local itemID = stillMissing[index]
            if not pendingItems[itemID] then
                pendingItems[itemID] = true
                pendingCount = pendingCount + 1
            end
        end
        if pendingCount > 0 then
            waitingForItems = true
            if listener.RegisterEvent then
                listener:RegisterEvent("GET_ITEM_INFO_RECEIVED", M.OnItemInfoReceived)
            end
        end
    end
    return record(payload, stillMissing ~= nil)
end

--- OnItemInfoReceived(_, itemID): finishes a postponed snapshot once the last item arrives.
function M.OnItemInfoReceived(_, itemID)
    itemID = tonumber(itemID)
    if not itemID or not pendingItems[itemID] then return end
    pendingItems[itemID] = nil
    pendingCount = pendingCount - 1
    if pendingCount > 0 then return end
    if awaitingCorrection then
        -- The incomplete snapshot has already been written. Ask for a fresh one the normal way:
        -- the fingerprint differs (the missing item levels were recorded as absent and are now
        -- numbers), so record() accepts it, and nothing extra is produced when nothing changed.
        clearPending()
        M.Request("item data arrived after an incomplete snapshot")
        return
    end
    -- Forced: everything this snapshot asked for has arrived, and a piece swapped in while we
    -- waited must not start a second wait behind the first. The next equipment change requests a
    -- fresh snapshot anyway.
    M.Capture(true)
end

---------------------------------------------------------------------------
-- The debounce
---------------------------------------------------------------------------

local function fire()
    debounceTimer = nil
    if not M.IsEnabled() then return end

    -- At most one snapshot per interval. When one is due sooner than that, the timer is simply
    -- pushed out to the moment it becomes allowed instead of being dropped.
    if lastRecordedAt > 0 then
        local remaining = snapshotInterval() - (clock() - lastRecordedAt)
        if remaining > 0 then
            if listener.ScheduleTimer then
                debounceTimer = listener:ScheduleTimer(fire, remaining)
            end
            return
        end
    end

    M.Capture(false)
end

--- Request(reason) -> bool. Asks for a snapshot; the work happens DEBOUNCE seconds later so a
-- player swapping ten items produces one event.
function M.Request(reason)
    if not M.IsEnabled() then return false end
    if not listener.ScheduleTimer then
        M.Capture(false)
        return true
    end
    if debounceTimer then listener:CancelTimer(debounceTimer, true) end
    debounceTimer = listener:ScheduleTimer(fire, DEBOUNCE)
    Log.Debug("CharacterSheet", "snapshot requested (%s)", tostring(reason))
    return true
end

---------------------------------------------------------------------------
-- Status
---------------------------------------------------------------------------

--- GetLast() -> payload|nil, unix. The last snapshot actually recorded.
function M.GetLast()
    return lastSnapshot, lastSnapshot and lastSnapshot.ts or nil
end

--- GetCount() -> how many snapshots this session recorded.
function M.GetCount()
    return snapshotCount
end

--- IsPending() -> bool. True while the module is waiting for item data -- either before the first
-- snapshot, or after an incomplete one that is owed a correction (see `IsPartial`).
function M.IsPending()
    return pendingCount > 0
end

--- IsPartial() -> bool. True when the last recorded snapshot was written by the deadline with
-- item data missing, and a corrected one is still owed.
function M.IsPartial()
    return awaitingCorrection == true
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    lastFingerprint, lastSnapshot = nil, nil
    awaitingCorrection = nil
    lastRecordedAt, snapshotCount = 0, 0
    clearPending()
end

function M.Enable()
    if not listener.RegisterEvent then return end

    listener:RegisterEvent("PLAYER_EQUIPMENT_CHANGED", function() M.Request("PLAYER_EQUIPMENT_CHANGED") end)
    listener:RegisterEvent("PLAYER_LEVEL_UP", function() M.Request("PLAYER_LEVEL_UP") end)
    listener:RegisterEvent("PLAYER_ENTERING_WORLD", function() M.Request("PLAYER_ENTERING_WORLD") end)

    listener:RegisterMessage("PQ_SETTING_CHANGED", function(_, path)
        if type(path) ~= "string" or path:sub(1, 16) ~= "global.telemetry" then return end
        if M.IsEnabled() then
            M.Request("PQ_SETTING_CHANGED")
        else
            clearPending()
            if debounceTimer and listener.CancelTimer then listener:CancelTimer(debounceTimer, true) end
            debounceTimer = nil
        end
    end)

    M.Request("Enable")
end

function M.OnProfileChanged()
    -- A different profile may have telemetry off, or on after it was off; both are one Request
    -- away, and the fingerprint is cleared so the new profile gets a full snapshot.
    lastFingerprint = nil
    if M.IsEnabled() then
        M.Request("OnProfileChanged")
    else
        clearPending()
    end
end

-- Exposed for the tests: the slot range and the rating names this client is asked about.
M.FIRST_SLOT, M.LAST_SLOT = FIRST_SLOT, LAST_SLOT
M.RATING_NAMES = RATING_NAMES
M.DEBOUNCE, M.ITEM_WAIT = DEBOUNCE, ITEM_WAIT
