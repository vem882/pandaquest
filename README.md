# PandaQuest

**Quest helper and navigator for Mists of Pandaria Classic (5.5.4, interface 50504).**

An arrow to your next quest objective, quest pins on the world map and minimap, gathering nodes
with respawn timers, flight times, archaeology and profession tools, and Wowhead links — English
and Finnish. It works fully on its own; synchronisation with the community portal is optional and
off by default.

The player-facing documentation — features, slash commands, settings, roadmap and credits — is
[`PandaQuest/README.md`](PandaQuest/README.md). This file is about the repository.

PandaQuest is free software under the **GNU General Public License v3** — see [`LICENSE`](LICENSE).

## Content and community

Much of Mists of Pandaria's data exists in no downloadable source, so PandaQuest's content is
completed from play and from contributors. The **PandaQuest portal, <https://pd.zroot.it>**, is
where that content is filled in and corrected, and where you can join in and help complete the
addon's data.

## Inspiration

PandaQuest is its own code, **inspired by** Questie, pfQuest, TomTom and the map addons it is built
to coexist with — it does not copy their code. Data and assets taken from other projects keep their
own terms; `PandaQuest/README.md`, "Credits and inspiration", lists exactly what.

## What is in this repository

This repository is the addon and the release tooling that turns it into a zip. Nothing else.

| | |
|---|---|
| `PandaQuest/` | the addon. This directory *is* what WoW installs, under exactly this name. |
| `LICENSE` | GPLv3. A copy also ships in `PandaQuest/`. |
| `assets/logo/` | the logo as SVG and PNG, 16 to 1024 px (400 px is the CurseForge avatar). Not part of the addon. |
| `.pkgmeta` | tells CurseForge's automatic packaging (the repository webhook) to take the `PandaQuest/` folder. |
| `.github/release/` | `build.py` (version, build identity, deterministic zip), `check.py` (the checks) and `curseforge.py` (optional upload). Not in the zip. |
| `.github/workflows/release.yml` | checks and builds the zip, publishes it as a release asset. |
| `.github/workflows/publish-curseforge.yml` | uploads an existing release to CurseForge, by hand. |

`PandaQuest/README.md`, `PandaQuest/changelog.txt`, `PandaQuest/CHANGELOG.md`, `PandaQuest/LICENSE` and
`PandaQuest/Textures/README.md` ship inside the release zip.

## Install

Unzip the release asset into your WoW AddOns directory, so that the addon ends up at
`World of Warcraft/_classic_/Interface/AddOns/PandaQuest`:

```sh
unzip PandaQuest-<version>.zip -d "/path/to/World of Warcraft/_classic_/Interface/AddOns"
```

Mists of Pandaria Classic uses the `_classic_` flavor folder.

## Release asset rules

The portal downloads this repository's release asset, so these four facts are the interface:

1. The asset is named exactly **`PandaQuest-<version>.zip`**.
2. `<version>` is **digits and dots only** (`^PandaQuest-(\d+(?:\.\d+)*)\.zip$`). A `v`, a hyphen
   or a short sha in the *file name* makes the package invisible, and the portal does not fail when
   that happens — it goes on offering the previous build. The tag carries a `v` (`v0.2.84`); the
   asset does not.
3. Every path inside the zip begins **`PandaQuest/`**, the folder WoW installs. The portal's
   update manifest is built from it, and an entry outside it is dropped.
4. The zip is **deterministic**: entries sorted by name, every timestamp `1980-01-01 00:00:00`,
   every mode bit `0644`, no directory entries.

`check.py` asserts all four against a zip it builds.

### The TOC files

The packaged zip carries the addon's TOC twice, with identical bytes: `PandaQuest.toc` and
`PandaQuest_Mists.toc`. The Mists of Pandaria Classic client reads the `_Mists` file first, CurseForge
reads the suffix to tag the file's game version, and the plain file is the fallback the portal's
package index reads. The second copy is generated at packaging time — a repository with two TOCs
would have two to keep in step — and `build.py` refuses a tree that contains one.
`## Interface: 50504` and `## AllowLoadGameType: mists` keep it from loading anywhere else.

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

`build.py package` refuses an `--out` name the portal could not see, **and** one whose version is
not the version this tree builds: the portal orders packages by the number in the *file name* and
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
not fall back — a depth-1 clone builds `PandaQuest-0.2.1.zip`, a name the portal's pattern matches
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

CurseForge also packages the repository itself through its webhook, using `.pkgmeta`. That package
is made by CurseForge's packager, not by `build.py`, so it is not the reference one: its TOC keeps the
declared `## Version: 0.2.0` and there is no `Core/Build.lua`. The release asset and the file the
workflow above uploads are the stamped, deterministic ones.

## What the checks cannot tell you

There is no Lua interpreter and no luacheck in this repository, so `check.py` cannot tell you the
addon *works*; it tells you the package is not obviously broken:

* the TOC parses and declares `## Interface`, `## Title` and `## Version`, and `## Interface` is
  `50504` by value and not merely by shape;
* every file the TOC lists exists, **with the case it is listed with** — Windows does not care and
  Linux does;
* every file `embeds.xml` pulls in exists too, recursively;
* nothing in the zip is unreachable from the packaged TOC's include graph, zero bytes, or from the
  development tree (`.py`, `.pyc`, `__pycache__`), and `Database/Data/` and `Libs/LibStub` are there;
* the four points of the release asset rules, against a freshly built zip, and both TOC files;
* the version is the series plus the measured commit count, the history behind it is not truncated,
  and the name it produces matches the portal's pattern;
* `changelog.txt` moved when the addon did, and is short English lines, newest version first.

Not checked anywhere in this repository: that every Lua file parses as Lua 5.1, that it lints clean,
and that it loads against the WoW API. A Lua syntax error would reach a player.

## Licence and credit

PandaQuest is © 2026 vem882 and released under the **GNU General Public License v3**
([`LICENSE`](LICENSE)). The quest database is built from Questie's Mists of Pandaria data (Questie is
also GPLv3). The embedded libraries under `PandaQuest/Libs/` — Ace3, LibStub, CallbackHandler,
LibDataBroker, LibDBIcon and HereBeDragons — and the icons under `PandaQuest/Textures/Icons/` keep
their own, GPL-compatible licences: `PandaQuest/Libs/LICENSE-Ace3.txt`, `PandaQuest/Libs/README.md`
and `PandaQuest/Textures/Icons/LICENSE.md`.
