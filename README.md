# PandaQuest

**Quest helper and navigator for World of Warcraft: Mists of Pandaria Classic (5.5.4), Classic Era (1.15),
The Burning Crusade Classic Anniversary (2.5) and WoW Forever (1.60).**

PandaQuest shows where your next quest objective is: an arrow, quest pins on the world map and
minimap, waypoints over quest NPCs' nameplates, gathering nodes with respawn timers, flight times,
and a browser for every quest in the game. It works on its own; sharing data with the PandaQuest
site is optional and off by default.

The site is **<https://pd.zroot.it>**: quest guides, NPCs, maps, flights and more, built from
Questie's data and from what players share.

This file covers the addon in short and then the repository. The full player guide (every
setting, slash command and FAQ) is [`PandaQuest/README.md`](PandaQuest/README.md).

## Install

- **CurseForge app** or **Wago app**: search for *PandaQuest* and install it.
- **By hand:** download `PandaQuest-<version>.zip` from
  [GitHub releases](https://github.com/vem882/pandaquest/releases) and unzip it into
  `World of Warcraft/<game folder>/Interface/AddOns/` (`_classic_` for MoP, `_classic_era_`,
  `_anniversary_` or `_forever_` for the others), so that the folder is
  `AddOns/PandaQuest/PandaQuest.toc`. Releases marked *Pre-release* are betas.

Restart the game, or `/reload` if it was running.

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
- **Gathering nodes** (ore, herbs, fishing, chests, rares) with respawn countdowns.
- **Flight times:** the flight master's tooltip shows the expected time before you fly, and a bar
  shows the time left during the flight. Your own measured flights come first, then the players'
  measured times from the site, then an estimate, marked as estimated.
- **Archaeology** dig-site bar and a profession recipe reader.
- **Tracker additions** and short notifications.
- **Links** to the quest's, NPC's or object's page on pd.zroot.it.
- **Languages:** English, every language the WoW client offers, and Finnish.
- **Optional:** TomTom (the target as a TomTom waypoint) and QuestieDB (fills gaps in the
  built-in database).

The addon is built on Ace3 (modules, timers, saved variables, options).

## Supported games

| Game | Interface | TOC | Quest database |
|---|---|---|---|
| Mists of Pandaria Classic | 50504 | `PandaQuest.toc`, `PandaQuest_Mists.toc` | `Database/Data/` |
| Classic Era | 11509 | `PandaQuest_Vanilla.toc` | `Database/Era/` |
| TBC Anniversary | 20506 | `PandaQuest_TBC.toc` | `Database/Anniversary/` |
| WoW Forever | 16001 | `PandaQuest_Forever.toc`, `PandaQuest_Camelot.toc` | from its launch, 4 November 2026 |

One download: each game's TOC loads the shared code and only its own game's database. WoW Forever has
no quest data until its launch (no beta data); until then the addon loads there and says so in one
line. `Core/Game.lua` detects the game and switches off what a game does not have (archaeology and the
dig-site bar are MoP's; the WatchFrame tracker distances use MoP's tracker; in Forever the recipe
scanner and combat-log kill counts are off for now); `Core/Compat.lua` bridges Forever's
Mainline-family API. The other games' databases are built by the portal's
`tools/build_db.py --flavour Vanilla|TBC|Forever` from the same Questie bundle as MoP's. Retail is not
supported.

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

## What is in this repository

This repository is the addon and the release tooling that turns it into a zip. Nothing else.

| | |
|---|---|
| `PandaQuest/` | the addon. This directory *is* what WoW installs, under exactly this name. |
| `LICENSE` | GPLv3. A copy also ships in `PandaQuest/`. |
| `assets/logo/` | the logo as SVG and PNG, 16 to 1024 px (400 px is the CurseForge avatar). Not part of the addon. |
| `.pkgmeta` | tells CurseForge's automatic packaging (the repository webhook) to take the `PandaQuest/` folder. |
| `data-sync.json` | where the PandaQuest portal's data sync left off (see "Data from the portal"). Not part of the addon. |
| `.github/release/` | `build.py` (version, build identity, TOCs, deterministic zip), `PandaQuest.toc.template` and `games.py` (what the TOCs are written from), `check.py` (the checks) and `curseforge.py` (optional upload). Not in the zip. |
| `.github/workflows/release.yml` | checks and builds the zip, publishes it as a release asset. |
| `.github/workflows/publish-curseforge.yml` | uploads an existing release to CurseForge, by hand. |

`PandaQuest/README.md`, `PandaQuest/changelog.txt`, `PandaQuest/CHANGELOG.md`, `PandaQuest/LICENSE` and
`PandaQuest/Textures/README.md` ship inside the release zip.

## The release asset

Every release carries one asset, and `build.py` and `check.py` hold it to four facts:

1. The asset is named exactly **`PandaQuest-<version>.zip`**, digits and dots only. A `v`, a hyphen
   or a short sha in the *file name* is refused. (The tag is another matter: `v0.2.84`, and
   `v0.2.84-beta` for a beta — see "The release channel".)
2. `<version>` is **`0.2.<commit count>`** — see "The version".
3. Every path inside the zip begins **`PandaQuest/`**, the folder WoW installs.
4. The zip is **deterministic**: entries sorted by name, every timestamp `1980-01-01 00:00:00`,
   every mode bit `0644`, no directory entries.

Players get the addon from CurseForge. The GitHub release is where the zip is built, checked and
published once; `publish-curseforge.yml` sends that same zip (see "Releasing"). The PandaQuest portal
no longer downloads the addon, but the digits-only name is still enforced: it keeps the version
unambiguous and anything that sorts releases by the number reads it the same way.

### The TOC files

The packaged zip carries one TOC per game (see "Supported games"), each listing only its own game's
database. The MoP pair (`PandaQuest.toc`, `PandaQuest_Mists.toc`) and the Forever pair (`_Forever`,
`_Camelot`) have identical bytes. The plain file is MoP's and the fallback a package index reads; its
`## AllowLoadGameType: mists` keeps it from loading anywhere else.

Every TOC is written from one template, `.github/release/PandaQuest.toc.template`, filled from
`.github/release/games.py`: one row per game with its `## Interface`, its `## Notes`, the lines only
its TOC has and the TOC lines of its database. The saved-variables line is the template's, the same
in every TOC (PandaQuestAH included, as a retired variable nothing touches).

Every one of those TOCs is committed in `PandaQuest/`, because CurseForge's own packager ships the
tree as it is and tags the file with a game for each TOC it finds (see "The CurseForge webhook
package"). **Edit the template, not the TOCs**, then run `python3 .github/release/build.py tocs`,
which writes all six; `check.py` and `build.py package` refuse a tree where any of them is missing or
not byte for byte what the template makes, and `check.py` also refuses a TOC no game writes.

`curseforge.py` tags the uploaded file from the package's own TOCs: each `## Interface` number is
mapped to its game and game version (50504 is Mists of Pandaria Classic `5.5.4`, 11509 Classic Era
`1.15.9` under type 67408, 20506 TBC Anniversary `2.5.6` under 73246, 16001 Forever `1.60.1` under 88568),
and the CurseForge
game version is looked up by its name and its game version type together, because a name alone can
belong to two games.

## The version

**`0.2.<number of commits reachable from HEAD>`**. The series comes from `## Version` in
`PandaQuest/PandaQuest.toc`; `build.py` appends the commit count at packaging time. Nothing writes
the third component down, because writing it down would change it. Every commit that lands on `main`
makes a new version, whether or not it touches a file a player downloads.

A pull request that changes `PandaQuest/` must also add a line to `PandaQuest/changelog.txt`
(newest version first, one short line per change, e.g. `quest 123 - Name - added`); `check.py`
fails otherwise, so the number moving always comes with a line about why. The section header is the
version the merge will produce: this repository's commit count after the merge commit.

The number is only required to move and never to go backwards. It does not encode how much changed.
To start a new series, change `## Version` in the TOC (`0.3.0` sorts above every `0.2.N`).

## The release channel

`## X-Release-Channel: beta` in `PandaQuest/PandaQuest.toc` marks every build from that tree as a
**beta** — the state a new feature is in until somebody has seen it work in the game. A beta says so
in four places, and none of them is the asset's file name, which the asset-name pattern keeps digits-only:

* the packaged `## Title` ends in an orange `beta`, which is what the AddOns list draws;
* `ns.Build.channel` is `"beta"`, and `/pq status` prints that this is a beta build;
* the release **tag** is `v<version>-beta` (CurseForge's packaging reads the word `beta` in a tag to
  label the file a beta, and the changelog and the reservation tag follow the tag);
* the GitHub release is created with the *prerelease* flag, so it is never "Latest".

`## Version` and the asset name are unchanged: `0.2.140` and `PandaQuest-0.2.140.zip`. A beta's
version sorts with the stable ones — the number is the commit count either way.

To ship a stable build, delete the line (or write `stable`) in a pull request that also names, in
`changelog.txt`, what has been seen to work.

## The build identity

`0.2.84+<short sha>`, and `+dirty` when `PandaQuest/` differs from that commit — tracked changes
*or* untracked files, because `build.py` packages the tree as it stands. It reaches the package four
ways, all derived from the commit and never from the clock:

* the packaged TOC's `## Title` — what the in-game AddOns list draws;
* the packaged TOC's `## Version` — which the addon reads into `Const.VERSION` and `/pq status`
  prints;
* `PandaQuest/Core/Build.lua`, generated at packaging time and listed first in the packaged TOC. It
  sets `ns.Build` and carries the commit *date*. It is not in the repository, and `check.py` fails if
  anybody commits one;
* the zip's archive comment, a JSON object with the commit subject and date.

## Building it yourself

No toolchain, no install step. Python 3.9 or newer, and git for the version:

```sh
python3 .github/release/check.py          # the checks; -v names each one
python3 .github/release/build.py version  # 0.2.<count>, whatever this checkout reaches
python3 .github/release/build.py identity # the build identity as shell lines, or --json
python3 .github/release/build.py package --out "dist/PandaQuest-$(python3 .github/release/build.py version).zip"
```

`build.py package` refuses an `--out` name a consumer could not see, **and** one whose version is
not the version this tree builds: a consumer orders packages by the number in the *file name* and
reads the manifest's version out of the *archive comment*, so a single mistyped digit would sort at
one version and advertise another. It also refuses to build from a shallow clone, or with no git —
see "Releasing".

**On determinism.** Two builds of the same tree produce the same bytes, and the workflow proves it
on every run by building twice and comparing sha256. That is a claim about one machine and one zlib;
what the contract needs is that nothing from the clock, the umask or the directory order gets into
the archive, and that is what is checked.

## Releasing

Merging into `main` runs `.github/workflows/release.yml` on a GitHub-hosted runner: it runs
`check.py`, builds the zip twice and compares them, and publishes it as the asset of a release tagged
`v<version>`. A pull request runs everything except the publish, and attaches the zip it built as a
run artifact, so a change can be installed and played before it is merged.

The checkout uses `fetch-depth: 0` and must keep doing so. A shallow clone does not fail and does
not fall back — a depth-1 clone builds `PandaQuest-0.2.1.zip`, a name the asset-name pattern matches
happily and sorts below every package it holds. So `build.py package` refuses it (and a checkout
with no git at all); `--allow-shallow` and `--allow-no-git` build anyway, for a local experiment
whose file name is wrong on purpose.

The publish is checked rather than announced: before uploading, the workflow fails if this version
does not sort above the highest existing release; the upload is skipped when the release already
carries this asset at this byte count; and afterwards it reads the release back and fails unless it
is published (not a draft) and carries `PandaQuest-<version>.zip` at exactly the size that was built.

**CurseForge** is a separate, manual step with its own workflow,
`.github/workflows/publish-curseforge.yml`. It uploads an *existing* release — the zip the GitHub
release carries, with `changelog.txt` as it was at that release — and builds nothing. Start it by
hand (Actions → *Upload existing release to CurseForge*, tag `latest` or e.g. `v0.2.125`) once there
is something worth a new file. It needs the `CF_API_TOKEN` repository secret; the project is the one
the package's TOC names (`## X-Curse-Project-ID`). A `curseforge/<tag>` reservation tag stops the
same release being sent twice.

### The CurseForge webhook package

CurseForge also packages the repository itself through its webhook (GitHub → Settings → Webhooks, a
push hook to the URL the CurseForge project's source settings give), using `.pkgmeta`. That package
is made by CurseForge's packager, not by `build.py`, so it is not the reference one: its TOCs keep the
declared `## Version: 0.2.0` and there is no `Core/Build.lua`. The release asset and the file the
workflow above uploads are the stamped, deterministic ones.

It carries all four games: every TOC is committed (see "The TOC files") and `.pkgmeta` leaves no
game's database out. How the file gets tagged for each game:

* CurseForge's own packager is not open source and its documentation does not say how it reads game
  versions. [Preparing the PackageMeta file](https://support.curseforge.com/support/solutions/articles/9000197952-preparing-the-packagemeta-file)
  covers only `ignore`, `move-folders`, `manual-changelog` and externals (and says `ignore` is applied
  before `move-folders`, which is why the paths in `.pkgmeta` start with `PandaQuest/`);
  [Multi-TOC for World of Warcraft Addons](https://support.curseforge.com/support/solutions/articles/9000209856-multi-toc-for-world-of-warcraft-addons)
  says each TOC must start with the folder's name and carry the interface number of its game. CurseForge
  answered the request to read game versions from every TOC ([CF-I-1832](https://curseforge-ideas.overwolf.com/ideas/CF-I-1832))
  as "Already exists": "You can now tag multiple interface versions/flavours and upload multi TOC files".
* The BigWigs packager follows the same `.pkgmeta` conventions and documents the rule
  ([README](https://github.com/BigWigsMods/packager#readme), "every interface value in every
  (non-external) TOC file will be included as a supported version"). Its `release.sh` looks for
  `<name>.toc` and `<name>[-_]{Mainline,Classic,Vanilla,BCC,TBC,Wrath,WOTLKC,Cata,Mists,Camelot}.toc`,
  maps each `## Interface` number to a game (`11xxx` Classic Era, `16xxx` Forever, `20xxx` TBC,
  `50xxx` Mists…), accepts comma-separated `## Interface:` values, and refuses a suffixed TOC whose
  number is another game's. **`_Forever` is not in that list; `_Camelot` is**, which is why Forever ships
  both (identical bytes): `_Camelot` gets the file tagged, and the client reads either
  ([TOC format](https://warcraft.wiki.gg/wiki/TOC_format#Naming): `_Forever` or `_Camelot` for Forever,
  `_Mists`, `_TBC` for TBC Classic and Anniversary, `_Vanilla` for Classic Era).

So each game has a TOC under a recognised suffix with its own single `## Interface` number, which is the
layout both rules tag for every game. If a webhook file ever shows only Mists of Pandaria Classic,
CurseForge's packager is reading the plain TOC alone; the fix would then be comma-separated interfaces in
the plain TOC (harmless in game, since every shipped client reads its own suffixed TOC first), or tagging
the file by hand.

## Data from the portal

The quest database reaches this repository through the PandaQuest portal, never around it: whatever
the addon ships has been on the portal first. Every two hours the portal's data sync compares the
portal with `main` and, when something changed, opens a pull request from a `data/sync-<time>` branch
and squash-merges it once the checks pass. It touches only:

* `PandaQuest/Database/Data/` and `ZoneData.lua`, rebuilt only when the portal has imported a
  different Questie release than the one the files were built from;
* `PandaQuest/Database/Overrides/Wowhead.lua` — what the portal read off Wowhead that the addon can
  use, only where the generated database has nothing of its own (`Database/DB.lua` applies it
  gap-only too, so it never replaces a value of Questie's):
  - quests: givers, hand-ins, the objective line, the zone, map points for objectives the database
    cannot place; and as fields Questie does not have, the money, the reward items (given and
    "choose one", with counts), the quest giver's text, and the experience where Questie has no
    figure — read with `DB.GetQuestRewards` and `DB.GetQuestDescription`;
  - NPCs and objects: where they stand (`spawns`, `zoneID`) when the database has no place for them,
    a whole row for one a quest names but the database lacks, and an NPC's level range, rank and title;
* `PandaQuest/Database/Overrides/Portal.lua` — the portal's moderator corrections, `hidden` included;
  applied last, so a correction always wins;
* `PandaQuest/Database/Overrides/Flights.lua` — the flight time of every direct flight in the
  taxi network: the players' measured median where at least two flights back it, otherwise an
  estimate from the path length, marked as estimated; plus measured multi-hop chains;
* `PandaQuest/changelog.txt` and `PandaQuest/CHANGELOG.md` — one section per release, under the
  version the merge produces, listing every quest, NPC, object and item whose data in the addon
  changed in it (`quest 123 - Name - updated`), each with indented lines saying what changed;
* `data-sync.json` — the last portal changelog line it looked at, and the portal's lines about an
  entity whose data has not reached the addon yet (`pending_change_ids`), written with the release
  that data arrives in or dropped after a week.

There is no release without data: a sync that would change nothing under `PandaQuest/Database`
commits nothing, however many lines the portal's own changelog gained — what happened only on the
portal (an item's Wowhead tooltip, say) never appears here. It does not upload to CurseForge unless
its operator turned that on, and then at most once a day. The sync runs on the portal's development box
(`tools/addon_sync.py` and `deploy/addonsync/` in vem882/pandawow).

## What the checks cannot tell you

There is no Lua interpreter and no luacheck in this repository, so `check.py` cannot tell you the
addon *works*; it tells you the package is not obviously broken. The one exception is
`.github/release/lua_checks.py`, which `check.py` runs when `lupa` (Lua 5.1 for Python) is
installed and reports as skipped where it is not, as on the GitHub runner: it runs `Core/Game.lua`
(which game a client is, the database check) and the saved-variable fixtures in
`.github/release/fixtures/savedvariables/` (files written by 0.2.99, 0.2.191 and this version) and
holds that each comes through with only `game` added, or set aside whole under `foreign`.

* the TOC parses and declares `## Interface`, `## Title` and `## Version`, and `## Interface` is
  `50504` by value and not merely by shape;
* every file the TOC lists exists, **with the case it is listed with** — Windows does not care and
  Linux does;
* every file `embeds.xml` pulls in exists too, recursively;
* nothing in the zip is unreachable from the packaged TOC's include graph, zero bytes, or from the
  development tree (`.py`, `.pyc`, `__pycache__`), and `Database/Data/` and `Libs/LibStub` are there;
* the four points of the release asset rules, against a freshly built zip, and both TOC files;
* the repository's TOC is what the template makes, byte for byte, and every TOC maps to a game
  version and a CurseForge game version type;
* the version is the series plus the measured commit count, the history behind it is not truncated,
  and the name it produces matches the asset-name pattern;
* `changelog.txt` moved when the addon did, and is short English lines, newest version first;
* the data files the portal's sync writes are loaded before `DB.lua`, build their tables, and stay
  under the size the sync itself refuses to go past.

Not checked anywhere in this repository: that every Lua file parses as Lua 5.1, that it lints clean,
and that it loads against the WoW API. A Lua syntax error would reach a player. (The portal
repository's tools run those against this tree: `tools/syntax_check.py`, `tools/luacheck_runner.py`
and the `tools/wowstub` tests.)

