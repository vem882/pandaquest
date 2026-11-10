-- A direct bearing from the ghost to the corpse on the currently open world map.
local _, ns = ...
local driver = CreateFrame("Frame")
local overlay, line
local elapsed = 0

local function hide()
    if overlay then overlay:Hide() end
end

local function mapXY(api, mapID, unit)
    local ok, point
    if unit then ok, point = pcall(api, mapID, unit)
    else ok, point = pcall(api, mapID) end
    point = ok and ns.Compat.Plain(point) or nil
    if not point or not point.GetXY then return end
    local gotXY, x, y = pcall(point.GetXY, point)
    if not gotXY then return end
    x, y = ns.Compat.Plain(x), ns.Compat.Plain(y)
    if type(x) ~= "number" or type(y) ~= "number" then return end
    if not (x >= 0 and x <= 1 and y >= 0 and y <= 1) or (x == 0 and y == 0) then return end
    return x, y
end

local function update()
    local map = ns.MapCompat.GetWorldMap()
    if not (UnitIsGhost and ns.Compat.Plain(UnitIsGhost("player")) and map and map:IsVisible()
        and map.GetMapID and C_Map and C_Map.GetPlayerMapPosition
        and C_DeathInfo and C_DeathInfo.GetCorpseMapPosition) then
        hide()
        return
    end
    local mapID = ns.Compat.Plain(map:GetMapID())
    if type(mapID) ~= "number" or mapID <= 0 then hide(); return end
    local x, y = mapXY(C_Map.GetPlayerMapPosition, mapID, "player")
    local corpseX, corpseY = mapXY(C_DeathInfo.GetCorpseMapPosition, mapID)
    local canvas = ns.MapCompat.GetCanvas()
    if not (x and corpseX and canvas) or (x == corpseX and y == corpseY) then
        hide()
        return
    end
    local width, height = canvas:GetSize()
    if not width or not height or width <= 0 or height <= 0 then hide(); return end
    if not overlay then
        overlay = CreateFrame("Frame", nil, canvas)
        overlay:EnableMouse(false)
        if not overlay.CreateLine then return end
        line = overlay:CreateLine(nil, "OVERLAY")
        line:SetColorTexture(0.62, 0.86, 1, 0.95)
        line:SetThickness(3)
    end
    if not line then return end
    if overlay:GetParent() ~= canvas then overlay:SetParent(canvas) end
    overlay:ClearAllPoints()
    overlay:SetAllPoints(canvas)
    overlay:SetFrameLevel(canvas:GetFrameLevel() + 5)
    line:SetStartPoint("TOPLEFT", overlay, x * width, -y * height)
    line:SetEndPoint("TOPLEFT", overlay, corpseX * width, -corpseY * height)
    overlay:Show()
end

local function tick(self, delta)
    elapsed = elapsed + delta
    if elapsed < 0.2 then return end
    elapsed = 0
    local dead = UnitIsDeadOrGhost and ns.Compat.Plain(UnitIsDeadOrGhost("player"))
    local ghost = UnitIsGhost and ns.Compat.Plain(UnitIsGhost("player"))
    if not dead and not ghost then
        self:SetScript("OnUpdate", nil)
        hide()
        return
    end
    update()
end

driver:SetScript("OnEvent", function(self, event)
    local ghost = UnitIsGhost and ns.Compat.Plain(UnitIsGhost("player"))
    if event ~= "PLAYER_UNGHOST" and (ghost or event == "PLAYER_DEAD" or event == "PLAYER_ALIVE") then
        self:SetScript("OnUpdate", tick)
        update()
    else
        self:SetScript("OnUpdate", nil)
        hide()
    end
end)
driver:RegisterEvent("PLAYER_DEAD")
driver:RegisterEvent("PLAYER_ALIVE")
driver:RegisterEvent("PLAYER_UNGHOST")
driver:RegisterEvent("PLAYER_ENTERING_WORLD")
