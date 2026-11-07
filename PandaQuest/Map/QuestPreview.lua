-- Preview a quest's NPC in the game's own model viewer.
local _, ns = ...
local panel, model, nameText, selectedQuest

local function hide()
    selectedQuest = nil
    if panel then panel:Hide() end
    if model and model.ClearModel then model:ClearModel() end
end

local function npcFor(questID)
    local db = ns.DB
    local quest = db and db.GetQuest(questID)
    if not quest then return end
    local targets = ns.Targets and ns.Targets.GetAll()
    for _, target in ipairs(targets or {}) do
        if target.questID == questID and target.entityType == "npc" and target.kind == "OBJECTIVE" then
            return target.entityID
        end
    end
    local objectives = quest.objectives or {}
    local creature = objectives.creatures and objectives.creatures[1]
    local finishers = quest.finishedBy and quest.finishedBy.npcs
    local starters = quest.startedBy and quest.startedBy.npcs
    return creature and creature.id or finishers and finishers[1] or starters and starters[1]
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
    model:SetPoint("BOTTOMRIGHT", -6, 28)
    nameText = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    nameText:SetPoint("BOTTOMLEFT", 6, 6)
    nameText:SetPoint("BOTTOMRIGHT", -6, 6)
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
    local npcID = npcFor(questID)
    if type(npcID) ~= "number" or npcID <= 0 then return end
    if not panel then createPanel(details) end
    if not model.SetCreature then return end
    local ok, result = pcall(model.SetCreature, model, npcID)
    if not ok or result == false then return end
    nameText:SetText(ns.DB.GetNpcName(npcID) or "")
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
