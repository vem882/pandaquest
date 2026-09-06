-- Core/Thread.lua: cooperative coroutine driver (docs/06 section 5).
-- One OnUpdate frame resumes queued jobs with a per-frame time budget of 8 ms. Jobs call Thread.Yield()
-- inside loops; the driver decides whether the call actually suspends (every ticksPerYield calls, or as
-- soon as the frame budget is spent). A job that raises an error is reported through geterrorhandler()
-- and removed; the driver and the other jobs keep running.
local _, ns = ...

local Thread = {}
ns.Thread = Thread

local Const = ns.Const
local Compat = ns.Compat
local Log = ns.Log

local coroutine, pcall, type, unpack = coroutine, pcall, type, unpack
local tremove = table.remove

local BUDGET_MS = Const.THREAD_BUDGET_MS or 8
local DEFAULT_TICKS = Const.THREAD_TICKS_PER_YIELD or 24

local jobs = {}             -- ordered list of running handles
local current = nil         -- handle being resumed right now
local frameStart = 0        -- Compat.NowMs() when the current Step started
local budgetMs = BUDGET_MS
local driver                -- OnUpdate frame (created lazily)
local nextId = 0

local function nowMs()
    return Compat.NowMs()
end

local function reportError(handle, err)
    local text = ("PandaQuest thread '%s' failed: %s"):format(tostring(handle.name), tostring(err))
    local handler = geterrorhandler and geterrorhandler()
    if handler then
        pcall(handler, text)
    end
    if Log and Log.Error then
        Log.Error("Thread", "%s", text)
    end
end

local function finish(handle, ok, ...)
    handle.running = false
    handle.done = true
    for i = #jobs, 1, -1 do
        if jobs[i] == handle then
            tremove(jobs, i)
            break
        end
    end
    if handle.onDone then
        local cbOk, cbErr = pcall(handle.onDone, ok, ...)
        if not cbOk then reportError(handle, cbErr) end
    end
end

-- Resumes one job once; returns true when the job is still alive.
local function resume(handle)
    current = handle
    handle.ticks = 0
    local results = { coroutine.resume(handle.co) }
    current = nil
    local ok = results[1]
    if not ok then
        handle.error = results[2]
        reportError(handle, results[2])
        finish(handle, false, results[2])
        return false
    end
    if coroutine.status(handle.co) == "dead" then
        finish(handle, true, unpack(results, 2))
        return false
    end
    if handle.cancelled then
        finish(handle, false, "cancelled")
        return false
    end
    return true
end

-- Runs the driver for one frame worth of work. Public so tests (and callers without a frame) can pump it.
-- Returns the number of jobs still pending.
function Thread.Step(budget)
    budgetMs = budget or BUDGET_MS
    frameStart = nowMs()
    local inCombat = Compat.InCombatLockdown()
    local i = 1
    while i <= #jobs do
        local handle = jobs[i]
        if nowMs() - frameStart >= budgetMs then
            break
        end
        if handle.cancelled then
            finish(handle, false, "cancelled")
        elseif inCombat and handle.pauseInCombat then
            i = i + 1
        elseif resume(handle) then
            i = i + 1
        end
    end
    if driver and #jobs == 0 then
        driver:Hide()
    end
    return #jobs
end

local function ensureDriver()
    if driver then return driver end
    if not CreateFrame then return nil end
    driver = CreateFrame("Frame", "PandaQuestThreadDriver", UIParent)
    driver:Hide()
    driver:SetScript("OnUpdate", function()
        Thread.Step()
    end)
    return driver
end

-- Thread.Run(fn, opts) -> handle. opts = { ticksPerYield = 24, name = "", onDone = fn(ok, ...), pauseInCombat = true }
function Thread.Run(fn, opts)
    if type(fn) ~= "function" then
        error("Thread.Run: fn must be a function", 2)
    end
    opts = opts or {}
    nextId = nextId + 1
    local handle = {
        id = nextId,
        name = opts.name or ("job" .. nextId),
        ticksPerYield = opts.ticksPerYield or DEFAULT_TICKS,
        pauseInCombat = (opts.pauseInCombat ~= false),
        onDone = opts.onDone,
        co = coroutine.create(fn),
        ticks = 0,
        running = true,
        done = false,
        cancelled = false,
        startedAt = nowMs(),
    }
    jobs[#jobs + 1] = handle
    local frame = ensureDriver()
    if frame then
        frame:Show()
    else
        -- No frame support (plain Lua): drive synchronously until the job completes.
        while handle.running do
            Thread.Step(1e9)
        end
    end
    return handle
end

-- Called from inside a job. Suspends when the tick counter or the frame budget says so.
-- Outside of a driver coroutine it is a no-op so shared code can call it unconditionally.
function Thread.Yield()
    local handle = current
    if not handle then return end
    if coroutine.running() ~= handle.co then return end
    handle.ticks = handle.ticks + 1
    if handle.cancelled or handle.ticks >= handle.ticksPerYield or (nowMs() - frameStart) >= budgetMs then
        handle.ticks = 0
        coroutine.yield()
    end
end

function Thread.Cancel(handle)
    if type(handle) ~= "table" or handle.done then return false end
    handle.cancelled = true
    if current ~= handle then
        finish(handle, false, "cancelled")
    end
    return true
end

function Thread.IsRunning(handle)
    return type(handle) == "table" and handle.running == true and not handle.done
end

function Thread.GetCurrent()
    return current
end

function Thread.CountRunning()
    return #jobs
end

-- Cancels every queued job (used by tests and /pq reset).
function Thread.CancelAll()
    for i = #jobs, 1, -1 do
        Thread.Cancel(jobs[i])
    end
end
