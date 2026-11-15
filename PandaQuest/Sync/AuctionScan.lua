local _, ns = ...
local L = ns.L
local driver = CreateFrame("Frame")
local tab, panel, scanButton, missingButton, status, scroll, resultContent, results
local modern, page, pending, sending
local seen, quantities = {}, {}
local run, processed, total, progress, previousTotal
local scan
local MISSING_BATCH_SIZE = 100
local PRICE_RECHECK = 86400
local EMPTY_RECHECK = 6 * 3600
local MARKET_STATE_MAX_AGE = 7 * 86400
local MAX_LISTINGS_PER_ITEM = 10000

local function readableNumber(value)
    return not (_G.issecretvalue and _G.issecretvalue(value)) and type(value) == "number"
end

local function addPrice(prices, id, price, quantity)
    if not readableNumber(id) or not readableNumber(price) or id < 1 or id > 10000000
        or id % 1 ~= 0 or price < 1 or price > 1000000000000 then return end
    if not run.target and readableNumber(quantity) and quantity > 0 then
        quantities[id] = math.min(1000000, (quantities[id] or 0) + math.floor(quantity))
    end
    price = math.floor(price)
    if not prices[id] or price < prices[id] then prices[id] = price end
end

local function marketIdentity()
    local _, _, realm = ns.Telemetry.GetCharacterIdentity()
    local region = _G.GetCurrentRegionName and _G.GetCurrentRegionName()
    local faction = _G.UnitFactionGroup and _G.UnitFactionGroup("player")
    realm = (realm or ""):lower()
    region = (region or ""):lower()
    local mode = realm:match("rppvp$") or realm:match("rp%-pvp$") or realm:match("hardcore$")
        or realm:match("pvp$") or realm:match("pve$") or realm:match("normal$")
        or realm:match("roleplay$") or realm:match("rp$")
    if mode == "normal" then mode = "pve" end
    if mode == "roleplay" then mode = "rp" end
    if mode == "rp-pvp" then mode = "rppvp" end
    return region, mode, realm, faction or ""
end

local function missingList()
    local region, mode = marketIdentity()
    local markets = ns.AuctionMissingMarkets and ns.AuctionMissingMarkets[ns.Game.id]
    return (markets and (markets[region .. ":" .. (mode or "")] or markets[region]))
        or (ns.AuctionMissing and ns.AuctionMissing[ns.Game.id])
end

local function marketState()
    local region, _, realm, faction = marketIdentity()
    local key = table.concat({ ns.Game.id, region, realm, faction }, ":")
    local state = ns.PQ.db.global.auctionMissingProgress
    local now = time()
    for identity, entry in pairs(state) do
        if type(entry) ~= "table" or type(entry.updated) ~= "number" or entry.updated < now - MARKET_STATE_MAX_AGE then
            state[identity] = nil
        end
    end
    local current = state[key] or { retry = {} }
    current.updated = now
    state[key] = current
    for id, untilTime in pairs(current.retry) do
        if type(untilTime) ~= "number" or untilTime <= now then current.retry[id] = nil end
    end
    return current
end

