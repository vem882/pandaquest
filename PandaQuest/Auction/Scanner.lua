-- Auction/Scanner.lua: the auction house price scan (docs/08 B1, amended 2026-09-14).
--
-- Nothing here runs on its own. A scan costs the player a minute at the auctioneer and the realm
-- a full listing, so it starts only from the button this module puts on the auction house window
-- or from /pq scan, and it stops the moment that window closes.
--
-- Which API: the 5.5.4 client ships two auction house UIs and picks one at run time with
-- IsUsingLegacyAuctionClient() (Blizzard_UIParent/Mists/UIParent.lua:215-221). The source does not
-- say which answer the live client gives, so the scanner asks the same question Blizzard's loader
-- asks and follows the answer: the modern client is read with C_AuctionHouse.ReplicateItems, the
-- legacy one is paged with QueryAuctionItems exactly as Blizzard_AuctionUI.lua pages it. docs/08
-- section 0 has the evidence and what only a scan on Hoptallus can settle.
--
-- The seller: GetReplicateItemInfo and GetAuctionItemInfo both return the owner's name (returns
-- 14 and 15, AuctionHouseDocumentation.lua:603-604, Blizzard_AuctionUI.lua:976). Those positions
-- are discarded into `_` at the call and never reach a table (docs/08 E).
local _, ns = ...
local L = ns.L

local Const, Log, Thread, Util = ns.Const, ns.Log, ns.Thread, ns.Util
local Store = ns.AuctionStore

local M = {}
ns.AuctionScanner = M

local type, pairs, tonumber, tostring, format = type, pairs, tonumber, tostring, string.format
local floor, ceil, tsort = math.floor, math.ceil, table.sort

local PAGE_SIZE = 50                -- NUM_AUCTION_ITEMS_PER_PAGE, Blizzard_AuctionUI/Classic/Blizzard_AuctionData.lua:2
local FILTER_ALL_INDEX = -1         -- "every quality", Blizzard_AuctionUI.lua:6
local ROWS_PER_YIELD = 200          -- Thread granularity; the 8 ms frame budget is the real limit
local TICK = 0.1                    -- seconds between polls of the throttle and the timeouts
local REPLICATE_TIMEOUT = 120       -- a full listing that has not arrived by then is not coming
local PAGE_TIMEOUT = 30
local INFO_RETRY_DELAY = 1          -- a legacy page whose item data is still loading is re-read
local INFO_RETRIES = 3
local SETTLE_DELAY = 2              -- replicate rows without item data get this long to load
local PLAYER_QUERY_PAUSE = 10       -- docs/08 A: the player's own search always goes first

-- The market value's shape (docs/08 D2).
local OUTLIER_LOW, OUTLIER_HIGH = 0.1, 10
local MARKET_SHARE = 0.15

local ctx                           -- the running scan, nil when idle
local lastResult                    -- { ok, reason, scan, at } of the last scan this session
local auctionOpen = false
local auctioneerNpc
local button, ticker
local hookedPlayerQueries = false

local function unixNow()
    return (time and time()) or 0
end

local function clock()
    return (GetTime and GetTime()) or 0
end

local function setting(key)
    local PQ = ns.PQ
    local auction = PQ and PQ.db and PQ.db.profile and PQ.db.profile.auction
    if not auction then return ns.DEFAULTS.profile.auction[key] end
    return auction[key]
end

---------------------------------------------------------------------------
-- Aggregation (docs/08 D2)
---------------------------------------------------------------------------

-- Per item key: auctions with the same unit price are collapsed into one step, which is how a
-- listing of thirty identical stacks costs one table entry instead of thirty.
local function newAccumulator()
    return { keys = {}, rows = 0, incomplete = 0, skipped = 0 }
end

