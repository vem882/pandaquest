-- Core/Init.lua: AceAddon object, AceDB, module lifecycle and slash commands.
-- Loaded last: every module table already exists on ns when this file runs.
local _, ns = ...
local L = ns.L

local Const, Util, Log, Thread = ns.Const, ns.Util, ns.Log, ns.Thread

local AceDB = LibStub("AceDB-3.0")

-- The addon object and every module were created in Core/Const.lua, with the lifecycle order
-- (ns.MODULE_ORDER) and the modules a player may switch off (ns.OPTIONAL_MODULES).
local PQ = ns.PQ

local pcall, type, tonumber, tostring, pairs, ipairs, format = pcall, type, tonumber, tostring, pairs, ipairs, string.format

-- Calls M[method](...) on every enabled module that defines it, in ns.MODULE_ORDER. Errors are
-- reported and do not stop the loop.
local function CallModules(method, ...)
    for _, name in ipairs(ns.MODULE_ORDER) do
        local module = ns[name]
        local fn = module and module[method]
        local handle = PQ:GetModule(name, true)
        if type(fn) == "function" and not (handle and not handle:IsEnabled()) then
            local ok, err = pcall(fn, ...)
            if not ok then
                local handler = geterrorhandler and geterrorhandler()
                if handler then pcall(handler, err) end
                Log.Error("Init", "%s.%s failed: %s", name, method, tostring(err))
            end
        end
    end
end
ns.CallModules = CallModules

--- ns.ApplyModuleStates(): enables every wanted module and disables the rest, in ns.MODULE_ORDER.
-- PQ:OnEnable calls it once for the login; Options > Modules and a profile change call it again.
-- A module enabled after the database is ready gets the OnDataReady it missed.
function ns.ApplyModuleStates()
    for _, name in ipairs(ns.MODULE_ORDER) do
        local module = PQ:GetModule(name, true)
        if module then
            local wanted = ns.IsModuleWanted(name)
            if wanted and not module:IsEnabled() then
                module:Enable()
                local own = ns[name]
                if ns.dbReady and type(own) == "table" and type(own.OnDataReady) == "function" then
                    local ok, err = pcall(own.OnDataReady)
                    if not ok then Log.Error("Init", "%s.OnDataReady failed: %s", name, tostring(err)) end
                end
            elseif not wanted and module:IsEnabled() then
                module:Disable()
            end
        end
    end
end

-- Applies a stored locale override (see Locales/fiFI.lua): copies the chosen table over ns.L.
local function ApplyLanguage()
    local choice = PQ.db.global.language
    if choice == nil or choice == "auto" then
        choice = (GAME_LOCALE or (GetLocale and GetLocale())) or "enUS"
    end
    local tbl = ns.LOCALE_TABLES and ns.LOCALE_TABLES[choice]
    if tbl and choice ~= "enUS" then
        for key, value in pairs(tbl) do rawset(L, key, value) end
    end
end

local function OnProfileChanged(_, _, profileName)
    Log.Debug("Init", "profile changed -> %s", tostring(profileName))
    ns.ApplyModuleStates()
    CallModules("OnProfileChanged")
    Log.Print(L["Profile changed: %s"], tostring(profileName or PQ.db:GetCurrentProfile()))
end

function PQ:OnInitialize()
    -- First, before AceDB or any module reads a saved variable: each one is tagged with the game it is
    -- used in, and one written in another game is set aside whole (Core/Game.lua). A failure here is
    -- reported and the addon carries on exactly as it did before this step existed.
    if ns.Game and ns.Game.ClaimSavedVariables then
        local ok, err = pcall(ns.Game.ClaimSavedVariables)
        if not ok then
            local handler = geterrorhandler and geterrorhandler()
            if handler then pcall(handler, err) end
            Log.Error("Init", "Game.ClaimSavedVariables failed: %s", tostring(err))
        end
    end

    self.db = AceDB:New("PandaQuestDB", ns.DEFAULTS, true)
    self.db.RegisterCallback(self, "OnProfileChanged", OnProfileChanged)
    self.db.RegisterCallback(self, "OnProfileCopied", OnProfileChanged)
    self.db.RegisterCallback(self, "OnProfileReset", OnProfileChanged)

    _G.PandaQuestSync = _G.PandaQuestSync or {}
    ns.Sync = _G.PandaQuestSync

    -- Auction house scans and sales are their own SavedVariable, so a scan an order
    -- of magnitude bigger than the quest log can be lost or reset without taking telemetry with
    -- it. Auction/Store.lua gives the table its shape.
    _G.PandaQuestAH = _G.PandaQuestAH or {}

    -- The same argument for profession recipes. A book read off one window is larger
    -- than a questing session, and it must be droppable without the quest log going with it.
    -- Recipes/Store.lua gives the table its shape.
    _G.PandaQuestProf = _G.PandaQuestProf or {}

    ApplyLanguage()

    for _, cmd in ipairs(Const.SLASH_COMMANDS) do
        self:RegisterChatCommand(cmd, "ChatCommand")
    end

    -- AceAddon initializes the modules next, in ns.MODULE_ORDER.
    Log.Debug("Init", "OnInitialize (version %s)", Const.VERSION)
