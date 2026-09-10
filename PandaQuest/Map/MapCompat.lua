-- Map/MapCompat.lua: living with Leatrix_Maps, Mapster, ElvUI and every other map addon
-- (docs/10 section E).
--
-- What those addons do to WorldMapFrame, counted in Leatrix_Maps' own source: `WorldMapFrame`
-- appears 98 times, `SetPoint`/`ClearAllPoints` 122, `SetSize`/`SetWidth` 43, `SetScale` 7 and
-- `SetParent` 6. They scale the map, resize it, re-anchor it, strip its border and fade it while
-- it moves. None of that is a bug for us to work around -- it is what the player installed the
-- addon for -- so the six rules of docs/10 E are about not standing in its way:
--
--   1. No assumption about the canvas' size or scale. A pin's size is derived from the effective
--      scale of the frame it hangs under, so a 1.5x map does not give 1.5x pins (GetPinScaleFactor).
--   2. Re-anchor on change. Three independent signals, because no single one covers every addon:
--      Blizzard's own data-provider callbacks, an OnSizeChanged on OUR frame anchored to the
--      canvas, and a quarter-second poll of scale and canvas size while the map is shown.
--   3. No assumption about a border or a fixed anchor. Nothing here reads WorldMapFrame's position;
--      the canvas is looked up again on every check rather than cached at load.
--   4. No competing for the same hooks. Nothing here hooks or replaces a Blizzard function and
--      nothing resizes, rescales or re-anchors a Blizzard frame. The one thing registered with the
--      map is a data provider through the public `AddDataProvider`, which is the extension point
--      Blizzard_MapCanvas exists to offer.
--   5. Fade-while-moving is free as long as every pin is a child of the canvas: IsDetached() is
--      what the tests assert against, so a pin parented to UIParent cannot pass unnoticed.
--   6. Simulated in tools/tests/test_pins.py. The real Leatrix_Maps was never loaded (CurseForge
--      wants an authenticated download), so what the harness proves is that the maths survives
--      those operations -- NOT that the addon combination works. That is an in-game check.
--
-- Verified against 5.5.4 rather than assumed:
--   * `MapCanvasMixin:OnCanvasSizeChanged` / `OnCanvasScaleChanged` exist and call
--     `CallMethodOnPinsAndDataProviders` (Blizzard_MapCanvas/Blizzard_MapCanvas.lua:568-586).
--   * `MapCanvasMixin:OnFrameSizeChanged` is called from Maximize/Minimize/SynchronizeDisplayState
--     ONLY (Blizzard_WorldMap/Cata/Blizzard_WorldMap.lua:66,76,86). WorldMapFrame has no
--     OnSizeChanged script, so a third-party `WorldMapFrame:SetSize(...)` fires none of Blizzard's
--     callbacks. That is why the poll below exists and why we do not rely on the provider alone.
--   * `SetScale` never fires OnSizeChanged for anybody: a frame's own width does not change when
--     it is scaled. Only the poll can see a rescale done from outside.
local _, ns = ...

local M = {}
ns.MapCompat = M

local Log = ns.Log

local type, pcall, pairs = type, pcall, pairs
local abs, tremove, tostring = math.abs, table.remove, tostring

local POLL_INTERVAL = 0.25         -- seconds between scale/size polls while the map is shown
local EPSILON = 0.01               -- ignore sub-pixel jitter
local MIN_FACTOR, MAX_FACTOR = 0.1, 10

local listeners = {}
local watcher                       -- our own frame, anchored to the canvas
local provider                      -- our MapCanvas data provider
local lastScale, lastWidth, lastHeight, lastCanvas
local pollElapsed = 0
local changeCount = 0
local enabled = false

---------------------------------------------------------------------------
-- Lookups (never cached: rule 3)
---------------------------------------------------------------------------

--- MapCompat.GetWorldMap() -> WorldMapFrame|nil
function M.GetWorldMap()
    local frame = _G and _G.WorldMapFrame or nil
    if type(frame) ~= "table" then return nil end
    return frame
end