local function addRow(acc, itemID, link, count, buyout)
    if type(itemID) ~= "number" or itemID <= 0 then
        acc.skipped = acc.skipped + 1
        return
    end
    local _, suffix = Store.ParseItemLink(link)
    local key = Store.ItemKey(itemID, suffix)
    local entry = acc.keys[key]
    if not entry then
        entry = { quantity = 0, auctions = 0, noBuyout = 0, qtyAt = {}, auctionsAt = {} }
        acc.keys[key] = entry
    end
    count = tonumber(count) or 1
    if count < 1 then count = 1 end
    buyout = tonumber(buyout) or 0
    entry.quantity = entry.quantity + count
    entry.auctions = entry.auctions + 1
    acc.rows = acc.rows + 1
    if buyout <= 0 then
        -- Bid-only auctions are counted but kept out of the price (docs/08 B1).
        entry.noBuyout = entry.noBuyout + 1
        return
    end
    local unit = buyout / count
    entry.qtyAt[unit] = (entry.qtyAt[unit] or 0) + count
    entry.auctionsAt[unit] = (entry.auctionsAt[unit] or 0) + 1
end

--- Summarize(entry) -> { minBuyout, market, quantity, auctions, noBuyout }.
-- minBuyout is the cheapest unit price with a buyout. market is the quantity-weighted mean of the
-- cheapest 15 % of the quantity (at least the cheapest price step), after dropping unit prices
-- below 10 % or above ten times the median auction.
function M.Summarize(entry)
    local stats = { quantity = entry.quantity, auctions = entry.auctions, noBuyout = entry.noBuyout }
    local units = {}
    for unit in pairs(entry.auctionsAt) do units[#units + 1] = unit end
    if #units == 0 then return stats end
    tsort(units)
    stats.minBuyout = units[1]

    local priced = 0
    for i = 1, #units do priced = priced + entry.auctionsAt[units[i]] end
    local lowPos, highPos = floor((priced + 1) / 2), floor(priced / 2) + 1
    local seen, lowValue, highValue = 0, nil, nil
    for i = 1, #units do
        seen = seen + entry.auctionsAt[units[i]]
        if not lowValue and seen >= lowPos then lowValue = units[i] end
        if seen >= highPos then highValue = units[i] break end
    end
    local median = (lowValue + highValue) / 2
    local low, high = median * OUTLIER_LOW, median * OUTLIER_HIGH

    local total = 0
    for i = 1, #units do
        local unit = units[i]
        if unit >= low and unit <= high then total = total + entry.qtyAt[unit] end
    end
    local target = total * MARKET_SHARE
    local taken, sum = 0, 0
    for i = 1, #units do
        local unit = units[i]
        if unit >= low and unit <= high then
            local qty = entry.qtyAt[unit]
            taken = taken + qty
            sum = sum + unit * qty
            if taken >= target then break end
        end
    end
    if taken > 0 then stats.market = sum / taken end
    return stats
end

---------------------------------------------------------------------------
-- Method and throttle
---------------------------------------------------------------------------

--- DetectMethod() -> "replicate" | "legacy" | nil. Follows IsUsingLegacyAuctionClient(), the
-- switch Blizzard's own loader uses; only if the switch itself is missing does the presence of
-- the functions decide, preferring the full listing.
function M.DetectMethod()
    local ah = C_AuctionHouse
    local hasReplicate = type(ah) == "table" and type(ah.ReplicateItems) == "function"
        and type(ah.GetNumReplicateItems) == "function" and type(ah.GetReplicateItemInfo) == "function"
    local hasLegacy = type(QueryAuctionItems) == "function" and type(GetNumAuctionItems) == "function"
        and type(GetAuctionItemInfo) == "function" and type(CanSendAuctionQuery) == "function"
    if type(IsUsingLegacyAuctionClient) == "function" then
        if IsUsingLegacyAuctionClient() then
            return hasLegacy and "legacy" or nil
        end
        return hasReplicate and "replicate" or nil
    end
    if hasReplicate then return "replicate" end
    if hasLegacy then return "legacy" end
    return nil
end

-- The only throttle the 5.5.4 source shows for C_AuctionHouse is this one: the sell frame will not
-- post while it is false and re-checks on AUCTION_HOUSE_THROTTLED_SYSTEM_READY
-- (Blizzard_AuctionHouseSellFrame.lua:261-262, :321, :487). A missing function means no throttle.
local function throttleReady()
    local ah = C_AuctionHouse
    if type(ah) == "table" and type(ah.IsThrottledMessageSystemReady) == "function" then
        return ah.IsThrottledMessageSystemReady() and true or false
    end
    return true
end

---------------------------------------------------------------------------
-- Reporting
---------------------------------------------------------------------------

-- Looked up when printed, not when the file loads: /pq lang rewrites ns.L in place after load.
local function reasonText(reason)
    if reason == "running" then return L["A scan is already running."] end
    if reason == "closed" then return L["Open the auction house first, then press Scan prices or type /pq scan."] end
    if reason == "unsupported" then return L["This client offers no auction house listing PandaQuest can read."] end
    if reason == "windowClosed" then return L["Scan cancelled: the auction house window was closed."] end
    if reason == "noAnswer" then return L["Scan stopped: the auction house did not answer."] end
    if reason == "stopped" then return L["Scan stopped. Nothing was saved."] end
    if reason == "empty" then return L["The auction house sent an empty listing. Nothing was saved."] end
    return nil
end

local function report(reason)
    local text = reasonText(reason)
    if text then Log.Print("%s", text) end
end

local function progressFraction(scan)
    if not scan then return 0 end
    if scan.method == "replicate" then
        if scan.state == "finishing" then return 1 end
        if not scan.total or scan.total <= 0 then return 0 end
        return (scan.done or 0) / scan.total
    end
    if scan.state == "finishing" then return 1 end
    if not scan.pages or scan.pages <= 0 then return 0 end
    return (scan.page or 0) / scan.pages
end

---------------------------------------------------------------------------
-- The button on the auction house window
---------------------------------------------------------------------------

local function auctionFrame()
    if M.DetectMethod() == "legacy" then
        return _G.AuctionFrame or _G.AuctionHouseFrame
    end
    return _G.AuctionHouseFrame or _G.AuctionFrame
end

--- RefreshButton(): shows, hides and relabels the scan button. Called on every state change and
-- by the ticker while a scan runs.
function M.RefreshButton()
    if not auctionOpen or not setting("scanButton") then
        if button then button:Hide() end
        return
    end
    local parent = auctionFrame()
    if not parent then
        if button then button:Hide() end
        return
    end
    if not button then
        button = CreateFrame("Button", "PandaQuestAuctionScanButton", parent, "UIPanelButtonTemplate")
        button:SetSize(150, 22)
        button:SetScript("OnClick", function()
            if ctx then M.Stop("stopped") else M.Start() end
        end)
    elseif button:GetParent() ~= parent then
        button:SetParent(parent)
    end
    -- Above the window's top right corner: outside the frame, so it can cover none of Blizzard's
    -- own controls whichever of the two auction UIs is loaded.
    button:ClearAllPoints()
    button:SetPoint("BOTTOMRIGHT", parent, "TOPRIGHT", 0, 2)
    if ctx then
        button:SetText(format(L["Stop scan (%d%%)"], floor(progressFraction(ctx) * 100)))
    else
        button:SetText(L["Scan prices"])
    end
    button:Show()
end

function M.GetButton()
    return button
end

---------------------------------------------------------------------------
-- Scan lifecycle
---------------------------------------------------------------------------

local tick

local function startTicker()
    if not ticker then
        ticker = CreateFrame("Frame", nil, UIParent)
        ticker.elapsed = 0
        ticker:SetScript("OnUpdate", function(self, elapsed)
            self.elapsed = self.elapsed + (elapsed or 0)
            if self.elapsed < TICK then return end
            self.elapsed = 0
            tick()
        end)
    end
    ticker.elapsed = 0
    ticker:Show()
end

local function stopTicker()
    if ticker then ticker:Hide() end
end

local function endScan(scan, result)
    if ctx ~= scan then return end
    ctx = nil
    result.at = unixNow()
    lastResult = result
    stopTicker()
    M.RefreshButton()
end

local function fail(scan, err)
    if ctx ~= scan then return end
    endScan(scan, { ok = false, reason = "error" })
    Log.Error("AuctionScanner", "scan failed: %s", tostring(err))
end

-- Runs one step of the scan as a Thread job. `after(...)` receives the job's returns and decides
-- what comes next. The job is a token rather than the Thread handle: a cancelled job still calls
-- onDone (with "cancelled"), and only the token tells a job that was replaced on purpose -- the
-- player searched, the scan was stopped -- from one that failed.
local function runJob(scan, name, fn, after)
    local job = {}
    scan.job = job
    job.handle = Thread.Run(function() return fn(scan) end, {
        name = "AuctionScan:" .. name,
        ticksPerYield = ROWS_PER_YIELD,
        onDone = function(ok, ...)
            if ctx ~= scan or scan.job ~= job then return end
            scan.job = nil
            if not ok then
                fail(scan, ...)
                return
            end
            after(...)
        end,
    })
end

local function cancelJob(scan)
    local job = scan.job
    scan.job = nil
    if job and job.handle then Thread.Cancel(job.handle) end
end

--- Stop(reason): cancels the running scan and discards what it read. A scan with rows missing is
-- not a price list: an alphabetical half of the auction house would put a wrong minimum on every
-- item it skipped.
function M.Stop(reason)
    local scan = ctx
    if not scan then return false end
    reason = reason or "stopped"
    cancelJob(scan)
    endScan(scan, { ok = false, reason = reason })
    report(reason)
    return true
end

local function buildScan(scan)
    local items, count = {}, 0
    for key, entry in pairs(scan.acc.keys) do
        items[key] = Store.EncodeStats(M.Summarize(entry))
        count = count + 1
        Thread.Yield()
    end
    local version, build
    if GetBuildInfo then version, build = GetBuildInfo() end
    local record = {
        id = format("%s-%s-%d", scan.realm, scan.faction, scan.startedAt),
        region = scan.region, realm = scan.realm, faction = scan.faction, npc = scan.npc,
        startedAt = scan.startedAt, finishedAt = unixNow(), method = scan.method,
        rows = scan.acc.rows, itemCount = count, incomplete = scan.acc.incomplete,
        truncated = scan.truncated and true or false,
        addonVersion = Const.VERSION, clientBuild = version and (build and (version .. "." .. build) or version) or nil,
        items = items,
    }
    Store.AddScan(record)
    return record
end

local function finish(scan)
    if scan.acc.rows == 0 then
        -- A realm's auction house is never empty; a listing with nothing in it is a listing that
        -- did not really arrive. Saved, it would become the newest scan and later reach the hub
        -- as "nothing for sale on this realm".
        endScan(scan, { ok = false, reason = "empty" })
        report("empty")
        return
    end
    scan.state = "finishing"
    runJob(scan, "finish", buildScan, function(record)
        endScan(scan, { ok = true, scan = record })
        Log.Print(L["Auction house scan finished: %d auctions of %d items in %s."], record.rows, record.itemCount,
            Util.FormatTime(clock() - scan.startedClock))
        if record.truncated then
            Log.Print(L["The scan stopped at %d auctions to keep the saved file small."], record.rows)
        end
    end)
end

-- Replicate ------------------------------------------------------------------

local function requestItem(itemID)
    if C_Item and C_Item.RequestLoadItemDataByID then
        pcall(C_Item.RequestLoadItemDataByID, itemID)
    end
end

local function readReplicate(scan)
    local ah = C_AuctionHouse
    local limit = Store.LIMITS.maxRowsPerScan
    for index = 0, scan.total - 1 do
        if scan.acc.rows + #scan.deferred >= limit then
            scan.truncated = true
            break
        end
        -- Returns 14 and 15 are the seller's name and are never kept (see the header).
        local _, _, count, _, _, _, _, _, _, buyout, _, _, _, _, _, _, itemID, hasAllInfo = ah.GetReplicateItemInfo(index)
        local link = ah.GetReplicateItemLink and ah.GetReplicateItemLink(index)
        if hasAllInfo == false and not link and type(itemID) == "number" then
            -- The random suffix lives in the link, and the link waits for the item data. The row
            -- is read again after SETTLE_DELAY rather than filed under the wrong key now.
            scan.deferred[#scan.deferred + 1] = index
            requestItem(itemID)
        else
            addRow(scan.acc, itemID, link, count, buyout)
        end
        scan.done = index + 1
        Thread.Yield()
    end
end

local function readDeferred(scan)
    local ah = C_AuctionHouse
    for i = 1, #scan.deferred do
        local index = scan.deferred[i]
        local _, _, count, _, _, _, _, _, _, buyout, _, _, _, _, _, _, itemID = ah.GetReplicateItemInfo(index)
        local link = ah.GetReplicateItemLink and ah.GetReplicateItemLink(index)
        if not link then scan.acc.incomplete = scan.acc.incomplete + 1 end
        addRow(scan.acc, itemID, link, count, buyout)
        Thread.Yield()
    end
    scan.deferred = {}
end

local function requestReplicate(scan)
    if not throttleReady() then
        scan.state = "throttled"
        return
    end
    scan.state = "waiting"
    scan.sentAt = clock()
    C_AuctionHouse.ReplicateItems()
end

local function onReplicateList()
    local scan = ctx
    if not scan or scan.method ~= "replicate" or scan.state ~= "waiting" then return end
    scan.total = tonumber(C_AuctionHouse.GetNumReplicateItems()) or 0
    scan.state = "reading"
    M.RefreshButton()
    runJob(scan, "replicate", readReplicate, function()
        if #scan.deferred > 0 then
            scan.state = "settling"
            scan.settleAt = clock() + SETTLE_DELAY
        else
            finish(scan)
        end
    end)
end

-- Legacy ---------------------------------------------------------------------

local function readLegacyPage()
    local batch, total = GetNumAuctionItems("list")
    batch, total = tonumber(batch) or 0, tonumber(total) or 0
    local rows, missing = {}, 0
    for i = 1, batch do
        -- Returns 14 and 15 are the seller's name and are never kept (see the header).
        local _, _, count, _, _, _, _, _, _, buyout, _, _, _, _, _, _, itemID, hasAllInfo = GetAuctionItemInfo("list", i)
        local link = GetAuctionItemLink and GetAuctionItemLink("list", i)
        if hasAllInfo == false and not link then missing = missing + 1 end
        rows[#rows + 1] = { itemID, link, count, buyout }
        Thread.Yield()
    end
    return total, rows, missing
end

local function onLegacyPage(scan, total, rows, missing)
    if missing > 0 and (scan.retries or 0) < INFO_RETRIES then
        -- Blizzard's browse list hides such a row until its data arrives ("Bug 145328",
        -- Blizzard_AuctionUI.lua:978); the page stays cached, so it is simply read again.
        scan.retries = (scan.retries or 0) + 1
        scan.state = "pageInfo"
        scan.retryAt = clock() + INFO_RETRY_DELAY
        return
    end
    local limit = Store.LIMITS.maxRowsPerScan
    for i = 1, #rows do
        if scan.acc.rows >= limit then
            scan.truncated = true
            break
        end
        local row = rows[i]
        if not row[2] and missing > 0 then scan.acc.incomplete = scan.acc.incomplete + 1 end
        addRow(scan.acc, row[1], row[2], row[3], row[4])
    end
    scan.retries = 0
    scan.total = total
    scan.pages = ceil(total / PAGE_SIZE)
    scan.page = scan.page + 1
    scan.done = (scan.done or 0) + #rows
    if scan.truncated or #rows == 0 or scan.page >= scan.pages then
        finish(scan)
    else
        scan.state = "query"
    end
    M.RefreshButton()
end

local function readPage(scan)
    scan.state = "reading"
    runJob(scan, "page", readLegacyPage, function(total, rows, missing)
        onLegacyPage(scan, total, rows, missing)
    end)
end

local function onLegacyList()
    local scan = ctx
    if not scan or scan.method ~= "legacy" then return end
    if scan.state == "page" then
        readPage(scan)
    elseif scan.state == "pageInfo" then
        -- The item data the page was waiting for has arrived.
        scan.retryAt = clock()
    end
end

-- docs/08 A: the scan never competes with the player. A search the player makes while a legacy
-- scan is paging would be answered with the scan's page (or the scan would read the player's), so
-- a query the scanner did not send pauses the scan and re-requests its page afterwards.
local function hookPlayerQueries()
    if hookedPlayerQueries or type(QueryAuctionItems) ~= "function" or not hooksecurefunc then return end
    hookedPlayerQueries = true
    hooksecurefunc("QueryAuctionItems", function()
        local scan = ctx
        if not scan or scan.method ~= "legacy" or scan.issuing then return end
        scan.pausedUntil = clock() + PLAYER_QUERY_PAUSE
        if scan.state == "page" or scan.state == "pageInfo" or scan.state == "reading" then
            cancelJob(scan)
            scan.state = "query"
        end
    end)
end

local function sendLegacyQuery(scan)
    if clock() < (scan.pausedUntil or 0) then return end
    if not CanSendAuctionQuery("list") then return end
    scan.issuing = true
    local ok, err = pcall(QueryAuctionItems, "", 0, 0, scan.page, false, FILTER_ALL_INDEX, false, false, nil)
    scan.issuing = false
    if not ok then
        fail(scan, err)
        return
    end
    scan.state = "page"
    scan.sentAt = clock()
end

-- Ticker ---------------------------------------------------------------------

tick = function()
    local scan = ctx
    if not scan then
        stopTicker()
        return
    end
    local now = clock()
    local state = scan.state
    if state == "throttled" then
        requestReplicate(scan)
    elseif state == "waiting" then
        if now - scan.sentAt > REPLICATE_TIMEOUT then M.Stop("noAnswer") return end
    elseif state == "settling" then
        if now >= scan.settleAt then
            scan.state = "reading"
            runJob(scan, "deferred", readDeferred, function() finish(scan) end)
        end
    elseif state == "query" then
        sendLegacyQuery(scan)
    elseif state == "page" then
        if now - scan.sentAt > PAGE_TIMEOUT then M.Stop("noAnswer") return end
    elseif state == "pageInfo" then
        if now >= scan.retryAt then readPage(scan) end
    end
    M.RefreshButton()
end

--- CanScan() -> ok, reasonOrMethod. ok is false with "running", "closed" or "unsupported".
function M.CanScan()
    if ctx then return false, "running" end
    if not auctionOpen then return false, "closed" end
    local method = M.DetectMethod()
    if not method then return false, "unsupported" end
    return true, method
end

--- Start() -> ok, reason. Starts a full scan of the open auction house.
function M.Start()
    local ok, method = M.CanScan()
    if not ok then
        report(method)
        return false, method
    end
    local realm, faction, region = Store.CurrentHouse()
    local scan = {
        method = method, realm = realm, faction = faction, region = region, npc = auctioneerNpc,
        startedAt = unixNow(), startedClock = clock(), acc = newAccumulator(), done = 0,
        deferred = {}, page = 0,
    }
    ctx = scan
    Log.Print("%s", L["Scanning the auction house. Keep the window open; closing it cancels the scan."])
    if method == "replicate" then
        requestReplicate(scan)
    else
        hookPlayerQueries()
        scan.state = "query"
        sendLegacyQuery(scan)
    end
    if ctx == scan then startTicker() end
    M.RefreshButton()
    return true, method
end

function M.IsScanning()
    return ctx ~= nil
end

--- GetProgress() -> { state, method, rows, total, page, pages, elapsed, fraction } or nil.
function M.GetProgress()
    local scan = ctx
    if not scan then return nil end
    return { state = scan.state, method = scan.method, rows = scan.acc.rows, done = scan.done,
             total = scan.total, page = scan.page, pages = scan.pages,
             elapsed = clock() - scan.startedClock, fraction = progressFraction(scan) }
end

--- GetLastResult() -> { ok, reason, scan, at } of the last scan this session, or nil.
function M.GetLastResult()
    return lastResult
end

--- GetLastScan() -> the newest stored scan of the auction house this character uses, or nil.
function M.GetLastScan()
    local realm, faction = Store.CurrentHouse()
    return Store.GetLatestScan(realm, faction)
end

function M.IsAuctionHouseOpen()
    return auctionOpen
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------

local function onAuctionHouseShow()
    auctionOpen = true
    -- "npc" is the unit the auction frame draws its portrait from
    -- (Blizzard_AuctionHouseFrame.lua:392). Kept so a neutral auction house can be told apart
    -- later; the source offers no other way to know which house this is.
    local guid = UnitGUID and UnitGUID("npc")
    auctioneerNpc = guid and Util.NpcIdFromGuid(guid) or nil
    M.RefreshButton()
    -- UIParent loads the auction UI in its own AUCTION_HOUSE_SHOW handler; if this handler ran
    -- first the frame does not exist yet, so look again on the next frame.
    if not button or not button:IsShown() then
        if C_Timer and C_Timer.After then C_Timer.After(0, M.RefreshButton) end
    end
end

local function onAuctionHouseClosed()
    auctionOpen = false
    local scan = ctx
    -- Reading needs the window; turning what was read into prices does not. A scan that has
    -- every row is saved even if the player walks away while it is being summarised.
    if scan and scan.state ~= "finishing" then
        M.Stop("windowClosed")
    end
    M.RefreshButton()
end

local function onThrottleReady()
    local scan = ctx
    if scan and scan.state == "throttled" then
        requestReplicate(scan)
        M.RefreshButton()
    end
end

--- ChatCommand(arg): /pq scan [stop|status].
function M.ChatCommand(arg)
    arg = tostring(arg or ""):lower()
    if arg == "stop" then
        if not M.Stop("stopped") then Log.Print("%s", L["No scan is running."]) end
        return
    end
    if arg == "status" then
        local progress = M.GetProgress()
        if progress then
            Log.Print(L["Scanning: %d%% (%d auctions read)."], floor(progress.fraction * 100), progress.rows)
        end
        local last = M.GetLastScan()
        if last then
            -- The method is printed because it is the one thing docs/08 section 0 could not settle
            -- from the source: which auction API the live client answered.
            Log.Print(L["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."], last.realm, last.faction,
                tostring(last.method), last.rows or 0, last.itemCount or 0,
                Util.FormatTime(unixNow() - (last.finishedAt or 0)))
        elseif not progress then
            Log.Print("%s", L["No auction house scan yet for this realm."])
        end
        return
    end
    M.Start()
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    local PQ = ns.PQ
    if PQ and PQ.commands then
        PQ.commands.scan = M.ChatCommand
    end
end

function M.Enable()
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if not AceEvent then return end
    AceEvent:Embed(M)
    M:RegisterEvent("AUCTION_HOUSE_SHOW", onAuctionHouseShow)
    M:RegisterEvent("AUCTION_HOUSE_CLOSED", onAuctionHouseClosed)
    M:RegisterEvent("REPLICATE_ITEM_LIST_UPDATE", onReplicateList)
    M:RegisterEvent("AUCTION_ITEM_LIST_UPDATE", onLegacyList)
    M:RegisterEvent("AUCTION_HOUSE_THROTTLED_SYSTEM_READY", onThrottleReady)
end

function M.OnProfileChanged()
    M.RefreshButton()
end
