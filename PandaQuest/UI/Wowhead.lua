-- UI/Wowhead.lua: Wowhead URL builders and the copy dialog (docs/06 section 11).
-- An in-game addon cannot open a browser, so the best we can do is hand the player a
-- pre-selected edit box and tell them to press Ctrl+C.
local _, ns = ...
local L = ns.L

local Const, Log = ns.Const, ns.Log

local M = {}
ns.Wowhead = M

local type, tonumber, format = type, tonumber, string.format

local BASE = Const.WOWHEAD_BASE or "https://www.wowhead.com/mop-classic/"
local POPUP = "PANDAQUEST_WOWHEAD_URL"

local function url(kind, id)
    id = tonumber(id)
    if not id then return nil end
    return format("%s%s=%d", BASE, kind, id)
end

function M.QuestUrl(id) return url("quest", id) end
function M.NpcUrl(id) return url("npc", id) end
function M.ObjectUrl(id) return url("object", id) end
function M.ItemUrl(id) return url("item", id) end

--- Wowhead.UrlForTarget(target) -> url|nil. Prefers the entity, falls back to the quest.
function M.UrlForTarget(target)
    if type(target) ~= "table" then return nil end
    if target.entityID then
        if target.entityType == "npc" then return M.NpcUrl(target.entityID) end
        if target.entityType == "object" then return M.ObjectUrl(target.entityID) end
        if target.entityType == "item" then return M.ItemUrl(target.entityID) end
    end
    return M.QuestUrl(target.questID)
end

---------------------------------------------------------------------------
-- Copy dialog
---------------------------------------------------------------------------

-- The edit box is not truly read-only (WoW has no such flag on EditBox in 5.5.4), so any edit
-- simply restores the URL and re-selects it: the player can copy but not mangle the link.
local function restore(editBox)
    local dialog = editBox and editBox.GetParent and editBox:GetParent()
    local text = dialog and dialog.data
    if type(text) ~= "string" then return end
    if editBox:GetText() ~= text then
        editBox:SetText(text)
    end
    editBox:HighlightText()
end

if StaticPopupDialogs then
    StaticPopupDialogs[POPUP] = {
        text = "%s",
        button1 = _G and _G.CLOSE or "Close",
        hasEditBox = true,
        editBoxWidth = 350,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
        OnShow = function(self, data)
            local editBox = self.editBox or (self.GetName and _G[self:GetName() .. "EditBox"])
            if not editBox then return end
            self.data = data
            editBox:SetText(type(data) == "string" and data or "")
            editBox:SetFocus()
            editBox:HighlightText()
        end,
        EditBoxOnTextChanged = restore,
        EditBoxOnEnterPressed = function(editBox)
            local dialog = editBox:GetParent()
            if dialog and dialog.Hide then dialog:Hide() end
        end,
        EditBoxOnEscapePressed = function(editBox)
            local dialog = editBox:GetParent()
            if dialog and dialog.Hide then dialog:Hide() end
        end,
    }
end

--- Wowhead.ShowCopyDialog(url): pops the copy box. Falls back to a chat line when StaticPopup
-- is unavailable, so the link is never simply lost.
function M.ShowCopyDialog(theUrl)
    if type(theUrl) ~= "string" or theUrl == "" then return false end
    M.lastUrl = theUrl
    if StaticPopup_Show and StaticPopupDialogs and StaticPopupDialogs[POPUP] then
        local dialog = StaticPopup_Show(POPUP, L["Press Ctrl+C to copy the link:"], nil, theUrl)
        if dialog then
            -- StaticPopup_Show only passes `data` to OnShow on some clients; set it either way.
            dialog.data = theUrl
            local editBox = dialog.editBox or (dialog.GetName and _G[dialog:GetName() .. "EditBox"])
            if editBox then
                editBox:SetText(theUrl)
                if editBox.HighlightText then editBox:HighlightText() end
            end
            return true
        end
    end
    Log.Print("%s", theUrl)
    return false
end

--- Wowhead.ShowForTarget(target): convenience for the pin and arrow menus.
function M.ShowForTarget(target)
    return M.ShowCopyDialog(M.UrlForTarget(target))
end

M.POPUP = POPUP
M.BASE = BASE

function M.Init() end
