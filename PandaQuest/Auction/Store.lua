-- Auction/Store.lua: the account-wide SavedVariable PandaQuestAH.
--
-- Auction data is kept apart from PandaQuestSync on purpose: one scan is an order of magnitude
-- bigger than a questing session, and losing or resetting it must never take the quest log with
-- it. WoW writes every SavedVariable of the addon into the same PandaQuest.lua, though, and the
-- companion refuses that file past 32 MB (companion-go/internal/luaparse/limits.go SyncLimits),
-- with telemetry alone allowed to reach about 10 MB. So everything here is bounded, and one item's
-- figures are one short string rather than a table: a table per item costs WoW's serializer six
-- lines and roughly 100 bytes, the string about 30.
local _, ns = ...

local Thread = ns.Thread

local M = {}
ns.AuctionStore = M

local type, pairs, tonumber, tostring, format, floor = type, pairs, tonumber, tostring, string.format, math.floor
local tremove, tsort = table.remove, table.sort

M.VERSION = 1

-- `maxScans` full scans are kept for the companion to upload; an older one is rolled
-- up into `known`, which keeps only the newest figures per item per auction house and forgets an
-- item `maxKnownAge` seconds after that house last saw it. `maxRowsPerScan` stops a scan reading
-- more auctions than the file budget allows and marks it truncated instead of dropping silently.
M.LIMITS = {
    maxScans = 5,
    maxRowsPerScan = 60000,
    maxHouses = 4,
    maxKnownItems = 30000,
    maxKnownAge = 30 * 86400,
    maxSales = 500,
}

-- The defaults live with the module that owns them because Core/Const.lua is the
-- core's contract; this file loads before Core/Init.lua creates AceDB, so the key is in place
-- when the profile is built. Nothing here can start a scan: there is deliberately no
-- autoScanOnOpen any more.
ns.DEFAULTS.profile.auction = {
    scanButton = true,          -- the "Scan prices" button on the auction house window
    showTooltipPrices = true,   -- the last known price on item tooltips
    recordSales = true,         -- auction invoices read from the mailbox
}

---------------------------------------------------------------------------
-- The SavedVariable
---------------------------------------------------------------------------

--- GetDB() -> PandaQuestAH, created and shaped on demand. Core/Init.lua creates the raw table.
function M.GetDB()
    local db = _G.PandaQuestAH
    if type(db) ~= "table" then
        db = {}
        _G.PandaQuestAH = db
    end
    if type(db.version) ~= "number" then db.version = M.VERSION end
    if type(db.scans) ~= "table" then db.scans = {} end
    if type(db.known) ~= "table" then db.known = {} end
    if type(db.sales) ~= "table" then db.sales = {} end
    return db
end

--- CurrentHouse() -> realm, faction, region. The realm is spelled like Sync/Telemetry.lua's
-- character key (no spaces or dashes), so the hub can join a scan to the characters it knows.
function M.CurrentHouse()
    local realm = GetNormalizedRealmName and GetNormalizedRealmName()
    if not realm or realm == "" then
        realm = ((GetRealmName and GetRealmName()) or "Unknown"):gsub("[%s%-]", "")
    end
    local faction = (UnitFactionGroup and UnitFactionGroup("player")) or "Neutral"
    local region = (GetCurrentRegionName and GetCurrentRegionName()) or nil
    return realm, faction, region
end

function M.HouseKey(realm, faction)
    return tostring(realm) .. "-" .. tostring(faction)
end

---------------------------------------------------------------------------
-- Items and their figures
---------------------------------------------------------------------------

--- ItemKey(itemID, suffixID) -> "72092" or "72092:-37". The same item with a different random
-- suffix is a different thing to buy, so the suffix is part of the key; the unique
-- id is not, because it only scales the suffix's stats for one copy.
function M.ItemKey(itemID, suffixID)
    suffixID = tonumber(suffixID) or 0
    if suffixID ~= 0 then
        return format("%d:%d", itemID, suffixID)
    end
    return format("%d", itemID)
end

