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

## Install

1. Download the release zip and unzip it into `World of Warcraft/_classic_/Interface/AddOns/`
   (or install it with the CurseForge app).
2. Make sure the folder is named exactly `PandaQuest` and contains `PandaQuest.toc`.
3. Restart the game, or `/reload` if it was already running.

Optional: **TomTom** is detected automatically when present.

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

- The quest/NPC/object/item database is built from Questie's Mists of Pandaria data.
- Respawn timers and drop rates for Vanilla and Burning Crusade come from pfQuest's database (MIT).
- Map icons in `Textures/Icons/` are the MIT-licensed icons from pfQuest/Questie
  (`Textures/Icons/LICENSE.md`).
- Embedded libraries (Ace3, LibStub, CallbackHandler, LibDataBroker, LibDBIcon, HereBeDragons)
  keep their own licences (`Libs/README.md`).

## Source

<https://github.com/vem882/pandawow_addon> — issues and pull requests welcome.
