-- Locales/enUS.lua: default locale. Keys are the English text; other locales translate every key.
-- Modules append their own keys to this table over time; keep the groups below in sync with fiFI.lua.
local _, ns = ...

local AceLocale = LibStub("AceLocale-3.0")
local L = AceLocale:NewLocale("PandaQuest", "enUS", true, true)
if not L then return end

-- Core / Init
L["PandaQuest %s loaded. Type /pq for options, /pq help for commands."] = true
L["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."] = true
L["%s is not available yet."] = true
L["Unknown command: %s"] = true
L["Available commands:"] = true
L["/pq - open options"] = true
L["/pq arrow - toggle the navigation arrow"] = true
L["/pq target [questID|clear] - pin a quest (or show the current target)"] = true
L["/pq next - skip the current target"] = true
L["/pq units meters|yards - distance units"] = true
L["/pq wh [questID] - Wowhead link"] = true
L["/pq hide <questID> - hide a quest from the navigator"] = true
L["/pq unhide <questID> - show a hidden quest again"] = true
L["/pq reset - reset arrow position and map pins"] = true
L["/pq debug [0-4|arrow] - log level"] = true
L["/pq dump quest|npc|object|item <id> - print database entry"] = true
L["/pq status - addon status"] = true
L["/pq sync - telemetry and community data status"] = true
L["/pq lang auto|enUS|fiFI - interface language"] = true
L["Units: %s"] = true
L["meters"] = true
L["yards"] = true
L["Usage: %s"] = true
L["Log level: %d (%s)"] = true
L["Arrow debug: %s"] = true
L["Language: %s (reload the UI to apply everywhere)"] = true
L["Enabled"] = true
L["Disabled"] = true
L["Quest %d hidden."] = true
L["Quest %d is visible again."] = true
L["Current target: %s"] = true
L["No current target."] = true
L["No target found for quest %d."] = true
L["Not found: %s %d"] = true
L["Version %s"] = true
L["Database: %s"] = true
L["ready"] = true
L["loading"] = true
L["Quests in log: %d"] = true
L["Targets: %d"] = true
L["Background jobs: %d"] = true
L["Telemetry: %s, sessions stored: %d"] = true
L["Community data: %s"] = true
L["none"] = true
L["Arrow position and pins reset."] = true
L["Profile changed: %s"] = true

-- Action texts (docs/06 section 9.3), used by Objectives.DescribeTarget
L["Kill %s (%d/%d)"] = true
L["Talk to %s"] = true
L["Loot %s from %s (%d/%d)"] = true
L["Collect %s from %s (%d/%d)"] = true
L["Use %s (%d/%d)"] = true
L["Use %s on %s"] = true
L["Explore %s"] = true
L["Turn in to %s"] = true
L["Pick up quest from %s"] = true
L["Kill %s"] = true
L["Loot %s from %s"] = true

-- Shared UI strings
L["Click: next target"] = true
L["Next: %s"] = true
L["%s complete - turn in to %s (%s)"] = true
L["Community: avg %s"] = true

-- The locale table is shared by every module: ns.L
ns.L = AceLocale:GetLocale("PandaQuest")
