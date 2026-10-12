-- UI/Motion.lua: the addon's small animation toolkit.
--
-- Everything that moves in PandaQuest moves through here, so there is one place that knows whether
-- the player wants motion at all and how fast. Nothing is built on AnimationGroup: a tween is a record
-- in one list that a single OnUpdate driver advances, which keeps the cost of "a window opens" to a
-- handful of table writes per frame, lets every animation be cancelled by its owner, and makes the
-- final state a plain function call when motion is switched off.
--
--   Motion.Tween{ owner =, duration =, delay =, ease =, from =, to =, apply = fn(value), onDone = fn }
--   Motion.FadeIn(frame, duration, delay)         Motion.FadeOut(frame, duration, onDone)
--   Motion.Rise(frame, dy, duration, delay)       fade-free slide of a frame into its own place
--   Motion.Pop(target, from, duration, delay)     scale settle: a frame's scale, or a texture's size
--   Motion.Sheen(frame, duration, delay)          a glint sweeping across a frame
--   Motion.Pulse(region, low, high, period)       a breathing alpha until StopPulse
--   Motion.Approach(current, target, dt, rate)    exponential smoothing for values set every frame
--
-- The ideas -- a choreographed reveal in which parts arrive one after another, a glint across a
-- title, an icon that settles into place -- are the common vocabulary of dialog UIs; the code is this
-- file's own.
local _, ns = ...

local M = {}
ns.Motion = M

local type, tostring, tonumber = type, tostring, tonumber
local max, exp, cos, sin, pi = math.max, math.exp, math.cos, math.sin, math.pi

---------------------------------------------------------------------------
-- Easing
---------------------------------------------------------------------------

local EASE = {
    linear = function(t) return t end,
    outQuad = function(t) return 1 - (1 - t) * (1 - t) end,
    outCubic = function(t) local u = 1 - t; return 1 - u * u * u end,
    inOutSine = function(t) return 0.5 - 0.5 * cos(pi * t) end,
    -- a small overshoot before it settles: 1 + c3 (t-1)^3 + c1 (t-1)^2
    outBack = function(t)
        local c1 = 1.4
        local c3 = c1 + 1
        local u = t - 1
        return 1 + c3 * u * u * u + c1 * u * u
    end,
}
M.EASE = EASE

---------------------------------------------------------------------------
-- Settings
---------------------------------------------------------------------------

local function settings()
    local PQ = ns.PQ
    local profile = PQ and PQ.db and PQ.db.profile
    return profile and profile.motion
end

--- IsEnabled() -> bool. Motion is on unless the player switched it off.
function M.IsEnabled()
    local s = settings()
    return not (s and s.enabled == false)
end

--- Speed() -> number, 0.5 .. 2, the player's multiplier (2 = twice as fast).
function M.Speed()
    local s = settings()
    local v = s and tonumber(s.speed) or 1
    if v < 0.5 then v = 0.5 elseif v > 2 then v = 2 end
    return v
end

---------------------------------------------------------------------------
-- The driver
---------------------------------------------------------------------------

local active = {}               -- array of tween records
local byOwner = {}              -- owner -> record
local driver

local function remove(record)
    for i = #active, 1, -1 do
        if active[i] == record then
            table.remove(active, i)
            break
        end
    end
    if record.owner ~= nil and byOwner[record.owner] == record then byOwner[record.owner] = nil end
end

local function onUpdate(_, elapsed)
    elapsed = elapsed or 0
    local speed = M.Speed()
    for i = #active, 1, -1 do
        local r = active[i]
        if r then
            r.elapsed = r.elapsed + elapsed * speed
            local local_t = r.elapsed - r.delay
            if local_t >= 0 then
                local progress = local_t / r.duration
                if r.loop then
                    progress = progress % 1
                    r.apply(r.from + (r.to - r.from) * r.ease(progress))
                elseif progress >= 1 then
                    remove(r)
                    r.apply(r.to)
                    if r.onDone then r.onDone() end
                else
                    r.apply(r.from + (r.to - r.from) * r.ease(progress))
                end
            end
        end
    end
    if #active == 0 and driver then driver:SetScript("OnUpdate", nil) end
