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
- **Waypoints** – the quest NPC you are heading for is marked over its nameplate: up close, the quest's
  name and what to do there ("Ready for turn-in") in a framed label with chevrons pointing at the NPC;
  further out, a column of light rising from the nameplate with the distance under it. The distance
  and travel time also ride on the arrow. The waypoint follows the quest you track (or the arrow's
  target): its hand-in NPC once the quest is complete, at that NPC's nearest spot in your zone.
  `/way [zone] x y [label]` sets a waypoint of your own, written the way TomTom writes it.
  Mists of Pandaria Classic gives addons no way to put a marker on a spot in the 3D world, so there
  is no beam over a bare map coordinate and none over an object; friendly NPC nameplates have to be
  switched on for the NPC marker (Options → Waypoints has a button), and inside dungeons the game
  keeps them from addons.
- **Quest database** – quests, NPCs, objects and items with zone mapping, dungeon entrances and
  hidden-quest lists. Decoded in a coroutine at login (about half a second) so the game never
  freezes.
- **Quest browser** – `/pq quests` (or left-click the minimap button) opens a window with every
  quest in the database: categories with counts on the left (continents, dungeons, raids,
  battlegrounds, classes, professions, events), a sortable list in the middle, and the selected
  quest as a page on the right — its text, who starts and ends it with coordinates, level, difficulty,
  side, shareable, quest ID and a map of the zone with the start (!), the end (?) and the objectives
  marked. It lists your own side's quests (Alliance or Horde) and the neutral ones; one click
  switches to the other side or to both. Quests only QuestieDB knows are included when that addon
  is installed (see "Compatibility"). Filters: name, quest level, "my level", side, and kind
  (dungeon, raid, group, PvP, daily, event).
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
- **Minimap button** – left-click opens the quest browser, Shift-click shows or hides the arrow,
  right-click opens the options. Its tooltip shows the current target, the flight in progress and
  the last sync with the PandaQuest site. The button can be hidden or locked in place, per profile.
  It is a LibDataBroker data source too, so Titan Panel, ChocolateBar and other broker bars show
  the flight, the target and its distance, or how many quests you track.
- **Options** – a full options panel (`/pq`) with profiles.
- **Languages** – English, and German, Spanish (Spain and Mexico), French, Italian, Brazilian
  Portuguese, Russian, Korean, Simplified and Traditional Chinese — every language the WoW client
  supports — plus Finnish. The addon follows the game's language.
- **Optional integrations** – mirrors the current target into the TomTom addon when you have it
  installed, and uses the **QuestieDB** addon, when it is installed and enabled, to complete the
  built-in quest database (see "Compatibility").

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
- **GitHub**: download `PandaQuest-<version>.zip` from
  <https://github.com/vem882/pandaquest/releases> and unzip it into
  `World of Warcraft/_classic_/Interface/AddOns/`. The folder must be named exactly `PandaQuest` and
  contain `PandaQuest.toc`. Entries marked **Pre-release** are betas; the one marked **Latest** is the
  newest stable build.
- Restart the game, or `/reload` if it was already running.

**Not yet confirmed in the game.** The quest browser, the QuestieDB bridge, the translations and the
animations have been tested only against a simulated client: how the windows fit real font metrics,
how the map art loads and how the motion feels are still open. Please report what you see — with
`/pq status` and the Lua error text if there is one. A build made for testing says *beta* after the
version in the AddOns list and in `/pq status`.

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
| `/pq quests [questID]` | open the quest browser, optionally on one quest's page |
| `/pq flight` | show the flight bar where it is so you can drag it |
| `/pq digsite` | show the dig-site bar so you can move it |
| `/pq scan professions\|archaeology` | read the open profession or archaeology window |
| `/pq sync` | synchronisation and community data status |
| `/pq consent` | the question about sharing quest data (synchronisation is off until you say yes) |
| `/pq lang auto\|<locale>` | interface language (`/pq lang` lists the codes: `enUS deDE esES esMX fiFI frFR itIT koKR ptBR ruRU zhCN zhTW`) |
| `/pq status` | addon status |
| `/pq dump quest\|npc\|object\|item <id>` | print a database entry |
| `/pq debug [0-4\|arrow]` | log level (0 error ... 4 trace) or arrow debug values |

`/way` sets a waypoint, in TomTom's syntax: `/way 35 79`, `/way 35.0, 79.0 Windrunner Spire`,
`/way Eversong Woods 35 79 Windrunner Spire`, `/way #94 35 79`; `/way clear` removes it and `/way`
alone shows the current one. PandaQuest only takes `/way` when no other addon has it; with TomTom
installed, `/way` stays TomTom's and the waypoint TomTom's arrow follows is shown in PandaQuest's
style instead.

## Settings

Everything has a working default; the panel (`/pq`) is optional.

