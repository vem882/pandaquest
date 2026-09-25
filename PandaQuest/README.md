# PandaQuest

Quest helper and navigator for **Mists of Pandaria Classic (5.5.4, Interface 50504)**.

PandaQuest shows an on-screen arrow that always points to the next sensible quest objective
(objective, turn-in, or the closest available quest), draws quest icons on the world map and
minimap, adds quest information to NPC and item tooltips, and links to Wowhead in game. The quest
database is derived from Questie's MoP data with its corrections applied.

## What works

- **Database** – 17 693 quests, 60 224 NPCs, 20 326 objects and 80 049 items, decoded in a
  coroutine at login (about half a second) so the game never freezes. Zone/area mapping,
  dungeon entrances, hidden-quest lists and Wowhead/community overrides on top. Plus a seed taken
  from pfQuest's classic database (`Database/Data/Seed.lua`): 10 738 NPC and 7 008 object respawn
  timers, 2 108 items with a measured drop rate and 693 gathering nodes.
- **Quest layer** – reads the quest log with the 5.5.4 API (`GetNumQuestLogEntries` +
  `GetQuestLogTitle` + `C_QuestLog.GetQuestObjectives`), parses objective progress, and works out
  which quests you could pick up (level, race, class, prerequisites, reputation, skill, exclusivity).
- **Navigation** – every unfinished objective, every ready turn-in and the nearest available quests
  become targets; the router weighs priority against real world distance and picks one.
- **Arrow** – a TomTom-style arrow with the quest name in difficulty colour, the action to take,
  the distance and an ETA from your actual speed, an arrival flash, drag-to-move and a right-click
  menu. Hides itself in instances, on taxis and in pet battles.
- **Map** – pins on the world map and the minimap through HereBeDragons, merged per spawn cluster,
  with tooltips and a right-click menu; the current target is highlighted. An objective spawn is a
  small ringed dot whose colour is derived from the quest's own name, so two spawns of one quest
  match and two quests do not; quest givers and turn-ins keep their `!` and `?`. The minimap keeps
  the nearest nodes when it is capped and fades the ones drifting towards the rim. Pins survive
  another addon rescaling, resizing or re-anchoring the world map (simulated in the harness --
  see "Not verified" below).
- **Node tooltips** – hovering a pin gives the pfQuest-style block: the creature's name, its level
  range, its type, its respawn time and the quests that want it, with each objective's live
  progress and its drop rate. **A line whose value we do not have is left out** -- never a `?`,
  never a zero, never an empty bracket.
- **Respawn timers** – three sources, and the tooltip always says which one it is looking at: the
  static seed taken from pfQuest's Vanilla/TBC data, the community median measured on the hub
  (shown as `~5 Mins (12)` with its sample count), and what this session measured itself. Killing
  a tracked mob or gathering a node starts a live countdown, and its pin stays faint until it is
  back. Mists of Pandaria is in none of the classic data, so Pandaria's timers are measured from
  play -- which is the same loop the quest guides already use.
- **Gathering nodes** – ore veins, herbs, fishing pools, chests and rare spawns on both maps, each
  with its own icon, filtered by what your character can actually gather (`Show nodes above my
  skill` brings the rest back faded). Pandaria's veins are in no source anybody can download, so
  they are learned from play: looting one teaches the addon where it is and starts its timer.
- **Tooltips** – NPC and item tooltips list the quests they start, end or count towards.
- **Flight times** – the flight master's tooltip says how long the flight takes and how many of
  your own flights that rests on (`~2 min 5 s (3 flights)`), and a small bar runs during the
  flight with the progress and what is left. **A route you have never flown shows nothing at
  all.** Nothing on this client can turn a taxi map into a distance: those coordinates are
  positions on the map *texture*, which Blizzard scales by 580x580 only to place a 16 px pin, and
  no source names a taxi's speed. So the times are measured by flying, the way the respawn timers
  are measured by killing, and an unmeasured route gets an empty line rather than a plausible one.
  Until a route has been flown twice the bar shows the time in the air and draws no fill: a
  fraction needs a whole. Requirements: [`docs/12-lentoajat.md`](../docs/12-lentoajat.md).
- **Tracker / notifications** – distance and a "navigate here" button on the Blizzard tracker,
  and a short centre-screen message when a quest completes or the target changes.
- **Options** – a full AceConfig panel in the Blizzard settings window, plus AceDB profiles.
- **TomTom** – optional waypoint mirroring when TomTom is installed.
- **Sync** – optional local telemetry in `PandaQuestSync` for the PandaQuest Hub. Nothing is ever
  uploaded by the addon itself; the companion tool reads the saved variables when you run it.

