# PandaQuest

**Quest helper and navigator for Mists of Pandaria Classic (5.5.4, Interface 50504).**

An arrow that always points at your next sensible quest objective, quest pins on the world map and
minimap, gathering nodes, flight times and Wowhead links — with a built-in database of 17 693
quests, 60 224 NPCs, 20 326 objects and 80 049 items.

PandaQuest works fully on its own. The optional **PandaQuest portal at <https://pd.zroot.it>**
is where the addon's content is completed and corrected — and you are welcome to help; see
"Content and community" below.

## Features

- **Navigation arrow** – points to the next unfinished objective, ready turn-in or the nearest
  available quest, with the quest name in difficulty colour, the action to take, the distance and an
  ETA from your actual speed. Hides itself in instances, on taxis and in pet battles. Drag to move,
  right-click for a menu.
- **Quest database** – quests, NPCs, objects and items with zone mapping, dungeon entrances and
  hidden-quest lists. Decoded in a coroutine at login (about half a second) so the game never
  freezes.
- **Quest availability** – works out which quests you can pick up: level, race, class,
  prerequisites, reputation, skill and exclusivity.
- **Map pins** – objectives, turn-ins and available quests on the world map and minimap, merged per
  spawn cluster, with tooltips and a right-click menu. The current target is highlighted.
- **Tooltips** – NPC and item tooltips list the quests they start, end or count towards. Hovering a
  pin shows the creature's level range, type, respawn time and the quests that want it, with live
  progress and drop rate. A line whose value is not known is left out — never a `?` or a zero.
- **Respawn timers** – from three sources, and the tooltip always says which: a static seed,
  community medians (shown with their sample count) and what your own session measured. Killing a
  tracked mob or gathering a node starts a countdown.
- **Gathering nodes** – ore, herbs, fishing pools, chests and rare spawns, filtered by what your
  character can gather. Pandaria's nodes are learned from play: gathering one teaches the addon
  where it is.
- **Flight times** – the flight master's tooltip shows how long a flight takes, and a bar runs
  during the flight. Routes are measured by flying them; an unmeasured route shows nothing rather
  than a guess.
- **Archaeology** – a dig-site progress bar (the one Mists never shipped) and a read of your
  archaeology window.
- **Professions and auctions** – read your recipe books (`/pq scan professions`) and scan auction
  prices on your realm. Nothing scans on its own; it always starts from a button or a command.
- **Tracker and notifications** – distance and a "navigate here" button on the Blizzard tracker,
  and a short centre-screen message when a quest completes or the target changes.
- **Wowhead links** – `/pq wh` gives a copyable link for a quest.
- **Options** – a full options panel (`/pq`) with profiles.
- **Languages** – English and Finnish.
- **Optional integration** – mirrors the current target into the TomTom addon when you have it
  installed.

### Optional synchronisation

Synchronisation is **optional and off by default**; nothing in PandaQuest needs it. If you turn it
on (`/pq` → Synchronisation, or `/pq consent`), the addon records what you do while questing into a
file on your own computer (`PandaQuestSync` in your SavedVariables). **The addon never uploads
anything itself.** A separate companion program reads that file when you run it. Turn it off at any
time; nothing is recorded while it is off.

## Content and community

Much of PandaQuest's data is incomplete for Mists of Pandaria — Pandaria's gathering nodes, respawn
timers and flight times exist in no downloadable source, so they are collected from play. The
**PandaQuest portal at <https://pd.zroot.it>** is where that content is completed and corrected,
and where anyone can join in and help fill the gaps. What the portal collects is meant to flow back into
the addon's data.

## Download and install

- **CurseForge app** (recommended): search for *PandaQuest* and install it.
- **GitHub**: download the latest `PandaQuest-<version>.zip` from
  <https://github.com/vem882/pandaquest/releases> and unzip it into
  `World of Warcraft/_classic_/Interface/AddOns/`. The folder must be named exactly `PandaQuest` and
  contain `PandaQuest.toc`.
- Restart the game, or `/reload` if it was already running.

