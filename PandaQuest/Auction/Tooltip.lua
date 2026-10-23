-- Auction/Tooltip.lua: this realm's last known auction price on item tooltips.
--
-- Same way in as Map/Tooltips.lua: C_TooltipInfo does not exist on 5.5.4, so the price is added
-- from an OnTooltipSetItem hook. The figures come only from scans of the auction house this
-- character uses -- this realm, this faction -- and a tooltip for an item no such scan listed gets
-- nothing at all rather than a guess.
local _, ns = ...
local L = ns.L

local Util = ns.Util
local Store = ns.AuctionStore

local M = ns.PQ:GetModule("AuctionTooltip")   -- an AceAddon module (Core/Const.lua)
ns.AuctionTooltip = M

local type, tostring, format, pcall = type, tostring, string.format, pcall

local COLOR_LABEL = { 1, 0.82, 0 }
local COLOR_VALUE = { 1, 1, 1 }
local COLOR_AGE = { 0.6, 0.6, 0.6 }

local hooked = false

-- The tooltip hooks cannot be taken off again, so a module switched off in Options > Modules is
-- told apart here, on every tooltip.
local function enabled()
    if not ns.IsModuleWanted("AuctionTooltip") then return false end
    local PQ = ns.PQ
    local auction = PQ and PQ.db and PQ.db.profile and PQ.db.profile.auction
    if not auction then return ns.DEFAULTS.profile.auction.showTooltipPrices end
    return auction.showTooltipPrices ~= false
end

--- FormatMoney(copper) -> "14g 50s", "3s 20c", "7c": Util.FormatMoney, which the quest rewards use too.
function M.FormatMoney(copper)
    return Util.FormatMoney(copper)
end

local function itemFromTooltip(tooltip)
    if not tooltip or not tooltip.GetItem then return nil end
    local ok, _, link, id = pcall(tooltip.GetItem, tooltip)
    if not ok then return nil end
    local itemID, suffix = Store.ParseItemLink(link)
    if not itemID and type(id) == "number" then itemID, suffix = id, 0 end
    return itemID, suffix
end

--- AddPriceLines(tooltip, itemID, suffixID) -> true when lines were added.
function M.AddPriceLines(tooltip, itemID, suffixID)
    local realm, faction = Store.CurrentHouse()
    local price = Store.GetPrice(itemID, suffixID, realm, faction)
    if not price then return false end
    local minText = price.minBuyout and M.FormatMoney(price.minBuyout) or L["bids only"]
    tooltip:AddDoubleLine(L["AH minimum buyout"], minText, COLOR_LABEL[1], COLOR_LABEL[2], COLOR_LABEL[3],
        COLOR_VALUE[1], COLOR_VALUE[2], COLOR_VALUE[3])
    if price.market then
        tooltip:AddDoubleLine(L["AH market value"], M.FormatMoney(price.market), COLOR_LABEL[1], COLOR_LABEL[2],
            COLOR_LABEL[3], COLOR_VALUE[1], COLOR_VALUE[2], COLOR_VALUE[3])
    end
    local age = (time and time() or 0) - (price.at or 0)
    -- The price is always this realm's, so the realm is shown as the game spells it; the stored
    -- key has its spaces taken out for the hub.
    local realmName = (GetRealmName and GetRealmName()) or price.realm
    tooltip:AddLine(format(L["%s, scanned %s ago"], tostring(realmName), Util.FormatTime(age)),
        COLOR_AGE[1], COLOR_AGE[2], COLOR_AGE[3])
    return true
end

--- OnTooltipSetItem(tooltip): the hook.
function M.OnTooltipSetItem(tooltip)
    if not enabled() then return end
    local itemID, suffix = itemFromTooltip(tooltip)
    if not itemID then return end
    if M.AddPriceLines(tooltip, itemID, suffix) and tooltip.Show then
        tooltip:Show()
    end
end

function M.OnEnable()
    if hooked then return end
    for _, name in ipairs({ "GameTooltip", "ItemRefTooltip" }) do
        local tooltip = _G[name]
        if tooltip and tooltip.HookScript then
            tooltip:HookScript("OnTooltipSetItem", M.OnTooltipSetItem)
        end
    end
    hooked = true
end
