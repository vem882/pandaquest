# Changelog

All notable changes to PandaQuest are documented here.

Older data syncs: see each version's GitHub release notes and https://pd.zroot.it/changelog

## [0.2.237] - 2026-10-23

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 8,579 quests, 55 NPCs, 4 objects
- quest 2754 - Horns of Frenzy - updated
  - description added
  - reward items: +1
- quest 8790 - Imperial Qiraji Regalia - updated
  - description added
  - reward choices: +3
- quest 9670 - They're Alive! Maybe... - updated
  - description added
  - reward items: +1
- quest 9760 - Vindicator's Rest - updated
  - description added
- quest 10330 - Shutting Down Manaforge Coruu - updated
  - description added
- quest 10348 - New Opportunities - updated
  - description added
- quest 12063 - Strength of Icemist - updated
  - description added
- quest 12245 - No Mercy for the Captured - updated
  - description added
- quest 12298 - High Commander Halford Wyrmbane - updated
  - description added
- quest 12411 - A Sister's Pledge - updated
  - description added
- quest 12413 - Attack on Silverbrook - updated
  - description added
  - reward choices: +5
- quest 12647 - An End to the Suffering - updated
  - description added
  - reward choices: +4
- quest 12758 - A Hero's Headgear - updated
  - description added
- quest 12937 - Relief for the Fallen - updated
  - description added
- quest 13088 - Northern Cooking - updated
  - description added
- quest 13793 - Among the Champions - updated
  - description added
  - reward choices: +2
- quest 14435 - The Blackmaw Doublecross - updated
  - description added
  - reward choices: +3
- quest 26044 - Where Are the Parts? - updated
  - description added
- quest 26405 - Zul'Mamwe Mambo - updated
  - description added
  - reward choices: +3
- quest 27191 - Hungry as an Ogre! - updated
  - description added
  - reward choices: +2
- quest 32143 - A Kind of Magic - updated
  - description added
  - reward money added (11g 40s)
- quest 32144 - Under Pressure - updated
  - description added
  - reward money added (11g 40s)
- quest 32145 - Don't Lose Your Head - updated
  - description added
  - reward money added (11g 40s)
- quest 32146 - Hammer to Fall - updated
  - description added
  - reward money added (11g 40s)
- quest 32148 - Attack! Move! - updated
  - description added
  - reward money added (11g 40s)
- quest 32149 - Resource Gathering - updated
  - description added
  - reward money added (11g 40s)
- quest 32150 - Supply Block - updated
  - description added
  - reward money added (11g 40s)
- quest 32151 - Tower Defense - updated
  - description added
  - reward money added (11g 40s)
- quest 32152 - Siege Damage - updated
  - description added
  - reward money added (11g 40s)
- quest 32153 - Hero Killer - updated
  - description added
  - reward money added (11g 40s)
- quest 32154 - Burn Out! - updated
  - description added
  - reward money added (11g 40s)
- quest 32156 - It's Only Right - updated
  - description added
  - reward money added (11g 40s)
- quest 32157 - The Only Good Goblin... - updated
  - description added
  - reward money added (11g 40s)
- quest 32158 - Two Step Program - updated
  - description added
  - reward money added (11g 40s)
- quest 32161 - Beastmaster's Hunt: The Crane - updated
  - description added
  - reward money added (11g 40s)
- quest 32162 - Beastmaster's Hunt: The Tiger - updated
  - description added
  - reward money added (11g 40s)
- quest 32163 - Beastmaster's Hunt: The Crab - updated
  - description added
  - reward money added (11g 40s)
- quest 32164 - Beastmaster's Hunt: The Crane - updated
  - description added
  - reward money added (11g 40s)
- quest 32165 - Beastmaster's Hunt: The Tiger - updated
  - description added
  - reward money added (11g 40s)
- quest 32166 - Beastmaster's Hunt: The Crab - updated
  - description added
  - reward money added (11g 40s)
- quest 32167 - Ancient's Fall - updated
  - description added
  - reward money added (11g 40s)
- quest 32168 - End of an Elder - updated
  - description added
  - reward money added (11g 40s)
- quest 32169 - A Colossal Victory - updated
  - description added
  - reward money added (11g 40s)
- quest 32170 - Ancient's Fall - updated
  - description added
  - reward money added (11g 40s)
- quest 32171 - End of an Elder - updated
  - description added
  - reward money added (11g 40s)
- quest 32172 - A Colossal Victory - updated
  - description added
  - reward money added (11g 40s)
- quest 32181 - Beastmaster's Quarry: The Crane - updated
  - description added
  - reward money added (1g 14s)
- quest 32182 - Beastmaster's Quarry: The Tiger - updated
  - description added
  - reward money added (1g 14s)
- quest 32183 - Beastmaster's Quarry: The Crab - updated
  - description added
  - reward money added (1g 14s)
- quest 32184 - Beastmaster's Quarry: The Crane - updated
  - description added
  - reward money added (1g 14s)
- quest 32371 - Memory Wine - updated
  - description added
  - reward money added (11g 40s)
- quest 32377 - A Kor'kron In Our Midst - updated
  - description added
  - reward money added (11g 40s)
- quest 33341 - Wayshrines Of The Celestials - updated
  - description added
  - reward money added (11g 40s)
- quest 64142 - A Demonstration of Loyalty - updated
  - description added
  - XP added (11,900)
- npc 4358 - Mirefin Puddlejumper - updated
  - coordinates: 14 spawn points added in Dustwallow Marsh
- npc 17681 - Expedition Researcher - updated
  - coordinates: 40 spawn points added in Bloodmyst Isle
- npc 39273 - "Doc" Cogspin - updated
  - coordinates: 16 spawn points added in Dun Morogh
- npc 67438 - Krasari Elder - updated
  - coordinates: 4 spawn points added in Krasarang Wilds

## [0.2.236] - 2026-10-23

The flight bar knows how long the flight takes, and quest mobs are marked on their nameplates.

### Added
- **Flight time before the first flight.** The bar shows "1 min 30 s left" and fills from takeoff on
  routes you have never flown. The expected time is, in order: your own median (two flights or more);
  the median all players measured, from the PandaQuest portal (the whole multi-hop flight when the
  portal has it, else the sum of its legs); the portal's estimate from the path's length; one flight
  of your own; the straight line between the flight masters. Everything but the first two reads
  "~... left (estimated)". Hover the bar for the arrival time on the clock.
  - The flight master's tooltip shows the same expected time for every destination before you click.
  - Your own flights are still timed and uploaded as before.
  - New data file `Database/Overrides/Flights.lua`, written by the portal's data sync.
- **Quest mobs.** NPCs that your active, unfinished quests need you to kill -- kill objectives,
  kill-credit groups and the NPCs that drop a quest item -- get a small quest mark on their nameplate
  and a "Quest: <title> (3/8)" line on their tooltip. The mark goes as soon as the objective is done.
  - Options > Navigation > **Quest mobs**: the icon (the quest "!", crossed swords or PandaQuest's
    kill pin), its size, an optional gold tint on the health bar (off by default) and the tooltip line.
    Options > Modules switches the whole thing off.
  - Works with Blizzard's nameplates and leaves Plater, KUI and others alone: the mark is a frame of
    its own on top of the plate. Enemy nameplates must be shown (V).

## [0.2.235] - 2026-10-23

One PandaQuest window, in the layout the owner asked for: tabs along the top, a category list with
icons, the settings as rows.

### Added
- **The PandaQuest window** (`/pq`, the minimap button): a dark window with a gold edge, the round
  PandaQuest logo over its top left corner, and five tabs -- **Quests** (the quest browser, the
  default), **Status** (synchronisation, the last upload the portal confirmed, the database and its
  counts), **Options**, **About & Help** (what the addon does, the portal's address, credits and
  licences, and the chat commands folded away) and **Performance** (the addon's memory, every module
  on or off and how many events, messages, timers and buckets it holds; nothing needs script
  profiling).
- **Options as categories**: Navigation, Map & Minimap, Tooltips, Flight, Professions & Gathering,
  Auction, Notifications, Sync & Privacy, Appearance, Language & Units, Modules, Profiles, Release notes
  and Advanced, each with an icon. A category with several groups has sub-tabs. Every setting is a row:
  its name in white, a line in grey under it, and its control on the right -- a check box, a slider
  with its range and a number box, a list, a button or a text box.
- **Search all settings**, a box above the categories: every setting whose name or description has
  the words in it, under the category it belongs to.
- **Reset Settings** per category, after a yes: only that category's settings go back to their
  defaults.
- Appearance > **Window**: the window's size on top of the game's UI scale, and putting it back.
- Options > **Release notes**: the feature releases, quoted from this changelog.

