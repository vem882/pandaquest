# PandaQuest

**Quest helper and navigator for World of Warcraft: Mists of Pandaria Classic (5.5.4), Classic Era (1.15),
The Burning Crusade Classic Anniversary (2.5) and WoW Forever (1.60).**

PandaQuest shows where your next quest objective is: an arrow, quest pins on the world map and
minimap, waypoints over quest NPCs' nameplates, gathering nodes with respawn timers, flight times,
and a browser for every quest in the game. It works on its own; sharing data with the PandaQuest
site is optional and off by default.

The website is **PandaBase — <https://pd.zroot.it>**: quest guides, NPCs, maps, flights and more, built from
Questie's data and from what players share.

This file covers the addon in short and then the repository. The full player guide (every
setting, slash command and FAQ) is [`PandaQuest/README.md`](PandaQuest/README.md).

## Install

1. Install **PandaQuest** and **PandaQuest Database** for the same game. The database is required.
2. Install **PandaQuest Auction** if you want in-game auction scans, price lookups or private sales tracking.
3. Restart WoW and type `/pq`.

For a manual install, download `PandaQuest-<version>.zip` from [GitHub Releases](https://github.com/vem882/pandaquest/releases).
Extract it to your game's `Interface/AddOns/` folder. Enable PandaQuest and PandaQuest Database in the
AddOns list. Keep PandaQuest Auction disabled if you only want the quest features. Individual archives
are also available on the same release page.

| Component | Repository | CurseForge project |
| --- | --- | --- |
| PandaQuest | [pandaquest](https://github.com/vem882/pandaquest) | [PandaQuest](https://www.curseforge.com/wow/addons/pandaquest) |
| PandaQuest Database | [pqDB](https://github.com/vem882/pqDB) | 1807827 |
| PandaQuest Auction | [pqAuction](https://github.com/vem882/pqAuction) | 1807835 |

## Usage

- **`/pq`** (or `/pandaquest`) opens the PandaQuest window. Tabs: **Quests**, **Status**,
  **Options**, **About & Help** and **Performance**. `/pq help` lists the commands.
- **Minimap button:** left-click opens the quest list, Shift-click shows or hides the arrow,
  right-click opens the options. It is also a LibDataBroker source for Titan Panel, ChocolateBar
  and similar bars.
- **`/way [zone] x y [label]`** sets a waypoint, in TomTom's syntax; `/way clear` removes it. If
  TomTom is installed, `/way` stays TomTom's.

## Features

- **Navigation arrow** to the next objective, turn-in or nearby quest, with distance and travel time.
- **Waypoints:** a label and chevrons (Pinpoint) over the target NPC's nameplate when close, a
  column of light with the distance when further away.
- **Quest browser** of every quest, with categories, filters, a zone map per quest and the quest's
  chain: which step it is, what comes next, and every step you have done.
- **Map pins** for objectives, turn-ins and available quests on the world map and minimap.
- **Quest-mob icons** on the nameplates of mobs your active quests need, plus a tooltip line.
- **Tooltips** on NPCs, items and pins: quests, level, respawn time, drop rate, and where an item
  comes from (the creatures that drop it, chests, containers, vendors).
- **Gathering nodes** (ore, herbs, fishing, chests, rares) with respawn countdowns, native WoW
  resource icons and gathering advice based on your current profession skill.
- **Flight times:** the flight master's tooltip shows the expected time before you fly, and a bar
  shows the time left during the flight. Your own measured flights come first, then the players'
  measured times from the site, then an estimate, marked as estimated.
- **Archaeology** dig-site bar and a profession recipe reader.
- **Tracker additions** and short notifications.
- **Links** to the quest's, NPC's or object's page on pd.zroot.it.
- **Languages:** English, every language the WoW client offers, and Finnish.
- **Optional:** TomTom (the target as a TomTom waypoint) and QuestieDB (fills gaps in the
  PandaQuest Database).

The addon is built on Ace3 (modules, timers, saved variables, options).

## Supported games

| Game | Interface | TOC | Quest database |
|---|---|---|---|
| Mists of Pandaria Classic | 50504 | `PandaQuest.toc`, `PandaQuest_Mists.toc` | `Database/Data/` |
| Classic Era | 11509 | `PandaQuest_Vanilla.toc` | `Database/Era/` |
| TBC Anniversary | 20506 | `PandaQuest_TBC.toc` | `Database/Anniversary/` |
| WoW Forever | 16001 | `PandaQuest_Forever.toc`, `PandaQuest_Camelot.toc` | `Database/Forever/` |

Each client loads the shared core and its own data from PandaQuest Database.
WoW Forever uses the live dataset, including the material gathered during its beta. Its
characters use their full two-part names; realms are not shown for Forever.
`Core/Game.lua` enables features per client: archaeology is specific to MoP, and Forever uses
its modern profession API for the local recipe reader. Combat-log kill counts remain unavailable
on clients that restrict the necessary events. `Core/Compat.lua` bridges client API differences.

The Sync app automatically discovers game installations and synchronizes supported games together,
with separate upload histories. It uploads character snapshots as well as recorded sessions and
refreshes the community guide in an already-installed addon. It does not install or update the
addon. Retail and PTR/beta folders can be detected, but full addon and hub support for those
clients is still in progress; do not treat detection as a claim of full support.


## Privacy and data sharing

- The addon **cannot send anything**; the WoW client does not allow it.
- Sharing is **off by default**. If you say yes (`/pq consent` or Options), the addon writes what
  you do while questing — quest progress, positions outside instances, flights, your gear, your
  guild's name and your rank in it — into `PandaQuestSync` in your SavedVariables. No chat, no names of other players, no bag contents.
- The separate **PandaQuest Sync** app, which you install and run yourself (from
  <https://pd.zroot.it/setup> or the Microsoft Store), reads that file and uploads it to the site.
- Turn sharing off at any time; nothing is recorded while it is off. The site's privacy statement
  is at <https://pd.zroot.it/privacy>.

## Licence and credits

PandaQuest is free software under the **GNU General Public License v3** ([`LICENSE`](LICENSE)),
© 2026 vem882.

- **Questie:** the quest, NPC, object and item database is built from Questie's Mists of Pandaria
  data (GPLv3).
- **Libraries:** Ace3, LibStub, CallbackHandler, LibDataBroker, **LibDBIcon** and **HereBeDragons**,
  embedded unchanged under their own licences ([`PandaQuest/Libs/README.md`](PandaQuest/Libs/README.md)).
- **InFlight** (MIT): PandaQuest uses InFlight's approach to noticing a flight on this client; no
  InFlight code is copied.
- **pfQuest** (MIT): respawn times and drop rates for older content, and map icons
  (`PandaQuest/Textures/Icons/LICENSE.md`).
- Inspired by Questie, pfQuest, TomTom and Waypoint UI; PandaQuest is its own code.
  [`PandaQuest/README.md`](PandaQuest/README.md) has the full list.

World of Warcraft is a trademark of Blizzard Entertainment. PandaQuest is a fan project and is not
affiliated with or endorsed by Blizzard.

## Content and community

Much of Mists of Pandaria's data (Pandaria's nodes, respawn times, flight times) exists in no
downloadable source, so it is measured from play. The site at <https://pd.zroot.it> is where that
data is collected and corrected, and every two hours the site's data sync brings it into this
repository as a new release (see "Data from the portal"). Report bugs at
<https://github.com/vem882/pandaquest/issues> or on the site's bugtracker.

## Build and release

This repository owns the core Lua code, the game compatibility layer and the shared release workflow.
`components.json` pins the exact database and auction commits used by the release. The build checks out
both pins, validates every game's TOC and builds four versioned ZIPs.

| ZIP | Contents |
| --- | --- |
| `PandaQuest-<version>.zip` | All three AddOns folders, for manual installation |
| `PandaQuest-Core-<version>.zip` | Core only, CurseForge project 1735809 |
| `PandaQuestDB-<version>.zip` | Game datasets, project 1807827 |
| `PandaQuestAuction-<version>.zip` | Optional auction features, project 1807835 |

The release version is `0.2.<commits reachable from HEAD>`. The release workflow tests pull requests
and publishes from `main` using the checked bytes. Source TOCs are generated with
`python3 .github/release/build.py tocs`. Use a full Git checkout to build the stamped core.
After checking out the pinned components, run:

```sh
export PQ_DATABASE_DIR="$PWD/.components/database/PandaQuestDB"
export PQ_AUCTION_DIR="$PWD/.components/auction/PandaQuestAuction"
python3 .github/release/check.py -v
version="$(python3 .github/release/build.py version)"
python3 .github/release/build.py package --out "dist/PandaQuest-Core-$version.zip"
python3 .github/release/components.py --core "dist/PandaQuest-Core-$version.zip" \
  --database .components/database --auction .components/auction --out dist
```

For CurseForge, run **Upload existing release to CurseForge** for the release tag and select a
component. The workflow checks that each file targets its own project. Publish and approve the first
Database file before publishing the split core. Set the repository variable `CF_DATABASE_SLUG` to
the Database project's CurseForge slug so CurseForge can install the required dependency. Auction
depends on the core, and can be published once the split core is available. Use the workflow's
versioned archives for distribution. The older source webhook should be disabled at cutover to avoid
publishing a second, unversioned package.

PandaBase generates quest data and the downloadable community guide. The static files live in
[pqDB](https://github.com/vem882/pqDB), and auction scan targets live in
[pqAuction](https://github.com/vem882/pqAuction). The Sync app still writes the community guide into
the installed core. Core keeps ownership of existing game settings, telemetry and auction
SavedVariables so updates preserve player data.

Each component repository checks pull requests and publishes a GitHub release from its main
branch. The version advances once for each new commit since its v0.2.624 release. The
`pq-component-publish.timer` on bananavm runs `.github/release/publish-component-files.sh`
every ten minutes. It dispatches the CurseForge upload for each new component release.
`components.json` and `component-versions.json` identify the packages used by the core release.