local function missingBatch(list, current)
    local batch, positions = {}, {}
    local first = 1
    for index, id in ipairs(list) do
        if id == current.nextId then first = index; break end
    end
    for offset = 0, #list - 1 do
        local index = (first + offset - 1) % #list + 1
        local id = list[index]
        if not current.retry[id] then
            batch[#batch + 1] = id
            positions[id] = list[index % #list + 1]
            if #batch >= MISSING_BATCH_SIZE then break end
        end
    end
    return batch, positions
end

local function reset()
    page, pending = 0, nil
    seen, quantities = {}, {}
    run, processed, total = nil, 0, nil
    if progress then progress:SetValue(0) end
    if scanButton then
        scanButton:SetText(L["Scan and share"])
        scanButton:Enable()
        local missing = missingList()
        missingButton:SetText(L["Find missing prices"])
        missingButton:SetEnabled(type(missing) == "table" and #missing > 0)
        results:SetText("")
        scroll:SetVerticalScroll(0)
        status:SetText(L["Find listed buyout prices and share them by realm and faction through Sync."])
    end
end

local function continueScan(delay)
    local current = run
    C_Timer.After(delay, function() if run == current and current then scan() end end)
end

local function displayPrices(updates, ids)
    table.sort(ids)
    local lines = {}
    for i = 1, #ids do
        local id = ids[i]
        local name = (C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(id))
            or (ns.DB and ns.DB.GetItemName(id)) or (_G.GetItemInfo and _G.GetItemInfo(id)) or ("#" .. id)
        local money = _G.GetCoinTextureString and _G.GetCoinTextureString(updates[id])
            or string.format("%dg %02ds %02dc", math.floor(updates[id] / 10000),
                math.floor(updates[id] / 100) % 100, updates[id] % 100)
        lines[i] = name .. "   " .. money
    end
    results:SetText(table.concat(lines, "\n"))
    resultContent:SetHeight(math.max(1, results:GetStringHeight()))
    scroll:SetVerticalScroll(0)
end

local function finishTarget(price, skipped)
    local target = run.target
    pending, page, total = nil, 0, nil
    if price then
        ns.Telemetry.QueueNativeAuctionPrices({ [target.id] = price })
        run.found = run.found + 1
        displayPrices({ [target.id] = price }, { target.id })
    elseif skipped then
        run.skipped = run.skipped + 1
    end
    run.market.nextId = run.positions[target.id]
    if not skipped then
        run.market.retry[target.id] = time() + (price and PRICE_RECHECK or EMPTY_RECHECK)
    end
    run.checked = run.checked + 1
    status:SetText(string.format(L["Missing prices: %d/%d checked · %d found · %d without buyout · %d skipped"],
        run.checked, run.limit, run.found, run.checked - run.found - run.skipped, run.skipped))
    progress:SetValue(math.floor(run.checked * 100 / run.limit))
    if run.checked >= run.limit then
        run = nil
        scanButton:Enable()
        missingButton:SetText(L["Find missing prices"])
    else
        run.index, run.target = run.index + 1, nil
        continueScan(0.5)
    end
end

-- Seller strings live only in the running scan. Queue just count and price statistics.
local function summarizeListings()
    local summaries = {}
    if not run.listings or run.incompleteListings then return summaries end
    for id, item in pairs(run.listings) do
        local prices = item.prices
        if prices then
            table.sort(prices)
            local n = #prices
            local middle = math.floor((n + 1) / 2)
            local median = math.floor((prices[middle] + prices[math.floor(n / 2) + 1]) / 2)
            summaries[id] = {
                lowest = prices[1], askn = n, askmed = median, askmax = prices[n],
                sellers = not item.missingOwner and not (item.shortOwners and item.fullOwners) and item.sellerCount or nil,
            }
        end
    end
    return summaries
end

local function recordListing(id, price, owner, hasFullOwner)
    local item = run.listings[id]
    if not item then
        item = { prices = {}, owners = {}, sellerCount = 0 }
        run.listings[id] = item
    end
    if not item.prices then return end
    if #item.prices == MAX_LISTINGS_PER_ITEM then
        item.prices, item.owners = nil, nil
        return
    end
    item.prices[#item.prices + 1] = price
    if (_G.issecretvalue and _G.issecretvalue(owner)) or type(owner) ~= "string" or owner == "" then
        item.missingOwner = true
        return
    end
    if hasFullOwner then item.fullOwners = true else item.shortOwners = true end
    local key = owner:lower()
    if not item.owners[key] then
        item.owners[key] = true
        item.sellerCount = item.sellerCount + 1
    end
end

local function finish(prices, last)
    pending = nil
    if run.target then
        local target = run.target
        local price = prices[target.id]
        if price then target.price = math.min(target.price or price, price) end
        if last then finishTarget(target.price) else continueScan(0.5) end
        return
    end
    local updates, ids = {}, {}
    for id, price in pairs(prices) do
        if not seen[id] or price < seen[id] then
            seen[id] = price
            updates[id] = price
            ids[#ids + 1] = id
        end
    end
    ns.Telemetry.QueueNativeAuctionPrices(updates, last and quantities or nil,
        last and summarizeListings() or nil)
    displayPrices(updates, ids)
    local queued = ns.Telemetry.NativeAuctionPriceCount()
    local percent = last and 100 or total and total > 0 and math.min(99, math.floor(processed / total * 100))
    progress:SetValue(percent or 0)
    if percent and modern and not last then
        status:SetText(string.format(L["About %d%% · %d prices queued for Sync"], percent, queued))
    elseif percent then
        status:SetText(string.format(L["%d%% · %d prices queued for Sync"], percent, queued))
    else
        status:SetText(string.format(L["Batch %d · %d prices queued · Total unknown"], page, queued))
    end
    if last then
        if modern and processed > 0 then previousTotal = processed end
        local missing = missingList()
        if missing then
            local current = marketState()
            for _, id in ipairs(missing) do
                if seen[id] then current.retry[id] = time() + PRICE_RECHECK end
            end
        end
        run = nil
        scanButton:SetText(L["Scan again"])
        local missing = missingList()
        missingButton:SetEnabled(type(missing) == "table" and #missing > 0)
    else
        continueScan(0.5)
    end
end

local function readModern(rows)
    local prices = {}
    processed = processed + #(rows or {})
    total = previousTotal
    for _, row in ipairs(rows or {}) do
        addPrice(prices, row.itemKey and row.itemKey.itemID, row.minPrice, row.totalQuantity)
    end
    finish(prices, C_AuctionHouse.HasFullBrowseResults())
end

local function readLegacy()
    local count, reportedTotal = GetNumAuctionItems("list")
    local prices = {}
    for i = 1, count do
        local _, _, quantity, _, _, _, _, _, _, buyout, _, _, _, owner, ownerFull, _, id, complete =
            GetAuctionItemInfo("list", i)
        local readable = readableNumber(quantity) and readableNumber(buyout) and quantity > 0
        if run.listings and ((_G.issecretvalue and _G.issecretvalue(complete)) or complete ~= true
            or not readable or not readableNumber(id)) then
            run.incompleteListings = true
        end
        if readable then
            local price = math.ceil(buyout / quantity)
            addPrice(prices, id, price, quantity)
            if run.listings and not run.incompleteListings and price >= 1 and price <= 1000000000000
                and id >= 1 and id <= 10000000 and id % 1 == 0 then
                local hasFullOwner = not (_G.issecretvalue and _G.issecretvalue(ownerFull))
                    and type(ownerFull) == "string" and ownerFull ~= ""
                recordListing(id, price, hasFullOwner and ownerFull or owner, hasFullOwner)
            end
        end
    end
    page = page + 1
    processed = processed + count
    if readableNumber(reportedTotal) then total = reportedTotal end
    local pageSize = _G.NUM_AUCTION_ITEMS_PER_PAGE or 50
    local last = count < pageSize or (total and page * pageSize >= total)
    if last and (not total or processed ~= total) then run.incompleteListings = true end
    finish(prices, last)
end

scan = function()
    if pending or not run then return end
    if not ns.IsModuleWanted("Telemetry") then
        reset()
        status:SetText(L["Enable the Telemetry module to share prices through Sync."])
        return
    end
    if ns.Telemetry.NativeAuctionPriceCount() >= ns.Telemetry.MAX_NATIVE_AUCTION_PRICES then
        reset()
        status:SetText(L["Reload or log out to save this scan before continuing."])
        return
    end
    local ready = modern and C_AuctionHouse.IsThrottledMessageSystemReady or CanSendAuctionQuery
    if ready and not ready() then
        continueScan(1)
        return
    end
    if run.ids then
        local target = run.target or { id = run.ids[run.index], started = GetTime() }
        run.target = target
        if not target.name then
            target.name = (C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(target.id))
                or (_G.GetItemInfo and _G.GetItemInfo(target.id))
                or (GetLocale() == "enUS" and ns.DB and ns.DB.GetItemName(target.id))
            if _G.issecretvalue and _G.issecretvalue(target.name) then target.name = nil end
            if type(target.name) ~= "string" or target.name == "" then
                target.name = nil
                if GetTime() - target.started >= 3 then finishTarget(nil, true); return end
                if not target.requested and C_Item and C_Item.RequestLoadItemDataByID then
                    target.requested = true
                    C_Item.RequestLoadItemDataByID(target.id)
                end
                continueScan(0.25)
                return
            end
        end
    end
    local target = run.target
    local search = target and target.name or ""
    local request = {}
    pending, sending = request, true
    local ok
    if modern then
        if page == 0 then
            ok = pcall(C_AuctionHouse.SendBrowseQuery, { searchString = search, sorts = {}, filters = {}, itemClassFilters = {} })
        else
            ok = pcall(C_AuctionHouse.RequestMoreBrowseResults)
        end
    else
        ok = pcall(QueryAuctionItems, search, nil, nil, page, false, nil, false, target ~= nil, nil)
    end
    sending = false
    if not ok then
        if target then finishTarget(nil, true); return end
        reset()
        status:SetText(L["The auction request failed. Try scanning again."])
        return
    end
    C_Timer.After(20, function()
        if pending == request then
            reset()
            status:SetText(L["The auction request timed out. Try scanning again."])
        end
    end)
end

local function otherSearch()
    if not sending and run and panel and panel:IsShown() then
        reset()
        status:SetText(L["Another auction search started. Scan again to begin a new list."])
    end
end

local function createTab(parent)
    panel = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    panel:SetPoint("TOPLEFT", parent, "TOPLEFT", 12, -66)
    panel:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -12, 12)
    panel:SetFrameLevel(parent:GetFrameLevel() + 60)
    panel:EnableMouse(true)
    panel:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", edgeSize = 22 })
    panel:SetBackdropColor(0.09, 0.07, 0.05, 1)
    panel:Hide()

    local title = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 22, -22)
    title:SetText(L["PandaQuest auction prices"])
    local close = CreateFrame("Button", nil, panel, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -3, -3)
    close:SetScript("OnClick", function() panel:Hide() end)

    status = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    status:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -15)
    status:SetPoint("RIGHT", -22, 0)
    status:SetJustifyH("LEFT")
    scanButton = CreateFrame("Button", "PandaQuestAuctionScanButton", panel, "UIPanelButtonTemplate")
    scanButton:SetSize(170, 26)
    scanButton:SetPoint("TOPLEFT", status, "BOTTOMLEFT", 0, -15)
    scanButton:SetScript("OnClick", function()
        if run then reset(); return end
        reset()
        run = { listings = not modern and {} or nil }
        missingButton:Disable()
        scanButton:SetText(L["Stop scan"])
        status:SetText(L["Waiting for auction results…"])
        scan()
    end)
    missingButton = CreateFrame("Button", "PandaQuestAuctionMissingButton", panel, "UIPanelButtonTemplate")
    missingButton:SetSize(200, 26)
    missingButton:SetPoint("LEFT", scanButton, "RIGHT", 8, 0)
    missingButton:SetText(L["Find missing prices"])
    missingButton:SetScript("OnClick", function()
        if run then reset(); return end
        reset()
        local list = missingList()
        if type(list) ~= "table" or #list == 0 then return end
        local current = marketState()
        local batch, positions = missingBatch(list, current)
        if #batch == 0 then
            status:SetText(L["All missing-price targets were checked recently. Try again later."])
            return
        end
        run = { ids = batch, index = 1, found = 0, skipped = 0, checked = 0,
            limit = #batch, market = current, positions = positions }
        scanButton:Disable()
        missingButton:SetText(L["Stop scan"])
        status:SetText(L["Waiting for auction results…"])
        scan()
    end)
    progress = CreateFrame("StatusBar", nil, panel)
    progress:SetPoint("TOPLEFT", scanButton, "BOTTOMLEFT", 0, -8)
    progress:SetSize(160, 12)
    progress:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    progress:SetStatusBarColor(0.86, 0.66, 0.23)
    progress:SetMinMaxValues(0, 100)
    scroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", progress, "BOTTOMLEFT", 0, -10)
    scroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -38, 20)
    resultContent = CreateFrame("Frame", nil, scroll)
    resultContent:SetSize(1, 1)
    scroll:SetScrollChild(resultContent)
    scroll:SetScript("OnSizeChanged", function(self, width)
        resultContent:SetWidth(math.max(1, width))
    end)
    results = resultContent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    results:SetPoint("TOPLEFT")
    results:SetPoint("RIGHT")
    results:SetJustifyH("LEFT")

    tab = CreateFrame("Button", "PandaQuestAuctionTab", parent, "UIPanelButtonTemplate")
    tab:SetSize(50, 24)
    tab:SetPoint("TOPRIGHT", parent, "BOTTOMRIGHT", -12, -1)
    tab:SetText("PQ")
    tab:SetScript("OnClick", function() panel:SetShown(not panel:IsShown()) end)
    panel:SetScript("OnHide", reset)
    reset()
end

local function setup()
    if tab then return end
    local parent = _G.AuctionHouseFrame or _G.AuctionFrame
    if not parent or not parent:IsShown() then return end
    local ah = _G.C_AuctionHouse
    modern = parent == _G.AuctionHouseFrame and ah and ah.SendBrowseQuery and ah.GetBrowseResults
        and ah.RequestMoreBrowseResults and ah.HasFullBrowseResults
    if not modern and not (QueryAuctionItems and GetNumAuctionItems and GetAuctionItemInfo) then return end
    createTab(parent)
    if modern then
        driver:RegisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_UPDATED")
        driver:RegisterEvent("AUCTION_HOUSE_BROWSE_RESULTS_ADDED")
        hooksecurefunc(ah, "SendBrowseQuery", otherSearch)
        hooksecurefunc(ah, "RequestMoreBrowseResults", otherSearch)
    else
        driver:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
        hooksecurefunc(_G, "QueryAuctionItems", otherSearch)
    end
end

driver:RegisterEvent("AUCTION_HOUSE_SHOW")
driver:SetScript("OnEvent", function(_, event, rows)
    if event == "AUCTION_HOUSE_SHOW" then
        if not tab then C_Timer.After(0, setup) end
    elseif pending and panel:IsVisible() then
        if event == "AUCTION_HOUSE_BROWSE_RESULTS_UPDATED" and page == 0 then
            page = 1
            readModern(C_AuctionHouse.GetBrowseResults())
        elseif event == "AUCTION_HOUSE_BROWSE_RESULTS_ADDED" then
            page = page + 1
            readModern(rows)
        elseif event == "AUCTION_ITEM_LIST_UPDATE" then
            readLegacy()
        end
    end
end)
