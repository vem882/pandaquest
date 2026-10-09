# Changelog

All notable changes to PandaQuest are documented here.

## [0.2] - unreleased

### Changed
- CurseForge preparation: avatar at 400x400, upload only by hand, changelog taken from the commits
  since the previous release (nothing in the addon itself changed).
- Synchronisation is optional: nothing is asked at login any more. It stays off until you turn it on
  in the options or type `/pq consent`, and the options say the addon works fully without it.
- The objective-text pattern converter is written from scratch (same results); comments no longer
  describe code as following another addon.
- Documentation rewritten for players: features, roadmap, the PandaQuest portal at
  <https://pd.zroot.it>, and credits.

The addon moved into its own repository, <https://github.com/vem882/pandawow_addon>, which
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
