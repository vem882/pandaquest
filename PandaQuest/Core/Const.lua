-- Core/Const.lua: constants and AceDB defaults.
local ADDON_NAME, ns = ...

local Const = {}
ns.Const = Const

-- Version string from the TOC (C_AddOns is the only API on 5.5.4; the old global is nil).
do
    local version
    if C_AddOns and C_AddOns.GetAddOnMetadata then
        version = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version")
    end
    Const.VERSION = version or "0.0.0"
end

Const.ADDON_NAME = ADDON_NAME
Const.SLASH_COMMANDS = { "pq", "pandaquest" }

Const.YARDS_PER_METER = 1.09361
Const.RUN_SPEED = 7                     -- yards per second on foot

-- Map icon names (Map/Icons.lua resolves them to texture paths).
Const.ICON_KINDS = {
    "available", "available_gray", "available_repeatable", "complete", "complete_repeatable",
    "slay", "loot", "object", "talk", "event", "itemuse", "explore", "pickup", "custom", "glow", "arrow",
}

-- Target kinds and their default priorities (smaller sorts first).
Const.TARGET_KINDS = { "OBJECTIVE", "TURNIN", "PICKUP", "ITEMUSE", "EXPLORE", "CUSTOM" }
Const.TARGET_PRIORITY = { OBJECTIVE = 10, ITEMUSE = 10, EXPLORE = 10, TURNIN = 5, PICKUP = 30, CUSTOM = 10 }

-- Thread driver budget.
Const.THREAD_BUDGET_MS = 8
Const.THREAD_TICKS_PER_YIELD = 24
Const.THREAD_MAX_RESUMES_PER_JOB = 4000   -- backstop if the clock does not advance (see Core/Thread.lua)

-- Log levels (Core/Log.lua).
Const.LOG_ERROR, Const.LOG_WARN, Const.LOG_INFO, Const.LOG_DEBUG, Const.LOG_TRACE = 0, 1, 2, 3, 4

-- Chat prefix colour and Wowhead base.
Const.CHAT_PREFIX = "|cff5fd7ffPanda|rQuest"
Const.WOWHEAD_BASE = "https://www.wowhead.com/mop-classic/"
-- The PandaQuest portal: the page every link the addon hands out goes to, so a player stays on the
-- site that has PandaQuest's own data (quests/<id>, npcs/<id>, objects/<id>, items/<id>).
Const.HUB_BASE = "https://pd.zroot.it/"

