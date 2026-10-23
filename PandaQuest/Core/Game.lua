-- Core/Game.lua: which game this client is, whether the database this TOC loaded is that game's, and
-- which game the saved variables were written in.
--
-- The first file of the TOC (a package lists the generated Core/Build.lua before it), so ns.Game is
-- there before anything reads the database. It needs nothing but GetBuildInfo at load time; the
-- functions that print run later, when ns.Log and ns.L exist.
--
--   ns.Game.id            "mop", "forever" or "unknown", fixed when this file runs
--   ns.Game.DataGame()    the game ns.Data was built for; a database that does not say is MoP's
--   ns.Game.DataMatches() false turns the database off (Database/DB.lua) with one line in chat
--   ns.Game.ClaimSavedVariables()  tags each saved variable with ns.Game.id, from Core/Init.lua
local _, ns = ...

local Game = {}
ns.Game = Game

local type, tonumber, tostring, pairs, ipairs, next, format = type, tonumber, tostring, pairs, ipairs, next, string.format
local concat, sort = table.concat, table.sort
local _G = _G

Game.MOP, Game.FOREVER, Game.UNKNOWN = "mop", "forever", "unknown"

Game.NAMES = {
    mop = "Mists of Pandaria Classic",
    forever = "WoW Forever",
}

-- Forever is a Mainline-family client: interface 16xxx ("Camelot", 1.60.1 is 16001), and project id 18
-- since build 70170 -- before that it reported Retail's 1, so the interface decides first.
local FOREVER_INTERFACES = { 16000, 16999 }
local FOREVER_PROJECT_ID = 18
-- Mists of Pandaria Classic is 5.5.x, interface 505xx.
local MOP_INTERFACES = { 50500, 50599 }

local function within(value, range)
    return value ~= nil and value >= range[1] and value <= range[2]
end

--- Game.Detect(version, interface, projectID, mistsProjectID) -> "mop" | "forever" | "unknown"
-- From GetBuildInfo's version and interface number and the client's WOW_PROJECT_ID; mistsProjectID is
-- WOW_PROJECT_MISTS_CLASSIC. Any of them may be nil: the project constants do not exist in every
-- client. The interface ranges are asked before the project ids, so a 505xx client is always MoP.
function Game.Detect(version, interface, projectID, mistsProjectID)
    interface = tonumber(interface)
    if within(interface, FOREVER_INTERFACES) then return Game.FOREVER end
    if within(interface, MOP_INTERFACES) then return Game.MOP end
    if type(projectID) == "number" then
        if projectID == FOREVER_PROJECT_ID then return Game.FOREVER end
        if type(mistsProjectID) == "number" and projectID == mistsProjectID then return Game.MOP end
    end
    if type(version) == "string" and version:match("^5%.5%.") then return Game.MOP end
    return Game.UNKNOWN
end

do
    local version, build, interface
    if type(_G.GetBuildInfo) == "function" then
        local _
        version, build, _, interface = _G.GetBuildInfo()
    end
    local project = _G.WOW_PROJECT_ID
    local mists = _G.WOW_PROJECT_MISTS_CLASSIC
    Game.version = version
    Game.build = build
    Game.interface = tonumber(interface)
    Game.project = type(project) == "number" and project or nil
    Game.id = Game.Detect(version, interface, Game.project, type(mists) == "number" and mists or nil)
end

--- Game.Name(key) -> how a person names that game.
function Game.Name(key)
    if key == Game.UNKNOWN then
        return format("a game PandaQuest does not know (interface %s)", tostring(Game.interface or "?"))
    end
    return Game.NAMES[key] or tostring(key)
end

---------------------------------------------------------------------------
-- The database
---------------------------------------------------------------------------

--- Game.DataGame() -> the game ns.Data was built for.
-- Database/Data/Meta.lua says so in ns.Data.game. A database built before that line existed says
-- nothing, and it is MoP's, which was the only game there was.
function Game.DataGame()
    local data = ns.Data
    local key = type(data) == "table" and data.game or nil
    if type(key) == "string" and key ~= "" then return key end
    return Game.MOP
end

