-- UI/Options.lua: the AceConfig-3.0 options table (docs/06 sections 11 and 12).
--
-- Every option addresses a settings key by path ("arrow.scale"); paths that start with "global."
-- live under db.global, the rest under db.profile. Setting one writes the value, fires
-- PQ_SETTING_CHANGED and calls the module that has to react, so nothing needs a reload.
local _, ns = ...
local L = ns.L

local Const, Log = ns.Const, ns.Log

local M = {}
ns.Options = M

local type, pairs, tonumber, tostring, format = type, pairs, tonumber, tostring, string.format

local APP_NAME = "PandaQuest"

local options                       -- the built table (cached)
local blizFrame, blizCategory       -- AddToBlizOptions results
local registered = false

local function db()
    local PQ = ns.PQ
    return PQ and PQ.db
end

---------------------------------------------------------------------------
-- Path resolution
---------------------------------------------------------------------------

-- Resolves "arrow.scale" / "global.telemetry.enabled" to (table, lastKey).
local function resolve(path)
    local store = db()
    if not store or type(path) ~= "string" then return nil, nil end
    local globalPath = path:match("^global%.(.+)$")
    local node, rest
    if globalPath then
        node, rest = store.global, globalPath
    else
        node, rest = store.profile, path
    end
    if not node then return nil, nil end
    local last
    for part in rest:gmatch("[^%.]+") do
        if last then
            node = node[last]
            if type(node) ~= "table" then return nil, nil end
        end
        last = part
    end
    return node, last
end

function M.GetValue(path)
    local node, key = resolve(path)
    if not node then return nil end
    return node[key]
end

---------------------------------------------------------------------------
-- Appliers: what has to happen after a key changes
---------------------------------------------------------------------------

local function refreshArrow()
    if ns.Arrow and ns.Arrow.Refresh then ns.Arrow.Refresh() end
end

local function refreshPins()
    if ns.Pins and ns.Pins.Redraw then ns.Pins.Redraw() end
end

local function rebuildTargets()
    if ns.Targets and ns.Targets.Rebuild then ns.Targets.Rebuild("options") end
end

local function recalcAvailability()
    if ns.Availability and ns.Availability.Recalculate then ns.Availability.Recalculate("options") end
    rebuildTargets()
end

local function refreshTracker()
    if ns.Tracker and ns.Tracker.Refresh then ns.Tracker.Refresh() end
end

local function refreshMinimapButton()
    if ns.MinimapButton and ns.MinimapButton.Refresh then ns.MinimapButton.Refresh() end
end

-- path prefix -> applier. The longest matching prefix wins.
local APPLIERS = {
    ["units"] = function() refreshArrow(); refreshTracker() end,
    ["arrow"] = refreshArrow,
    ["nav.mode"] = function() if ns.Router and ns.Router.Update then ns.Router.Update(true) end end,
    ["nav.focusQuestID"] = function() if ns.Router and ns.Router.Update then ns.Router.Update(true) end end,
    ["nav"] = rebuildTargets,
    ["map.lowLevelQuests"] = recalcAvailability,
    ["map.showRepeatable"] = recalcAvailability,
    ["map.showDungeon"] = recalcAvailability,
    ["map.showRaid"] = recalcAvailability,
    ["map.showPvP"] = recalcAvailability,
    ["map.showPetBattle"] = recalcAvailability,
    ["map"] = refreshPins,
    -- docs/10 D2: a profession toggle changes which nodes exist, not just which pins are shown, so
    -- the per-map node lists are dropped before the pins are rebuilt.
    ["professions"] = function()
        if ns.Professions and ns.Professions.Redraw then ns.Professions.Redraw() else refreshPins() end
    end,
    ["tooltips"] = function() if ns.Tooltips and ns.Tooltips.InvalidateCache then ns.Tooltips.InvalidateCache() end end,
    ["tracker"] = refreshTracker,
    ["notify"] = function() end,
    ["minimapButton"] = refreshMinimapButton,
    ["debug.level"] = function() if Log.SetLevel then Log.SetLevel(M.GetValue("debug.level")) end end,
    ["debug"] = refreshArrow,
    ["global.telemetry"] = function()
        if ns.Telemetry and ns.Telemetry.ApplySettings then ns.Telemetry.ApplySettings() end
    end,
    -- docs/08 B3: the tooltip and the mailbox read their switch every time, so only the button on
    -- an already open auction house window has to be told.
    ["auction"] = function()
        if ns.AuctionScanner and ns.AuctionScanner.RefreshButton then ns.AuctionScanner.RefreshButton() end
    end,
}

