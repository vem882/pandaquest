-- Auction/Mail.lua: what this character sold and bought, read from auction invoices in the mailbox
--
-- The API is the one Blizzard's own mail frame reads (Blizzard_UIPanels_Game/Classic/MailFrame.lua):
--   GetInboxInvoiceInfo(i) -> invoiceType, itemName, playerName, bid, buyout, deposit, consignment,
--                             moneyDelay, etaHour, etaMin, count, commerceAuction         (:514)
--   GetInboxHeaderInfo(i)  -> ..., daysLeft (7, fractional days, :221-224), ..., firstItemID (15, :174)
-- GetInboxInvoiceInfo is not in the generated API documentation of this build at all, so every
-- call is guarded and a missing function simply records nothing.
--
-- playerName is the other side of the trade -- another player's character -- and is discarded at
-- the call. The sender of the mail is discarded the same way. GetInboxText is never
-- called: reading a letter's text is what opening it does, and it would mark every invoice read
-- behind the player's back.
local _, ns = ...

local Log = ns.Log
local Store = ns.AuctionStore

local M = {}
ns.AuctionMail = M

local type, tonumber, tostring, format, floor, abs = type, tonumber, tostring, string.format, math.floor, math.abs

-- MailFrame.lua:530-611 draws three kinds. "seller_temp_invoice" is a sale whose money is still on
-- its way (AUCTION_INVOICE_PENDING_FUNDS_COLON, :593); the final "seller" invoice for the same sale
-- follows, so recording the temporary one as well would count every sale twice.
local KIND = { buyer = "bought", seller = "sold" }

-- An invoice has no id. What identifies one across mailbox visits is its content plus the moment
-- it expires, which the server fixes when the mail is sent; daysLeft is derived from that moment,
-- so now + daysLeft stays the same number from one visit to the next. The tolerance only absorbs
-- rounding in daysLeft and clock drift between visits.
local EXPIRY_TOLERANCE = 3600
local READ_DELAY = 0.3              -- MAIL_INBOX_UPDATE comes in bursts; read once per burst

local mailboxOpen = false
local pending = false

local function setting(key)
    local PQ = ns.PQ
    local auction = PQ and PQ.db and PQ.db.profile and PQ.db.profile.auction
    if not auction then return ns.DEFAULTS.profile.auction[key] end
    return auction[key]
end

local function serverNow()
    if GetServerTime then return GetServerTime() end
    return (time and time()) or 0
end

local function characterKey()
    local realm = Store.CurrentHouse()
    local name = (UnitName and UnitName("player")) or "Unknown"
    return name .. "-" .. realm
end

local function fingerprint(r)
    return format("%s|%s|%s|%d|%d|%d|%d|%d|%s", r.character or "", r.kind, r.item, r.count or 1, r.price or 0,
        r.buyout or 0, r.deposit or 0, r.cut or 0, r.commodity and "c" or "")
end

--- ReadInbox() -> number of new records. Safe to call as often as the inbox changes: an invoice
-- already recorded on an earlier visit is matched and skipped.
function M.ReadInbox()
    if not setting("recordSales") then return 0 end
    if type(GetInboxNumItems) ~= "function" or type(GetInboxInvoiceInfo) ~= "function"
        or type(GetInboxHeaderInfo) ~= "function" then
        return 0
    end
    local realm, faction = Store.CurrentHouse()
    local character = characterKey()
    local now = serverNow()

    -- Every stored record, by fingerprint, each usable once per read: two identical sales in the
    -- same inbox are two records, and a third identical mail is only new if nothing is left to
    -- match it with.
    local sales = Store.GetSales()
    local byPrint = {}
    for i = 1, #sales do
        local key = fingerprint(sales[i])
        local list = byPrint[key]
        if not list then
            list = {}
            byPrint[key] = list
        end
        list[#list + 1] = sales[i]
    end
    local used = {}

    local added = 0
    local numItems = tonumber((GetInboxNumItems())) or 0
    for index = 1, numItems do
        -- Return 3 is the other player's name and is never kept (see the header).
        local invoiceType, itemName, _, bid, buyout, deposit, consignment, _, _, _, count, commerceAuction =
            GetInboxInvoiceInfo(index)
        local kind = KIND[invoiceType]
        if kind and type(itemName) == "string" then
            local _, _, _, _, _, _, daysLeft, _, _, _, _, _, _, _, firstItemID = GetInboxHeaderInfo(index)
            daysLeft = tonumber(daysLeft)
            if daysLeft then
                local record = {
                    kind = kind, item = itemName, count = tonumber(count) or 1,
                    price = tonumber(bid) or 0, buyout = tonumber(buyout) or 0,
                    commodity = commerceAuction and true or nil,
                    character = character, realm = realm, faction = faction,
                    mailExpires = floor(now + daysLeft * 86400 + 0.5), seenAt = now,
                }
                if kind == "sold" then
                    record.deposit = tonumber(deposit) or 0
                    record.cut = tonumber(consignment) or 0
                    -- What the seller invoice says arrived: MailFrame.lua:574 draws bid+deposit-consignment.
                    record.net = record.price + record.deposit - record.cut
                else
                    -- A purchase invoice carries the item it paid for.
                    record.itemId = tonumber(firstItemID)
                end
                local match
                for _, old in ipairs(byPrint[fingerprint(record)] or {}) do
                    if not used[old] and abs((tonumber(old.mailExpires) or 0) - record.mailExpires) <= EXPIRY_TOLERANCE then
                        match = old
                        break
                    end
                end
                if match then
                    used[match] = true
                else
                    Store.AddSale(record)
                    added = added + 1
                end
            end
        end
    end
    if added > 0 then
        Log.Debug("AuctionMail", "recorded %d auction invoice(s)", added)
    end
    return added
end

local function readSoon()
    if pending then return end
    pending = true
    local function run()
        pending = false
        local ok, err = pcall(M.ReadInbox)
        if not ok then Log.Error("AuctionMail", "reading the inbox failed: %s", tostring(err)) end
    end
    if C_Timer and C_Timer.After then
        C_Timer.After(READ_DELAY, run)
    else
        run()
    end
end

function M.IsMailboxOpen()
    return mailboxOpen
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Enable()
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if not AceEvent then return end
    AceEvent:Embed(M)
    -- MAIL_SHOW / MAIL_CLOSED / MAIL_INBOX_UPDATE: MailInfoDocumentation.lua:97, :50, :66. The inbox
    -- is only read while the mailbox is open; MailFrame_Show's CheckInbox (MailFrame.lua:102) is
    -- what brings the MAIL_INBOX_UPDATE with the invoices in it.
    M:RegisterEvent("MAIL_SHOW", function()
        mailboxOpen = true
    end)
    M:RegisterEvent("MAIL_INBOX_UPDATE", function()
        if mailboxOpen then readSoon() end
    end)
    M:RegisterEvent("MAIL_CLOSED", function()
        mailboxOpen = false
    end)
end