--- ParseItemLink(link) -> itemID, suffixID. The MoP link payload is
--   item:id:enchant:gem1:gem2:gem3:gem4:suffix:unique:level::spec:...
-- (Sync/Character.lua's ParseItemLink documents the 5.5.4 layout with real links). A random
-- suffix may be negative. It stays apart from CharacterSheet.ParseItemLink because the scanner
-- calls it for every auction row and wants only these two numbers, not gems and a specialization.
function M.ParseItemLink(link)
    if type(link) ~= "string" then return nil end
    local payload = link:match("item:([%-%d:]+)")
    if not payload then return nil end
    local fields, count = {}, 0
    for value in (payload .. ":"):gmatch("([^:]*):") do
        count = count + 1
        fields[count] = tonumber(value)
        if count >= 7 then break end
    end
    local itemID = fields[1]
    if not itemID or itemID <= 0 then return nil end
    return itemID, fields[7] or 0
end

local function asCopper(value)
    if value == nil then return nil end
    local copper = floor(value + 0.5)
    -- A unit price below half a copper is still a price; 0 would read back as "no buyout".
    if copper < 1 then copper = 1 end
    return copper
end

--- EncodeStats({ minBuyout, market, quantity, auctions, noBuyout }) -> "m,v,q,n,nb".
-- m and v are copper per single item and empty when every auction was bid-only.
function M.EncodeStats(stats)
    local m, v = asCopper(stats.minBuyout), asCopper(stats.market)
    return format("%s,%s,%d,%d,%d", m and tostring(m) or "", v and tostring(v) or "",
        stats.quantity or 0, stats.auctions or 0, stats.noBuyout or 0)
end

--- DecodeStats("m,v,q,n,nb[,at]") -> { minBuyout, market, quantity, auctions, noBuyout, at } or nil.
function M.DecodeStats(text)
    if type(text) ~= "string" then return nil end
    local m, v, q, n, nb, at = text:match("^(%d*),(%d*),(%d+),(%d+),(%d+),?(%d*)$")
    if not q then return nil end
    return { minBuyout = tonumber(m), market = tonumber(v), quantity = tonumber(q),
             auctions = tonumber(n), noBuyout = tonumber(nb), at = tonumber(at) }
end

---------------------------------------------------------------------------
-- Scans and the roll-up
---------------------------------------------------------------------------

local function knownAt(value)
    return tonumber(type(value) == "string" and value:match(",(%d+)$")) or 0
end

-- Copies one scan's figures into known[house], newest wins. Nothing is removed from the scan
-- list until this has finished, so a job cancelled half way leaves the scan in place and the
-- next AddScan simply merges it again (a figure is only ever replaced by a newer one).
local function mergeIntoKnown(db, scan)
    local houseKey = M.HouseKey(scan.realm, scan.faction)
    local house = db.known[houseKey]
    if type(house) ~= "table" then
        house = { realm = scan.realm, faction = scan.faction, updatedAt = 0, items = {} }
        db.known[houseKey] = house
    end
    local at = tonumber(scan.finishedAt) or 0
    local items = house.items
    for key, value in pairs(scan.items or {}) do
        if knownAt(items[key]) <= at then
            items[key] = value .. "," .. at
        end
        Thread.Yield()
    end
    if at > (tonumber(house.updatedAt) or 0) then house.updatedAt = at end
    return house
end

-- An item this house has not seen for maxKnownAge is forgotten, measured from the house's own
-- newest data rather than the wall clock: a player away for two months still gets last known
-- prices (with their age) until a new scan replaces them.
local function pruneHouse(house)
    local limits = M.LIMITS
    local cutoff = (tonumber(house.updatedAt) or 0) - limits.maxKnownAge
    local items, count = house.items, 0
    for key, value in pairs(items) do
        if knownAt(value) < cutoff then
            items[key] = nil
        else
            count = count + 1
        end
        Thread.Yield()
    end
    if count <= limits.maxKnownItems then return end
    local order = {}
    for key, value in pairs(items) do order[#order + 1] = { knownAt(value), key } end
    tsort(order, function(a, b) return a[1] < b[1] end)
    for i = 1, count - limits.maxKnownItems do
        items[order[i][2]] = nil
    end
end

local function pruneHouses(db, keep)
    local count = 0
    for _ in pairs(db.known) do count = count + 1 end
    while count > M.LIMITS.maxHouses do
        local oldestKey, oldestAt
        for key, house in pairs(db.known) do
            local at = type(house) == "table" and tonumber(house.updatedAt) or 0
            if key ~= keep and (not oldestAt or at < oldestAt) then oldestKey, oldestAt = key, at end
        end
        if not oldestKey then return end
        db.known[oldestKey] = nil
        count = count - 1
    end
end

--- AddScan(scan) -> scan. Appends a finished scan and rolls the oldest ones into `known` until at
-- most LIMITS.maxScans remain. Yields through ns.Thread when called inside a job.
function M.AddScan(scan)
    local db = M.GetDB()
    local scans = db.scans
    scans[#scans + 1] = scan
    while #scans > M.LIMITS.maxScans do
        local oldest = scans[1]
        local house = mergeIntoKnown(db, oldest)
        pruneHouse(house)
        tremove(scans, 1)
        pruneHouses(db, M.HouseKey(oldest.realm, oldest.faction))
    end
    return scan
end

--- GetLatestScan(realm, faction) -> the newest stored scan of that auction house, or nil.
function M.GetLatestScan(realm, faction)
    local scans = M.GetDB().scans
    for i = #scans, 1, -1 do
        local scan = scans[i]
        if scan.realm == realm and scan.faction == faction then return scan end
    end
    return nil
end

--- GetPrice(itemID, suffixID, realm, faction) -> stats or nil.
-- stats = { minBuyout, market, quantity, auctions, noBuyout, at (unix time of the data), realm }.
-- The newest scan of this auction house that listed the item wins; only when no stored scan has
-- it does the rolled-up `known` figure answer. Nothing is borrowed from another realm or faction.
function M.GetPrice(itemID, suffixID, realm, faction)
    if type(itemID) ~= "number" then return nil end
    local db = M.GetDB()
    local key = M.ItemKey(itemID, suffixID)
    local scans = db.scans
    for i = #scans, 1, -1 do
        local scan = scans[i]
        if scan.realm == realm and scan.faction == faction and type(scan.items) == "table" then
            local stats = M.DecodeStats(scan.items[key])
            if stats then
                stats.at = tonumber(scan.finishedAt)
                stats.realm = realm
                return stats
            end
        end
    end
    local house = db.known[M.HouseKey(realm, faction)]
    local stats = type(house) == "table" and type(house.items) == "table" and M.DecodeStats(house.items[key])
    if stats then
        stats.realm = realm
        return stats
    end
    return nil
end

---------------------------------------------------------------------------
-- Sales and purchases
---------------------------------------------------------------------------

function M.GetSales()
    return M.GetDB().sales
end

--- AddSale(record): appends one invoice record and drops the oldest past LIMITS.maxSales.
function M.AddSale(record)
    local sales = M.GetDB().sales
    sales[#sales + 1] = record
    while #sales > M.LIMITS.maxSales do
        tremove(sales, 1)
    end
    return record
end