end

local function ensureDriver()
    if not driver and CreateFrame then driver = CreateFrame("Frame", "PandaQuestMotionDriver", UIParent) end
    if driver then driver:SetScript("OnUpdate", onUpdate) end
    return driver
end

--- Tween(opts) -> record|nil. nil means it already finished (motion off, or zero duration).
function M.Tween(opts)
    local apply = opts.apply
    local to = opts.to == nil and 1 or opts.to
    local from = opts.from == nil and 0 or opts.from
    local duration = tonumber(opts.duration) or 0.2
    if opts.owner ~= nil then M.Cancel(opts.owner) end

    if not M.IsEnabled() or duration <= 0 or opts.instant then
        if apply then apply(opts.loop and from or to) end
        if opts.onDone and not opts.loop then opts.onDone() end
        return nil
    end
    local record = {
        owner = opts.owner, apply = apply, from = from, to = to, duration = duration,
        delay = tonumber(opts.delay) or 0, elapsed = 0, loop = opts.loop, onDone = opts.onDone,
        ease = EASE[opts.ease or "outCubic"] or EASE.outCubic,
    }
    active[#active + 1] = record
    if record.owner ~= nil then byOwner[record.owner] = record end
    if record.delay <= 0 then apply(from) end
    if not ensureDriver() then
        -- no frames at all (a bare test runtime): finish now rather than never
        remove(record)
        apply(to)
        if record.onDone then record.onDone() end
        return nil
    end
    return record
end

--- Cancel(owner, finish): stop that owner's tween. With `finish` it jumps to the end state first.
function M.Cancel(owner, finish)
    local record = owner ~= nil and byOwner[owner]
    if not record then return end
    remove(record)
    if finish and not record.loop then
        record.apply(record.to)
        if record.onDone then record.onDone() end
    end
end

--- IsRunning(owner) -> bool
function M.IsRunning(owner)
    return owner ~= nil and byOwner[owner] ~= nil
end

--- ActiveCount() -> number of tweens in flight (for tests and for the "nothing is left running" check)
function M.ActiveCount()
    return #active
end

---------------------------------------------------------------------------
-- Building blocks
---------------------------------------------------------------------------

--- FadeIn(frame, duration, delay): from transparent to opaque, shown at once.
function M.FadeIn(frame, duration, delay)
    if not frame then return end
    frame:SetAlpha(0)
    frame:Show()
    M.Tween{ owner = tostring(frame) .. ":alpha", duration = duration or 0.2, delay = delay, from = 0, to = 1,
        ease = "outQuad", apply = function(v) frame:SetAlpha(v) end }
end

--- FadeOut(frame, duration, onDone): to transparent, then hidden and its alpha put back to 1.
function M.FadeOut(frame, duration, onDone)
    if not frame then return end
    local from = frame:GetAlpha() or 1
    M.Tween{ owner = tostring(frame) .. ":alpha", duration = duration or 0.15, from = from, to = 0,
        ease = "outQuad", apply = function(v) frame:SetAlpha(v) end,
        onDone = function()
            frame:Hide()
            frame:SetAlpha(1)
            if onDone then onDone() end
        end }
end

--- Rise(frame, dy, duration, delay): the frame glides `dy` pixels into the place it is anchored at.
function M.Rise(frame, dy, duration, delay)
    if not (frame and frame.GetPoint and frame.SetPoint) then return end
    local point, relative, relativePoint, x, y = frame:GetPoint(1)
    if not point then return end
    local baseX, baseY = x or 0, y or 0
    M.Tween{ owner = tostring(frame) .. ":rise", duration = duration or 0.25, delay = delay, from = dy or -12, to = 0,
        ease = "outCubic",
        apply = function(offset)
            frame:ClearAllPoints()
            frame:SetPoint(point, relative, relativePoint, baseX, baseY + offset)
        end }
end

--- Pop(target, from, duration, delay): scale settle. A frame is scaled with SetScale; a texture is
-- resized from `from` times its size back to its own size.
function M.Pop(target, from, duration, delay)
    if not target then return end
    from = from or 1.15
    if target.SetScale and target.GetObjectType and target:GetObjectType() ~= "Texture" then
        local base = target:GetScale() or 1
        M.Tween{ owner = tostring(target) .. ":pop", duration = duration or 0.3, delay = delay, from = from, to = 1,
            ease = "outBack", apply = function(s) target:SetScale(base * s) end }
    elseif target.GetSize and target.SetSize then
        local w, h = target:GetSize()
        if not w or not h then return end
        M.Tween{ owner = tostring(target) .. ":pop", duration = duration or 0.3, delay = delay, from = from, to = 1,
            ease = "outBack", apply = function(s) target:SetSize(w * s, h * s) end }
    end
end

--- Sheen(frame, duration, delay): a soft vertical band that sweeps once from left to right across
-- the frame and fades out as it leaves. Draws on an overlay texture it creates the first time.
function M.Sheen(frame, duration, delay)
    if not (frame and frame.CreateTexture) then return end
    local glint = frame.pqSheen
    if not glint then
        glint = frame:CreateTexture(nil, "OVERLAY")
        if glint.SetBlendMode then glint:SetBlendMode("ADD") end
        if glint.SetColorTexture then glint:SetColorTexture(1, 0.95, 0.75, 0.0) end
        frame.pqSheen = glint
    end
    local width = (frame.GetWidth and frame:GetWidth()) or 0
    local height = (frame.GetHeight and frame:GetHeight()) or 0
    if width <= 0 or height <= 0 then return end
    local band = max(12, width * 0.22)
    glint:SetSize(band, height)
    M.Tween{ owner = tostring(frame) .. ":sheen", duration = duration or 0.6, delay = delay, from = 0, to = 1,
        ease = "linear",
        apply = function(p)
            glint:ClearAllPoints()
            glint:SetPoint("LEFT", frame, "LEFT", p * (width + band) - band, 0)
            local alpha = sin(pi * p) * 0.22
            if glint.SetColorTexture then glint:SetColorTexture(1, 0.95, 0.75, alpha) end
            if p >= 1 then glint:Hide() else glint:Show() end
        end }
end

--- Pulse(region, low, high, period): breathing alpha until StopPulse(region).
-- One breath per period: it starts at `high` (a region that is already opaque does not jump), is at `low`
-- half a period later and back at `high` at the end, smooth at both turns. A loop tween only ever runs
-- its ease one way and then starts over, so the way back is the cosine here, not a second tween. With
-- motion off it is `high` and nothing runs, and the setting is looked at on every step, so switching
-- animations off puts a breathing region back at once.
function M.Pulse(region, low, high, period)
    if not (region and region.SetAlpha) then return end
    low, high = low or 0.55, high or 1
    local half = (high - low) * 0.5
    local middle = low + half
    local owner = tostring(region) .. ":pulse"
    M.Tween{ owner = owner, loop = true, duration = period or 1.6, from = 0, to = 1, ease = "linear",
        apply = function(p)
            if not M.IsEnabled() then           -- switched off while it was breathing: back to `high`, and done
                M.Cancel(owner)
                region:SetAlpha(high)
                return
            end
            region:SetAlpha(middle + half * cos(2 * pi * p))
        end }
end

function M.StopPulse(region, restoreAlpha)
    if not region then return end
    M.Cancel(tostring(region) .. ":pulse")
    if restoreAlpha ~= false and region.SetAlpha then region:SetAlpha(1) end
end

--- Approach(current, target, dt, rate) -> the value `current` has reached after dt seconds of
-- exponential smoothing towards `target` (rate in 1/seconds; 10 is brisk). With motion off it
-- returns `target`, so a bar then jumps like it always did.
function M.Approach(current, target, dt, rate)
    if not M.IsEnabled() or type(current) ~= "number" then return target end
    local step = 1 - exp(-(rate or 10) * M.Speed() * (dt or 0))
    local value = current + (target - current) * step
    if (target - value) * (target - value) < 1e-6 then return target end
    return value
end

--- Stagger(index, step) -> the start delay of the index-th part of a reveal (1-based).
function M.Stagger(index, step)
    return max(0, (index or 1) - 1) * (step or 0.06)
end

return M
