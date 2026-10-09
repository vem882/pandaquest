-- Nav/Arrow.lua: the navigation arrow (docs/06 section 9.5).
--
-- Rotation convention, verified against the stub world and Blizzard's own code:
--   * HBD:GetWorldVector and GetPlayerFacing() both measure radians from north, growing the same
--     way (north 0, west pi/2, south pi, east 3*pi/2), so the relative bearing is
--     `worldAngle - facing`.
--   * Texture:SetRotation(r) rotates counter-clockwise for positive r (Blizzard_RadialWheel.lua:72
--     feeds it atan2(dy, dx) in screen coordinates, which is counter-clockwise).
--   Both grow counter-clockwise, so the arrow texture - which points UP - is rotated by exactly the
--   bearing: target to the left of the player -> positive bearing -> texture turns left. No sign
--   flip anywhere. `/pq debug arrow` prints angle/facing/bearing to double-check it in game.
--
-- Performance rule for OnUpdate (docs/06 9.5): rotation and colour are recomputed every frame -
-- those are three arithmetic calls and two setters, no allocation - while the text lines are only
-- rebuilt when a *rounded* value actually changed. Standing still therefore allocates nothing.
local _, ns = ...
local L = ns.L

local M = {}
ns.Arrow = M

local Const, Util, Log, Compat = ns.Const, ns.Util, ns.Log, ns.Compat

-- AceEvent/AceTimer key their registries by object, and CallbackHandler keeps exactly ONE callback
-- per (object, message). Registering on the shared ns.PQ object therefore silently replaces the
-- handler another module installed for the same message, so every module listens through its own
-- embedded object instead (docs/06 section 3 allows a module to use its own frame).
local listener = {}
M.listener = listener
do
    local AceEvent = LibStub and LibStub("AceEvent-3.0", true)
    if AceEvent then AceEvent:Embed(listener) end
    local AceTimer = LibStub and LibStub("AceTimer-3.0", true)
    if AceTimer then AceTimer:Embed(listener) end
end

local tonumber, tostring = tonumber, tostring
local abs, floor, pi = math.abs, math.floor, math.pi
local format = string.format

local PI2 = pi * 2
-- The arrow texture is rotated with Texture:SetRotation, which spins the texture coordinates INSIDE
-- the region's rect. A non-square rect therefore stretches the image differently at every angle
-- (worst at 90/270 degrees) and clips the tip on the diagonals, so the region is square and the
-- artwork in arrow.tga fits inside its inscribed circle (tools/make_textures.py).
local BASE_SIZE = 56
local TEXT_BLOCK = 56                   -- room under the arrow for the four text lines
local NO_TARGET_GRACE = 1.0             -- keep the arrow up for a second before hiding (docs 9.5)
local TEXT_INTERVAL = 0.1               -- how often the text values are re-examined
local EVALUATE_INTERVAL = 0.2           -- show/hide heartbeat (a hidden frame has no OnUpdate)
local FLASH_TIME = 0.6                  -- arrival glow duration
local TEXTURE_PATH = "Interface\\AddOns\\PandaQuest\\Textures\\"

---------------------------------------------------------------------------
-- State (all scalars: nothing here is allocated per frame)
---------------------------------------------------------------------------

local frame, arrowTex, glowTex, titleText, actionText, statusText, communityText
local shownTarget                       -- target the visible texts belong to
local lastTargetAt = 0                  -- GetTime() when a target was last available
local textAccum = 0
local lastDistanceStep, lastEtaStep = nil, nil
local flashUntil = 0
local visible = false
local dragging = false

local function profile()
    local PQ = ns.PQ
    return (PQ and PQ.db and PQ.db.profile) or ns.DEFAULTS.profile
end

local function arrowProfile()
    local p = profile()
    return p.arrow or ns.DEFAULTS.profile.arrow
end

local function now()
    return (GetTime and GetTime()) or 0
end

---------------------------------------------------------------------------
-- Colour gradient: red (behind) -> yellow (sideways) -> green (dead ahead)
---------------------------------------------------------------------------

local function gradient(ahead)
    if ahead < 0 then ahead = 0 elseif ahead > 1 then ahead = 1 end
    if ahead < 0.5 then
        return 1, ahead * 2, 0
    end
    return (1 - ahead) * 2, 1, 0
