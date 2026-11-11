-- Preview quest items, objects, and NPCs beside the map's quest details.
local _, ns = ...
local panel, model, nameText, selectedQuest, nextButton
local candidates, index, icon

local function hide()
    selectedQuest = nil
    if panel then panel:Hide() end
    if model and model.ClearModel then model:ClearModel() end
end

local function previewsFor(questID)
    local db = ns.DB
    local quest = db and db.GetQuest(questID)
    local result, seen = {}, {}
    if not quest then return result end
    local function add(id, kind, label)
        kind = kind or "npc"
        local key = kind .. tostring(id)
        if type(id) == "number" and id > 0 and not seen[key] then
            seen[key] = true
            result[#result + 1] = { id = id, kind = kind, label = label }
        end
    end
    local objectives = quest.objectives or {}
    for _, item in ipairs(objectives.items or {}) do add(item.id, "item", item.text) end
    for _, object in ipairs(objectives.objects or {}) do add(object.id, "object", object.text) end
    local targets = ns.Targets and ns.Targets.GetAll()
    for _, target in ipairs(targets or {}) do
        if target.questID == questID and target.kind == "OBJECTIVE" then
            if target.entityType == "item" or target.entityType == "object" then
                add(target.entityID, target.entityType, target.entityName)
                if target.sourceType == "npc" then add(target.sourceID) end
            elseif target.entityType == "npc" then
                add(target.entityID)
            end
        end
    end
    for _, creature in ipairs(quest.objectives and quest.objectives.creatures or {}) do
        add(creature.id)
    end
    for _, id in ipairs(quest.finishedBy and quest.finishedBy.npcs or {}) do add(id) end
    for _, id in ipairs(quest.startedBy and quest.startedBy.npcs or {}) do add(id) end
    return result
end

local function showCandidate()
    local entry = candidates[index]
    local id, kind = entry.id, entry.kind
    if model.ClearModel then model:ClearModel() end
    model:Hide()
    icon:Hide()
    local name
    if kind == "npc" then
        local ok, result = pcall(model.SetCreature, model, id)
        model:SetShown(ok and result ~= false)
        name = ns.DB.GetNpcName(id)
    elseif kind == "item" then
        local getIcon = C_Item and C_Item.GetItemIconByID or _G.GetItemIcon
        icon:SetTexture((getIcon and getIcon(id)) or "Interface\\Icons\\INV_Misc_QuestionMark")
        icon:Show()
        name = ns.DB.GetItemName(id)
    else
        icon:SetTexture((ns.Icons and ns.Icons.Get("object")) or "Interface\\Icons\\INV_Misc_QuestionMark")
        icon:Show()
        name = ns.DB.GetObjectName(id)
    end
    nameText:SetText(name or entry.label or tostring(id))
    nextButton:SetText(format("%d / %d  >", index, #candidates))
    nextButton:SetShown(#candidates > 1)
end

local function createPanel(details)
    panel = CreateFrame("Frame", nil, details, BackdropTemplateMixin and "BackdropTemplate")
    panel:SetSize(148, 164)
    panel:SetPoint("TOPRIGHT", details, "TOPLEFT", -8, -32)
    panel:SetFrameLevel(details:GetFrameLevel() + 5)
    if panel.SetBackdrop then
        panel:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 },
        })
    end
    model = CreateFrame("PlayerModel", nil, panel)
    model:SetPoint("TOPLEFT", 6, -20)
    model:SetPoint("BOTTOMRIGHT", -6, 48)
    icon = panel:CreateTexture(nil, "ARTWORK")
    icon:SetSize(48, 48)
    icon:SetPoint("CENTER", 0, 9)
    nameText = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    nameText:SetPoint("BOTTOMLEFT", 6, 27)
    nameText:SetPoint("BOTTOMRIGHT", -6, 27)
    nextButton = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    nextButton:SetSize(78, 20)
    nextButton:SetPoint("BOTTOM", 0, 5)
    nextButton:SetScript("OnClick", function()
        index = index % #candidates + 1
        showCandidate()
    end)
    local close = CreateFrame("Button", nil, panel, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", 2, 2)
    close:SetScript("OnClick", function() panel:Hide() end)
    details:HookScript("OnHide", hide)
    panel:Hide()
end

local function show(questID)
    if questID == selectedQuest then return end
    hide()
    local details = QuestMapFrame and QuestMapFrame.DetailsFrame
    if not details or not details:IsShown() then return end
    candidates = previewsFor(questID)
    if #candidates == 0 then return end
    if not panel then createPanel(details) end
    index = 1
    showCandidate()
    selectedQuest = questID
    panel:Show()
end

local loader = CreateFrame("Frame")
local function install()
    if type(hooksecurefunc) ~= "function" or type(QuestMapFrame_ShowQuestDetails) ~= "function" then return end
    hooksecurefunc("QuestMapFrame_ShowQuestDetails", show)
    loader:UnregisterAllEvents()
end
loader:RegisterEvent("ADDON_LOADED")
loader:SetScript("OnEvent", install)
install()