PandaQuest is built for **Mists of Pandaria Classic 5.5.4** only. It does not load on other game
versions. Optional: **TomTom** is detected automatically when present.

## Getting help and reporting problems

- **Issues:** <https://github.com/vem882/pandaquest/issues>
- **Questions and content:** the portal at <https://pd.zroot.it>.

A good report says what you did, what you expected and what happened. Please include:

1. The output of `/pq status` (it prints the version and the build it came from).
2. The Lua error text, if there is one. Turn error display on with `/console scriptErrors 1`, then
   `/reload`.
3. `/pq debug 3` before reproducing the problem raises the addon's log level (`0` errors only up to
   `4` trace); `/pq debug 1` puts it back.

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
| `/pq flight` | show the flight bar where it is so you can drag it |
| `/pq digsite` | show the dig-site bar so you can move it |
| `/pq scan professions\|archaeology` | read the open profession or archaeology window |
| `/pq sync` | synchronisation and community data status |
| `/pq consent` | the question about sharing quest data (synchronisation is off until you say yes) |
| `/pq lang auto\|enUS\|fiFI` | interface language |
| `/pq status` | addon status |
| `/pq dump quest\|npc\|object\|item <id>` | print a database entry |
| `/pq debug [0-4\|arrow]` | log level (0 error ... 4 trace) or arrow debug values |

## Settings

Everything has a working default; the panel (`/pq`) is optional.

| Group | What you can change |
|---|---|
| General | distance units (metres/yards), minimap button, language |
| Arrow | show/lock, quest text, ETA, community timings, hide in instances, arrival flash, size, opacity, text size, reset position |
| Navigation | target selection (auto / focused quest / nearest), route to turn-ins and new quests, arrival radius |
| TomTom | off, or mirror the current target |
| Map | objective / turn-in / available pins, minimap pins, pin sizes, how many nodes the minimap carries, which quests to show |
| Gathering | the node layer on/off, mining / herbalism / fishing / chests / rares, only my professions, fade nodes until they respawn |
| Tooltips | quest info in tooltips, quest IDs |
| Flight master | the flight time line, the in-flight bar, its lock, size and position |
| Tracker | enhance the Blizzard tracker, show distance |
| Notifications | on/off, quest complete, next objective, sound |
| Synchronisation (optional) | record quest data, movement breadcrumbs, sessions kept |
| Advanced | log level, arrow debug output, redraw pins |
| Profiles | standard profile management |

PandaQuest follows the game locale and ships English and Finnish. The WoW client never reports
`fiFI`, so Finnish is selected with `/pq lang fiFI` (reload the UI afterwards).

## Saved variables

`PandaQuestDB` (settings and profiles), `PandaQuestSync` (optional synchronisation data),
`PandaQuestAH` (auction scans) and `PandaQuestProf` (recipe books).

## Frequently asked questions

**Do I need the portal or the companion program?** No. PandaQuest works fully on its own. The
portal is where the shared content is completed; using it is optional.

**Is anything sent anywhere?** No. The addon cannot send anything: the WoW client does not allow
it. Synchronisation only writes a file on your computer, and only if you switch it on. A separate
companion program, run by you, can read that file.

**Why does a node or a flight show no time?** Because the number is unknown, and PandaQuest leaves
a line out rather than print a guess. Respawn timers and flight times are measured from play: kill
the mob, gather the node or fly the route once and it appears.

**The arrow points at something odd.** `/pq next` skips the current target, `/pq target <questID>`
pins a quest, and the Navigation options switch between automatic, focused and nearest. If the arrow
looks rotated the wrong way, please report it with `/pq status` — the rotation has not yet been
confirmed on a live client.

**A quest is missing or wrong.** The database is built from Questie's Mists of Pandaria data with
corrections on top, and it is not perfect. Report the quest ID (`/pq dump quest <id>` prints the
entry) and the portal can correct it.

**Can I use it with Questie?** PandaQuest does not read from or change Questie, and the two have
not been tested together in game. If you see two sets of pins, switch one addon's map pins off.