--- Game.DataMatches() -> true when the database this TOC loaded is for the game being played.
function Game.DataMatches()
    return Game.id == Game.DataGame()
end

---------------------------------------------------------------------------
-- The saved variables
---------------------------------------------------------------------------

-- Every saved variable PandaQuest.toc declares and the addon still uses. Each one is a table of the
-- game it was written in.
Game.SAVED_VARIABLES = { "PandaQuestDB", "PandaQuestSync", "PandaQuestProf" }
-- Declared in the TOC so WoW keeps a player's copy, and otherwise never touched -- not even tagged:
-- PandaQuestAH held the auction scans of the Auction module, which is gone.
Game.RETIRED_SAVED_VARIABLES = { "PandaQuestAH" }

--- Game.ClaimStore(store, game) -> the foreign key the old contents went under, or nil
-- One saved variable, as WoW handed it over:
--   * `game` is this game: nothing changes;
--   * no `game` key: written before this file existed, by a version that ran in Mists of Pandaria
--     Classic only, so it is MoP's. In MoP (or while it is still empty) it gets `game = <game>` and
--     nothing else changes; in another game it is MoP's data and is set aside as below;
--   * `game` is another game (a WTF folder copied from another install): every key goes, as it is,
--     into store.foreign[<that game>] -- or <that game>-2, -3 ... when that name is taken -- and the
--     store starts again empty, tagged with this game. Nothing is deleted, rebuilt or re-shaped, and
--     an existing `foreign` table stays where it is, so data set aside before is not buried deeper.
-- A value that is not a table is left alone, exactly as the code after this would find it.
function Game.ClaimStore(store, game)
    if type(store) ~= "table" or type(game) ~= "string" or game == Game.UNKNOWN then return nil end
    local tag = store.game
    if tag == game then return nil end
    if tag == nil then
        if game == Game.MOP or next(store) == nil then
            store.game = game
            return nil
        end
        tag = Game.MOP
    end

    local foreign = store.foreign
    if type(foreign) ~= "table" then foreign = nil end
    local moved = {}
    for key, value in pairs(store) do
        if not (key == "foreign" and foreign) then moved[key] = value end
    end
    for key in pairs(moved) do store[key] = nil end

    foreign = foreign or {}
    local base = type(tag) == "string" and tag ~= "" and tag or Game.UNKNOWN
    local key, n = base, 1
    while foreign[key] ~= nil do
        n = n + 1
        key = base .. "-" .. n
    end
    foreign[key] = moved
    store.foreign = foreign
    store.game = game
    return key
end

--- Game.ClaimSavedVariables(names) -> { {name = "PandaQuestSync", from = "forever", key = "forever"}, ... }
-- Called by Core/Init.lua when ADDON_LOADED hands the saved variables over, before AceDB or any module
-- reads one. A missing variable is created empty, as Core/Init.lua and AceDB would create it a moment
-- later, so that it is tagged from its first save. In a game this file does not know, nothing is
-- tagged or moved: the next load in a known game would otherwise take everything for foreign.
function Game.ClaimSavedVariables(names)
    local moved = {}
    if Game.id == Game.UNKNOWN then return moved end
    for _, name in ipairs(names or Game.SAVED_VARIABLES) do
        local store = _G[name]
        if store == nil then
            store = {}
            _G[name] = store
        end
        local tag = type(store) == "table" and store.game or nil
        local key = Game.ClaimStore(store, Game.id)
        if key then moved[#moved + 1] = { name = name, from = tag or Game.MOP, key = key } end
    end
    if #moved > 0 then
        local games, stores, seen = {}, {}, {}
        for _, entry in ipairs(moved) do
            local from = Game.Name(entry.from)
            if not seen[from] then
                seen[from] = true
                games[#games + 1] = from
            end
            stores[#stores + 1] = entry.name
        end
        sort(games)
        local L, Log = ns.L, ns.Log
        local text = L and L["Saved data from %s was set aside, not deleted (%s); this game starts its own."]
            or "Saved data from %s was set aside, not deleted (%s); this game starts its own."
        if Log and Log.Print then
            Log.Print(text, concat(games, ", "), concat(stores, ", "))
        end
    end
    return moved
end
