-- Local account-scoped capture. This data is separate from public price observations.
local _, ns = ...
local driver = CreateFrame("Frame")
local M = {}
ns.OwnAuctions = M
local auctionOpen, mailboxOpen, mailboxReadPending
local MAX_LISTINGS, MAX_SALES = 500, 500

local function plain(value, expected)
    return not (issecretvalue and issecretvalue(value)) and type(value) == expected
end

local function integer(value, minimum, maximum)
    if plain(value, "number") and value >= minimum and value <= maximum and value % 1 == 0 then
        return value
    end
end

local function game()
    return ns.Game and ns.Game.id
end

local function settings()
    return ns.Telemetry.GetSettings()
end

function M.ApplySettings()
    local store = _G.PandaQuestOwnAuctions
    if type(store) == "table" and store.version == 1 and store.game == game() then
        store.enabled = settings().recordOwnAuctions == true
    end
end

local function record()
    if not settings().recordOwnAuctions then return end
    local gameId = game()
    if not gameId then return end
    local key, name, realm = ns.Telemetry.GetCharacterIdentity()
    local store = _G.PandaQuestOwnAuctions
    if store == nil then
        store = { version = 1, game = gameId, characters = {} }
        _G.PandaQuestOwnAuctions = store
    end
    if type(store) == "table" and store.game == gameId and store.version == nil then
        store.version, store.characters = 1, {}
    end
    if type(store) ~= "table" or store.version ~= 1 or store.game ~= gameId
        or type(store.characters) ~= "table" then return end
    store.enabled = true
    local character = store.characters[key]
    if not character then
        character = { sales = {}, nextSale = 0 }
        store.characters[key] = character
    end
    character.name, character.realm = name, realm
    character.region = GetCurrentRegionName and GetCurrentRegionName() or nil
    character.faction = UnitFactionGroup and UnitFactionGroup("player") or nil
    return character
end

local function money(value)
    return integer(value, 0, 1000000000000)
end

local function listing(itemId, quantity, buyout, bid, expiresAt)
    itemId = integer(itemId, 1, 10000000)
    quantity = integer(quantity, 1, 1000000)
    if not itemId or not quantity then return end
    return { itemId = itemId, quantity = quantity, buyout = money(buyout), bid = money(bid), expiresAt = expiresAt }
end

local function saveListings(modern)
    if not auctionOpen or not settings().recordOwnAuctions then return end
    local now = GetServerTime()
    local rows = {}
    local count
    if modern then
        count = C_AuctionHouse.GetNumOwnedAuctions()
    else
        count = GetNumAuctionItems("owner")
    end
    if not integer(count, 0, MAX_LISTINGS) then return end
    for i = 1, count do
        local row
        if modern then
            local info = C_AuctionHouse.GetOwnedAuctionInfo(i)
            if not plain(info, "table") or not plain(info.itemKey, "table")
                or not plain(info.status, "number") then return end
            local active = Enum and Enum.AuctionStatus and Enum.AuctionStatus.Active
            if info.status == (active or 0) then
                local seconds = integer(info.timeLeftSeconds, 1, 604800)
                row = listing(info.itemKey.itemID, info.quantity, info.buyoutAmount, info.bidAmount,
                    seconds and now + seconds)
                if not row then return end
            end
        else
            local _, _, quantity, _, _, _, _, _, _, buyout, bid, _, _, _, _, sold, itemId =
                GetAuctionItemInfo("owner", i)
            if not plain(sold, "number") then return end
            if sold == 0 then
                row = listing(itemId, quantity, buyout, bid)
                if not row then return end
            end
        end
        if row then rows[#rows + 1] = row end
    end
    local character = record()
    if character then character.snapshot = { observedAt = now, listings = rows } end
end

local function fingerprint(row)
    return string.format("%s|%d|%d|%d", row.itemName, row.quantity, row.gross, row.net)
end

local function readSales()
    if not mailboxOpen or not settings().recordOwnAuctions then return end
    local count = integer(GetInboxNumItems(), 0, 500)
    if not count then return end
    local character = record()
    if not character then return end
    local now = GetServerTime()
    local used, existing = {}, {}
    for _, row in ipairs(character.sales) do
        local key = fingerprint(row)
        existing[key] = existing[key] or {}
        table.insert(existing[key], row)
    end
    for i = 1, count do
        -- Ignore the counterparty and all mail bodies. Temporary invoices have no settled sale.
        local kind, name, _, gross, _, deposit, cut, _, _, _, quantity = GetInboxInvoiceInfo(i)
        if plain(kind, "string") and kind == "seller" and plain(name, "string") and #name > 0 and #name <= 256 then
            local _, _, _, _, _, _, daysLeft = GetInboxHeaderInfo(i)
            gross, deposit, cut = money(gross), money(deposit) or 0, money(cut) or 0
            if gross and gross > 0 and plain(daysLeft, "number") and daysLeft >= 0 and daysLeft <= 90 then
                local row = {
                    itemName = name, quantity = integer(quantity, 1, 1000000) or 1,
                    gross = gross, net = math.max(0, gross + deposit - cut), observedAt = now,
                    invoiceExpiresAt = math.floor(now + daysLeft * 86400 + 0.5),
                }
                local key = fingerprint(row)
                local match
                for _, old in ipairs(existing[key] or {}) do
                    if not used[old] and math.abs(old.invoiceExpiresAt - row.invoiceExpiresAt) <= 3600 then
                        match = old
                        break
                    end
                end
                if match then
                    used[match] = true
                else
                    character.nextSale = character.nextSale + 1
                    row.id = string.format("%d-%d", now, character.nextSale)
                    character.sales[#character.sales + 1] = row
                end
            end
        end
    end
    while #character.sales > MAX_SALES do table.remove(character.sales, 1) end
end

driver:RegisterEvent("PLAYER_LOGIN")
driver:RegisterEvent("AUCTION_HOUSE_SHOW")
driver:RegisterEvent("AUCTION_HOUSE_CLOSED")
if C_AuctionHouse and C_AuctionHouse.GetNumOwnedAuctions and C_AuctionHouse.GetOwnedAuctionInfo then
    driver:RegisterEvent("OWNED_AUCTIONS_UPDATED")
end
if GetNumAuctionItems and GetAuctionItemInfo then
    driver:RegisterEvent("AUCTION_OWNED_LIST_UPDATE")
end
if GetInboxNumItems and GetInboxInvoiceInfo and GetInboxHeaderInfo then
    driver:RegisterEvent("MAIL_SHOW")
    driver:RegisterEvent("MAIL_CLOSED")
    driver:RegisterEvent("MAIL_INBOX_UPDATE")
end
driver:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_LOGIN" then
        M.ApplySettings()
    elseif event == "AUCTION_HOUSE_SHOW" then
        auctionOpen = true
    elseif event == "AUCTION_HOUSE_CLOSED" then
        auctionOpen = false
    elseif event == "OWNED_AUCTIONS_UPDATED" then
        saveListings(true)
    elseif event == "AUCTION_OWNED_LIST_UPDATE" then
        saveListings(false)
    elseif event == "MAIL_SHOW" then
        mailboxOpen = true
    elseif event == "MAIL_CLOSED" then
        mailboxOpen = false
    elseif event == "MAIL_INBOX_UPDATE" and mailboxOpen and settings().recordOwnAuctions and not mailboxReadPending then
        mailboxReadPending = true
        C_Timer.After(0, function()
            mailboxReadPending = false
            readSales()
        end)
    end
end)