| Group | What you can change |
|---|---|
| General | distance units (metres/yards), quest database source (PandaQuest only / fill gaps from QuestieDB / QuestieDB values first), minimap button (show, lock in place), language |
| Arrow | show/lock, quest text, ETA, community timings, hide in instances, arrival flash, size, opacity, text size, reset position |
| Navigation | target selection (auto / focused quest / nearest), route to turn-ins and new quests, arrival radius |
| TomTom | off, or mirror the current target |
| Waypoints | on/off; follow the tracked quest; also objectives; show TomTom's waypoint; the distance on the arrow, the Pinpoint label, its distance, the beam and its colour, size; forget a `/way` point on arrival; friendly NPC nameplates (a button, never on its own); clear the waypoint |
| Map | objective / turn-in / available pins, minimap pins, pin sizes, how many nodes the minimap carries, which quests to show |
| Gathering | the node layer on/off, mining / herbalism / fishing / chests / rares, only my professions, fade nodes until they respawn |
| Tooltips | quest info in tooltips, quest IDs |
| Flight master | the flight time line, the in-flight bar, its lock, size and position |
| Tracker | enhance the Blizzard tracker, show distance |
| Notifications | on/off, quest complete, next objective, sound |
| Synchronisation (optional) | record quest data, movement breadcrumbs, sessions kept |
| Advanced | log level, arrow debug output, redraw pins |
| Profiles | standard profile management |

PandaQuest follows the game locale (see "Languages"). `/pq lang <code>` picks another one, and
`/pq lang auto` goes back to the game's; reload the UI afterwards.

## Saved variables

`PandaQuestDB` (settings and profiles), `PandaQuestSync` (optional synchronisation data),
`PandaQuestAH` (auction scans) and `PandaQuestProf` (recipe books). The waypoint settings are
`waypoint` in the profile and the point or quest you chose is `waypoint` under the character, both
added in 0.2.198; nothing saved before them is changed.

Each one carries a `game` key, the game it was written in (`mop` for Mists of Pandaria Classic),
added the first time 0.2.194 or later loads it; nothing else in it is changed. If PandaQuest finds
saved data from another game -- for example after a `WTF` folder was copied from another install --
it does not delete it: the data is moved, unchanged, under `foreign` in the same saved variable, and
one chat line says so.

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

**Can I use it with Questie or QuestieDB?** Questie itself is not read or changed by PandaQuest. The separate QuestieDB addon (the database Questie reads) is used when it is installed — see "Compatibility". PandaQuest does not change Questie either way, and the two have
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
| QuestieDB | optional: when the QuestieDB addon is installed and enabled, PandaQuest reads its public API (`LibQuestieDB`) while its own database loads. Default: it **fills gaps** — a quest, NPC, object or item PandaQuest does not know is built from QuestieDB. `/pq` → General → *Quest database source* can switch it off or make QuestieDB's values win (takes effect after `/reload`). PandaQuest's own overrides are applied afterwards and still win. Nothing from QuestieDB is copied into this addon's files: it is read at run time and kept in memory. `/pq status` says what it did. |
| Questie | not used and not modified; not tested together in game |
| Leatrix Maps, Mapster, ElvUI map module | PandaQuest's pins are built to survive another addon rescaling or re-anchoring the world map; tested against a simulated client, not yet confirmed on a live one |
| HereBeDragons | embedded, shared with other addons that embed the same library |

## Languages

PandaQuest follows the game locale and ships **English** (`enUS`) and these translations, one file
each in `Locales/`:

| Code | Language | | Code | Language |
|---|---|---|---|---|
| `deDE` | German | | `koKR` | Korean |
| `esES` | Spanish (Spain) | | `ptBR` | Brazilian Portuguese |
| `esMX` | Spanish (Latin America) | | `ruRU` | Russian |
| `frFR` | French | | `zhCN` | Simplified Chinese |
| `itIT` | Italian | | `zhTW` | Traditional Chinese |
| `fiFI` | Finnish | | | |

`fiFI` is not a language the WoW client offers, so Finnish is chosen with `/pq lang fiFI` and a
reload. The others are picked automatically from the game's language, or with `/pq lang <code>`.

**The translations other than Finnish were produced with AI assistance and have not been reviewed
by native speakers.** They use the terms of the official game clients as closely as that allows, but
expect awkward wording and the odd wrong term. Corrections are welcome as issues or pull requests:
each file is a plain table of `["English text"] = "translation"` lines. A string a translation does
not have appears in English, so a partial translation is fine. The repository checks refuse a key
that does not exist, and a translation that drops or reorders a `%s` / `%d` the addon fills in.

Adding a language the client has is a new file in `Locales/` (copy a small one such as
`Locales/itIT.lua`), a line for it in `PandaQuest.toc` and `/pq lang` picks it up by itself.

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
- Reward items on the quest browser's page (the database has experience and reputation, not the items)
- Localized names for the quest browser's event and profession categories
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
- **Waypoint UI** by Adaptvx — the idea of a waypoint you see in the world, with a framed label and
  chevrons once you are close. PandaQuest's waypoints are their own code and art, built on
  nameplates, because the navigation frame that addon draws on does not exist in Mists of Pandaria
  Classic.
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