### Changed
- The window can be moved and resized (from the corner, down to the quest browser's size), and
  remembers its place, size and scale per profile (`profile.window`, a new key). It never grows past
  the screen at any UI scale. Escape closes it.
- The Settings button and `/pq options` open the window's Options tab. The same options are still in
  the game's own Settings panel and in `/pq config`: all three read the one options table.
- The window and each page are built the first time they are opened, only the rows on screen exist,
  and nothing runs while the window is hidden.

## [0.2.234] - 2026-10-23

Fewer commands to remember: `/pq` opens PandaQuest, and everything else is in its Settings.

### Changed
- **`/pq` (and `/pandaquest`) opens the quest browser**, every quest in the database, instead of the
  options. A **Settings** button with a gear in its header opens all the settings in their own window.
  `/pq options` still opens them directly.
- **A quest's page** has four buttons: *Navigate* (the arrow and the pins follow it), *Hide from the
  navigator* / *Show in the navigator*, *Show on map* (the world map, where the quest starts) and
  *PandaQuest link*. Right-clicking a quest in the list offers the same four.
- `/pq help` prints one line: "/pq opens PandaQuest; everything else is in its Settings." Every old
  command still works, for macros; `/pq help all` and Settings > Advanced list them.

### Added
- Settings > **Status**: what `/pq status` and `/pq sync` print, on a page.
- Settings > **Hidden quests**: every quest hidden from the navigator, and buttons to show one or all of
  them again.
- Settings > **Moving frames**: *Unlock frames to move them* (the arrow, the flight bar and the dig site
  bar, with the two bars shown for a moment) and *Reset positions*.
- Settings > **Synchronisation and privacy** says what is recorded and what never is, and has the data
  sharing question as a button.
- Settings > **Advanced**: print a database entry (quest, NPC, object or item), and the list of every
  chat command.

## [0.2.233] - 2026-10-23

PandaQuest uses its Ace3 libraries fully. In the game it looks and plays as before, with one new
options section.

### Added
- **Options > Modules.** Fifteen parts of PandaQuest can be switched off completely: the arrow, map
  and minimap pins, quest info in tooltips, respawn timers, gathering nodes, the quest tracker
  additions, notifications, the dig site bar, the auction house scan, auction sales from the mailbox,
  auction prices in tooltips, the recipe reader, the archaeology reader, quest data recording and gear
  recording. A part that is off stops listening to the game, its timers stop and it shows nothing.
  The switch is stored in the profile (`profile.modules.<Name>`, on by default) and follows a profile
  switch, copy or reset. What the rest is built on (quest log, targets, database, options) always runs.
- **`/pq config [section] [option] [value]`** changes any setting from chat: AceConfigCmd-3.0 on the
  same options table the panel draws. `/pq config` lists the sections; a section that is not also a
  command works without the word, e.g. `/pq map showOnMinimap off`. Every other command is unchanged.

### Changed
- Every subsystem is an AceAddon-3.0 module of one addon object, created in the lifecycle order and
  enabled one by one in that order at login, before the database starts loading -- the same order as
  before. `ns.<Name>` is still the module, so nothing that reads it changed.
- Each module is its own AceEvent/AceTimer/AceBucket target, so switching it off drops all of its
  events, messages, timers and buckets at once.
- Timers that were frames counting every frame are AceTimers that fire only when due: the minimap pin
  re-ranking (4 per second, only while needed), the node tooltip respawn countdown, the auction scan
  poll and the telemetry breadcrumb sampler. The pin redraw, the notification hold and the mailbox read
  were `C_Timer` calls; they are AceTimers on their module now. The combat log is an AceEvent
  registration, made only while quest data is recorded.
- Bursty events go through AceBucket: `MAIL_INBOX_UPDATE` (one read per burst) and
  `TRADE_SKILL_UPDATE` / `TRADE_SKILL_LIST_UPDATE` (one look at the window per burst), beside the
  `QUEST_LOG_UPDATE` bucket that was there.
- `Telemetry.IsEnabled`, `CharacterSheet.IsEnabled` and `Professions.IsEnabled` are renamed
  `IsRecording`, `IsRecording` and `IsLayerEnabled`: `IsEnabled` is AceAddon's own on every module.

### Fixed
- Choosing a language now puts every text back to English before it applies the new one, so a text that
  language does not translate reads in English -- not in the game's language or the language chosen
  before it (`/pq lang enUS` on a German client gave German until a reload).

### Saved data
- Nothing in `PandaQuestDB`, `PandaQuestSync`, `PandaQuestAH` or `PandaQuestProf` is moved, renamed
  or dropped. The only new keys are the module switches, and AceDB writes them only when one is off.

## [0.2.232] - 2026-10-23

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 8,534 quests, 51 NPCs, 4 objects
- quest 8633 - Enigma Robes - updated
  - description added
  - reward items: +1
- quest 10667 - Underworld Loam - updated
  - description added
- quest 10775 - Tabards of the Illidari - updated
  - description added
- quest 11213 - Check Up on Tabetha - updated
  - description added
- quest 12761 - Mastery of the Crystals - updated
  - description added
- quest 13598 - Unsavory Remedies - updated
  - description added
- quest 14237 - Forward Movement - updated
  - description added
- quest 14275 - Someone's Keeping Track of You - updated
  - description added
- quest 14303 - Back to Aggra - updated
  - description added
- quest 24480 - The Halls Of Reflection - updated
  - description added
- quest 24502 - Necessary Roughness - updated
  - description added
- quest 27697 - Corruption in Maraudon - updated
  - description added
- quest 28460 - Threat of the Winterfall - updated
  - description added
  - reward choices: +4
- quest 31870 - Cassandra Kaboom - updated
  - description added
  - reward items: +1
- quest 31959 - The Empress' Gambit - updated
  - description added
  - reward money added (11g 40s)
- quest 31966 - Battle Pet Tamers: Cataclysm - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31967 - Battle Pet Tamers: Cataclysm - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31970 - Grand Master Obalis - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31971 - Grand Master Obalis - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31972 - Brok - updated
  - description added
  - reward money added (10g 60s)
- quest 31973 - Bordin Steadyfist - updated
  - description added
  - reward money added (9g)
- quest 31974 - Goz Banefury - updated
  - description added
  - reward money added (65s)
- quest 31975 - The Returning Champion - updated
  - description added
  - reward money added (7g 80s)
- quest 31976 - The Returning Champion - updated
  - description added
  - reward money added (35s)
- quest 31977 - The Returning Champion - updated
  - description added
  - reward money added (11g 40s)
- quest 31978 - Priorities! - updated
  - description added
  - reward money added (9g 80s)
- quest 31980 - The Returning Champion - updated
  - description added
  - reward money added (7g 80s)
- quest 31981 - Exceeding Expectations - updated
  - description added
  - reward money added (90s)
- quest 31982 - Exceeding Expectations - updated
  - description added
  - reward money added (11g 40s)
- quest 31983 - A Brief Reprieve - updated
  - description added
  - reward money added (11g 40s)
- quest 31984 - A Brief Reprieve - updated
  - description added
  - reward money added (11g)
- quest 31985 - The Triumphant Return - updated
  - description added
  - reward money added (9g)
- quest 31986 - The Triumphant Return - updated
  - description added
  - reward money added (11g 40s)
- quest 31987 - Theramore - updated
  - reward money added (9g 40s)
  - reward items: +1
- quest 31988 - Daily Selected Scenario - updated
  - reward money added (11g 40s)
- quest 31991 - Grand Master Zusshi - updated
  - description added
  - reward money added (90s)
  - reward items: +1
- quest 31998 - A Worthy Challenge: Sha of Doubt - updated
  - description added
  - reward money added (45g 60s)
- quest 31999 - Nazgrim's Command - updated
  - description added
  - reward money added (98s)
  - reward choices: +9
- quest 32001 - A Worthy Challenge: Sha of Hatred - updated
  - description added
  - reward money added (45g 60s)
- quest 32002 - A Worthy Challenge: Xin the Weaponmaster - updated
  - description added
  - reward money added (45g 60s)
- quest 32003 - A Worthy Challenge: Raigonn - updated
  - description added
  - reward money added (45g 60s)
- quest 32004 - A Worthy Challenge: Wing Leader Ner'onok - updated
  - description added
  - reward money added (45g 60s)
- quest 32005 - A Worthy Challenge: Durand - updated
  - description added
  - reward money added (45g 60s)
- quest 32006 - A Worthy Challenge: Flameweaver Koegler - updated
  - description added
  - reward money added (45g 60s)
- quest 32007 - A Worthy Challenge: Darkmaster Gandling - updated
  - description added
  - reward money added (34g 20s)
- quest 32008 - Audrey Burnhep - updated
  - description added
  - reward money added (10g 60s)
- quest 32018 - His Name Was... Stormstout - updated
  - description added
  - reward money added (1g 2s)
- quest 32019 - They Call Him... Stormstout - updated
  - description added
  - reward money added (1g 2s)
- quest 32030 - Once in a Hundred Lifetimes - updated
  - description added
  - reward money added (1g 14s)
- quest 32035 - Got Silk? - updated
  - description added
  - reward money added (1g 2s)
- quest 32038 - Stag Mastery - updated
  - description added
  - reward money added (10g 20s)
- quest 32045 - Children of the Water - updated
  - description added
  - reward money added (10g 20s)
- quest 32097 - Short-Supply Reward - updated
  - reward items: +1
- quest 32106 - A Winter Veil Gift - updated
  - reward items: +1
- quest 32107 - Flying Tiger Gourami - updated
  - description added
  - reward money added (11g 40s)
- quest 32108 - Domination Point - updated
  - description added
  - reward money added (5g 70s)
- quest 32109 - Lion's Landing - updated
  - description added
  - reward money added (5g 70s)
- quest 32115 - Shackles of the Past - updated
  - description added
  - reward money added (11g 40s)
- quest 32116 - Priorities, People! - updated
  - description added
  - reward money added (1g 14s)
- quest 32118 - Taking Advantage - updated
  - description added
  - reward money added (1g 14s)
- quest 32119 - It Is A Mystery - updated
  - description added
  - reward money added (11g 40s)
- quest 32120 - Legacy of Ogudei - updated
  - description added
  - reward money added (11g 40s)
- quest 32121 - The Spirit Trap - updated
  - description added
  - reward money added (11g 40s)
- quest 32122 - Ogudei's Lieutenants - updated
  - description added
  - reward money added (11g 40s)
- quest 32123 - Death on Two Legs - updated
  - description added
  - reward money added (11g 40s)
- quest 32126 - Tear It Up - updated
  - description added
  - reward money added (11g 40s)
- quest 32127 - All Dead, All Dead - updated
  - description added
  - reward money added (11g 40s)
- quest 32128 - Another One Bites the Dust - updated
  - description added
  - reward money added (11g 40s)
- quest 32130 - Good Luck, Have Fun - updated
  - description added
  - reward money added (11g 40s)
- quest 32131 - We Require More Minerals! - updated
  - description added
  - reward money added (11g 40s)
- quest 32132 - Worker Harassment - updated
  - description added
  - reward money added (11g 40s)
- quest 32133 - Sentry Wards - updated
  - description added
  - reward money added (11g 40s)
- quest 32134 - Hard Counter - updated
  - description added
  - reward money added (11g 40s)
- quest 32135 - Hero Killer - updated
  - description added
  - reward money added (11g 40s)
- quest 32136 - Work Order: Fuel - updated
  - description added
  - reward money added (1g 14s)
- quest 32137 - Runnin' On Empty - updated
  - description added
  - reward money added (11g 40s)
- quest 32138 - Work Order: Lumber - updated
  - description added
  - reward money added (1g 14s)
- quest 32139 - Stacked! - updated
  - description added
  - reward money added (11g 40s)
- quest 32140 - Work Order: Iron - updated
  - description added
  - reward money added (1g 14s)
- quest 32141 - Power Metal - updated
  - description added
  - reward money added (11g 40s)
- quest 32142 - We Will Rock You - updated
  - description added
  - reward money added (11g 40s)
- quest 91703 - A Celestial Challenge: Flameweaver Koegler - updated
  - description added
  - reward money added (45g 60s)
  - XP added (471,000)

## [0.2.231] - 2026-10-23

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 8,461 quests, 51 NPCs, 4 objects
- quest 11 - Riverpaw Gnoll Bounty - updated
  - description added
  - reward choices: +3
- quest 9035 - Roadside Ambush - updated
  - description added
- quest 9541 - Totem of Yor - updated
  - description added
- quest 9748 - Don't Drink the Water - updated
  - description added
- quest 10321 - Shutting Down Manaforge Coruu - updated
  - description added
- quest 10322 - Shutting Down Manaforge Duro - updated
  - description added
- quest 10328 - Sunfury Briefings - updated
  - description added
- quest 10365 - Shutting Down Manaforge Ara - updated
  - description added
  - reward choices: +2
- quest 11015 - Netherwing Crystals - updated
  - description added
- quest 12786 - Thunder Bluff - updated
  - quest giver added: Grand Apothecary Putress
  - description added
- quest 13570 - Remembrance of Auberdine - updated
  - reward items: +1
  - reward choices: +3
- quest 14240 - To the Cliffs - updated
  - description added
- quest 14470 - Military Breakthrough - updated
  - description added
- quest 24456 - Thunderhorn Cleansing - updated
  - description added
- quest 24457 - Rite of Vision - updated
  - description added
- quest 26663 - Sinking From Within - updated
  - description added
- quest 26703 - Bloodsail's End - updated
  - description added
  - reward items: +1
  - reward choices: +3
- quest 27326 - The Drums of War - updated
  - description added
- quest 27348 - Secure the Cargo! - updated
  - description added
- quest 28479 - The Ruins of Kel'Theril - updated
  - description added
- quest 31817 - Merda Stronghoof - updated
  - description added
  - reward items: +1
- quest 31828 - Level Up! - updated
  - description added
  - reward money added (90s)
- quest 31830 - Level Up! - updated
  - description added
  - reward money added (11g 40s)
- quest 31831 - Level Up! - updated
  - description added
  - reward money added (7s)
- quest 31832 - Level Up! - updated
  - description added
  - reward money added (10g 60s)
- quest 31833 - Continue Your Training: Master Woo - updated
  - description added
  - reward choices: +3
- quest 31834 - Begin Your Training: Master Cheng - updated
  - description added
  - reward choices: +2
- quest 31835 - Continue Your Training: Master Kistane - updated
  - description added
  - reward choices: +2
- quest 31839 - Continue Your Training: Master Hsu - updated
  - description added
  - reward choices: +3
- quest 31847 - Better Dead than Dread - updated
  - description added
  - reward money added (1g 14s)
- quest 31850 - Eric Davidson - updated
  - description added
  - reward money added (90s)
- quest 31851 - Bill Buckler - updated
  - description added
  - reward money added (90s)
- quest 31852 - Steven Lisbane - updated
  - description added
  - reward money added (90s)
- quest 31853 - All Aboard! - updated
  - description added
  - reward money added (98s)
- quest 31858 - The Peak of Serenity - Continue Your Training - updated
  - description added
- quest 31859 - The Peak of Serenity - Continue Your Training - updated
  - description added
- quest 31860 - The Peak of Serenity - Continue Your Training - updated
  - description added
- quest 31861 - The Peak of Serenity - Continue Your Training - updated
  - description added
- quest 31862 - Zonya the Sadist - updated
  - description added
  - reward money added (11g 40s)
- quest 31872 - Merda Stronghoof - updated
  - description added
  - reward money added (11g 40s)
- quest 31876 - The Inkmasters of the Arboretum - updated
  - description added
  - reward money added (1g 14s)
- quest 31877 - The Inkmasters of the Arboretum - updated
  - description added
  - reward money added (1g 14s)
- quest 31886 - Dread Space - updated
  - description added
  - reward money added (1g 14s)
- quest 31889 - Battle Pet Tamers: Kalimdor - updated
  - description added
  - reward money added (11g 40s)
  - XP added (80)
  - reward items: +1
- quest 31891 - Battle Pet Tamers: Kalimdor - updated
  - description added
  - reward money added (11g 40s)
  - XP added (80)
  - reward items: +1
- quest 31894 - A Delicate Balance - updated
  - description added
  - reward money added (1g 10s)
- quest 31895 - Better Off Dread - updated
  - description added
  - reward money added (1g 14s)
- quest 31897 - Grand Master Trixxy - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31902 - Battle Pet Tamers: Eastern Kingdoms - updated
  - description added
  - reward money added (11g 40s)
  - XP added (80)
  - reward items: +1
- quest 31903 - Battle Pet Tamers: Eastern Kingdoms - updated
  - description added
  - reward money added (11g 40s)
  - XP added (80)
  - reward items: +1
- quest 31905 - Grazzle the Great - updated
  - description added
  - reward money added (11g 40s)
- quest 31906 - Kela Grimtotem - updated
  - description added
  - reward money added (11g 40s)
- quest 31907 - Zoltan - updated
  - description added
  - reward money added (11g 40s)
- quest 31909 - Grand Master Trixxy - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31910 - David Kosse - updated
  - description added
  - reward money added (90s)
- quest 31911 - Deiza Plaguehorn - updated
  - description added
  - reward money added (90s)
- quest 31912 - Kortas Darkhammer - updated
  - description added
  - reward money added (11g 40s)
- quest 31913 - Everessa - updated
  - description added
  - reward money added (11g 40s)
- quest 31914 - Durin Darkhammer - updated
  - description added
  - reward money added (90s)
- quest 31915 - Grand Master Lydia Accoste - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31916 - Grand Master Lydia Accoste - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31917 - A Tamer's Homecoming - updated
  - description added
  - reward money added (11g 40s)
- quest 31918 - A Tamer's Homecoming - updated
  - description added
  - reward money added (11g 40s)
- quest 31919 - Battle Pet Tamers: Outland - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31920 - Grand Master Antari - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31921 - Battle Pet Tamers: Outland - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31922 - Nicki Tinytech - updated
  - description added
  - reward money added (2g 90s)
- quest 31923 - Ras'an - updated
  - description added
  - reward money added (90s)
- quest 31924 - Narrok - updated
  - description added
  - reward money added (2g 90s)
- quest 31925 - Morulu The Elder - updated
  - description added
  - reward money added (11g 40s)
- quest 31926 - Grand Master Antari - updated
  - description added
  - reward money added (9g 40s)
  - reward items: +1
- quest 31927 - Battle Pet Tamers: Northrend - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31928 - Grand Master Payne - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31929 - Battle Pet Tamers: Northrend - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31930 - Battle Pet Tamers: Pandaria - updated
  - description added
  - reward money added (11g 40s)
  - XP added (80)
  - reward items: +1
- quest 31931 - Beegle Blastfuse - updated
  - description added
  - reward money added (90s)
- quest 31932 - Nearly Headless Jacob - updated
  - description added
  - reward money added (90s)
- quest 31933 - Okrut Dragonwaste - updated
  - description added
  - reward money added (90s)
- quest 31934 - Gutretch - updated
  - description added
  - reward money added (90s)
- quest 31935 - Grand Master Payne - updated
  - description added
  - reward money added (90s)
  - reward items: +1
- quest 31936 - The "Jinyu Princess" Irrigation System - updated
  - description added
  - reward money added (11g 40s)
- quest 31937 - "Thunder King" Pest Repellers - updated
  - description added
  - reward money added (11g 40s)
- quest 31938 - The "Earth-Slasher" Master Plow - updated
  - description added
  - reward money added (11g 40s)
- quest 31941 - Squash Those Foul Odors - updated
  - description added
  - reward money added (5g 70s)
- quest 31942 - It's Melon Time - updated
  - description added
  - reward money added (5g 70s)
- quest 31943 - Which Berries? Witchberries. - updated
  - description added
  - reward money added (5g 70s)
- quest 31944 - Complete Your Training: The Final Test - updated
  - description added
  - reward choices: +3
- quest 31945 - Learn and Grow VI: Gina's Vote - updated
  - description added
  - reward money added (10g 20s)
- quest 31946 - Mung-Mung's Vote III: The Great Carrot Caper - updated
  - description added
  - reward money added (11g 40s)
- quest 31947 - Farmer Fung's Vote III: Crazy For Cabbage - updated
  - description added
  - reward money added (11g 40s)
- quest 31948 - Nana's Vote II: The Sacred Springs - updated
  - description added
  - reward money added (11g 40s)
- quest 31949 - Nana's Vote III: Witchberry Julep - updated
  - description added
  - reward money added (11g 40s)
- quest 31951 - Grand Master Aki - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31952 - Battle Pet Tamers: Pandaria - updated
  - description added
  - reward money added (11g 40s)
  - XP added (80)
  - reward items: +1
- quest 31953 - Grand Master Hyuna - updated
  - description added
  - reward money added (10g 60s)
  - reward items: +1
- quest 31954 - Grand Master Mo'ruk - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31955 - Grand Master Nishi - updated
  - description added
  - reward money added (9g 40s)
  - reward items: +1
- quest 31956 - Grand Master Yon - updated
  - description added
  - reward money added (90s)
  - reward items: +1
- quest 31957 - Grand Master Shu - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31958 - Grand Master Aki - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 32565 - Encroaching Force - updated
  - description added
  - reward money added (22g 80s)
  - reward items: +1
- quest 33375 - Refining The Vision - updated
  - description added

## [0.2.230] - 2026-10-23

Fixes to a quest's page in the quest browser, from the owner's screenshot of "Magic" Mushrooms (29362).

### Fixed
- **The map showed for a moment and then disappeared**, leaving its brown ground and the pins. The zone
  art's tiles and the brown ground were textures in the same draw layer and sub-level, which the client
  draws in no fixed order and re-sorts when the page changes (the crossfade, a pin popping in). The
  ground is now at sub-level -8 and the tiles at 1, so the art is always on top.
- **Level "-1"**: a quest whose level follows the player's (Questie's -1) reads *Scales* in the list
  and on the page, its colour and difficulty are taken at the player's level, and the line under the
  title says it scales with your level.