-- AceDB defaults. Must match the contract exactly.
ns.DEFAULTS = {
    profile = {
        units = "meters",                            -- "meters"|"yards"
        arrow = { enabled = true, locked = false, scale = 1.0, alpha = 1.0, point = "CENTER", x = 0, y = -140,
                  showETA = true, showText = true, showCommunity = true, autoHideInInstance = true, arrivalFlash = true,
                  fontSize = 12 },
        nav = { mode = "auto", includeAvailable = true, includeTurnIn = true, availableRadius = 800, maxAvailable = 5,
                focusQuestID = nil, tomtomMode = "off", arriveRadius = 15 },
        -- nodeScale, minimapMaxNodes and minimapFade are about the objective dots:
        -- have their own size (they are dots, not glyphs), the minimap carries at most
        -- minimapMaxNodes of them (nearest first), and a pin fades and shrinks once it is past
        -- minimapFade of the way from the minimap's centre to its edge (0 = no fade).
        map = { showAvailable = true, showObjectives = true, showTurnIn = true, showOnMinimap = true, iconScale = 1.0,
                minimapIconScale = 1.0, lowLevelQuests = false, showRepeatable = true, showDungeon = false, showRaid = false,
                showPvP = false, showPetBattle = true, clusterSpawns = true, fadeMinimapEdge = true,
                nodeScale = 1.0, minimapMaxNodes = 50, minimapFade = 0.6 },
        -- Profession nodes. `onlyMyProfessions` is the filter that keeps the map
        -- honest for a character with no gathering profession at all - it draws nothing rather
        -- than a zone full of veins nobody here can touch - while `showUngatherable` is the
        -- opposite request: show me what I could take if I levelled the skill, faded.
        -- `respawnCountdown` dims a node this session already emptied until ns.Respawn says it is
        -- back, and the same switch dims a quest spawn whose mob the player just killed
        -- (Map/Pins.lua's ApplyRespawnFade): one countdown, one toggle.
        professions = { enabled = true, mining = true, herbalism = true, fishing = true,
                        chests = true, rares = true, showUngatherable = false,
                        onlyMyProfessions = true, respawnCountdown = true },
        -- The flight master. `tooltipETA` appends one line to the taxi node tooltip
        -- and `bar` draws the progress bar while the flight runs. Both show nothing at all on a
        -- route this account has never flown, because nothing on this client can say how long an
        -- unflown route takes (Flight/Routes.lua's header). The bar is locked and sized the way
        -- `arrow` above is, and remembers where it was dragged to with all four of GetPoint's
        -- anchor returns rather than three: rebuilding the anchor from `barPoint` alone assumes
        -- the client leaves point == relativePoint after a drag, and nothing here can check that.
        flight = { tooltipETA = true,
                   bar = true, barLocked = false, barScale = 1.0,
                   barPoint = "CENTER", barRelPoint = "CENTER", barX = 0, barY = -200 },
        -- Archaeology. `snapshotOnOpen` reads the archaeology window's own numbers --
        -- the races, their keystone item, their fragments and their artifacts -- into
        -- PandaQuestProf whenever the player opens or closes that window. `digSiteBar` is the
        -- dig-site progress bar Mists never shipped: Blizzard wrote one for Cataclysm
        -- (Blizzard_FrameXML/Cata/ArchaeologyProgressBar.lua) and listed its XML only in
        -- Blizzard_FrameXML_Mainline.toc, leaving Mists with the commented-out hook at
        -- Blizzard_UIParent/Mists/UIParent.lua:1148. The position keys are the arrow's
        -- (Nav/Arrow.lua): a frame the player can drag has to remember where they dropped it.
        --
        -- These live here rather than beside their module the way `recipes` does, because two
        -- modules read them -- Recipes/Archaeology.lua for the snapshot and UI/DigSiteBar.lua for
        -- the bar -- and the bar loads first. One declaration in the file that loads before
        -- everything is one less thing that depends on the TOC's order.
        archaeology = { snapshotOnOpen = true,
                        digSiteBar = true, barLocked = false, barScale = 1.0,
                        barPoint = "CENTER", barX = 0, barY = -260 },
        -- `npcTitles` is the <title> line on map pins, `questRewards` a quest's rewards under a quest the
        -- player can pick up (unit tooltips and map pins alike).
        tooltips = { enabled = true, showIds = false, npcTitles = true, questRewards = true },
        -- The quest browser's page (UI/QuestBrowser.lua): `questText` is the quest giver's text under the
        -- objectives, `rewards` the money and items in the Rewards line, both as the PandaQuest portal
        -- read them off Wowhead.
        browser = { questText = true, rewards = true },
        tracker = { enhanceBlizzard = true, showDistance = true },
        notify = { enabled = true, sound = true, questComplete = true, nextTarget = true },
        -- No radius here: LibDBIcon only offers a library-wide button radius, so exposing one
        -- would move every other addon's minimap button too (see UI/MinimapButton.lua).
        minimapButton = { hide = false, minimapPos = 220 },
        -- Motion (UI/Motion.lua): windows fade and settle, messages slide, bars glide. `enabled = false`
        -- shows every final state at once; `speed` is a multiplier, 0.5 (slow) to 2 (fast).
        motion = { enabled = true, speed = 1 },
        debug = { level = 1, arrowDebug = false },
    },
    char = { hiddenQuests = {}, manualTargetKey = nil, tomtomWaypoint = nil, questAcceptedAt = {}, customTargets = {} },
    -- `gear` records the character sheet (Sync/Character.lua) at most once per `gearInterval`
    -- seconds. `gearMoney` is the one field in that snapshot that is off unless the operator asks
    -- for it: nothing the hub shows needs a character's gold.
    --
    -- `enabled` is **false** and stays false until the player says otherwise.  What
    -- telemetry records is a movement log -- map coordinates with timestamps, tied to a character
    -- name -- and the hub's legal basis for processing it is consent.  A default of `true` made
    -- the consent chain incoherent in both directions: the recorder filled the saved variable
    -- before anybody had been asked anything, and a player who then ticked the box on the hub was
    -- consenting to the upload of data collected before the question existed.  Writing to one's
    -- own disk is not the hub operator's processing, but collecting by default is a bad habit and
    -- this is the file where the habit is set.
    --
    -- `asked` is what stops the first-run question becoming a nag: Sync/Consent.lua sets it once
    -- the player has answered either way, so "no" is remembered as firmly as "yes".
    global = { telemetry = { enabled = false, asked = false,
                             breadcrumbs = true, breadcrumbInterval = 10, maxSessions = 30,
                             maxEventsPerSession = 5000,
                             gear = true, gearInterval = 60, gearMoney = false },
               -- What play taught us about profession nodes. WHERE Pandaria's ore
               -- and herbs stand is in no source we can reach, so the only way one reaches the map
               -- is that somebody gathered it; the seed does at least say what
               -- those ids ARE, read from our own object database, and it still places nothing.
               -- `nodes[objectId] = { k = kind, s = skill, n = name,
               -- p = { [spawnKey] = timesSeen } }`. Local and unconditional - writing to one's own
               -- disk is not the hub's processing - while *sending* it is gated by telemetry.
               nodes = {},
               -- Whether the QuestieDB addon, if installed, completes our database (Database/QuestieDB.lua):
               -- "off", "gaps" or "prefer". Read once, while the database loads.
               questieDB = { mode = "gaps" },
               -- What play taught us about flight times. Nothing on this client can
               -- convert a taxi map position into yards and nothing names a taxi's speed, so a
               -- route's duration exists only once somebody has flown it and we timed it.
               -- `flight.routes["srcNodeID-dstNodeID"] = { n = samples, [1..n] = seconds,
               -- t = unix time of the newest }`, keyed by the numeric node ids and never by a
               -- localised node name. Account wide and local: like `nodes` above, writing to one's
               -- own disk is not the hub's processing, and nothing here is uploaded in this
               -- version -- there is nothing to aggregate until somebody flies.
               flight = { routes = {} },
               dbCompiled = nil },
}

---------------------------------------------------------------------------
-- The AceAddon object and its modules
---------------------------------------------------------------------------
-- Every subsystem is an AceAddon-3.0 module of one addon object. They are created here, in the first
-- file of the TOC, because each module file fetches its own object while it loads
-- (`local M = ns.PQ:GetModule("QuestLog")`), and `ns.<Name>` is that same object, so everything that
-- reads ns.QuestLog keeps working. Core/Init.lua gives the addon and the modules their lifecycle.
--
-- The order of this list is the lifecycle order, and both passes follow it:
--   OnInitialize  at ADDON_LOADED, right after PQ:OnInitialize created AceDB. AceAddon initializes
--                 modules in the order they were created, which is this list's order.
--   OnEnable      at PLAYER_LOGIN, from PQ:OnEnable, one module at a time in this order, and only
--                 then the database load (Core/Init.lua, ApplyModuleStates). The modules are created
--                 disabled (SetDefaultModuleState(false)) for exactly that reason: AceAddon would
--                 otherwise enable them itself, after PQ:OnEnable had already started the database.
-- OnDataReady and OnProfileChanged reach the enabled modules in the same order (ns.CallModules).
ns.MODULE_ORDER = {
    "Schema", "Zones", "DB",
    "Player", "QuestLog", "Objectives", "Availability",
    "Targets", "Router", "Arrow", "TomTomBridge",
    "Icons", "MapCompat", "NodeTooltip", "Pins", "Tooltips",
    "Respawn", "Professions",
    "FlightRoutes", "FlightTooltip",
    "Options", "MinimapButton", "FlightBar", "Wowhead", "Tracker", "Notify", "DigSiteBar", "QuestBrowser",
    "MainWindow",
    "AuctionStore", "AuctionScanner", "AuctionMail", "AuctionTooltip",
    -- After AuctionScanner because RecipeScanner's OnInitialize takes one word out of its /pq scan
    -- command and hands the rest back. Archaeology does the same to RecipeScanner's wrapper,
    -- so it comes after that one for the same reason.
    "RecipeStore", "RecipeScanner", "Archaeology",
    "Telemetry", "CharacterSheet", "Consent", "Community",
}

-- The modules a player may switch off (Options > Modules; profile.modules.<Name>, on by default).
-- A module that is off has no event, message, bucket or timer registered and shows nothing. Every
-- module missing from this list is something another one stands on -- the quest log, the targets,
-- the database -- and stays on.
ns.OPTIONAL_MODULES = {
    "Arrow", "Pins", "Tooltips", "Respawn", "Professions",
    "Tracker", "Notify", "DigSiteBar",
    "AuctionScanner", "AuctionMail", "AuctionTooltip", "RecipeScanner", "Archaeology",
    "Telemetry", "CharacterSheet",
}

-- profile.modules.<Name> = true for every optional module. A new key: nothing is moved into it.
ns.DEFAULTS.profile.modules = {}
local OPTIONAL = {}
for _, name in ipairs(ns.OPTIONAL_MODULES) do
    ns.DEFAULTS.profile.modules[name] = true
    OPTIONAL[name] = true
end

--- ns.IsModuleWanted(name) -> bool. False only for an optional module the profile switched off; true
-- for everything else, and before AceDB exists. Module code asks this ("has the player switched me
-- off?") rather than AceAddon's IsEnabled, which is also false between loading and PLAYER_LOGIN.
function ns.IsModuleWanted(name)
    if not OPTIONAL[name] then return true end
    local PQ = ns.PQ
    local states = PQ and PQ.db and PQ.db.profile and PQ.db.profile.modules
    return not (type(states) == "table" and states[name] == false)
end

-- In the game AceAddon is always there (embeds.xml loads it first). The release checks also read this
-- file on its own, for ns.DEFAULTS alone (.github/release/lua_checks.py), and there is no addon then.
local AceAddon = LibStub and LibStub("AceAddon-3.0", true)
if not AceAddon then return end

local PQ = AceAddon:NewAddon(ADDON_NAME, "AceEvent-3.0", "AceTimer-3.0", "AceBucket-3.0", "AceConsole-3.0")
ns.PQ = PQ
_G.PandaQuest = PQ

-- What every module inherits. A file that still builds a table of its own (`local M = {}`, the shape
-- every file had before the modules; ns.<Name> is then that table, not the module) is driven through
-- that table's Init and Enable, so its lifecycle keeps the same place in the order.
local Prototype = {}
ns.ModulePrototype = Prototype

local function ownTable(module)
    local own = ns[module.moduleName]
    if own ~= module and type(own) == "table" then return own end
    return nil
end

function Prototype:OnInitialize()
    local own = ownTable(self)
    if own and type(own.Init) == "function" then own.Init() end
end

function Prototype:OnEnable()
    local own = ownTable(self)
    if own and type(own.Enable) == "function" then own.Enable() end
end

-- AceEvent, AceTimer and AceBucket clear the module's own registrations when it is disabled; a table
-- of its own that embedded them itself is cleared here.
function Prototype:OnDisable()
    local own = ownTable(self)
    if not own then return end
    for _, target in ipairs({ own, rawget(own, "listener") or false }) do
        if type(target) == "table" then
            if type(target.UnregisterAllEvents) == "function" then target:UnregisterAllEvents() end
            if type(target.UnregisterAllMessages) == "function" then target:UnregisterAllMessages() end
            if type(target.UnregisterAllBuckets) == "function" then target:UnregisterAllBuckets() end
            if type(target.CancelAllTimers) == "function" then target:CancelAllTimers() end
        end
    end
end

PQ:SetDefaultModuleState(false)
PQ:SetDefaultModulePrototype(Prototype)
PQ:SetDefaultModuleLibraries("AceEvent-3.0", "AceTimer-3.0", "AceBucket-3.0")
for _, name in ipairs(ns.MODULE_ORDER) do
    ns[name] = PQ:NewModule(name)
end