end
M.Gradient = gradient

---------------------------------------------------------------------------
-- Text
---------------------------------------------------------------------------

local function difficultyTitle(target)
    local title = target.questTitle or target.text or ""
    local level = tonumber(target.questLevel)
    if not level then return title end
    return format("|c%s[%d] %s|r", Util.QuestDifficultyColorHex(level), level, title)
end

-- Rebuilds the three text lines. Only ever called when something rounded changed.
local function rebuildText(target, distance, eta)
    if not titleText then return end
    local p = arrowProfile()
    if shownTarget ~= target then
        titleText:SetText(difficultyTitle(target))
        actionText:SetText(target.text or target.objectiveText or "")
        if communityText then
            local avg = target.communityAvgTime
            if p.showCommunity and avg then
                communityText:SetText(format(L["Community: avg %s"], Util.FormatTime(avg)))
                communityText:Show()
            else
                communityText:SetText("")
                communityText:Hide()
            end
        end
        shownTarget = target
    end
    if not statusText then return end
    if not distance then
        -- Explicit, not blank: an empty line next to a visible arrow reads as "zero metres away".
        statusText:SetText(L["Distance unknown"])
        return
    end
    local units = profile().units
    if not p.showETA or not eta then
        statusText:SetText(Util.FormatDistance(distance, units))
    else
        statusText:SetText(format("%s  \226\128\162  ~%s", Util.FormatDistance(distance, units), Util.FormatTime(eta)))
    end
end

-- Distance granularity for change detection: below 10 yards a tenth, above that a whole unit.
local function distanceStep(distance)
    if distance < 10 then return floor(distance * 10) end
    return 100 + floor(distance)
end

---------------------------------------------------------------------------
-- Visibility
---------------------------------------------------------------------------

local function shouldHide()
    local p = arrowProfile()
    if not p.enabled then return true end
    if Compat.IsInPetBattle() then return true end
    if Compat.UnitOnTaxi("player") then return true end
    if p.autoHideInInstance and ns.Player and ns.Player.IsInInstance and ns.Player.IsInInstance() then
        return true
    end
    return false
end

--- Evaluate(): decides whether the arrow belongs on screen right now.
-- A hidden frame gets no OnUpdate in WoW, so this cannot live inside OnUpdate alone: a repeating
-- 0.2 s timer (and the target/zone messages) call it as well, and that is what brings the arrow
-- back after an instance, a taxi ride or a spell of having no target.
function M.Evaluate()
    if not frame then return false end
    local Router = ns.Router
    local hasTarget = (Router and Router.GetCurrent and Router.GetCurrent()) ~= nil
    if shouldHide() then
        if visible then frame:Hide(); visible = false end
        return false
    end
    if hasTarget then
        lastTargetAt = now()
    elseif (now() - lastTargetAt) > NO_TARGET_GRACE then
        if visible then frame:Hide(); visible = false end
        return false
    end
    if not visible then
        frame:Show()
        visible = true
        shownTarget = nil
        lastDistanceStep, lastEtaStep = nil, nil
    end
    return true
end

---------------------------------------------------------------------------
-- OnUpdate
---------------------------------------------------------------------------

