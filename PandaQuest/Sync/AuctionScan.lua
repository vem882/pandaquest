local _, ns = ...
local L = ns.L
local driver = CreateFrame("Frame")
local tab, panel, scanButton, status, scroll, resultContent, results
local modern, page, pending, sending, complete
local seen = {}

local function readableNumber(value)
    return not (_G.issecretvalue and _G.issecretvalue(value)) and type(value) == "number"
end

local function addPrice(prices, id, price)
    if not readableNumber(id) or not readableNumber(price) or id < 1 or id > 10000000
        or id % 1 ~= 0 or price < 1 or price > 1000000000000 then return end
    price = math.floor(price)
    if not prices[id] or price < prices[id] then prices[id] = price end
end

local function reset()
    page, pending, complete = 0, nil, false
    seen = {}
    if scanButton then
        scanButton:SetText(L["Scan and share"])
        scanButton:Enable()
        results:SetText("")
        scroll:SetVerticalScroll(0)
        status:SetText(L["Find listed buyout prices and share them by realm and faction through Sync."])
    end
end

local function finish(prices, last)
    pending, complete = nil, last
    local updates, ids = {}, {}
    for id, price in pairs(prices) do
        if not seen[id] or price < seen[id] then
            seen[id] = price
            updates[id] = price
            ids[#ids + 1] = id
        end
    end
    local added = ns.Telemetry.QueueNativeAuctionPrices(updates)
    table.sort(ids)
    local lines = {}
    for i = 1, #ids do
        local id = ids[i]
        local name = (C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(id))
            or (GetItemInfo and GetItemInfo(id)) or ("#" .. id)
        local money = GetCoinTextureString and GetCoinTextureString(updates[id])
            or tostring(updates[id]) .. "c"
        lines[i] = name .. "   " .. money
    end
    results:SetText(table.concat(lines, "\n"))
    resultContent:SetHeight(math.max(1, results:GetStringHeight()))
    scroll:SetVerticalScroll(0)
    status:SetText(string.format(L["%d new prices in this batch. %d queued for Sync after logout or reload."],
        added, ns.Telemetry.NativeAuctionPriceCount()))
    scanButton:SetText(complete and L["Scan again"] or L["Find next"])
    scanButton:Enable()
end

local function readModern(rows)
    local prices = {}
    for _, row in ipairs(rows or {}) do
        addPrice(prices, row.itemKey and row.itemKey.itemID, row.minPrice)
    end
    finish(prices, C_AuctionHouse.HasFullBrowseResults())
end

local function readLegacy()
    local count, total = GetNumAuctionItems("list")
    local prices = {}
    for i = 1, count do
        local _, _, quantity, _, _, _, _, _, _, buyout, _, _, _, _, _, _, id = GetAuctionItemInfo("list", i)
        if readableNumber(quantity) and readableNumber(buyout) and quantity > 0 then
            addPrice(prices, id, math.ceil(buyout / quantity))
        end
    end
    page = page + 1
    finish(prices, count < (_G.NUM_AUCTION_ITEMS_PER_PAGE or 50)
        or (total and page * (_G.NUM_AUCTION_ITEMS_PER_PAGE or 50) >= total))
end

local function scan()
    if pending then return end
    if not ns.IsModuleWanted("Telemetry") then
        status:SetText(L["Enable the Telemetry module to share prices through Sync."])
        return
    end
    if ns.Telemetry.NativeAuctionPriceCount() >= ns.Telemetry.MAX_NATIVE_AUCTION_PRICES then
        status:SetText(L["Reload or log out to save this scan before continuing."])
        return
    end
    if complete then reset() end
    local ready = modern and C_AuctionHouse.IsThrottledMessageSystemReady or CanSendAuctionQuery
    if ready and not ready() then
        status:SetText(L["The auction house is busy. Try again in a moment."])
        return
    end
    local request = {}
    pending, sending = request, true
    scanButton:Disable()
    status:SetText(L["Waiting for auction results…"])
    local ok
    if modern then
        if page == 0 then
            ok = pcall(C_AuctionHouse.SendBrowseQuery, { searchString = "", sorts = {}, filters = {}, itemClassFilters = {} })
        else
            ok = pcall(C_AuctionHouse.RequestMoreBrowseResults)
        end
    else
        ok = pcall(QueryAuctionItems, "", nil, nil, page, false, nil, false, false, nil)
    end
    sending = false
    if not ok then
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
    if not sending and panel and panel:IsShown() and (pending or page > 0) then
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
    scanButton:SetScript("OnClick", scan)
    scroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", scanButton, "BOTTOMLEFT", 0, -16)
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