--- MapCompat.GetCanvas() -> the map's canvas frame, or the map itself when it has none.
function M.GetCanvas()
    local frame = M.GetWorldMap()
    if not frame then return nil end
    if frame.GetCanvas then
        local ok, canvas = pcall(frame.GetCanvas, frame)
        if ok and type(canvas) == "table" then return canvas end
    end
    return frame
end

local function effectiveScaleOf(frame)
    if not frame or not frame.GetEffectiveScale then return nil end
    local ok, scale = pcall(frame.GetEffectiveScale, frame)
    if ok and type(scale) == "number" and scale > 0 then return scale end
    return nil
end

--- MapCompat.GetUIScale() -> UIParent's effective scale (1 when there is no UIParent).
function M.GetUIScale()
    return effectiveScaleOf(_G and _G.UIParent) or 1
end

--- MapCompat.GetMapScale() -> WorldMapFrame:GetEffectiveScale() (docs/10 E1), or the UI scale.
function M.GetMapScale()
    return effectiveScaleOf(M.GetWorldMap()) or M.GetUIScale()
end

--- MapCompat.GetPinScaleFactor(pin) -> the number a pin's screen size must be multiplied by to
-- stay that many screen pixels.
--
-- The pin is a child of whatever HereBeDragons parented it to (a canvas pin on the world map, the
-- Minimap on the minimap), so its own effective scale already carries every SetScale between it
-- and the screen -- including the canvas zoom, which Blizzard's pin scaling does not fully undo
-- for a child frame. Falling back to WorldMapFrame keeps docs/10 E1 literally true for a pin that
-- is still sitting in the pool with UIParent as its parent.
function M.GetPinScaleFactor(pin)
    local scale
    local parent = pin and pin.GetParent and pin:GetParent() or nil
    if parent and parent ~= (_G and _G.UIParent) then
        scale = effectiveScaleOf(parent)
    end
    if not scale then scale = M.GetMapScale() end
    local factor = M.GetUIScale() / scale
    if factor ~= factor then return 1 end                    -- NaN
    if factor < MIN_FACTOR then return MIN_FACTOR end
    if factor > MAX_FACTOR then return MAX_FACTOR end
    return factor
end

--- MapCompat.IsDetached(pin) -> bool. True when a pin is on the map but hanging off UIParent
-- instead of the canvas, which is docs/10 E5's failure mode: the map's fade would not reach it.
function M.IsDetached(pin)
    if not pin or not pin.GetParent then return false end
    local parent = pin:GetParent()
    if not parent then return true end
    return parent == (_G and _G.UIParent)
end

---------------------------------------------------------------------------
-- Listeners
---------------------------------------------------------------------------