end

function PQ:OnEnable()
    ns.ApplyModuleStates()

    self:RegisterMessage("PQ_DB_READY", function()
        ns.dbReady = true
        Log.Debug("Init", "PQ_DB_READY")
        CallModules("OnDataReady")
    end)

    if ns.DB and type(ns.DB.Load) == "function" then
        local ok, err = pcall(ns.DB.Load)
        if not ok then Log.Error("Init", "DB.Load failed: %s", tostring(err)) end
    else
        Log.Warn("Init", "DB.Load is not available; database modules are not loaded yet")
    end

    if not self.db.global.welcomeShown then
        self.db.global.welcomeShown = Const.VERSION
        Log.Print(L["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."])
    end
    Log.Info("Init", L["PandaQuest %s loaded. Type /pq for options, /pq help for commands."], Const.VERSION)
end

function PQ:OnDisable()
    Thread.CancelAll()
end

---------------------------------------------------------------------------
-- Slash commands
---------------------------------------------------------------------------

local function notAvailable(what)
    Log.Print(L["%s is not available yet."], what)
end

-- Returns module[fnName] when the module and function exist, otherwise prints a friendly message.
local function need(moduleName, fnName)
    local module = ns[moduleName]
    local fn = module and module[fnName]
    if type(fn) == "function" then return fn end
    notAvailable(moduleName .. "." .. fnName)
    return nil
end

local function describeTarget(target)
    if not target then return L["none"] end
    local text = target.text or target.key or "?"
    if target.questTitle then text = format("%s - %s", target.questTitle, text) end
    if target.distance then text = text .. " (" .. Util.FormatDistance(target.distance) .. ")" end
    return text
end