local function onUpdate(self, elapsed)
    if not M.Evaluate() then return end
    local Router = ns.Router
    local target = Router and Router.GetCurrent and Router.GetCurrent() or nil

    if not target then
        if arrowTex then arrowTex:SetVertexColor(0.55, 0.55, 0.55) end
        return
    end

    -- Rotation, colour and the arrival fade: every frame, arithmetic only.
    local distance = Router.GetDistanceTo(target)
    if arrowTex then
        -- pfQuest's arrival feedback (route.lua:373): the arrow fades as you enter the objective
        -- circle, so "you are there" reads without looking at the numbers.
        local alpha = 1
        if distance then
            local radius = Router.GetArriveRadius and Router.GetArriveRadius(target) or 15
            if distance < radius * 2 then
                alpha = 0.45 + 0.55 * Util.Clamp((distance - radius) / radius, 0, 1)
            end
        end
        arrowTex:SetAlpha(alpha)
    end
    local angle = Router.GetAngleTo(target)
    local facing = Compat.GetPlayerFacing()
    if angle and facing then
        local bearing = angle - facing
        while bearing > pi do bearing = bearing - PI2 end
        while bearing <= -pi do bearing = bearing + PI2 end
        if arrowTex then
            arrowTex:SetRotation(bearing)
            local ahead = 1 - abs(bearing) / pi
            local r, g, b = gradient(ahead)
            arrowTex:SetVertexColor(r, g, b)
        end
    elseif arrowTex then
        -- No bearing: the target sits in another instance group, or HBD cannot resolve the map
        -- right now. Keeping the last rotation would point the player confidently in a direction
        -- that is no longer meaningful, so the arrow is reset and greyed out instead.
        arrowTex:SetRotation(0)
        arrowTex:SetVertexColor(0.55, 0.55, 0.55)
    end

    -- Arrival glow (numbers only; the texture alpha is a scalar setter).
    if glowTex then
        local remaining = flashUntil - now()
        if remaining > 0 then
            glowTex:SetAlpha(remaining / FLASH_TIME)
        elseif glowTex:GetAlpha() > 0 then
            glowTex:SetAlpha(0)
        end
    end

    -- Text: re-examined 10x/s, rebuilt only when a rounded value changed.
    textAccum = textAccum + (elapsed or 0)
    if textAccum < TEXT_INTERVAL and shownTarget == target then return end
    textAccum = 0

    local eta = Router.GetETA(target)
    local dStep = distance and distanceStep(distance) or nil
    local eStep = eta and floor(eta + 0.5) or nil
    if shownTarget == target and dStep == lastDistanceStep and eStep == lastEtaStep then return end
    lastDistanceStep, lastEtaStep = dStep, eStep
    rebuildText(target, distance, eta)
end

---------------------------------------------------------------------------
-- Interaction
---------------------------------------------------------------------------

local function savePosition()
    if not frame then return end
    local point, _, _, x, y = frame:GetPoint(1)
    if not point then return end
    local p = arrowProfile()
    p.point, p.x, p.y = point, x, y
end

local function onDragStart(self)
    if arrowProfile().locked then return end
    dragging = true
    self:StartMoving()
end

local function onDragStop(self)
    if not dragging then return end
    dragging = false
    self:StopMovingOrSizing()
    savePosition()
end