--- MapCompat.RegisterListener(fn): fn(reason) runs whenever the map's scale or canvas size moved.
function M.RegisterListener(fn)
    if type(fn) ~= "function" then return false end
    for i = 1, #listeners do
        if listeners[i] == fn then return false end
    end
    listeners[#listeners + 1] = fn
    return true
end

function M.UnregisterListener(fn)
    for i = #listeners, 1, -1 do
        if listeners[i] == fn then tremove(listeners, i) end
    end
end

local function fire(reason)
    changeCount = changeCount + 1
    for i = 1, #listeners do
        local ok, err = pcall(listeners[i], reason)
        if not ok then Log.Debug("MapCompat", "listener error: %s", tostring(err)) end
    end
end

---------------------------------------------------------------------------
-- Change detection
---------------------------------------------------------------------------

local function moved(a, b)
    if a == nil or b == nil then return a ~= b end
    return abs(a - b) > EPSILON
end

--- MapCompat.Check([reason]) -> bool. Reads the map's current scale and canvas size and fires the
-- listeners when either moved. Cheap enough to poll: three getters and two comparisons.
function M.Check(reason)
    local frame = M.GetWorldMap()
    if not frame then return false end
    local canvas = M.GetCanvas()
    local scale = M.GetMapScale()
    local width = canvas and canvas.GetWidth and canvas:GetWidth() or nil
    local height = canvas and canvas.GetHeight and canvas:GetHeight() or nil

    local changed = false
    if canvas ~= lastCanvas then
        -- The map addon swapped or re-parented the canvas; re-anchor our watcher to the new one.
        lastCanvas = canvas
        M.EnsureWatcher(true)
        changed = true
    end
    if moved(scale, lastScale) or moved(width, lastWidth) or moved(height, lastHeight) then
        changed = true
    end
    lastScale, lastWidth, lastHeight = scale, width, height
    if changed then fire(reason or "check") end
    return changed
end

--- MapCompat.GetState() -> scale, canvasWidth, canvasHeight, changeCount (introspection/tests).
function M.GetState()
    return lastScale, lastWidth, lastHeight, changeCount
end

---------------------------------------------------------------------------
-- The watcher frame (rule 4: our frame, not Blizzard's)
---------------------------------------------------------------------------

local function onPoll(_, elapsed)
    pollElapsed = pollElapsed + (elapsed or 0)
    if pollElapsed < POLL_INTERVAL then return end
    pollElapsed = 0
    M.Check("poll")
end

local function onWatcherSizeChanged()
    M.Check("size")
end

--- MapCompat.EnsureWatcher([reparent]) -> frame|nil. A frame of ours anchored over the whole
-- canvas. Being a child of the canvas gives it two things for free: its OnSizeChanged fires when
-- the canvas is resized from anywhere, and its OnUpdate only runs while the map is on screen.
function M.EnsureWatcher(reparent)
    local canvas = M.GetCanvas()
    if not canvas then return nil end
    if not watcher then
        if not CreateFrame then return nil end
        watcher = CreateFrame("Frame", "PandaQuestMapWatcher", canvas)
        watcher:SetScript("OnSizeChanged", onWatcherSizeChanged)
        watcher:SetScript("OnUpdate", onPoll)
        reparent = true
    end
    if reparent then
        if watcher.SetParent then watcher:SetParent(canvas) end
        if watcher.ClearAllPoints then watcher:ClearAllPoints() end
        if watcher.SetAllPoints then watcher:SetAllPoints(canvas) end
        if watcher.Show then watcher:Show() end
    end
    return watcher
end

--- MapCompat.GetWatcher() -> frame|nil (tests).
function M.GetWatcher() return watcher end

---------------------------------------------------------------------------
-- Blizzard's own signal: a data provider (rule 4 -- the public extension point)
---------------------------------------------------------------------------

local function buildProvider()
    if provider then return provider end
    local base = _G and _G.MapCanvasDataProviderMixin
    if type(base) ~= "table" then return nil end
    if CreateFromMixins then
        provider = CreateFromMixins(base)
    else
        provider = {}
        for k, v in pairs(base) do provider[k] = v end
    end
    -- The map calls these on every provider it owns; each one means the geometry we cached is
    -- stale. RemoveAllData/RefreshAllData stay as the mixin defines them (no-ops): this provider
    -- owns no pins of its own, HereBeDragons owns those.
    provider.OnCanvasScaleChanged = function() M.Check("canvasScale") end
    provider.OnCanvasSizeChanged = function() M.Check("canvasSize") end
    provider.OnMapChanged = function() M.Check("mapChanged") end
    return provider
end

--- MapCompat.GetProvider() -> the data provider table, or nil when MapCanvasDataProviderMixin is
-- not loaded (which would mean Blizzard_MapCanvas is not loaded, and there is no canvas either).
function M.GetProvider() return provider end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------

function M.Init()
    lastScale, lastWidth, lastHeight, lastCanvas = nil, nil, nil, nil
    pollElapsed = 0
end

function M.Enable()
    if enabled then return true end
    enabled = true
    M.EnsureWatcher(true)
    local frame = M.GetWorldMap()
    local p = buildProvider()
    if frame and p and frame.AddDataProvider then
        local ok, err = pcall(frame.AddDataProvider, frame, p)
        if not ok then Log.Debug("MapCompat", "AddDataProvider failed: %s", tostring(err)) end
    end
    M.Check("enable")
    Log.Debug("MapCompat", "enabled (canvas %s, provider %s, scale %.2f)",
        M.GetCanvas() and "ready" or "missing", p and "ready" or "missing", M.GetMapScale())
    return true
end

function M.IsEnabled() return enabled end

function M.OnProfileChanged()
    M.Check("profile")
end