- **Rewards "+5 81"**: the reputation is written with the faction's name, "+5 The Tillers" (the
  faction id when the client does not know it), and money is shown in gold, silver and copper coins.
- **Wowhead link** is now **PandaQuest link**: the copy box holds the quest's page on the PandaQuest
  portal, https://pd.zroot.it/quests/<id>. Every other link the addon hands out (the arrow's and the
  map pins' menus, `/pq wh`) goes to the portal too.

## [0.2.229] - 2026-10-23

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 8,371 quests, 51 NPCs, 4 objects
- quest 8486 - Arcane Instability - updated
  - description added
  - reward choices: +2
- quest 8561 - Conqueror's Crown - updated
  - description added
  - reward items: +1
- quest 9911 - The Count of the Marshes - updated
  - description added
- quest 10457 - Protecting Our Own - updated
  - description added
  - reward choices: +4
- quest 10504 - The Bladespire Ogres - updated
  - description added
  - reward choices: +4
- quest 10922 - Digging Through Bones - updated
  - description added
- quest 11793 - Further Investigation - updated
  - description added
- quest 13563 - A Love Eternal - updated
  - description added
  - reward choices: +2
- quest 13898 - The Tides Turn Against Us - updated
  - description added
- quest 14075 - Trouble in the Mines - updated
  - description added