--- ShowContextMenu(owner, menu) -> "menu"|"chat"|nil
-- 5.5.4 removed EasyMenu together with the old UIDropDownMenu builders (it exists neither in the
-- client source nor in Ketho's global dump); MenuUtil.CreateContextMenu is the replacement and is
-- what Blizzard's own WatchFrame.lua:88 calls. `menu` is the classic EasyMenu array, so the entries
-- stay inspectable by tests and by the chat fallback that keeps the actions reachable on a client
-- without MenuUtil.
function M.ShowContextMenu(owner, menu)
    if type(menu) ~= "table" then return nil end
    local util = _G and _G.MenuUtil
    if util and util.CreateContextMenu then
        -- pcall: a right click must never throw, whatever the menu API does with the owner region.
        local ok, err = pcall(util.CreateContextMenu, owner or UIParent, function(_, root)
            if not root then return end
            for i = 1, #menu do
                local entry = menu[i]
                if entry.isTitle then
                    if root.CreateTitle then root:CreateTitle(entry.text) end
                elseif entry.func and root.CreateButton then
                    root:CreateButton(entry.text, entry.func)
                end
            end
        end)
        if ok then return "menu" end
        Log.Error("Arrow", "context menu failed: %s", tostring(err))
    end
    -- No menu system at all: print the actions instead of silently doing nothing.
    for i = 1, #menu do
        local entry = menu[i]
        if not entry.isTitle and entry.text then Log.Print("- %s", tostring(entry.text)) end
    end
    return "chat"
end

local function openMenu()
    local Router = ns.Router
    local target = Router and Router.GetCurrent and Router.GetCurrent() or nil
    local p = arrowProfile()
    local menu = {
        { text = Const.CHAT_PREFIX, isTitle = true, notCheckable = true },
        { text = L["Next target"], notCheckable = true, func = function()
            if Router and Router.Skip then Router.Skip() end
        end },
        { text = p.locked and L["Unlock arrow"] or L["Lock arrow"], notCheckable = true, func = function()
            M.SetLocked(not p.locked)
        end },
        { text = L["Reset arrow position"], notCheckable = true, func = M.ResetPosition },
        { text = (profile().units == "yards") and L["Show distance in metres"] or L["Show distance in yards"],
          notCheckable = true, func = function()
            local db = ns.PQ and ns.PQ.db
            if not db then return end
            db.profile.units = (db.profile.units == "yards") and "meters" or "yards"
            if ns.PQ.SendMessage then ns.PQ:SendMessage("PQ_SETTING_CHANGED", "units", db.profile.units) end
            M.Refresh()
        end },
    }
    if target then
        if target.uiMapID then
            menu[#menu + 1] = { text = L["Show on map"], notCheckable = true, func = function()
                if ns.Pins and ns.Pins.ShowTarget then ns.Pins.ShowTarget(target) end
            end }
        end
        if target.questID then
            menu[#menu + 1] = { text = L["Wowhead link"], notCheckable = true, func = function()
                if ns.Wowhead and ns.Wowhead.ShowCopyDialog and ns.Wowhead.QuestUrl then
                    ns.Wowhead.ShowCopyDialog(ns.Wowhead.QuestUrl(target.questID))
                end
            end }
            menu[#menu + 1] = { text = L["Hide this quest"], notCheckable = true, func = function()
                local db = ns.PQ and ns.PQ.db
                if db then db.char.hiddenQuests[target.questID] = true end
                if ns.Targets and ns.Targets.Rebuild then ns.Targets.Rebuild("arrowHide") end
            end }
        end
        if ns.TomTomBridge and ns.TomTomBridge.IsAvailable and ns.TomTomBridge.IsAvailable() then
            menu[#menu + 1] = { text = L["Send to TomTom"], notCheckable = true, func = function()
                ns.TomTomBridge.SetWaypoint(target)
            end }
        end
    end
    menu[#menu + 1] = { text = L["Close"], notCheckable = true, func = function() end }
    M.lastMenu = menu
    return M.ShowContextMenu(frame, menu)
end
M.OpenMenu = openMenu

local function onClick(self, button)
    local Router = ns.Router
    local target = Router and Router.GetCurrent and Router.GetCurrent() or nil
    local shift = IsShiftKeyDown and IsShiftKeyDown()
    if shift or button == "MiddleButton" then
        if target and ns.TomTomBridge and ns.TomTomBridge.SetWaypoint then
            ns.TomTomBridge.SetWaypoint(target)
        end
        return
    end
    if button == "RightButton" then
        openMenu()
        return
    end
    if Router and Router.Skip then Router.Skip() end
end
M.OnClick = onClick

local function onEnter(self)
    if not GameTooltip then return end
    local Router = ns.Router
    local target = Router and Router.GetCurrent and Router.GetCurrent() or nil
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
    GameTooltip:AddLine(Const.CHAT_PREFIX)
    if target then
        GameTooltip:AddLine(target.questTitle or target.text or "", 1, 1, 1)
        if target.objectiveText then GameTooltip:AddLine(target.objectiveText, 0.8, 0.8, 0.8) end
        if target.questID and ns.QuestLog and ns.QuestLog.GetQuest then
            local entry = ns.QuestLog.GetQuest(target.questID)
            local objectives = entry and entry.objectives
            if objectives then
                for i = 1, #objectives do
                    local objective = objectives[i]
                    local r, g, b = 1, 0.82, 0
                    if objective.finished then r, g, b = 0.3, 1, 0.3 end
                    GameTooltip:AddLine("- " .. tostring(objective.text or ""), r, g, b)
                end
            end
        end
        local distance = Router.GetDistanceTo(target)
        if distance then
            local eta = Router.GetETA(target)
            GameTooltip:AddDoubleLine(L["Distance"], Util.FormatDistance(distance, profile().units))
            if eta then GameTooltip:AddDoubleLine(L["ETA"], Util.FormatTime(eta)) end
        end
    else
        GameTooltip:AddLine(L["No current target."], 0.7, 0.7, 0.7)
    end
    GameTooltip:AddLine(L["Click: next target"], 0.6, 0.6, 0.6)
    GameTooltip:AddLine(L["Right-click: arrow menu"], 0.6, 0.6, 0.6)
    GameTooltip:AddLine(L["Shift-click: send to TomTom"], 0.6, 0.6, 0.6)
    GameTooltip:Show()
end
M.OnEnter = onEnter

local function onLeave()
    if GameTooltip then GameTooltip:Hide() end
end

---------------------------------------------------------------------------
-- Frame construction
---------------------------------------------------------------------------

local function applyLayout()
    if not frame then return end
    local p = arrowProfile()
    local scale = tonumber(p.scale) or 1
    local size = BASE_SIZE * scale
    frame:SetSize(size, size + TEXT_BLOCK)
    frame:SetAlpha(tonumber(p.alpha) or 1)
    if arrowTex then arrowTex:SetSize(size, size) end
    if glowTex then glowTex:SetSize(size * 1.6, size * 1.6) end
    frame:SetMovable(not p.locked)
    frame:EnableMouse(true)
    local fontSize = tonumber(p.fontSize) or 12
    local fontPath, _, fontFlags
    if titleText and titleText.GetFont then
        fontPath, _, fontFlags = titleText:GetFont()
    end
    if fontPath then
        if titleText then titleText:SetFont(fontPath, fontSize + 1, fontFlags) end
        if actionText then actionText:SetFont(fontPath, fontSize, fontFlags) end
        if statusText then statusText:SetFont(fontPath, fontSize, fontFlags) end
        if communityText then communityText:SetFont(fontPath, fontSize - 1, fontFlags) end
    end
    local showText = p.showText ~= false
    if titleText then titleText:SetShown(showText) end
    if actionText then actionText:SetShown(showText) end
    if statusText then statusText:SetShown(showText) end
end

local function applyPosition()
    if not frame then return end
    local p = arrowProfile()
    frame:ClearAllPoints()
    frame:SetPoint(p.point or "CENTER", UIParent, p.point or "CENTER", tonumber(p.x) or 0, tonumber(p.y) or -140)
end

local function createFrame()
    if frame or not CreateFrame then return frame end
    frame = CreateFrame("Button", "PandaQuestArrow", UIParent)
    frame:SetFrameStrata("MEDIUM")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    if frame.RegisterForClicks then frame:RegisterForClicks("LeftButtonUp", "RightButtonUp", "MiddleButtonUp") end
    if frame.RegisterForDrag then frame:RegisterForDrag("LeftButton") end
    frame:Hide()

    glowTex = frame:CreateTexture(nil, "BACKGROUND")
    glowTex:SetTexture(TEXTURE_PATH .. "arrow_glow")
    glowTex:SetPoint("TOP", frame, "TOP", 0, 8)
    glowTex:SetAlpha(0)

    arrowTex = frame:CreateTexture(nil, "ARTWORK")
    arrowTex:SetTexture(TEXTURE_PATH .. "arrow")
    arrowTex:SetPoint("TOP", frame, "TOP", 0, 0)

    titleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    titleText:SetPoint("TOP", arrowTex, "BOTTOM", 0, -4)
    actionText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    actionText:SetPoint("TOP", titleText, "BOTTOM", 0, -2)
    statusText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    statusText:SetPoint("TOP", actionText, "BOTTOM", 0, -2)
    communityText = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    communityText:SetPoint("TOP", statusText, "BOTTOM", 0, -2)
    communityText:Hide()

    frame:SetScript("OnUpdate", onUpdate)
    frame:SetScript("OnDragStart", onDragStart)
    frame:SetScript("OnDragStop", onDragStop)
    frame:SetScript("OnClick", onClick)
    frame:SetScript("OnEnter", onEnter)
    frame:SetScript("OnLeave", onLeave)

    applyLayout()
    applyPosition()
    M.frame = frame
    return frame
end

---------------------------------------------------------------------------
-- Public API (docs/06 9.5)
---------------------------------------------------------------------------

function M.Show()
    arrowProfile().enabled = true
    createFrame()
    lastTargetAt = now()
    M.Refresh()
    M.Evaluate()
end

function M.Hide()
    arrowProfile().enabled = false
    if frame and visible then
        frame:Hide()
        visible = false
    end
end

function M.Toggle()
    if arrowProfile().enabled then M.Hide() else M.Show() end
    return arrowProfile().enabled
end

function M.IsShown()
    return visible and frame ~= nil and frame:IsShown() == true
end

function M.SetLocked(locked)
    local p = arrowProfile()
    p.locked = locked and true or false
    if frame then frame:SetMovable(not p.locked) end
    Log.Print(p.locked and L["Arrow locked."] or L["Arrow unlocked - drag it to move."])
    return p.locked
end

function M.ResetPosition()
    local p = arrowProfile()
    local defaults = ns.DEFAULTS.profile.arrow
    p.point, p.x, p.y = defaults.point, defaults.x, defaults.y
    applyPosition()
end

--- Refresh(): re-reads the profile and forces the next OnUpdate to rebuild the texts.
function M.Refresh()
    if not frame then return end
    applyLayout()
    applyPosition()
    shownTarget = nil
    lastDistanceStep, lastEtaStep = nil, nil
    textAccum = TEXT_INTERVAL
end

function M.GetFrame()
    return frame
end

--- GetTextures() -> arrowTex, glowTex. Introspection for the options preview and the tests
-- (the rotated region has to stay square, see BASE_SIZE).
function M.GetTextures()
    return arrowTex, glowTex
end

--- The four text lines exactly as they are on screen: title, action, status, community.
function M.GetTexts()
    if not frame then return nil end
    return titleText and titleText:GetText() or "",
           actionText and actionText:GetText() or "",
           statusText and statusText:GetText() or "",
           communityText and communityText:GetText() or ""
end

--- Debug dump for `/pq debug arrow`: prints the raw angle numbers so the sign convention can be
-- checked in game without a reload.
function M.DebugAngles()
    local Router = ns.Router
    local target = Router and Router.GetCurrent and Router.GetCurrent()
    if not target then
        Log.Print(L["No current target."])
        return
    end
    local angle = Router.GetAngleTo(target)
    local facing = Compat.GetPlayerFacing()
    local bearing = Router.GetBearingTo(target)
    Log.Print("arrow: angle=%s facing=%s bearing=%s rotation=%s",
        tostring(angle), tostring(facing), tostring(bearing),
        arrowTex and tostring(arrowTex:GetRotation()) or "-")
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

local evaluateTicker

local function onTargetReached(_, target)
    if not arrowProfile().arrivalFlash then return end
    flashUntil = now() + FLASH_TIME
    if glowTex then glowTex:SetAlpha(1) end
    if target then
        Log.Debug("Arrow", "arrival flash for %s", tostring(target.key))
    end
end

local function onCurrentTargetChanged()
    shownTarget = nil
    lastDistanceStep, lastEtaStep = nil, nil
    textAccum = TEXT_INTERVAL
    M.Evaluate()
end

function M.Init()
    -- Nothing: the frame is created in Enable, after PLAYER_LOGIN.
end

function M.Enable()
    createFrame()
    if listener.RegisterMessage then
        listener:RegisterMessage("PQ_TARGET_REACHED", onTargetReached)
        listener:RegisterMessage("PQ_CURRENT_TARGET_CHANGED", onCurrentTargetChanged)
        listener:RegisterMessage("PQ_SETTING_CHANGED", function(_, path)
            M.Refresh()
            -- `/pq debug arrow` flips this flag; print the raw angles once so the sign convention
            -- can be verified in game without a reload.
            if path == "debug.arrowDebug" and profile().debug and profile().debug.arrowDebug then
                M.DebugAngles()
            end
        end)
    end
    if listener.RegisterEvent then
        listener:RegisterEvent("PLAYER_ENTERING_WORLD", M.Evaluate)
        listener:RegisterEvent("ZONE_CHANGED_NEW_AREA", M.Evaluate)
    end
    -- A hidden frame runs no OnUpdate, so the show/hide decision needs its own heartbeat.
    if listener.ScheduleRepeatingTimer and not evaluateTicker then
        evaluateTicker = listener:ScheduleRepeatingTimer(M.Evaluate, EVALUATE_INTERVAL)
    end
    if arrowProfile().enabled then
        lastTargetAt = now()
    end
    M.Evaluate()
end

function M.OnProfileChanged()
    M.Refresh()
end
