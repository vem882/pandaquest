# PandaQuest

**Quest helper and navigator for Mists of Pandaria Classic (5.5.4, interface 50504).**

An arrow to your next quest objective, quest pins on the world map and minimap, gathering nodes
with respawn timers, flight times, archaeology and profession tools, and Wowhead links — English
and Finnish. It works fully on its own; synchronisation with the community portal is optional and
off by default.

The player-facing documentation — features, slash commands, settings, roadmap and credits — is
[`PandaQuest/README.md`](PandaQuest/README.md). This file is about the repository.

## Content and community

Much of Mists of Pandaria's data exists in no downloadable source, so PandaQuest's content is
completed from play and from contributors. The **PandaQuest portal, <https://pd.zroot.it>**, is
where that content is filled in and corrected, and where you can join in and help complete the
addon's data.

## Inspiration

PandaQuest is its own code, **inspired by** Questie, pfQuest, TomTom and the map addons it is built
to coexist with — it does not copy their code. Data and assets taken from other projects keep their
own terms; `PandaQuest/README.md`, "Credits and inspiration", lists exactly what.

## What is here

| | |
|---|---|
| `PandaQuest/` | the addon. This directory *is* what WoW installs, under exactly this name. |
| `assets/logo/` | the logo as SVG and PNG at 16 to 1024 px. Not part of the addon. |
| `curseforge/` | the CurseForge summary, project description and the publishing checklist. |
| `.github/release/` | release tooling (`build.py`, `check.py`, `curseforge.py`). Not part of the addon and not in the zip. |
| `.github/workflows/release.yml` | builds the zip, publishes it as a release asset and, once configured, uploads it to CurseForge. |

`PandaQuest/README.md`, `PandaQuest/CHANGELOG.md` and `PandaQuest/Textures/README.md` ship inside
the release zip — they are the addon's own documentation and they go where the addon goes.

## What is not here, and where it is

Everything else lives in the platform repository, **<https://github.com/vem882/pandawow>**: the
hub (FastAPI, the site players log in to), the Go sync engine, the Electron companion app, the
deploy, the CI pipeline, the database tooling in `tools/`, the docs, and `.luacheckrc` — which is
not a standalone file, since it reads the WoW global list out of `tools/wowapi/wow_std.lua`, so it
stayed with the linter it configures. Nothing in this repository imports from there and nothing
there imports from here. The two are joined by one thing only, and it is a file:

## The contract

The platform repository **downloads this repository's release asset**. Not a submodule, not a
checkout. So the release is an interface between two codebases, and these four facts are the
whole of it:

1. The asset is named exactly **`PandaQuest-<version>.zip`**.
2. `<version>` is **digits and dots only**. The hub finds packages with
   `^PandaQuest-(\d+(?:\.\d+)*)\.zip$` and orders them with
   `tuple(int(part) for part in version.split("."))`. A `v`, a hyphen or a short sha anywhere in
   the *file name* makes the package invisible — and the hub does not fail when that happens, it
   goes on offering the previous build with nothing anywhere saying why.
3. Every path inside the zip begins **`PandaQuest/`**. That is the folder name WoW installs, and
   it is also what the hub's update manifest is built from: `_safe_member` drops every entry that
   does not start with that prefix, and `index_package` then answers `503 … has no
   PandaQuest.toc in it` because the TOC was one of the entries it dropped. So a zip packed
   without the folder does not produce a wrong manifest — it produces no package at all.
4. The zip is **deterministic**: entries sorted by name, every timestamp `1980-01-01 00:00:00`,
   every mode bit `0644`, no directory entries.

`.github/release/check.py` asserts all four against a zip it builds, and it carries the hub's regex verbatim so
that the assertion is about the hub's rule and not about a paraphrase of it.

The tag carries a `v` (`v0.2.84`) and the asset does not. Tags are read by humans; the file name
is read by the hub.

## The version

**`0.2.<number of commits reachable from HEAD>`** — `0.2.84` at the split. The series comes from
`## Version` in `PandaQuest/PandaQuest.toc`; `.github/release/build.py` appends the commit count at packaging
time. Nothing writes the third component down, because writing it down would change it: the
commit that recorded 84 would be commit 85.