- quest 27152 - Unusual Behavior... Even For Gnolls - updated
  - description added
- quest 28837 - Altered Beasts - updated
  - description added
- quest 31735 - The Right Tool For The Job - updated
  - description added
  - reward money added (9g 80s)
  - reward choices: +9
- quest 31736 - Envoy of the Alliance - updated
  - description added
  - reward money added (9g 80s)
- quest 31737 - The Cost of War - updated
  - description added
  - reward money added (9g 80s)
- quest 31738 - Pillaging Peons - updated
  - description added
  - reward money added (9g 80s)
- quest 31739 - Priorities! - updated
  - description added
  - reward money added (9g 80s)
- quest 31740 - Koukou's Rampage - updated
  - description added
  - reward money added (9g 80s)
- quest 31741 - Twinspire Keep - updated
  - description added
  - reward money added (9g 80s)
- quest 31742 - Fractured Forces - updated
  - description added
  - reward money added (9g 80s)
- quest 31743 - Smoke Before Fire - updated
  - description added
  - reward money added (9g 80s)
- quest 31744 - Unfair Trade - updated
  - description added
  - reward money added (9g 80s)
- quest 31745 - Onward and Inward - updated
  - description added
  - reward money added (9g 80s)
- quest 31752 - Blingtron 4000 - updated
  - reward items: +1
- quest 31754 - Cannonfire - updated
  - description added
  - reward money added (11g 40s)
- quest 31755 - Acts of Cruelty - updated
  - description added
  - reward money added (11g 40s)
- quest 31757 - Unleashed Spirits - updated
  - description added
  - reward money added (11g 40s)
- quest 31758 - Laosy Scouting - updated
  - description added
  - reward money added (11g 40s)
- quest 31760 - Striking First - updated
  - description added
  - reward money added (11g 40s)
- quest 31762 - Crumbling Behemoth - updated
  - description added
  - reward money added (11g 40s)
- quest 31765 - Paint it Red! - updated
  - description added
  - reward money added (9g 80s)
  - reward choices: +9
- quest 31766 - Touching Ground - updated
  - description added
  - reward money added (9g 80s)
- quest 31767 - Finish Them! - updated
  - description added
  - reward money added (9g 80s)
- quest 31768 - Fire Is Always the Answer - updated
  - description added
  - reward money added (9g 80s)
- quest 31769 - The Final Blow! - updated
  - description added
  - reward money added (9g 80s)
- quest 31770 - You're Either With Us Or... - updated
  - description added
  - reward money added (9g 80s)
- quest 31772 - Priorities! - updated
  - description added
  - reward money added (9g 80s)
- quest 31773 - Prowler Problems - updated
  - description added
  - reward money added (9g 80s)
- quest 31774 - Seeking Zin'jun - updated
  - description added
  - reward money added (9g 80s)
  - reward choices: +9
- quest 31775 - Assault on the Airstrip - updated
  - description added
  - reward money added (9g 80s)
- quest 31776 - Strongarm Tactics - updated
  - description added
  - reward money added (9g 80s)
- quest 31777 - Choppertunity - updated
  - description added
  - reward money added (9g 80s)
- quest 31778 - Unreliable Allies - updated
  - description added
  - reward money added (9g 80s)
- quest 31779 - The Darkness Within - updated
  - description added
  - reward money added (19g 60s)
- quest 31780 - Old MacDonald - updated
  - description added
  - reward money added (70s)
- quest 31781 - Lindsay - updated
  - description added
  - reward money added (35s)
- quest 31782 - Overthrone - updated
  - description added
  - reward money added (11g 40s)
  - reward choices: +9
- quest 31785 - Level Up! - updated
  - description added
  - reward money added (10g 60s)
- quest 31787 - Pristine Mogu Runestone - updated
  - description added
  - reward items: +2
- quest 31788 - Pristine Terracotta Arm - updated
  - description added
  - reward items: +2
- quest 31789 - Pristine Petrified Bone Whip - updated
  - description added
  - reward items: +2
- quest 31790 - Pristine Thunder King Insignia - updated
  - description added
  - reward items: +2