**How do I reset everything?** `/pq reset` resets the arrow position and map pins. Settings live in
the options panel's *Profiles* tab. Deleting `PandaQuestDB.lua` from your SavedVariables folder
(with the game closed) resets all settings.

**Does it work on Retail, Classic Era or other Classic versions?** No. It targets interface
50504, Mists of Pandaria Classic 5.5.4.

## Compatibility

| Addon | Relationship |
|---|---|
| TomTom | optional: PandaQuest can send its current target to TomTom as a waypoint |
| Questie | not used and not modified; not tested together in game |
| Leatrix Maps, Mapster, ElvUI map module | PandaQuest's pins are built to survive another addon rescaling or re-anchoring the world map; tested against a simulated client, not yet confirmed on a live one |
| HereBeDragons | embedded, shared with other addons that embed the same library |

## Languages

PandaQuest follows the game locale and ships **English** and **Finnish** (`Locales/enUS.lua`,
`Locales/fiFI.lua`). The WoW client never reports `fiFI`, so Finnish is selected with
`/pq lang fiFI` and a reload.

Adding a language is a small pull request: copy `Locales/enUS.lua`, translate the values, register
the table the way `Locales/fiFI.lua` does and add the locale name to the `/pq lang` command. A key
you leave out falls back to English, so a partial translation is fine.

## Contributing

- **Play with synchronisation on** and use the portal: respawn timers, node positions and flight
  times for Pandaria only exist because somebody measured them.
- **Report wrong or missing data** with the quest, NPC or object ID.
- **Translate** (see above) or fix an English string.
- **Code:** pull requests are welcome at <https://github.com/vem882/pandaquest>. The addon is
  plain Lua 5.1 with Ace3, and the package checks are `python3 .github/release/check.py`.

## Roadmap

Not done yet:

- Flight-path routing between continents (a cross-continent target sorts last and shows no
  distance).
- A PandaQuest quest tracker of its own (today it enhances Blizzard's).
- Measured respawn timers, node positions and flight times for all of Pandaria — this is what the
  portal and your play fill in.
- Verification in game: the arrow's rotation, the auction scanning path on Hoptallus, and
  compatibility with Leatrix Maps, Mapster and ElvUI's map module have been tested against a
  simulated client but not yet confirmed on a live one.

## Credits and inspiration

PandaQuest is its own code. It is **inspired by** other addons, and it does not copy their code:

- **Questie** — the idea of a quest helper that knows which quests you can pick up, and the
  positional database format PandaQuest's quest data is shaped after.
- **pfQuest** by Shagu — the idea of showing a creature's respawn time, level and drop rate on its
  map pin, and of reducing many spawn points to one representative point.
- **TomTom** — the idea of an on-screen arrow with a distance. PandaQuest can also hand its target
  to TomTom when it is installed.
- **Leatrix Maps, Mapster, ElvUI** — PandaQuest is built to coexist with them.

Data and assets from other projects keep their own terms:

- The quest/NPC/object/item database is built from Questie's Mists of Pandaria data. Questie is
  published under GPLv3, which is why PandaQuest is too.
- Respawn timers and drop rates for Vanilla and Burning Crusade come from pfQuest's database (MIT).
- Map icons in `Textures/Icons/` are the MIT-licensed icons from pfQuest/Questie
  (`Textures/Icons/LICENSE.md`).
- Embedded libraries (Ace3, LibStub, CallbackHandler, LibDataBroker, LibDBIcon, HereBeDragons)
  keep their own licences (`Libs/README.md`).

## Licence

PandaQuest is free software under the **GNU General Public License, version 3** (`LICENSE`). Copyright
(C) 2026 vem882. You may use, study, change and share it under those terms; a changed copy must be
shared under the same licence, with its source. The embedded libraries and the third-party icons keep
their own, GPL-compatible licences (`Libs/README.md`, `Textures/Icons/LICENSE.md`).

The database files under `Database/Data/` are generated, from Questie's data with corrections on top;
they are the form this repository distributes.

## Author and source

Written by **vem882**. Source, issues and releases: <https://github.com/vem882/pandaquest>.
The PandaQuest portal: <https://pd.zroot.it>.