Why the count, and not a number somebody bumps: the patch component used to live in a file, which
means somebody had to remember it. The only package in the platform repository's `dist/` is
`PandaQuest-0.1.0.zip`, built from commit `0f19433` — the version that is written down, not one
that moved. (How long it had been that way is not measured here, and neither is whether every
earlier release said the same; what is measured is that the newest one did.) A number that moves
by itself is the fix, and the commit count is the only such number that is digits, monotonic, and
free.

**Why `0.2` and not `0.1`.** The commit count is a per-repository counter, and the two
repositories' counters are not comparable. Measured at the split, with this repository's `main` at
`082c57d`: **84** commits here, **390** in the platform repository, whose next build would
therefore produce `PandaQuest-0.1.390.zip` (`python3 ci/lib/addon_build.py version` prints
`0.1.390`). Publishing `0.1.84` from here would hand the hub a package that sorts *below* that one
— `(0, 1, 84) < (0, 1, 390)` — and the hub does not fail on that; it goes on offering whatever
sorts highest, silently, exactly the failure mode point 2 warns about. Bumping the minor once, at
the split, makes every number this repository will ever produce sort above every number the other
one can: `(0, 2, 84) > (0, 1, 390)`, and it stays true for as long as the series does. It is also
honest — moving the addon into its own repository is a minor-version event if anything is.

The counter restarts at a small number because this repository's history was filtered to the
commits that touched `PandaQuest/`. That is a fact about the past and not a promise about the
future: every commit that lands here from now on bumps the version, whether or not it changes a
file a player downloads — a change to `.github/release/build.py`, to `.github/release/check.py`, to the workflow or to this README
counts exactly as much as a change to the addon.

The number is only required to move and never to go backwards. It does not encode how much
changed, and a commit here that leaves `PandaQuest/` untouched still produces a new version — the
zip then differs from its predecessor only in the stamped identity. That is the accepted cost of
a counter that nobody has to maintain.

## The build identity

`0.2.84+<short sha>`, and `+dirty` when `PandaQuest/` differs from that commit — tracked changes
*or* untracked files, because `.github/release/build.py` packages the tree as it stands and a package claiming a
commit it does not contain is a lie a bug report cannot see through. Only `PandaQuest/` counts:
editing this README does not change a byte a player downloads.

It reaches the package four ways, all of them derived from the commit and never from the clock:

* the packaged TOC's `## Title` — what the in-game AddOns list draws, so a player can see at a
  glance that the update arrived;
* the packaged TOC's `## Version` — which the addon reads into `Const.VERSION` and `/pq status`
  prints;
* `PandaQuest/Core/Build.lua`, generated at packaging time and listed first in the packaged TOC.
  It sets `ns.Build` and carries the commit *date*, the one fact `## Version` cannot hold. It is
  not in the repository, and `.github/release/check.py` fails if anybody commits one;
* the zip's archive comment, a JSON object with the commit subject and date, which is where the
  hub reads what /setup shows.

## Building it yourself

No toolchain, no install step. Python 3.9 or newer, and git for the version:

```sh
python3 .github/release/check.py                  # the checks; -v names each one
python3 .github/release/build.py version          # 0.2.<count>, whatever this checkout reaches
python3 .github/release/build.py identity         # the build identity as shell lines, or --json
python3 .github/release/build.py package --out "dist/PandaQuest-$(python3 .github/release/build.py version).zip"
```

`build.py package` refuses an `--out` name the hub could not see, **and** one whose version is not
the version this tree builds. Both halves are needed. The shape alone would let
`PandaQuest-0.2.9.zip` through for a tree that builds `0.2.94`: the hub orders packages by the
number in the *file name* and reads the manifest's version out of the *archive comment*, so a
single mistyped digit produces a package it sorts at one version and advertises as another. It
also refuses to build at all from a shallow clone, or with no git — see "Releasing".

**On determinism.** Two builds of the same tree produce the same bytes, and the workflow proves it
on every run by building twice and comparing sha256. That is a claim about one machine and one
zlib. Byte-for-byte equality across different machines has **not** been tested and is not
promised; what the contract needs is that nothing from the clock, the umask or the directory order
gets into the archive, and that is what is checked.

