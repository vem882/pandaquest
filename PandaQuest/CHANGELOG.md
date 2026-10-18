# Changelog

All notable changes to PandaQuest are documented here.

## [0.2.175] - 2026-10-18

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 4,548 quests, 10 NPCs
- quest 9859 - Talbuk Mastery - updated
- quest 26049 - The Princess Unleashed - updated
- quest 26056 - The Wavespeaker - updated
- quest 26057 - The Wavespeaker - updated
- quest 26065 - Free Wil'hai - updated
- quest 26070 - Clearing the Defiled - updated
- quest 26071 - Clearing the Defiled - updated
- quest 26072 - Into the Totem - updated
- quest 26078 - Extinguish the Fires - updated
- quest 26079 - Wanted! Otto and Falconcrest - updated
- quest 26080 - One Last Favor - updated
- quest 26085 - Rallying the Defenders - updated
- quest 26086 - Orako - updated
- quest 26087 - "Glow-Juice" - updated
- quest 26088 - Here Fishie Fishie - updated
- quest 26089 - Die Fishman Die - updated
- quest 26090 - I Brought You This Egg - updated
- quest 26091 - Here Fishie Fishie 2: Eel-Egg-Trick Boogaloo - updated
- quest 26092 - Orako's Report - updated
- quest 26093 - Northfold Manor - updated
- quest - and 22 more quests updated

## [0.2.174] - 2026-10-18

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 4,507 quests, 10 NPCs
- quest 2 - Sharptalon's Claw - updated
- quest 23 - Ursangous's Paw - updated
- quest 24 - Shadumbra's Head - updated
- quest 25 - Simmer Down Now - updated
- quest 47 - Gold Dust Exchange - updated
- quest 52 - Protect the Frontier - updated
- quest 60 - Kobold Candles - updated
- quest 62 - The Fargodeep Mine - updated
- quest 76 - The Jasperlode Mine - updated
- quest 123 - The Collector - updated
- npc 1160 - Captain Halyndor - updated
- npc 1748 - Highlord Bolvar Fordragon - updated
- npc 3231 - Corrupted Dreadmaw Crocolisk - updated
- npc 5296 - Rage Scar Yeti - updated
- npc 5297 - Elder Rage Scar - updated
- npc 9165 - Fledgling Pterrordax - updated
- npc 14527 - Simone the Inconspicuous - updated
- npc 39926 - Twilight Inciter - updated
- npc 41009 - Krom'gar Hot Air Balloon - updated
- npc 41098 - Gnaws - updated
- quest - and 4,496 more quests updated

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

## [0.2.172] - 2026-10-18

Data from the PandaQuest portal.

- quest 25802 - Reclaiming Goods - updated
- quest 25803 - The Search Continues - updated
- quest 30772 - Seeing Red - updated
- quest 30893 - The Endless Swarm - updated

## [0.2.171] - 2026-10-18

Data from the PandaQuest portal.

- quest 30975 - The Taking of Dusklight Bridge - updated

## [0.2.170] - 2026-10-18

Data from the PandaQuest portal.

- quest 31138 - The Arts of a Monk - updated
- item 21360 - Deathdealer's Helm - updated
- item 85574 - Darkspear Monk's Staff - updated
- item 89564 - Red Belt of Gentle Persuasion - updated
- item 89565 - Red Belt of Unspoken Warning - updated
- item - More items filled in - updated

## [0.2.169] - 2026-10-18

Data from the PandaQuest portal.

- item 4907 - Woodland Tunic - updated
- item 5395 - Woodland Shield - updated
- item 11189 - Woodland Robes - updated
- item 21359 - Deathdealer's Boots - updated
- item 21362 - Deathdealer's Leggings - updated
- item 25878 - Dusksteel Throwing Knife - updated
- item 29280 - Violet Signet - updated
- item 29288 - Violet Signet - updated
- item 29291 - Violet Signet - updated
- item 57254 - Runner's Boots - updated
- item 73208 - Trainee's Dagger - updated
- item 73212 - Trainee's Dagger - updated

## [0.2.168] - 2026-10-18

Data from the PandaQuest portal.

