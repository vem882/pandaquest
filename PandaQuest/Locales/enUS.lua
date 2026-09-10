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

-- Database
L["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] = true
L["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] = true

-- Nav (arrow, router, TomTom)
L["Arrow locked."] = true
L["Arrow unlocked - drag it to move."] = true
L["Close"] = true
L["Custom target"] = true
L["Distance"] = true
L["ETA"] = true
L["Hide this quest"] = true
L["Lock arrow"] = true
L["Next target"] = true
L["Reset arrow position"] = true
L["Right-click: arrow menu"] = true
L["Send to TomTom"] = true
L["Shift-click: send to TomTom"] = true
L["Show distance in metres"] = true
L["Show distance in yards"] = true
L["Show on map"] = true
L["TomTom is not loaded."] = true
L["Unlock arrow"] = true
L["Wowhead link"] = true

-- Map (pins, tooltips)
L["%d spawns here"] = true
L["Left-click: navigate here"] = true
L["Right-click: more options"] = true
L["Set as target"] = true
L["Hide quest: %s"] = true
L["Wowhead: %s"] = true
L["Starts: %s"] = true
L["Turn in: %s"] = true
L["Ends: %s"] = true

-- Map/NodeTooltip (docs/10 B3: the pfQuest-style node block)
L["Level:"] = true
L["Type:"] = true
L["Skill:"] = true
L["Respawn:"] = true
L["Respawn in:"] = true
L["~%s (%d)"] = true
L["Unit"] = true
L["Object"] = true
L["Item"] = true
L["Area"] = true
L["%d Sec"] = true
L["%d Secs"] = true
L["%d Min"] = true
L["%d Mins"] = true
L["%d Hour"] = true
L["%d Hours"] = true

-- UI/Options
L["General"] = true
L["PandaQuest works out of the box. Everything below is optional."] = true
L["Distance units"] = true
L["Metres are shown as '123 m', yards as '135 yd'."] = true
L["Show minimap button"] = true
L["Left-click the minimap button to toggle the arrow, right-click for these options."] = true
L["Language"] = true
L["PandaQuest follows your game language; /pq lang overrides it."] = true
L["Arrow"] = true
L["Show the arrow"] = true
L["Hide it to navigate by map pins only."] = true
L["Lock the arrow in place"] = true
L["When unlocked, drag the arrow to move it."] = true
L["Show quest text"] = true
L["Quest name and the action to take under the arrow."] = true
L["Show travel time"] = true
L["Estimated time to the target at your current speed."] = true
L["Show community timings"] = true
L["Average completion time collected from other players, when available."] = true
L["Hide inside instances"] = true
L["The arrow cannot guide you inside a dungeon or raid."] = true
L["Flash on arrival"] = true
L["A short glow when you reach the target."] = true
L["Appearance"] = true
L["Size"] = true
L["Arrow size relative to the default."] = true
L["Opacity"] = true
L["Text size"] = true
L["Reset position"] = true
L["Moves the arrow back to the middle of the screen."] = true
L["Navigation"] = true
L["Target selection"] = true
L["Auto weighs priority and distance; Focused quest follows one quest."] = true
L["Auto"] = true
L["Focused quest"] = true
L["Nearest"] = true
L["Focused quest ID"] = true
L["Used by 'Focused quest'. Empty follows the quest you track in the log."] = true
L["Route to turn-ins"] = true
L["Completed quests are routed back to their quest giver."] = true
L["Route to new quests"] = true
L["Nearby quests you could pick up are added to the route."] = true
L["New quest radius"] = true
L["How far away a pickup may be to be routed to (yards)."] = true
L["Maximum new quests"] = true
L["How many pickups are routed at once."] = true
L["Arrival radius"] = true
L["How close you must get before a target counts as reached (yards)."] = true
L["TomTom"] = true
L["TomTom waypoints"] = true
L["Mirror sends the current target to TomTom as a waypoint."] = true
L["Off"] = true
L["Mirror current target"] = true
L["Map"] = true
L["Show objective pins"] = true
L["Where to go for the quests in your log."] = true
L["Show turn-in pins"] = true
L["Quest givers waiting for a completed quest."] = true
L["Show available quest pins"] = true
L["Quests you could pick up."] = true
L["Show pins on the minimap"] = true
L["Keep distant pins on the minimap edge"] = true
L["Off hides a pin as soon as it leaves the minimap."] = true
L["Merge nearby spawns"] = true
L["One pin for a pack of mobs instead of a dozen."] = true
L["Pin size"] = true
L["Map pin size"] = true
L["Minimap pin size"] = true
-- Map/Pins, Map/Icons (docs/10 B1-B2: coloured dots, the minimap cap and the edge fade)
L["Objective dot size"] = true
L["Objective spawns are small dots coloured per quest; quest givers keep their icons."] = true
L["Maximum minimap pins"] = true
L["When there are more, the ones nearest to you are kept."] = true
L["Minimap edge fade"] = true
L["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] = true
L["Which quests to show"] = true
L["Show low level quests"] = true
L["Quests that are grey for your level."] = true
L["Show repeatable and daily quests"] = true
L["Show dungeon quests"] = true
L["Show raid quests"] = true
L["Show PvP quests"] = true
L["Show pet battle quests"] = true

-- Nodes/Professions (docs/10 D: gathering nodes on the map)
L["Gathering"] = true
L["Ore, herbs, fishing pools, chests and rare spawns. Pandaria's are collected from play as you travel."] = true
L["Show gathering nodes"] = true
L["Turns the whole layer off, whatever the boxes below say."] = true
L["Which nodes"] = true
L["Mining veins"] = true
L["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] = true
L["Herbs"] = true
L["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] = true
L["Fishing pools"] = true
L["Fishing pools on lakes, rivers and the coast."] = true
L["Chests and treasures"] = true
L["Chests and lockboxes in the world; no gathering skill filters these."] = true
L["Rare spawns"] = true
L["Rare creatures that spawn in a fixed place."] = true
L["Which of them you can gather"] = true
L["Only my professions"] = true
L["A profession you have not learned contributes nothing at all."] = true
L["Show nodes above my skill"] = true
L["Drawn faded. Useful for planning where to level a gathering skill next."] = true
L["Fade nodes and mobs until they respawn"] = true
L["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] = true

L["Tooltips"] = true
L["Add quest info to tooltips"] = true
L["Shows which quests an NPC or item starts, ends or counts towards."] = true
L["Show quest IDs"] = true
L["Useful when reporting missing data."] = true
L["Tracker"] = true
L["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] = true
L["Enhance the Blizzard tracker"] = true
L["Show distance on tracked quests"] = true
L["Notifications"] = true
L["Show notifications"] = true
L["A short message in the middle of the screen."] = true
L["Quest complete and turned in"] = true
L["Next objective"] = true
L["Play a sound"] = true
L["Preview"] = true
L["PandaQuest is ready."] = true
L["Synchronisation"] = true
L["Questing data is stored in your SavedVariables and never uploaded on its own."] = true
L["Record quest data"] = true
L["Record movement breadcrumbs"] = true
L["Occasional position samples that improve community routes."] = true
L["Breadcrumb interval (seconds)"] = true
L["Sessions to keep"] = true
L["Events per session"] = true
L["Advanced"] = true
L["Log level"] = true
L["How much PandaQuest prints to chat."] = true
L["Errors"] = true
L["Warnings"] = true
L["Info"] = true
L["Debug"] = true
L["Trace"] = true
L["Arrow debug output"] = true
L["Prints the bearing values used by the arrow."] = true
L["Redraw map pins"] = true
L["Print status to chat"] = true
L["Profiles"] = true
L["Options are not available; use /pq help for chat commands."] = true

-- UI (minimap button, tracker, notifications, Wowhead)
L["Distance unknown"] = true
L["Left-click: toggle the arrow"] = true
L["Right-click: open options"] = true
L["Press Ctrl+C to copy the link:"] = true
L["Navigate to this quest"] = true
L["the quest giver"] = true
L["unknown distance"] = true
L["%s complete"] = true
L["Turned in: %s"] = true

-- Sync (telemetry, community data)
L["Telemetry: %s"] = true
L["Events recorded this session: %d (%d dropped)"] = true
L["Sessions stored: %d, waiting for upload: %d"] = true
L["Last upload confirmed: %s"] = true
L["never"] = true
L["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] = true
L["No community data yet."] = true
L["Community data from %s"] = true
L["Last gear snapshot: %s"] = true
L["Gear snapshots: off."] = true

-- Sync / Consent (docs/07 B1: telemetry is off until the player says otherwise)
L["/pq consent - ask the data sharing question again"] = true
L["PandaQuest can send what you do while questing to the community hub."] = true
L["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] = true
L["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] = true
L["PandaQuest can share your quest data to build the community routes."] = true
L["It is off. Turn it on in /pq options if you want to take part."] = true
L["Share my quest data"] = true
L["No thanks"] = true
L["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] = true
L["Nothing will be collected. Turn it on any time in /pq options."] = true

-- The locale table is shared by every module: ns.L
ns.L = AceLocale:GetLocale("PandaQuest")