## Installing it

Unzip the release asset into your WoW AddOns directory, so that the addon ends up at
`World of Warcraft/_classic_/Interface/AddOns/PandaQuest`:

```sh
unzip PandaQuest-<version>.zip -d "/path/to/World of Warcraft/_classic_/Interface/AddOns"
```

MoP Classic uses the `_classic_` flavor folder. There is no installer script here — the platform
repository has one (`tools/install.py`), and it stayed there with the rest of the toolchain.

## Releasing

Merging into `main` runs `.github/workflows/release.yml` on a GitHub-hosted runner: it runs
`.github/release/check.py`, builds the zip twice and compares them, and publishes it as the asset of a release
tagged `v<version>`. A pull request runs everything except the publish, and attaches the zip it
built as a run artifact, so a change can be installed and played before it is merged.

The checkout uses `fetch-depth: 0` and must keep doing so. A shallow clone does not fail and does
not fall back — measured, a depth-1 clone of this repository builds `PandaQuest-0.2.1.zip`, a name
the hub's pattern matches happily and sorts below every package it holds. A checkout with no git at
all is quieter still: `release_version` then falls back to the TOC's declared series and builds
`PandaQuest-0.2.0.zip`, a number that also matches the pattern and never moves again. So
`build.py package` refuses both — `--allow-shallow` and `--allow-no-git` build anyway, for a local
experiment whose file name is wrong on purpose — and `.github/release/check.py` asserts both refusals and that the
`fetch-depth: 0` line is still in the workflow.

The publish itself is checked rather than announced. Before uploading, the workflow lists the
releases that already exist and fails if this version does not sort above the highest of them; the
upload is skipped entirely when the release already carries this asset at this byte count, so the
destructive `--clobber` path is only reached when there is nothing working to lose; and afterwards
it reads the release back and fails unless it is published (not a draft) and carries
`PandaQuest-<version>.zip` at exactly the size that was built.

## Checks, and what they cannot tell you

There is no Lua interpreter and no luacheck in this repository. The platform repository keeps
those, and `.github/release/check.py` deliberately does not try to reproduce them. So the checks cannot tell you
the addon *works*; they tell you the package is not obviously broken:

* the TOC parses and declares `## Interface`, `## Title` and `## Version`, and `## Interface` is
  `50504` by value and not merely by shape;
* every file the TOC lists exists, **with the case it is listed with** — Windows does not care and
  the Linux machines that build and serve this do;
* every file `embeds.xml` pulls in exists too, recursively, since the TOC lists the XML and not
  the libraries inside it;
* nothing in the zip is unreachable from the packaged TOC's include graph, zero bytes, or from the
  development tree (`.py`, `.pyc`, `__pycache__`), and `Database/Data/` and `Libs/LibStub` are
  there — a tree checked out without the generated database still packages happily;
* the four points of the contract above, against a freshly built zip;
* the version is the series plus the measured commit count, the history behind it is not
  truncated, and the name it produces matches the hub's own regex.

**What is genuinely given up by the split**, and is not checked anywhere in this repository: that
every Lua file parses as Lua 5.1 (`tools/syntax_check.py`), that it lints clean against the
addon's globals (`tools/luacheck_runner.py` and `.luacheckrc`), and that it loads and runs against
the WoW API stubs (`tools/tests`). All three need the toolchain, and the toolchain stayed in the
platform repository. Until something here can run them, a Lua syntax error reaches a player.

## Licence and credit

Author: vem882 (`## Author` in the TOC). Inspiration and third-party data are listed in
`PandaQuest/README.md`.

The embedded libraries under `PandaQuest/Libs/` — Ace3, LibStub, CallbackHandler, LibDataBroker,
LibDBIcon and HereBeDragons — are other people's work and keep their own terms. What is written
down here is `PandaQuest/Libs/LICENSE-Ace3.txt`, `PandaQuest/Libs/README.md` and
`PandaQuest/Textures/Icons/LICENSE.md`; read those. This repository declares no licence of its own
at the root, and that is a statement about what is in the tree, not a grant.