- quest 31791 - Pristine Edicts of the Thunder King - updated
  - description added
  - reward items: +2
- quest 31792 - Pristine Iron Amulet - updated
  - description added
  - reward items: +2
- quest 31793 - Pristine Branding Iron - updated
  - description added
  - reward items: +2
- quest 31794 - Pristine Mogu Coin - updated
  - description added
  - reward items: +2
- quest 31795 - Pristine Pandaren Tea Set - updated
  - description added
  - reward items: +2
- quest 31796 - Pristine Game Board - updated
  - description added
  - reward items: +2
- quest 31797 - Pristine Twin Stein Set - updated
  - description added
  - reward items: +2
- quest 31798 - Pristine Walking Cane - updated
  - description added
  - reward items: +2
- quest 31799 - Pristine Empty Keg - updated
  - description added
  - reward items: +2
- quest 31800 - Pristine Carved Bronze Mirror - updated
  - description added
  - reward items: +2
- quest 31801 - Pristine Gold-Inlaid Figurine - updated
  - description added
  - reward items: +2
- quest 31802 - Pristine Apothecary Tins - updated
  - description added
  - reward items: +2
- quest 31803 - Pristine Pearl of Yu'lon - updated
  - description added
  - reward items: +2
- quest 31804 - Pristine Standard of Niuzao - updated
  - description added
  - reward items: +2
- quest 31808 - Rampage Against the Machine - updated
  - description added
  - reward money added (11g 40s)
- quest 31809 - Remnants of Anger - updated
  - description added
  - reward money added (45g 60s)
  - reward choices: +9
- quest 31810 - Riding the Skies - updated
  - quest giver added: Elder Anli
  - description added
  - reward money added (5g 70s)
  - reward choices: +1
- quest 31811 - Riding the Skies - updated
  - quest giver added: Elder Anli
  - description added
  - reward money added (5g 70s)
  - reward choices: +1
- quest 31818 - Zunta - updated
  - description added
  - reward money added (1s 75c)
- quest 31819 - Dagra the Fierce - updated
  - description added
  - reward money added (2s 25c)
- quest 31820 - A Present for Teacher - updated
  - description added
  - reward money added (34g 20s)
  - reward items: +1
  - reward choices: +3
- quest 31821 - Level Up! - updated
  - description added
  - reward money added (10g 60s)
- quest 31822 - Level Up! - updated
  - description added
  - reward money added (2s 25c)
- quest 31823 - Level Up! - updated
  - description added
  - reward money added (11g 40s)
- quest 31824 - Level Up! - updated
  - description added
  - reward money added (90s)
- quest 31825 - Level Up! - updated
  - description added
  - reward money added (11g)
- quest 31826 - Level Up! - updated
  - description added
  - reward money added (10g 60s)
- quest 31827 - Level Up! - updated
  - description added
  - reward money added (11g 40s)
- quest 31842 - Practice Makes Perfect: Master Kistane - updated
  - description added
- quest 32561 - Competing Magic - updated
  - description added
  - reward money added (22g 80s)
  - reward items: +1
- quest 32686 - Pristine Banner of the Mantid Empire - updated
  - description added
  - reward items: +2
- quest 92336 - Potion Master - updated
  - description added
- npc 3667 - Anaya Dawnrunner - updated
  - coordinates: 16 spawn points added in Darkshore
- npc 43929 - Blingtron 4000 - updated
  - coordinates: 26 spawn points added in The Jade Forest
  - coordinates: 20 spawn points added in Orgrimmar
  - coordinates: 19 spawn points added in Krasarang Wilds
  - coordinates: 16 spawn points added in Kun-Lai Summit
  - coordinates: also changed in 7 more zones
- npc 65804 - Golden Lotus Guard - updated
  - coordinates: 28 spawn points added in Vale of Eternal Blossoms

## [0.2.228] - 2026-10-23

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 8,296 quests, 48 NPCs, 4 objects
- quest 3361 - A Refugee's Quandary - updated
  - description added
- quest 7162 - Proving Grounds - updated
  - description added
  - reward items: +2
- quest 7171 - Legendary Heroes - updated
  - reward items: +1
- quest 11569 - Keymaster Urmgrgl - updated
  - description added
  - reward items: +1
- quest 11967 - Mustering the Reds - updated
  - description added
- quest 12728 - Monitoring the Rift: Winterfin Cavern - updated
  - description added
  - reward items: +1
  - reward choices: +4
- quest 12871 - Aid from the Explorers' League - updated
  - coordinates: 2 objective points added in The Storm Peaks
  - description added
- quest 13506 - Reason to Worry - updated
  - description added
- quest 13520 - The Boon of the Seas - updated
  - description added
  - reward items: +1
- quest 13583 - The Wildkin's Oath - updated
  - description added
- quest 13604 - Archivum Data Disc - updated
  - description added
- quest 13897 - The Battle for Darkshore - updated
  - description added
- quest 13900 - The Offering to Azshara - updated
  - description added
- quest 14078 - Lockdown! - updated
  - description added
- quest 24491 - Follow that Gyro-Copter! - updated
  - description added
- quest 26428 - To Steal From Thieves - updated
  - description added
  - reward choices: +5
- quest 27105 - An Unwelcome Guest - updated
  - description added
- quest 31639 - Shado-Pan Monastery Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31640 - Siege of Niuzao Temple Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31641 - Mogu'shan Palace Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31642 - Scholomance Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31643 - Scarlet Halls Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31644 - Scarlet Monastery Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31645 - Gate of the Setting Sun Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31646 - Shado-Pan Monastery Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31647 - Siege of Niuzao Temple Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31648 - Mogu'shan Palace Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31649 - Scholomance Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31650 - Scarlet Halls Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31651 - Scarlet Monastery Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31656 - The Threat in the South - updated
  - description added
  - reward money added (1g 14s)
- quest 31660 - Not Fit to Swarm - updated
  - description added
  - reward money added (11g 40s)
- quest 31661 - A Source of Terrifying Power - updated
  - description added
  - reward money added (11g 40s)
- quest 31669 - The Cabbage Test - updated
  - description added
  - reward money added (5g 70s)
- quest 31670 - That Dangling Carrot - updated
  - description added
  - reward money added (5g 70s)
- quest 31671 - Why Not Scallions? - updated
  - description added
  - reward money added (5g 70s)
- quest 31672 - A Pumpkin-y Perfume - updated
  - description added
  - reward money added (5g 70s)
- quest 31673 - Red Blossom Leeks, You Make the Croc-in' World Go Down - updated
  - description added
  - reward money added (5g 70s)
- quest 31674 - The Pink Turnip Challenge - updated
  - description added
  - reward money added (5g 70s)
- quest 31675 - The White Turnip Treatment - updated
  - description added
  - reward money added (5g 70s)
- quest 31676 - Ancient Vengeance - updated
  - description added
  - reward money added (11g 40s)
- quest 31677 - The Warlord's Ashes - updated
  - description added
  - reward money added (22g 80s)
- quest 31679 - Extending Our Coverage - updated
  - description added
  - reward money added (11g 40s)
- quest 31680 - Crime and Punishment - updated
  - description added
  - reward money added (11g 40s)
- quest 31681 - Better With Age - updated
  - description added
  - reward money added (11g 40s)
  - reward choices: +5
- quest 31682 - By the Sea, Nevermore - updated
  - description added
  - reward money added (11g 40s)
- quest 31687 - Thinning the Sik'thik - updated
  - description added
  - reward money added (11g)
  - reward choices: +5
- quest 31688 - The Search for Restless Leng - updated
  - description added
  - reward money added (11g)
- quest 31689 - The Dreadsworn - updated
  - description added
  - reward money added (11g 40s)
- quest 31693 - Julia Stevens - updated
  - description added
  - reward money added (10g 60s)
- quest 31694 - Hisingen Blues - updated
  - objectives text added
  - description added
- quest 31698 - Thinning The Pack - updated
  - description added
  - reward money added (11g 40s)
- quest 31699 - Sprite Fright - updated
  - description added
  - reward money added (11g 40s)
- quest 31700 - The Shoe Is On The Other Foot - updated
  - description added
  - reward money added (11g 40s)
- quest 31701 - Dark Huntress - updated
  - description added
  - reward money added (11g 40s)
- quest 31702 - On The Prowl - updated
  - description added
  - reward money added (11g 40s)
- quest 31703 - Madcap Mayhem - updated
  - description added
  - reward money added (11g 40s)
- quest 31704 - Pooped - updated
  - description added
  - reward money added (11g 40s)
- quest 31705 - Needle Me Not - updated
  - description added
  - reward money added (11g 40s)
- quest 31706 - Weeping Widows - updated
  - description added
  - reward money added (11g 40s)
- quest 31707 - A Tangled Web - updated
  - description added
  - reward money added (11g 40s)
- quest 31708 - Serpent's Scale - updated
  - description added
  - reward money added (11g 40s)
- quest 31709 - Lingering Doubt - updated
  - description added
  - reward money added (11g 40s)
- quest 31710 - Tiny Treats - updated
  - description added
  - reward money added (11g 40s)