- item 29277 - Violet Signet - updated
- item 29279 - Violet Signet of the Great Protector - updated
- item 29283 - Violet Signet of the Master Assassin - updated
- item 52879 - Sea Witch's Bracers - updated
- item 52884 - Footsteps of the Fallen Friend - updated
- item 52887 - Zuni's Family Heirloom - updated
- item 57387 - Spymaster's Legs - updated
- item 60260 - Sea Witch's Bag - updated
- item 65624 - SI:7 Special Issue Facemask - updated

## [0.2.167] - 2026-10-17

Data from the PandaQuest portal.

- quest 31140 - Lions for Lambs - updated
- item 29278 - Violet Signet - updated
- item 52889 - Blooded Darkspear Dagger - updated
- item - More items filled in - updated

## [0.2.166] - 2026-10-17

Data from the PandaQuest portal.

- item 21364 - Deathdealer's Vest - updated
- item 21405 - Band of Veiled Shadows - updated
- item 59047 - Free Body Belt - updated
- item 59048 - Torque-Applying Gloves - updated
- item 59049 - Inertial Bracers - updated

## [0.2.165] - 2026-10-17

Data from the PandaQuest portal.

- npc 23003 - Joe Rumsey - updated

## [0.2.164] - 2026-10-17

Data from the PandaQuest portal.

- database - Wowhead fill-ins as on the PandaQuest portal: 1 quest
- quest 24702 - Here Lies Dadanga - updated
- item 25505 - Carinda's Wedding Band - updated
- item 25512 - Tribal Hauberk - updated
- item 25567 - Cord of the Ring - updated
- item 25575 - Thunderbringer's Guard - updated
- item 25592 - Clefthoof Wristguards - updated
- item 25776 - Ogre Slayer's Pendant - updated
- item 27436 - Iron Band of the Unbreakable - updated
- item 28041 - Bladefist's Breadth - updated
- item 30019 - Area 52 Defender's Pants - updated
- item 30364 - Resonating Axe - updated
- item 35601 - Drakonid Arm Blade - updated
- item 36559 - Prized Handscythes - updated
- item 38221 - Shroud of Fluid Strikes - updated
- item 42763 - Bindings of Sabotage - updated
- item 42766 - Spiked Treads of Mutation - updated
- item 43183 - Tundra Tracker's Shoulderguards - updated
- item 64884 - Bilgewater Cartel Tabard - updated
- item 65286 - Ancient Seed Casing - updated

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

## [0.2.161] - 2026-10-17

Data from the PandaQuest portal.

- quest 13914 - Searing Roc Feathers - updated
- quest 13915 - Hungry, Hungry Hatchling - updated
- quest 13916 - Poached, Scrambled, Or Raw? - updated
- quest 13917 - Gorishi Grub - updated

## [0.2.160] - 2026-10-16

Data from the PandaQuest portal.

- database - rebuilt from Questie 12.1.0+v1.0.6 (was 11.37.1)
- database - Wowhead fill-ins as on the PandaQuest portal: 0 quests
- quest 216 - Between a Rock and a Thistlefur - fixed
- quest 488 - Zenn's Bidding - fixed
- quest 876 - Serena Bloodfeather - fixed
- quest 1222 - Stinky's Escape - fixed
- quest 2751 - Barbaric Battlements - fixed
- quest 2752 - On Iron Pauldrons - fixed
- quest 2753 - Trampled Under Foot - fixed
- quest 2754 - Horns of Frenzy - fixed
- quest 7141 - The Battle of Alterac - fixed
- quest 7142 - The Battle for Alterac - fixed
- quest 7161 - Proving Grounds - fixed
- quest 7162 - Proving Grounds - fixed
- quest 7163 - Rise and Be Recognized - fixed
- quest 7164 - Honored Amongst the Clan - fixed
- quest 7165 - Earned Reverence - fixed
- quest 7166 - Legendary Heroes - fixed
- quest 7168 - Rise and Be Recognized - fixed
- quest 7169 - Honored Amongst the Guard - fixed
- quest 7170 - Earned Reverence - fixed
- quest 7171 - Legendary Heroes - fixed
- data - and 53 more fixed: 52 quests, 1 object
- quest 6861 - Zinfizzlex's Portable Shredder Unit - removed
- quest 6862 - Zinfizzlex's Portable Shredder Unit - removed
- quest 6901 - Launch the Attack! - removed
- quest 7281 - Brotherly Love - removed
- quest 7282 - Brotherly Love - removed
- quest 7301 - Fallen Sky Lords - removed
- quest 7302 - Fallen Sky Lords - removed

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