local function applierFor(path)
    local best, bestLen = nil, -1
    for prefix, fn in pairs(APPLIERS) do
        if path == prefix or path:sub(1, #prefix + 1) == prefix .. "." then
            if #prefix > bestLen then best, bestLen = fn, #prefix end
        end
    end
    return best
end

--- Options.Set(path, value): writes a setting, fires PQ_SETTING_CHANGED and applies it.
function M.Set(path, value)
    local node, key = resolve(path)
    if not node then return false end
    if node[key] == value then return false end
    node[key] = value
    local PQ = ns.PQ
    if PQ and PQ.SendMessage then PQ:SendMessage("PQ_SETTING_CHANGED", path, value) end
    local apply = applierFor(path)
    if apply then
        local ok, err = pcall(apply)
        if not ok then Log.Error("Options", "applying %s failed: %s", path, tostring(err)) end
    end
    return true
end

---------------------------------------------------------------------------
-- AceConfig get/set (info.arg holds the path)
---------------------------------------------------------------------------

local function get(info)
    return M.GetValue(info.arg)
end

local function set(info, value)
    M.Set(info.arg, value)
end

-- Quest ID input: "" / "0" clears the focus.
local function getFocus(info)
    local value = M.GetValue(info.arg)
    return value and tostring(value) or ""
end

local function setFocus(info, value)
    local id = tonumber(value)
    if id == 0 then id = nil end
    M.Set(info.arg, id)
end

local function toggle(order, name, desc, path, extra)
    local option = { type = "toggle", order = order, name = name, desc = desc, arg = path,
                     get = get, set = set, width = "full" }
    if extra then for k, v in pairs(extra) do option[k] = v end end
    return option
end

local function range(order, name, desc, path, minValue, maxValue, step, extra)
    local option = { type = "range", order = order, name = name, desc = desc, arg = path,
                     min = minValue, max = maxValue, step = step, get = get, set = set }
    if extra then for k, v in pairs(extra) do option[k] = v end end
    return option
end

local function header(order, name)
    return { type = "header", order = order, name = name }
end

---------------------------------------------------------------------------
-- The table (docs/06 section 11 group order)
---------------------------------------------------------------------------

local function buildTable()
    local tbl = {
        type = "group",
        name = format("%s %s", "PandaQuest", Const.VERSION),
        childGroups = "tab",
        args = {
            general = {
                type = "group", order = 1, name = L["General"], args = {
                    intro = { type = "description", order = 0, fontSize = "medium",
                        name = L["PandaQuest works out of the box. Everything below is optional."] },
                    units = { type = "select", order = 1, name = L["Distance units"],
                        desc = L["Metres are shown as '123 m', yards as '135 yd'."],
                        values = { meters = L["meters"], yards = L["yards"] },
                        arg = "units", get = get, set = set },
                    minimapButton = toggle(2, L["Show minimap button"],
                        L["Left-click the minimap button to toggle the arrow, right-click for these options."],
                        "minimapButton.hide", {
                            get = function() return not M.GetValue("minimapButton.hide") end,
                            set = function(_, value) M.Set("minimapButton.hide", not value) end,
                        }),
                    languageHeader = header(10, L["Language"]),
                    languageInfo = { type = "description", order = 11,
                        name = L["PandaQuest follows your game language; /pq lang overrides it."] },
                },
            },
            arrow = {
                type = "group", order = 2, name = L["Arrow"], args = {
                    enabled = toggle(1, L["Show the arrow"], L["Hide it to navigate by map pins only."], "arrow.enabled"),
                    locked = toggle(2, L["Lock the arrow in place"], L["When unlocked, drag the arrow to move it."], "arrow.locked"),
                    showText = toggle(3, L["Show quest text"], L["Quest name and the action to take under the arrow."], "arrow.showText"),
                    showETA = toggle(4, L["Show travel time"], L["Estimated time to the target at your current speed."], "arrow.showETA"),
                    showCommunity = toggle(5, L["Show community timings"],
                        L["Average completion time collected from other players, when available."],
                        "arrow.showCommunity"),
                    autoHideInInstance = toggle(6, L["Hide inside instances"],
                        L["The arrow cannot guide you inside a dungeon or raid."], "arrow.autoHideInInstance"),
                    arrivalFlash = toggle(7, L["Flash on arrival"], L["A short glow when you reach the target."], "arrow.arrivalFlash"),
                    lookHeader = header(10, L["Appearance"]),
                    scale = range(11, L["Size"], L["Arrow size relative to the default."], "arrow.scale", 0.5, 3, 0.05),
                    alpha = range(12, L["Opacity"], nil, "arrow.alpha", 0.1, 1, 0.05),
                    fontSize = range(13, L["Text size"], nil, "arrow.fontSize", 8, 24, 1),
                    reset = { type = "execute", order = 14, name = L["Reset position"],
                        desc = L["Moves the arrow back to the middle of the screen."],
                        func = function() if ns.Arrow and ns.Arrow.ResetPosition then ns.Arrow.ResetPosition() end end },
                },
            },
            nav = {
                type = "group", order = 3, name = L["Navigation"], args = {
                    mode = { type = "select", order = 1, name = L["Target selection"],
                        desc = L["Auto weighs priority and distance; Focused quest follows one quest."],
                        values = { auto = L["Auto"], quest = L["Focused quest"], nearest = L["Nearest"] },
                        arg = "nav.mode", get = get, set = set },
                    focusQuestID = { type = "input", order = 2, name = L["Focused quest ID"],
                        desc = L["Used by 'Focused quest'. Empty follows the quest you track in the log."],
                        arg = "nav.focusQuestID", get = getFocus, set = setFocus },
                    includeTurnIn = toggle(3, L["Route to turn-ins"], L["Completed quests are routed back to their quest giver."], "nav.includeTurnIn"),
                    includeAvailable = toggle(4, L["Route to new quests"],
                        L["Nearby quests you could pick up are added to the route."], "nav.includeAvailable"),
                    availableRadius = range(5, L["New quest radius"], L["How far away a pickup may be to be routed to (yards)."],
                        "nav.availableRadius", 100, 5000, 50),
                    maxAvailable = range(6, L["Maximum new quests"], L["How many pickups are routed at once."],
                        "nav.maxAvailable", 0, 20, 1),
                    arriveRadius = range(7, L["Arrival radius"], L["How close you must get before a target counts as reached (yards)."],
                        "nav.arriveRadius", 5, 100, 1),
                    tomtomHeader = header(10, L["TomTom"]),
                    tomtomMode = { type = "select", order = 11, name = L["TomTom waypoints"],
                        desc = L["Mirror sends the current target to TomTom as a waypoint."],
                        values = { off = L["Off"], mirror = L["Mirror current target"] },
                        arg = "nav.tomtomMode", get = get, set = set },
                },
            },
            map = {
                type = "group", order = 4, name = L["Map"], args = {
                    showObjectives = toggle(1, L["Show objective pins"], L["Where to go for the quests in your log."], "map.showObjectives"),
                    showTurnIn = toggle(2, L["Show turn-in pins"], L["Quest givers waiting for a completed quest."], "map.showTurnIn"),
                    showAvailable = toggle(3, L["Show available quest pins"], L["Quests you could pick up."], "map.showAvailable"),
                    showOnMinimap = toggle(4, L["Show pins on the minimap"], nil, "map.showOnMinimap"),
                    fadeMinimapEdge = toggle(5, L["Keep distant pins on the minimap edge"],
                        L["Off hides a pin as soon as it leaves the minimap."], "map.fadeMinimapEdge"),
                    clusterSpawns = toggle(6, L["Merge nearby spawns"],
                        L["One pin for a pack of mobs instead of a dozen."], "map.clusterSpawns"),
                    sizeHeader = header(10, L["Pin size"]),
                    iconScale = range(11, L["Map pin size"], nil, "map.iconScale", 0.5, 3, 0.05),
                    minimapIconScale = range(12, L["Minimap pin size"], nil, "map.minimapIconScale", 0.5, 3, 0.05),
                    nodeScale = range(13, L["Objective dot size"],
                        L["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."],
                        "map.nodeScale", 0.5, 3, 0.05),
                    minimapMaxNodes = range(14, L["Maximum minimap pins"],
                        L["When there are more, the ones nearest to you are kept."],
                        "map.minimapMaxNodes", 5, 300, 5),
                    minimapFade = range(15, L["Minimap edge fade"],
                        L["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."],
                        "map.minimapFade", 0, 0.95, 0.05),
                    filterHeader = header(20, L["Which quests to show"]),
                    lowLevelQuests = toggle(21, L["Show low level quests"], L["Quests that are grey for your level."], "map.lowLevelQuests"),
                    showRepeatable = toggle(22, L["Show repeatable and daily quests"], nil, "map.showRepeatable"),
                    showDungeon = toggle(23, L["Show dungeon quests"], nil, "map.showDungeon"),
                    showRaid = toggle(24, L["Show raid quests"], nil, "map.showRaid"),
                    showPvP = toggle(25, L["Show PvP quests"], nil, "map.showPvP"),
                    showPetBattle = toggle(26, L["Show pet battle quests"], nil, "map.showPetBattle"),
                },
            },
            professions = {
                type = "group", order = 5, name = L["Gathering"], args = {
                    info = { type = "description", order = 0,
                        name = L["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] },
                    enabled = toggle(1, L["Show gathering nodes"],
                        L["Turns the whole layer off, whatever the boxes below say."], "professions.enabled"),
                    kindHeader = header(5, L["Which nodes"]),
                    mining = toggle(6, L["Mining veins"],
                        L["Ore veins. Hidden when your Mining skill is too low, unless you show those too."],
                        "professions.mining"),
                    herbalism = toggle(7, L["Herbs"],
                        L["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."],
                        "professions.herbalism"),
                    fishing = toggle(8, L["Fishing pools"],
                        L["Fishing pools on lakes, rivers and the coast."], "professions.fishing"),
                    chests = toggle(9, L["Chests and treasures"],
                        L["Chests and lockboxes in the world; no gathering skill filters these."],
                        "professions.chests"),
                    rares = toggle(10, L["Rare spawns"],
                        L["Rare creatures, at the places a rare was looted."], "professions.rares"),
                    filterHeader = header(15, L["Which of them you can gather"]),
                    onlyMyProfessions = toggle(16, L["Only my professions"],
                        L["A profession you have not learned contributes nothing at all."], "professions.onlyMyProfessions"),
                    showUngatherable = toggle(17, L["Show nodes above my skill"],
                        L["Drawn faded. Useful for planning where to level a gathering skill next."],
                        "professions.showUngatherable"),
                    respawnCountdown = toggle(18, L["Fade nodes and mobs until they respawn"],
                        L["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."],
                        "professions.respawnCountdown"),
                },
            },
            tooltips = {
                type = "group", order = 6, name = L["Tooltips"], args = {
                    enabled = toggle(1, L["Add quest info to tooltips"],
                        L["Shows which quests an NPC or item starts, ends or counts towards."], "tooltips.enabled"),
                    showIds = toggle(2, L["Show quest IDs"], L["Useful when reporting missing data."], "tooltips.showIds"),
                },
            },
            tracker = {
                type = "group", order = 7, name = L["Tracker"], args = {
                    info = { type = "description", order = 0,
                        name = L["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] },
                    enhanceBlizzard = toggle(1, L["Enhance the Blizzard tracker"], nil, "tracker.enhanceBlizzard"),
                    showDistance = toggle(2, L["Show distance on tracked quests"], nil, "tracker.showDistance"),
                },
            },
            notify = {
                type = "group", order = 8, name = L["Notifications"], args = {
                    enabled = toggle(1, L["Show notifications"], L["A short message in the middle of the screen."], "notify.enabled"),
                    questComplete = toggle(2, L["Quest complete and turned in"], nil, "notify.questComplete"),
                    nextTarget = toggle(3, L["Next objective"], nil, "notify.nextTarget"),
                    sound = toggle(4, L["Play a sound"], nil, "notify.sound"),
                    test = { type = "execute", order = 10, name = L["Preview"],
                        func = function()
                            if ns.Notify and ns.Notify.Show then
                                ns.Notify.Show(L["PandaQuest is ready."], "info", true)
                            end
                        end },
                },
            },
            sync = {
                type = "group", order = 9, name = L["Synchronisation"], args = {
                    info = { type = "description", order = 0,
                        name = L["Questing data is stored in your SavedVariables and never uploaded on its own."] },
                    enabled = toggle(1, L["Record quest data"], nil, "global.telemetry.enabled"),
                    breadcrumbs = toggle(2, L["Record movement breadcrumbs"],
                        L["Occasional position samples that improve community routes."], "global.telemetry.breadcrumbs"),
                    breadcrumbInterval = range(3, L["Breadcrumb interval (seconds)"], nil,
                        "global.telemetry.breadcrumbInterval", 2, 60, 1),
                    maxSessions = range(4, L["Sessions to keep"], nil, "global.telemetry.maxSessions", 1, 200, 1),
                    maxEventsPerSession = range(5, L["Events per session"], nil,
                        "global.telemetry.maxEventsPerSession", 100, 50000, 100),
                },
            },
            -- docs/08 B3. There is no "scan when the window opens" switch: a scan is the player's
            -- time and the realm's load, so it only ever starts from the button or /pq scan.
            auction = {
                type = "group", order = 10, name = L["Auction house"], args = {
                    info = { type = "description", order = 0,
                        name = L["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] },
                    scanButton = toggle(1, L["Show the scan button on the auction house window"], nil, "auction.scanButton"),
                    showTooltipPrices = toggle(2, L["Show auction prices on item tooltips"],
                        L["The lowest buyout and the market value from your last scan on this realm, with how old it is."],
                        "auction.showTooltipPrices"),
                    recordSales = toggle(3, L["Record my auction sales and purchases"],
                        L["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."],
                        "auction.recordSales"),
                },
            },
            advanced = {
                type = "group", order = 20, name = L["Advanced"], args = {
                    level = { type = "select", order = 1, name = L["Log level"],
                        desc = L["How much PandaQuest prints to chat."],
                        values = { [0] = L["Errors"], [1] = L["Warnings"], [2] = L["Info"],
                                   [3] = L["Debug"], [4] = L["Trace"] },
                        arg = "debug.level", get = get, set = set },
                    arrowDebug = toggle(2, L["Arrow debug output"],
                        L["Prints the bearing values used by the arrow."], "debug.arrowDebug"),
                    resetPins = { type = "execute", order = 10, name = L["Redraw map pins"],
                        func = function() if ns.Pins and ns.Pins.Redraw then ns.Pins.Redraw(true) end end },
                    status = { type = "execute", order = 11, name = L["Print status to chat"],
                        func = function()
                            local PQ = ns.PQ
                            if PQ and PQ.commands and PQ.commands.status then PQ.commands.status("") end
                        end },
                },
            },
        },
    }

    -- Profiles tab (AceDBOptions). Registered last so it always sorts to the end.
    local store = db()
    local AceDBOptions = LibStub and LibStub("AceDBOptions-3.0", true)
    if store and AceDBOptions then
        local profiles = AceDBOptions:GetOptionsTable(store)
        profiles.order = 30
        profiles.name = L["Profiles"]
        tbl.args.profiles = profiles
    end
    return tbl
end

--- Options.GetTable() -> the AceConfig options table (built once, then cached).
function M.GetTable()
    if not options then
        options = buildTable()
    end
    return options
end

--- Options.Rebuild(): drops the cached table (profile switch changes the AceDBOptions part).
function M.Rebuild()
    options = nil
    local AceConfigRegistry = LibStub and LibStub("AceConfigRegistry-3.0", true)
    if AceConfigRegistry and registered then
        pcall(AceConfigRegistry.NotifyChange, AceConfigRegistry, APP_NAME)
    end
end

---------------------------------------------------------------------------
-- Registration and opening
---------------------------------------------------------------------------

function M.Init()
    local AceConfig = LibStub and LibStub("AceConfig-3.0", true)
    if not AceConfig then
        Log.Warn("Options", "AceConfig-3.0 is missing; /pq falls back to chat commands")
        return
    end
    -- The table is passed as a function so it is built after AceDB exists.
    local ok, err = pcall(AceConfig.RegisterOptionsTable, AceConfig, APP_NAME, M.GetTable)
    if not ok then
        Log.Error("Options", "RegisterOptionsTable failed: %s", tostring(err))
        return
    end
    registered = true
end

function M.Enable()
    if not registered or blizFrame then return end
    local AceConfigDialog = LibStub and LibStub("AceConfigDialog-3.0", true)
    -- InterfaceOptions_AddCategory does not exist on 5.5.4; AceConfigDialog uses the Settings API.
    if not AceConfigDialog or not AceConfigDialog.AddToBlizOptions then return end
    local ok, frame, category = pcall(AceConfigDialog.AddToBlizOptions, AceConfigDialog, APP_NAME, "PandaQuest")
    if not ok then
        Log.Warn("Options", "AddToBlizOptions failed: %s", tostring(frame))
        return
    end
    blizFrame, blizCategory = frame, category or (frame and frame.name)
    Log.Debug("Options", "options panel registered (%s)", tostring(blizCategory))
end

--- Options.Open([group]): opened by /pq. Prefers the Blizzard settings panel, falls back to the
-- standalone AceConfigDialog window when the Settings API refuses (it does in some Classic builds).
function M.Open(group)
    local AceConfigDialog = LibStub and LibStub("AceConfigDialog-3.0", true)
    local settings = _G and _G.Settings
    if blizCategory and settings and settings.OpenToCategory then
        local ok = pcall(settings.OpenToCategory, blizCategory)
        if ok then
            M.lastOpen = "settings"
            return true
        end
    end
    if AceConfigDialog and AceConfigDialog.Open then
        local ok = pcall(AceConfigDialog.Open, AceConfigDialog, APP_NAME, nil, group)
        if ok then
            M.lastOpen = "dialog"
            return true
        end
    end
    Log.Print(L["Options are not available; use /pq help for chat commands."])
    return false
end

function M.Close()
    local AceConfigDialog = LibStub and LibStub("AceConfigDialog-3.0", true)
    if AceConfigDialog and AceConfigDialog.Close then pcall(AceConfigDialog.Close, AceConfigDialog, APP_NAME) end
end

function M.GetCategory()
    return blizCategory, blizFrame
end

function M.OnProfileChanged()
    local AceConfigRegistry = LibStub and LibStub("AceConfigRegistry-3.0", true)
    if AceConfigRegistry and registered then
        pcall(AceConfigRegistry.NotifyChange, AceConfigRegistry, APP_NAME)
    end
end

M.APP_NAME = APP_NAME