- quest 31711 - The Seed of Doubt - updated
  - description added
  - reward money added (11g 40s)
- quest 31712 - Monkey Mischief - updated
  - description added
  - reward money added (11g 40s)
- quest 31713 - The Big Brew-haha - updated
  - description added
  - reward money added (11g 40s)
- quest 31714 - Saving the Serpents - updated
  - description added
  - reward money added (11g 40s)
- quest 31715 - The Big Kah-Oona - updated
  - description added
  - reward money added (11g 40s)
- quest 31716 - Pooped - updated
  - description added
  - reward money added (11g 40s)
- quest 31717 - The Trainer's Challenge: Ace Longpaw - updated
  - description added
  - reward money added (11g 40s)
- quest 31718 - The Trainer's Challenge: Big Bao - updated
  - description added
  - reward money added (11g 40s)
- quest 31719 - The Trainer's Challenge: Ningna Darkwheel - updated
  - description added
  - reward money added (11g 40s)
- quest 31720 - The Trainer's Challenge: Suchi the Sweet - updated
  - description added
  - reward money added (11g 40s)
- quest 31721 - The Trainer's Challenge: Qua-Ro Whitebrow - updated
  - description added
  - reward money added (11g 40s)
- quest 31724 - Old MacDonald - updated
  - description added
  - reward money added (3s)
  - reward items: +1
- quest 31725 - Lindsay - updated
  - description added
  - reward money added (90s)
  - reward items: +1
- quest 31726 - Eric Davidson - updated
  - description added
  - reward money added (3g 10s)
  - reward items: +1
- quest 31727 - Gambling Problem - updated
  - description added
  - reward money added (1g 14s)
- quest 31728 - Bill Buckler - updated
  - description added
  - reward money added (8g 20s)
  - reward items: +1
- quest 31729 - Steven Lisbane - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31730 - A Not So Friendly Request - updated
  - description added
  - reward money added (1g 14s)
- quest 31732 - Unleash Hell - updated
  - description added
  - reward money added (9g 80s)
  - reward choices: +10
- quest 31733 - Touching Ground - updated
  - description added
  - reward money added (9g 80s)
- quest 31734 - Welcome Wagons - updated
  - description added
  - reward money added (9g 80s)
- quest 31756 - High Chance of Rain - updated
  - description added
  - reward money added (11g 40s)
- quest 31771 - Face to Face With Consequence - updated
  - description added
  - reward money added (9g 80s)
- quest 31904 - Cassandra Kaboom - updated
  - description added
  - reward money added (11g 40s)
- quest 31908 - Elena Flutterfly - updated
  - description added
  - reward money added (12s)
- quest 32299 - Just Some Light Clean-Up Work - updated
  - description added
  - reward money added (11g 40s)
- quest 32539 - Dark Offerings - updated
  - description added
  - reward money added (11g 40s)
- quest 32607 - Extended Shore Leave - updated
  - description added
  - reward money added (45g 60s)
- quest 32693 - Pristine Kypari Sap Container - updated
  - description added
  - reward items: +2
- quest 33161 - A Timeless Tour - updated
  - description added
  - XP added (236,000)
- object 214862 - Hatchling Poop - updated
  - coordinates: 29 spawn points added in The Jade Forest
- object 214863 - Hatchling Poop - updated
  - coordinates: 24 spawn points added in The Jade Forest

## [0.2.227] - 2026-10-23

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 8,216 quests, 48 NPCs, 2 objects
- quest 5892 - Irondeep Supplies - updated
  - description added
- quest 8764 - The Changing of Paths - Protector No More - updated
  - reward choices: +2
- quest 9280 - Replenishing the Healing Crystals - updated
  - description added
  - reward choices: +3
- quest 10704 - How to Break Into the Arcatraz - updated
  - description added
  - reward items: +1
  - reward choices: +5
- quest 10735 - Down the Violet Path - updated
  - description added
  - reward items: +1
- quest 11212 - Tabetha's Farm - updated
  - description added
- quest 24471 - Aid for the Wounded - updated
  - description added
- quest 24475 - All the Other Stuff - updated
  - description added
- quest 28121 - Forces of Jaedenar - updated
  - description added
- quest 28609 - Hammer Time - updated
  - description added
- quest 31542 - Incarnadine Ink - updated
  - description added
  - reward money added (11g 40s)
  - XP added (236,000)
  - reward items: +1
- quest 31543 - Portrait of a Lady - updated
  - description added
  - reward money added (11g 40s)
  - XP added (236,000)
  - reward items: +1
- quest 31544 - A Tribute to the Dead - updated
  - description added
  - reward money added (11g 40s)
  - XP added (236,000)
  - reward items: +1
- quest 31545 - The Finer Things - updated
  - description added
- quest 31548 - Learning the Ropes - updated
  - description added
  - reward money added (90s)
- quest 31549 - On The Mend - updated
  - description added
  - reward money added (4g 10s)
- quest 31550 - Got one! - updated
  - description added
  - reward money added (10g 60s)
- quest 31551 - Got one! - updated
  - description added
  - reward money added (11g 40s)
- quest 31552 - Learning the Ropes - updated
  - description added
  - reward money added (10g 60s)
- quest 31553 - On The Mend - updated
  - description added
  - reward money added (11g 40s)
- quest 31555 - Got one! - updated
  - description added
  - reward money added (10g 60s)
- quest 31556 - Learning the Ropes - updated
  - description added
  - reward money added (11g 40s)
- quest 31557 - The Finer Things - updated
  - description added
- quest 31558 - The Finer Things - updated
  - description added
- quest 31559 - The Finer Things - updated
  - description added
- quest 31560 - The Finer Things - updated
  - description added
- quest 31561 - The Finer Things - updated
  - description added
- quest 31562 - The Finer Things - updated
  - description added
- quest 31563 - The Finer Things - updated
  - description added
- quest 31564 - The Finer Things - updated
  - description added
- quest 31565 - The Finer Things - updated
  - description added
- quest 31566 - The Finer Things - updated
  - description added
- quest 31567 - The Finer Things - updated
  - description added
- quest 31568 - On The Mend - updated
  - description added
  - reward money added (90s)
- quest 31569 - Got one! - updated
  - description added
  - reward money added (90s)
- quest 31570 - Got one! - updated
  - description added
  - reward money added (11g 40s)
- quest 31571 - Learning the Ropes - updated
  - description added
  - reward money added (11g 40s)
- quest 31572 - On The Mend - updated
  - description added
  - reward money added (90s)
- quest 31573 - Learning the Ropes - updated
  - description added
  - reward money added (11g 40s)
- quest 31574 - On The Mend - updated
  - description added
  - reward money added (11g 40s)
- quest 31575 - Got one! - updated
  - description added
  - reward money added (11g 40s)
- quest 31576 - Learning the Ropes - updated
  - description added
  - reward money added (11g 40s)
- quest 31577 - On The Mend - updated
  - description added
  - reward money added (11g 40s)
- quest 31578 - Got one! - updated
  - description added
  - reward money added (9g)
- quest 31579 - Learning the Ropes - updated
  - description added
  - reward money added (90s)
- quest 31580 - On The Mend - updated
  - description added
  - reward money added (90s)
- quest 31581 - Got one! - updated
  - description added
  - reward money added (90s)
- quest 31582 - Learning the Ropes - updated
  - description added
  - reward money added (10g 60s)
- quest 31583 - On The Mend - updated
  - description added
  - reward money added (11g 40s)
- quest 31584 - Got one! - updated
  - description added
  - reward money added (10g 60s)
- quest 31588 - Learning the Ropes - updated
  - description added
  - reward money added (11g 40s)
- quest 31589 - On The Mend - updated
  - description added
  - reward money added (65s)
- quest 31590 - Got one! - updated
  - description added
  - reward money added (11g 40s)
- quest 31591 - Learning the Ropes - updated
  - description added
  - reward money added (10g 60s)
- quest 31592 - On The Mend - updated
  - description added
  - reward money added (10g 60s)
- quest 31593 - Got one! - updated
  - description added
  - reward money added (11g 40s)
- quest 31598 - Kypa'rak's Core - updated
  - description added
  - reward money added (22g 80s)
- quest 31599 - The Matriarch's Maw - updated
  - description added
  - reward money added (22g 80s)
- quest 31603 - Seeds of Fear - updated
  - reward money added (1g 14s)
- quest 31605 - The Zan'thik Dig - updated
  - description added
  - reward money added (1g 14s)
- quest 31606 - The Dissector Wakens - updated
  - description added
  - reward money added (11g 40s)
  - reward choices: +9
- quest 31609 - The Wrath of Shek'zeer - updated
  - description added
  - reward money added (22g 80s)
- quest 31611 - The Kun-Lai Kicker - updated
  - description added
  - reward money added (45g 60s)
- quest 31612 - Shadow of the Empire - updated
  - description added
  - reward money added (22g 80s)
  - reward choices: +5
- quest 31614 - LFGDungeons - Mists - Heroic Random - 1st - updated
  - reward money added (22g 80s)
  - XP added (294,000)
