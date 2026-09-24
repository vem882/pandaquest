-- Core/Const.lua: constants and AceDB defaults (docs/06 sections 5 and 12).
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

-- Target kinds and their default priorities (smaller sorts first, docs/06 section 9.1).
Const.TARGET_KINDS = { "OBJECTIVE", "TURNIN", "PICKUP", "ITEMUSE", "EXPLORE", "CUSTOM" }
Const.TARGET_PRIORITY = { OBJECTIVE = 10, ITEMUSE = 10, EXPLORE = 10, TURNIN = 5, PICKUP = 30, CUSTOM = 10 }

-- Thread driver budget (docs/06 section 5).
Const.THREAD_BUDGET_MS = 8
Const.THREAD_TICKS_PER_YIELD = 24
Const.THREAD_MAX_RESUMES_PER_JOB = 4000   -- backstop if the clock does not advance (see Core/Thread.lua)

-- Log levels (Core/Log.lua).
Const.LOG_ERROR, Const.LOG_WARN, Const.LOG_INFO, Const.LOG_DEBUG, Const.LOG_TRACE = 0, 1, 2, 3, 4

-- Chat prefix colour and Wowhead base.
Const.CHAT_PREFIX = "|cff5fd7ffPanda|rQuest"
Const.WOWHEAD_BASE = "https://www.wowhead.com/mop-classic/"

-- AceDB defaults (docs/06 section 12). Must match the contract exactly.
ns.DEFAULTS = {
    profile = {
        units = "meters",                            -- "meters"|"yards"
        arrow = { enabled = true, locked = false, scale = 1.0, alpha = 1.0, point = "CENTER", x = 0, y = -140,
                  showETA = true, showText = true, showCommunity = true, autoHideInInstance = true, arrivalFlash = true,
                  fontSize = 12 },
        nav = { mode = "auto", includeAvailable = true, includeTurnIn = true, availableRadius = 800, maxAvailable = 5,
                focusQuestID = nil, tomtomMode = "off", arriveRadius = 15 },
        -- nodeScale, minimapMaxNodes and minimapFade are docs/10 section B2: the objective dots
        -- have their own size (they are dots, not glyphs), the minimap carries at most
        -- minimapMaxNodes of them (nearest first), and a pin fades and shrinks once it is past
        -- minimapFade of the way from the minimap's centre to its edge (0 = no fade).
        map = { showAvailable = true, showObjectives = true, showTurnIn = true, showOnMinimap = true, iconScale = 1.0,
                minimapIconScale = 1.0, lowLevelQuests = false, showRepeatable = true, showDungeon = false, showRaid = false,
                showPvP = false, showPetBattle = true, clusterSpawns = true, fadeMinimapEdge = true,
                nodeScale = 1.0, minimapMaxNodes = 50, minimapFade = 0.6 },
        -- docs/10 D2: profession nodes. `onlyMyProfessions` is the filter that keeps the map
        -- honest for a character with no gathering profession at all - it draws nothing rather
        -- than a zone full of veins nobody here can touch - while `showUngatherable` is the
        -- opposite request: show me what I could take if I levelled the skill, faded.
        -- `respawnCountdown` dims a node this session already emptied until ns.Respawn says it is
        -- back, and the same switch dims a quest spawn whose mob the player just killed
        -- (Map/Pins.lua's ApplyRespawnFade): one countdown, one toggle.
        professions = { enabled = true, mining = true, herbalism = true, fishing = true,
                        chests = true, rares = true, showUngatherable = false,
                        onlyMyProfessions = true, respawnCountdown = true },
        -- docs/11 B5-B6: archaeology. `snapshotOnOpen` reads the archaeology window's own numbers --
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
        tooltips = { enabled = true, showIds = false },
        tracker = { enhanceBlizzard = true, showDistance = true },
        notify = { enabled = true, sound = true, questComplete = true, nextTarget = true },
        -- No radius here: LibDBIcon only offers a library-wide button radius, so exposing one
        -- would move every other addon's minimap button too (see UI/MinimapButton.lua).
        minimapButton = { hide = false, minimapPos = 220 },
        debug = { level = 1, arrowDebug = false },
    },
    char = { hiddenQuests = {}, manualTargetKey = nil, tomtomWaypoint = nil, questAcceptedAt = {}, customTargets = {} },
    -- `gear` records the character sheet (Sync/Character.lua) at most once per `gearInterval`
    -- seconds. `gearMoney` is the one field in that snapshot that is off unless the operator asks
    -- for it: nothing the hub shows needs a character's gold.
    --
    -- `enabled` is **false** and stays false until the player says otherwise (docs/07 B1).  What
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
               -- What play taught us about profession nodes (docs/10 A4/D3). WHERE Pandaria's ore
               -- and herbs stand is in no source we can reach, so the only way one reaches the map
               -- is that somebody gathered it; since docs/10 J the seed does at least say what
               -- those ids ARE, read from our own object database, and it still places nothing.
               -- `nodes[objectId] = { k = kind, s = skill, n = name,
               -- p = { [spawnKey] = timesSeen } }`. Local and unconditional - writing to one's own
               -- disk is not the hub's processing - while *sending* it is gated by telemetry.
               nodes = {},
               dbCompiled = nil },
}