-- Simple two-level table dumper for /pq dump.
local function dumpValue(v, depth)
    depth = depth or 0
    if type(v) ~= "table" then return tostring(v) end
    if depth >= 2 then return "{...}" end
    local parts, n = {}, 0
    for k, val in pairs(v) do
        n = n + 1
        if n > 40 then parts[#parts + 1] = "..."; break end
        parts[#parts + 1] = tostring(k) .. "=" .. dumpValue(val, depth + 1)
    end
    return "{" .. table.concat(parts, ", ") .. "}"
end

local commands = {}
PQ.commands = commands

commands.help = function()
    Log.Print(L["Available commands:"])
    local lines = {
        "/pq - open options", "/pq arrow - toggle the navigation arrow",
        "/pq target [questID|clear] - pin a quest (or show the current target)", "/pq next - skip the current target",
        "/pq units meters|yards - distance units", "/pq wh [questID] - Wowhead link",
        "/pq hide <questID> - hide a quest from the navigator", "/pq unhide <questID> - show a hidden quest again",
        "/pq reset - reset arrow position and map pins", "/pq debug [0-4|arrow] - log level",
        "/pq dump quest|npc|object|item <id> - print database entry", "/pq status - addon status",
        "/pq sync - telemetry and community data status",
        "/pq scan professions - read the open profession window",
        "/pq scan archaeology - read your archaeology window",
        "/pq digsite - show the dig site bar so you can move it",
        "/pq consent - ask the data sharing question again",
        "/pq flight - show the flight bar so you can drag it",
        "/pq quests [questID] - browse every quest in the database",
        "/pq lang auto|<locale> - interface language",
    }
    for _, line in ipairs(lines) do Log.Print("  %s", L[line]) end
end

commands.options = function()
    local fn = need("Options", "Open")
    if fn then fn() end
end

commands.arrow = function()
    local fn = need("Arrow", "Toggle")
    if fn then fn() end
end

commands.target = function(arg)
    local Router = ns.Router
    if arg == "" then
        local fn = need("Router", "GetCurrent")
        if fn then
            local current = fn()
            if current then Log.Print(L["Current target: %s"], describeTarget(current))
            else Log.Print(L["No current target."]) end
        end
        return
    end
    if arg == "clear" or arg == "none" or arg == "off" then
        local fn = need("Router", "SetManualTarget")
        if fn then fn(nil) end
        return
    end
    local questID = tonumber(arg)
    if not questID then
        Log.Print(L["Usage: %s"], L["/pq target [questID|clear] - pin a quest (or show the current target)"])
        return
    end
    local getForQuest = need("Targets", "GetForQuest")
    if not getForQuest then return end
    local list = getForQuest(questID)
    local target = list and list[1]
    if not target then
        Log.Print(L["No target found for quest %d."], questID)
        return
    end
    if Router and Router.SetManualTarget then
        Router.SetManualTarget(target)
        Log.Print(L["Current target: %s"], describeTarget(target))
    else
        notAvailable("Router.SetManualTarget")
    end
end

commands.next = function()
    local fn = need("Router", "Skip")
    if fn then fn() end
end

commands.units = function(arg)
    if arg == "meters" or arg == "yards" then
        PQ.db.profile.units = arg
        PQ:SendMessage("PQ_SETTING_CHANGED", "units", arg)
    elseif arg ~= "" then
        Log.Print(L["Usage: %s"], L["/pq units meters|yards - distance units"])
        return
    end
    Log.Print(L["Units: %s"], L[PQ.db.profile.units])
    if ns.QuestieDB and ns.QuestieDB.GetStatusLines then
        for _, line in ipairs(ns.QuestieDB.GetStatusLines()) do Log.Print("%s", line) end
    end
end

commands.wh = function(arg)
    local questID = tonumber(arg)
    if not questID and ns.Router and ns.Router.GetCurrent then
        local current = ns.Router.GetCurrent()
        questID = current and current.questID
    end
    if not questID then
        Log.Print(L["Usage: %s"], L["/pq wh [questID] - Wowhead link"])
        return
    end
    local urlFn = need("Wowhead", "QuestUrl")
    local showFn = urlFn and need("Wowhead", "ShowCopyDialog")
    if urlFn and showFn then showFn(urlFn(questID)) end
end

local function setHidden(arg, hidden)
    local questID = tonumber(arg)
    if not questID then
        Log.Print(L["Usage: %s"], L[hidden and "/pq hide <questID> - hide a quest from the navigator"
            or "/pq unhide <questID> - show a hidden quest again"])
        return
    end
    PQ.db.char.hiddenQuests[questID] = hidden or nil
    Log.Print(L[hidden and "Quest %d hidden." or "Quest %d is visible again."], questID)
    if ns.Availability and ns.Availability.Recalculate then ns.Availability.Recalculate("hidden") end
    if ns.Targets and ns.Targets.Rebuild then ns.Targets.Rebuild("hidden") end
end
commands.hide = function(arg) setHidden(arg, true) end
commands.unhide = function(arg) setHidden(arg, false) end

commands.reset = function()
    if ns.Arrow and ns.Arrow.ResetPosition then ns.Arrow.ResetPosition() end
    if ns.Pins and ns.Pins.Clear then ns.Pins.Clear() end
    if ns.Pins and ns.Pins.Redraw then ns.Pins.Redraw() end
    if ns.Router and ns.Router.SetManualTarget then ns.Router.SetManualTarget(nil) end
    Log.Print(L["Arrow position and pins reset."])
end

commands.debug = function(arg)
    if arg == "arrow" then
        local dbg = PQ.db.profile.debug
        dbg.arrowDebug = not dbg.arrowDebug
        PQ:SendMessage("PQ_SETTING_CHANGED", "debug.arrowDebug", dbg.arrowDebug)
        Log.Print(L["Arrow debug: %s"], L[dbg.arrowDebug and "Enabled" or "Disabled"])
        return
    end
    local level = tonumber(arg)
    if level then
        Log.SetLevel(level)
        PQ:SendMessage("PQ_SETTING_CHANGED", "debug.level", PQ.db.profile.debug.level)
    elseif arg ~= "" then
        Log.Print(L["Usage: %s"], L["/pq debug [0-4|arrow] - log level"])
        return
    end
    level = Log.GetLevel()
    Log.Print(L["Log level: %d (%s)"], level, Log.LEVEL_NAMES[level] or "?")
end

local DUMP_GETTERS = { quest = "GetQuest", npc = "GetNpc", object = "GetObject", item = "GetItem" }
commands.dump = function(arg)
    local kind, id = arg:match("^(%a+)%s+(%d+)$")
    local getter = kind and DUMP_GETTERS[kind:lower()]
    if not getter then
        Log.Print(L["Usage: %s"], L["/pq dump quest|npc|object|item <id> - print database entry"])
        return
    end
    local fn = need("DB", getter)
    if not fn then return end
    local entry = fn(tonumber(id))
    if not entry then
        Log.Print(L["Not found: %s %d"], kind, tonumber(id))
        return
    end
    Log.Print("%s %s: %s", kind, id, dumpValue(entry))
end

commands.status = function()
    Log.Print(L["Version %s"], Const.VERSION)
    -- ns.Build is generated INTO THE PACKAGE by build.py and is absent from the
    -- repository, so a developer running from a checkout simply gets one line less.  It is printed
    -- here because it carries the one fact ## Version cannot: when the commit this copy was built
    -- from was made.  A player comparing their game with what /setup offers is comparing dates.
    local build = ns.Build
    if build and build.committed then
        Log.Print(L["Built %s from %s"], build.committed, build.commit or "?")
        if build.dirty then
            Log.Print(L["This is a build from a modified working tree; it is not a release."])
        end
    end
    if build and build.channel == "beta" then
        Log.Print(L["This is a beta build: new features are not yet confirmed in the game."])
    end
    local ready = ns.DB and ns.DB.IsReady and ns.DB.IsReady()
    Log.Print(L["Database: %s"], L[ready and "ready" or "loading"])
    if ns.QuestLog and ns.QuestLog.GetAll then
        local n = 0
        for _ in pairs(ns.QuestLog.GetAll() or {}) do n = n + 1 end
        Log.Print(L["Quests in log: %d"], n)
    end
    if ns.Targets and ns.Targets.GetAll then
        Log.Print(L["Targets: %d"], #(ns.Targets.GetAll() or {}))
    end
    if ns.Router and ns.Router.GetCurrent then
        Log.Print(L["Current target: %s"], describeTarget(ns.Router.GetCurrent()))
    end
    Log.Print(L["Background jobs: %d"], Thread.CountRunning())
    Log.Print(L["Units: %s"], L[PQ.db.profile.units])
end

commands.sync = function()
    -- Telemetry owns the wording; the fallback keeps /pq sync useful if the
    -- module failed to load.
    if ns.Telemetry and ns.Telemetry.GetStatusLines then
        -- The last line of GetStatusLines() is already the community data freshness.
        for _, line in ipairs(ns.Telemetry.GetStatusLines()) do Log.Print("%s", line) end
        return
    end
    local enabled = PQ.db.global.telemetry and PQ.db.global.telemetry.enabled
    Log.Print(L["Telemetry: %s, sessions stored: %d"], L[enabled and "Enabled" or "Disabled"], 0)
    local text = ns.Community and ns.Community.GetFreshnessText and ns.Community.GetFreshnessText()
    Log.Print(L["Community data: %s"], text or L["none"])
end

-- The first-run telemetry question, on demand.  Somebody who clicked past it, or who
-- wants to change their mind and would rather be asked than hunt through the options panel, gets
-- the same dialog with the same wording.
commands.consent = function()
    if ns.Consent and ns.Consent.Ask then
        ns.Consent.Ask()
        return
    end
    Log.Print(L["%s is not available yet."], "consent")
end

-- Every language the addon ships, "enUS" first, in a stable order for printing.
local function availableLanguages()
    local codes = { "enUS" }
    for code in pairs(ns.LOCALE_TABLES or {}) do
        if code ~= "enUS" then codes[#codes + 1] = code end
    end
    table.sort(codes, function(a, b)
        if a == "enUS" then return b ~= "enUS" end
        if b == "enUS" then return false end
        return a < b
    end)
    return codes
end

commands.quests = function(arg)
    local Browser = ns.QuestBrowser
    if not (Browser and Browser.Show) then
        notAvailable("QuestBrowser")
        return
    end
    local questID = tonumber(arg)
    if questID then
        Browser.Open(questID)
    else
        Browser.Toggle()
    end
end

commands.lang = function(arg)
    local known = {}
    for _, code in ipairs(availableLanguages()) do known[code] = true end
    if arg == "auto" or known[arg] then
        PQ.db.global.language = (arg ~= "auto") and arg or nil
        ApplyLanguage()
    elseif arg ~= "" then
        Log.Print(L["Usage: %s"], L["/pq lang auto|<locale> - interface language"])
        Log.Print(L["Available languages: %s"], table.concat(availableLanguages(), ", "))
        return
    end
    Log.Print(L["Language: %s (reload the UI to apply everywhere)"], PQ.db.global.language or "auto")
    Log.Print(L["Available languages: %s"], table.concat(availableLanguages(), ", "))
end

-- Entry point for /pq and /pandaquest.
function PQ:ChatCommand(input)
    input = tostring(input or ""):gsub("^%s+", ""):gsub("%s+$", "")
    local cmd, rest = input:match("^(%S+)%s*(.-)$")
    cmd = cmd and cmd:lower() or ""
    rest = rest or ""
    if cmd == "" then
        if ns.Options and ns.Options.Open then
            ns.Options.Open()
        else
            commands.help()
        end
        return
    end
    local handler = commands[cmd]
    if not handler then
        Log.Print(L["Unknown command: %s"], cmd)
        commands.help()
        return
    end
    local ok, err = pcall(handler, rest)
    if not ok then
        Log.Error("Init", "/pq %s failed: %s", cmd, tostring(err))
    end
end