- quest 31615 - LFGDungeons - Mists - Heroic Random - Nth - updated
  - reward money added (22g 80s)
  - XP added (294,000)
- quest 31616 - LFGDungeons - Mists - Scenario - Normal Random - 1st - updated
  - reward money added (11g 40s)
  - XP added (236,000)
- quest 31617 - LFGDungeons - Mists - Scenario - Normal Random - Nth - updated
  - reward money added (11g 40s)
  - XP added (236,000)
- quest 31618 - LFGDungeons - Mists - Normal Random - 1st - updated
  - reward money added (11g 40s)
  - XP added (236,000)
- quest 31619 - LFGDungeons - Mists - Normal Random - Nth - updated
  - reward money added (11g 40s)
  - XP added (236,000)
- quest 31620 - Stormstout Brewery Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31621 - Stormstout Brewery Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31622 - Stormstout Brewery Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31623 - Stormstout Brewery Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31624 - Gate of the Setting Sun Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31625 - Shado-Pan Monastery Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31626 - Siege of Niuzao Temple Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31627 - Mogu'shan Palace Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31628 - Scholomance Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31629 - Scarlet Monastery Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31630 - Scarlet Halls Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31631 - Gate of the Setting Sun Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31632 - Shado-Pan Monastery Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31633 - Siege of Niuzao Temple Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31634 - Mogu'shan Palace Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31635 - Scholomance Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31636 - Scarlet Halls Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31637 - Scarlet Monastery Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31638 - Gate of the Setting Sun Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 32627 - Charged Moganite - updated
  - description added
  - reward money added (11g 40s)
- quest 33027 - The Secret Ingredient Is... - updated
  - description added
  - reward money added (22g 80s)
- quest 33230 - A Flash of Bronze... - updated
  - description added
  - reward money added (2g 85s)
- quest 33338 - Empowering the Hourglass - updated
  - description added

## [0.2.226] - 2026-10-23

### Fixed
- Flights are recorded again. The recorder started a measurement only on `PLAYER_CONTROL_LOST`, and
  only if `UnitOnTaxi("player")` was already true at that moment. On the 5.5.4 client the taxi flag
  is set a moment after the flight master's button is pressed, so that never matched: no flight was
  measured, no route time was stored and the flight bar never appeared. Takeoff and landing are now
  read from `UnitOnTaxi` itself -- an AceTimer checks it for up to 10 seconds after the click, and
  every half second in the air -- with the control and unit-flag events only making the check
  sooner. This is the approach InFlight uses on this client, reimplemented.
- A click the server refuses (a taxi error message) is dropped at once, so it cannot name a quest
  taxi taken a few seconds later. A summon, a battleground or dungeon port, an early landing or a
  loading screen in the air end the flight elsewhere and are not filed.

### Added
- A `/reload` in the air keeps the flight: it is kept in `PandaQuestDB.char.flightInAir` with the
  server's clock and picked up after the reload. A login in the air (after a disconnect) is shown on
  the bar but not filed, because the time logged out was not seen in the air.