Not in this version: flight-path routing between continents (a cross-continent target sorts last
and shows no distance), and a PandaQuest tracker of its own.

**Not verified in game.** Compatibility with Leatrix_Maps is asserted by *simulating* what that
addon does to the world map -- scaling it, resizing it, re-anchoring it, swapping its canvas -- in
the test harness, because the current release cannot be downloaded without a CurseForge login. The
arithmetic holds; whether the two addons actually get on is still an in-game question, and the same
goes for Mapster and ElvUI's map module.

## Install

1. Copy the `PandaQuest` folder into `World of Warcraft/_classic_/Interface/AddOns/`.
2. Make sure the folder is named exactly `PandaQuest` and contains `PandaQuest.toc`.
3. Restart the game, or `/reload` if it was already running.

Optional: **TomTom** (waypoint mirroring) and **Questie** are detected automatically when present.

## Slash commands

`/pq` or `/pandaquest`:

| Command | Effect |
|---|---|
| `/pq` | open the options panel |
| `/pq help` | list commands |
| `/pq arrow` | toggle the navigation arrow |
| `/pq target [questID\|clear]` | pin a quest as the current target (no argument: show the current target) |
| `/pq next` | skip the current target |
| `/pq units meters\|yards` | distance units |
| `/pq wh [questID]` | Wowhead link for a quest (default: current target) |
| `/pq hide <questID>` / `/pq unhide <questID>` | hide a quest from the navigator / show it again |
| `/pq reset` | reset the arrow position and map pins |
| `/pq debug [0-4\|arrow]` | log level (0 error ... 4 trace) or arrow debug values |
| `/pq dump quest\|npc\|object\|item <id>` | print a database entry |
| `/pq status` | addon status |
| `/pq sync` | telemetry and community data status |
| `/pq flight` | show the flight bar where it is so you can drag it |
| `/pq lang auto\|enUS\|fiFI` | interface language |

## Settings

Everything has a working default; the panel (`/pq`) is optional. Groups and the keys behind them:

| Group | What you can change |
|---|---|
| General | distance units (metres/yards), minimap button, language note |
| Arrow | show/lock, quest text, ETA, community timings, hide in instances, arrival flash, size, opacity, text size, reset position |
| Navigation | target selection (auto / focused quest / nearest), focused quest ID, route to turn-ins, route to new quests + radius and count, arrival radius |
| TomTom | off or mirror the current target |
| Map | objective / turn-in / available pins, minimap pins, edge pins, spawn merging, pin sizes, node size, how many nodes the minimap carries and how far in they start fading, which quests to show (low level, repeatable, dungeon, raid, PvP, pet battle) |
| Gathering | the whole node layer on/off, mining / herbalism / fishing / chests / rares separately, only my professions, show nodes above my skill, fade nodes and mobs until they respawn |
| Tooltips | quest info in tooltips, quest IDs |
| Flight master | the flight time line in the taxi tooltip, the in-flight bar, its lock, its size, preview and reset position |
| Tracker | enhance the Blizzard tracker, show distance |
| Notifications | on/off, quest complete, next objective, sound, preview |
| Synchronisation | record quest data, movement breadcrumbs and their interval, sessions kept, events per session |
| Advanced | log level, arrow debug output, redraw pins, print status |
| Profiles | the standard AceDB profile management |

Language: PandaQuest follows the game locale and ships English and Finnish. The WoW client never
reports `fiFI`, so Finnish is selected with `/pq lang fiFI` (reload the UI afterwards).

## Saved variables

`PandaQuestDB` (settings, AceDB profiles) and `PandaQuestSync` (optional telemetry for the
PandaQuest Hub; turn it off under Synchronisation).

## Development

The addon itself lives at <https://github.com/vem882/pandawow_addon>, which packages and publishes
it and whose `README.md` describes the release.

The toolchain is in the platform repository, <https://github.com/vem882/pandawow>: `docs/`
(Finnish) for the module contract, and `tools/` for the database builder, the texture generator,
the WoW API stub test harness and the luacheck runner. Every `docs/…` and `tools/…` path in this
addon's comments and in `Textures/README.md` is a path in *that* repository, including the
commands below — they are run from its root, not from this folder.

```sh
python3 -m pytest tools/tests -q -p no:cacheprovider   # no game client needed
python3 tools/luacheck_runner.py                       # lint every Lua file
python3 tools/syntax_check.py PandaQuest/**/*.lua      # Lua 5.1 syntax only
```

## License

The addon repository declares no licence of its own at the root, which is a statement about what
is in the tree and not a grant. Embedded libraries keep their own licenses (`Libs/README.md`), and
the map icons copied from Questie/pfQuest keep theirs (`Textures/Icons/LICENSE.md`).