- Each flight keeps its route as node ids with every stop, the seconds in the air, the fare (the
  money that left your purse, else the flight master's price) and the landing time.
- With synchronisation on, every finished flight from a flight master is added to
  `PandaQuestSync.flights` (`id`, `src`, `dst`, `hops`, `s`, `cost`, `t`, `char`, `build`, and
  `speed` for a character with Ride Like the Wind) for the companion app to take to the PandaQuest
  site, which can then show flight routes, their times and their prices. The newest 300 are kept.
  When the site's community file carries `flightsAckedAt`, the flights it covers are dropped, the way
  `ackUploadedThrough` drops uploaded sessions. Existing saved data is not changed.

## [0.2.225] - 2026-10-23

### Changed
- Left-click on the minimap button now opens and closes the quest browser, the general list of
  quests. Shift-click shows or hides the arrow (what left-click used to do); right-click still opens
  the options. The tooltip and the options say so in every language.

### Added
- The minimap button is a LibDataBroker data source rather than a plain launcher, so Titan Panel,
  ChocolateBar and every other broker display can show it. Its text follows the flight in progress
  (destination and time left, in the flight bar's own words), else the current target and its
  distance, else how many quests you track; the icon turns into the taxi pin while you fly. The text
  is rebuilt on events and by a one-second AceTimer only while a target or a flight is shown, never
  per frame, and a burst of events is one rebuild.
- The button's tooltip adds the flight in progress and, when the addon knows it, the last time the
  PandaQuest site confirmed a sync.
- Options: lock the minimap button in place. The button's settings live in the AceDB profile, and a
  profile switch, copy or reset moves the button to the new profile's table.
- The add-on compartment (`LibDBIcon:AddButtonToCompartment`) behind LibDBIcon's own feature check,
  with a switch in the options. The Mists Classic 5.5.4 client has no add-on compartment, so there
  the switch is hidden and nothing is registered.

## [0.2.201] - 2026-10-20

The changelog says what changed in every data sync, all of it.

### Changed
- `changelog.txt` may carry indented lines under a data change, one per thing that changed for that
  quest, NPC, object or item (`  - coordinates: 3 spawn points added in Badlands`). The checks
  allow them as `  - <what changed>`, at most 100 characters, under a change line.
- The GitHub release notes now end with the version's own section of `changelog.txt`, every line
  of it. Past GitHub's 125,000-character limit for a release body they carry the section's summary
  lines and links to `changelog.txt` at the release's tag, which always holds the whole list.
- A CurseForge upload (`publish-curseforge.yml`) sends the section whole up to 30,000 characters
  and, past that, its summary and the links to the full list. CurseForge documents no limit; 30,000
  stays under the largest changelog this project has seen accepted.
- `changelog.txt` and `CHANGELOG.md` keep the newest data syncs in full; older ones are in their
  GitHub releases and on https://pd.zroot.it/changelog.

## [0.2.198] - 2026-10-20

Waypoints you see in the world, as far as Mists of Pandaria Classic lets an addon show them.

### Added
- **Pinpoint.** When the waypoint is an NPC -- the quest's hand-in NPC, or its giver -- and the NPC's
  nameplate is on screen, the quest's name and what to do there ("Ready for turn-in") float over it in
  a framed label, with three chevrons pointing down at the NPC. It appears within the Pinpoint
  distance (20 yards; Options → Waypoints).
- **Beam.** Further out, a column of light rises from the same nameplate, with a badge and the
  distance at its foot. It fades as you close in and gives way to the Pinpoint label.
- **Card.** The badge, the distance and the travel time to the waypoint ride on the arrow.
- **Which place.** The waypoint follows the quest you track on the map (or else the arrow's target):
  once the quest is complete, its hand-in NPC, at that NPC's nearest spot in the zone you are in.
  Objectives of unfinished quests are marked only when you switch that on. `Waypoint:SetQuest(questID)`,
  `Waypoint:SetPoint(uiMapID, x, y, label)` and `Waypoint:Clear()` let other parts of the addon choose
  it (`ns.Waypoint`).
- **`/way [zone] x y [label]`**, TomTom's syntax (`35 79`, `35, 79`, decimal commas, a zone name or
  `#uiMapID`, `/way clear`), registered only when no other addon owns `/way`. The point is a flag on
  the map and the arrow follows it; it is forgotten when you walk up to it (an option), and a pin you
  had made yourself comes back when it goes.
- **TomTom.** With TomTom installed, `/way` stays TomTom's, and the waypoint TomTom's arrow follows is
  shown in PandaQuest's style (`TomTomBridge.WatchCrazyArrow`, post-hooks only).
- **Options → Waypoints**: every part on or off, the Pinpoint distance, beam colour, size, forgetting a
  `/way` point on arrival, and a button for friendly NPC nameplates, which the NPC marker needs.
  PandaQuest never changes that game setting on its own.
- `Textures/Waypoint/`: the beam, the badge, the chevrons and the label's plate -- original art,
  drawn by a script, under the addon's licence.

### Not possible in this client
- Mists of Pandaria Classic 5.5.4 has no `C_Navigation`, no `C_SuperTrack` and no
  `C_Map.SetUserWaypoint`, and the camera cannot be read, so nothing can be drawn at a spot in the 3D
  world. There is no beam over a bare map coordinate or over an object (objects have no nameplate);
  the arrow and the card show the way there. Friendly nameplates reach addons outdoors only.

### Saved data
- New keys only: `waypoint` in the profile (the options) and `waypoint` under the character (the point
  or quest you chose). Nothing saved before is moved or changed.

## [0.2.194] - 2026-10-20

Groundwork for a second game (WoW Forever). In Mists of Pandaria Classic nothing a player sees
changes.

### Added
- `Core/Game.lua`, the first file the addon loads, tells which game the client is: Mists of Pandaria
  Classic (5.5.x, interface 505xx) or WoW Forever (interface 16000-16999, or project id 18). Other
  clients are "unknown". The answer is `ns.Game.id`: `mop`, `forever` or `unknown`.
- The quest database says which game it was built for: `ns.Data.game = "mop"` in
  `Database/Data/Meta.lua`. A database that does not say is MoP's, as every database so far is. If it
  is not the game being played, PandaQuest does not load it -- no quest, NPC or object of it reaches
  the arrow, the map or a tooltip -- and prints one line naming both games.
- Every saved variable (`PandaQuestDB`, `PandaQuestSync`, `PandaQuestAH`, `PandaQuestProf`) gets a
  `game` key the first time this version loads it. Nothing else in it is changed, removed or
  re-shaped: the saved file is what it was, plus one line in each.
- Saved data written in another game -- for example a `WTF` folder copied from another install -- is
  never deleted. It is moved, whole and unchanged, under `foreign.<game>` in the same saved variable
  (`foreign.<game>-2` if that name is taken), this game starts with its own, and one chat line says so.

### Changed
- Release tooling, not part of the addon: every TOC is written from one template
  (`.github/release/PandaQuest.toc.template`, with `games.py`), and the CurseForge upload maps every
  TOC the package carries to a game version and its CurseForge game version type. The package is
  unchanged: Mists of Pandaria Classic is the only game it carries.

## [0.2.173] - 2026-10-18

### Added
- The addon now uses what the PandaQuest portal read off Wowhead, carried in
  `Database/Overrides/Wowhead.lua` by the portal's data sync. From this version that file holds, only
  where the generated (Questie) database has nothing of its own:
  - for quests: the money (`rewardMoney`, copper), the reward items with their counts, given
    (`rewardItems`) and "choose one of" (`rewardChoices`), the quest giver's text (`description`), the
    experience where Questie's table has no figure (`rewardXP`), the zone or category (`zoneOrSort`),
    and map points for objectives the database cannot place (`extraObjectives`), besides the givers,
    hand-ins and objective line it already carried;
  - for NPCs and objects: where they stand (`spawns`, `zoneID`) when the database has no place for
    them -- so the arrow and the map pins reach them -- and a whole row for one a quest names that
    the database lacks; for NPCs, the level range, rank and title from their own Wowhead page.
- `DB.GetQuestRewards(questID)` (experience, money, items, choices) and `DB.GetQuestDescription(questID)`
  read the new quest fields; `DB.GetExtra` documents them. A moderator's correction in
  `Database/Overrides/Portal.lua` with the same field name wins.
- The quest browser's page lists the money and the reward items in its Rewards line, with the whole
  list ("You will receive", "Choose one of") on hover, and shows the quest giver's text under the
  objectives on the parchment (`<name>`, `<race>` and `<class>` filled in). The XP column takes the
  portal's figure for a quest Questie has none for.
- A quest you can pick up shows its rewards -- money, experience, items -- under it on its giver's
  tooltip ("Starts: ...") and on its map pin; an NPC's map pin shows its title under the name.
- Four switches, all on by default: General > "Quest text in the quest browser" and "Reward items and
  money in the quest browser"; Tooltips > "Show quest rewards" and "Show NPC titles".

### Changed
- The Wowhead set (`Wowhead.lua`) is applied gap-only when the database loads: it fills a field the
  row has nothing in (nil, 0, blank) and never replaces a value of Questie's, also when the QuestieDB
  bridge filled it first. The community guide and the moderators' corrections are applied after it,
  as before. `Util.FormatMoney` is shared by the auction tooltip and the quest rewards.

## [0.2.163] - 2026-10-17

### Added
- The gear snapshot (telemetry, `GEAR`, payload version 2) carries the character's sex (`UnitSex`)
  and the barber's choices for its face, skin colour, hair and the race's other features, so the
  PandaQuest portal can draw the character as a 3D figure the way it looks in game. This client
  answers what a face is only while the barber UI is open, so the choices are read when you take the
  barber's chair and again when a change is paid for -- never while you only preview one -- and kept
  with the character in the saved variable until the next visit. A character that has not visited a
  barber since this version sends its sex alone, and the portal draws the default face and hair.
  Nothing is read or kept while telemetry is off.

## [0.2] - unreleased

### Added
- Overrides can hide a quest, an NPC, an object or an item with `hidden = true`, which the addon then
  treats exactly like an entry on Questie's blacklist (`DB.IsQuestHidden`, `DB.IsNpcHidden`,
  `DB.IsItemHidden`, and the new `DB.IsObjectHidden`); `hidden = false` shows one the blacklist hides.
  When two override sets disagree, the one applied last wins.
- `Database/Overrides/Portal.lua`: corrections from the PandaQuest portal (<https://pd.zroot.it>) that
  its moderators and admins made or approved. It is generated by the portal's data sync and applied
  after `Wowhead.lua` and `Community.lua`, so a moderator's decision has the last word.

### Changed
- TOC: the package carries `PandaQuest_Mists.toc` beside `PandaQuest.toc` (the Mists client reads it
  first) and the TOC declares `## AllowLoadGameType: mists` and `## X-License: GPL-3.0`.
- Licence: PandaQuest is GPLv3 (`LICENSE`, `## X-License` in the TOC). Questie, whose Mists of
  Pandaria data the database is built from, is published under the same licence.
- The repository is only the addon: references to anything outside it were removed from the
  documentation, comments and generated-file headers.
- CurseForge preparation: avatar at 400x400, upload only by hand, changelog taken from the commits
  since the previous release (nothing in the addon itself changed).
- Synchronisation is optional: nothing is asked at login any more. It stays off until you turn it on
  in the options or type `/pq consent`, and the options say the addon works fully without it.
- The objective-text pattern converter is written from scratch (same results); comments no longer
  describe code as following another addon.
- Documentation rewritten for players: features, roadmap, the PandaQuest portal at
  <https://pd.zroot.it>, and credits.

The addon moved into its own repository, <https://github.com/vem882/pandaquest>, which
packages and publishes it. The shipped version is now `0.2.<commits in that repository>`, computed
at packaging time; the series bumped from 0.1 to 0.2 because the commit counter changed meaning
when the addon moved. That repository's `README.md`, "The version", is the argument.

## [0.1.0] - unreleased

First working version: the whole chain from login to a moving arrow runs end to end.

### Added
- Addon skeleton: TOC (Interface 50504), embedded libraries (Ace3, LibDataBroker, LibDBIcon, HereBeDragons 2.0).
- Core: constants and defaults, utilities (distance/time formatting, GUID parsing), levelled logging with
  rate-limited errors, C_* compatibility wrappers, coroutine driver with an 8 ms per-frame budget.
- AceAddon/AceDB initialisation, module lifecycle (Init/Enable/OnDataReady/OnProfileChanged), slash commands.
- Locales: enUS (default, 223 keys) and fiFI (complete translation).
- Database: positional Questie-derived data for 17 693 quests, 60 224 NPCs, 20 326 objects and 80 049 items,
  decoded in a background coroutine (~0.5 s) with reverse indexes, name lookup, zone/area resolution,
  dungeon entrances and Wowhead/community overrides.
- Quest layer: quest log scanning with the 5.5.4 API, objective text parsing, target building per objective,
  turn-in and pickup targets, and full availability evaluation (level, race, class, prerequisites,
  exclusivity, reputation, skill, spell).
- Navigation: target collection with pfQuest-style spawn clustering, a router that weighs priority against
  real world distance, distance/bearing/ETA through HereBeDragons, and arrival detection.
- Arrow: `PandaQuestArrow` with rotation, red-to-green gradient, quest title in difficulty colour, action
  text, `123 m • ~1 min 20 s` status line, arrival flash, drag-to-move, tooltip and right-click menu.
- Map: world map and minimap pins (HereBeDragons-Pins-2.0) with per-frame draw budget, layer toggles,
  tooltips, a right-click menu and highlighting of the current target; NPC/item tooltip lines.
- UI: AceConfig options panel, minimap button (LibDataBroker/LibDBIcon), Wowhead links with a copy dialog,
  Blizzard tracker enhancement and centre-screen notifications.
- Sync: optional local telemetry in `PandaQuestSync` and a reader for companion-written community data.
- TomTom bridge: optional mirroring of the current target as a TomTom waypoint.
- Textures: generated arrow, glow, addon icon and quest pins, plus MIT-licensed icons from Questie/pfQuest.
- Tooling: WoW API stub harness for lupa (Lua 5.1), 282 pytest tests including an end-to-end integration
  suite, a luacheck runner with a generated 5.5.4 global list, and the database builder.

### Fixed during integration
- Each module now listens through its own AceEvent object. CallbackHandler keeps exactly one callback per
  (object, message), so registering on the shared `ns.PQ` silently replaced another module's handler:
  `PQ_SETTING_CHANGED` never reached the arrow and `PLAYER_ENTERING_WORLD` never reached the router.
- `/pq sync` printed a hard-coded zero; it now prints `Telemetry.GetStatusLines()`.
- The options applier for the telemetry group did nothing; it now calls `Telemetry.ApplySettings()`.
- Community timings and hotspots are applied to every target, so the arrow's community line can appear.
- A community override for a quest the database does not know no longer creates an empty, nameless quest row.
- The arrow status line uses the separator the module contract specifies (`123 m • ~1 min 20 s`).
- Dropped the dead `GetAddOnMetadata` fallback in `Core/Const.lua`; the bare global does not exist on 5.5.4.
