# PandaQuest

The World of Warcraft addon: a quest helper and navigator for **Mists of Pandaria Classic
(5.5.4, interface 50504)**. Quest objectives on the map and in a tracker, an arrow to the next
one, flight-path routing, auction and recipe scanning, archaeology dig sites, English and
Finnish.

This repository is the addon and the two scripts that turn it into a release. That is all it is.

## What is here

| | |
|---|---|
| `PandaQuest/` | the addon. This directory *is* what WoW installs, under exactly this name. |
| `build.py` | packaging: the version, the build identity, the deterministic zip. |
| `check.py` | the checks, stdlib `unittest` only. |
| `.github/workflows/release.yml` | builds the zip and publishes it as a release asset. |

## What is not here, and where it is

Everything else lives in the platform repository, **<https://github.com/vem882/pandawow>**: the
hub (FastAPI, the site players log in to), the Go sync engine, the Electron companion app, the
deploy, the CI pipeline, the database tooling in `tools/`, and the docs. Nothing in this
repository imports from there and nothing there imports from here. The two are joined by one
thing only, and it is a file:

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
   the hub's update manifest lists the paths straight out of the archive, so the installed folder
   and the manifest both depend on it.
4. The zip is **deterministic**: entries sorted by name, every timestamp `1980-01-01 00:00:00`,
   every mode bit `0644`, no directory entries.

`check.py` asserts all four against a zip it builds, and it carries the hub's regex verbatim so
that the assertion is about the hub's rule and not about a paraphrase of it.

The tag carries a `v` (`v0.2.84`) and the asset does not. Tags are read by humans; the file name
is read by the hub.

## The version

**`0.2.<number of commits reachable from HEAD>`** — `0.2.84` at the split. The series comes from
`## Version` in `PandaQuest/PandaQuest.toc`; `build.py` appends the commit count at packaging
time. Nothing writes the third component down, because writing it down would change it: the
commit that recorded 84 would be commit 85.

Why the count, and not a number somebody bumps: the platform repository shipped `0.1.0` for every
release it had ever made, because the patch component lived in a file and no one remembered it.
The player watched /setup say "newest build: 0.1.0" for six months. A number that moves by itself
is the fix, and the commit count is the only such number that is digits, monotonic, and free.

**Why `0.2` and not `0.1`.** The commit count is a per-repository counter, and the two
repositories' counters are not comparable. Measured at the split, with this repository's `main` at
`082c57d`: **84** commits here, **390** in the platform repository. It was building
`PandaQuest-0.1.390.zip`. Publishing `0.1.84` from here would have handed the hub a package that
sorts *below* the one it already had — `(0, 1, 84) < (0, 1, 390)` — and the hub would have kept
offering the old build, silently, exactly the failure mode point 2 warns about. Bumping the minor
once, at the split, makes every number this repository will ever produce sort above every number
the old one did: `(0, 2, 84) > (0, 1, 390)`, and it stays true for as long as the series does. It
is also honest — moving the addon into its own repository is a minor-version event if anything is.

One property came free with the split and is worth naming: this repository's history was filtered
to the commits that touched `PandaQuest/`, so its count moves when *the addon* changes. In the
platform repository a documentation commit bumped the addon's version.

The number is only required to move and never to go backwards. It does not encode how much
changed, and a commit here that leaves `PandaQuest/` untouched still produces a new version — the
zip then differs from its predecessor only in the stamped identity. That is the accepted cost of
a counter that nobody has to maintain.

## The build identity

`0.2.84+<short sha>`, and `+dirty` when `PandaQuest/` differs from that commit — tracked changes
*or* untracked files, because `build.py` packages the tree as it stands and a package claiming a
commit it does not contain is a lie a bug report cannot see through. Only `PandaQuest/` counts:
editing this README does not change a byte a player downloads.

It reaches the package four ways, all of them derived from the commit and never from the clock:

* the packaged TOC's `## Title` — what the in-game AddOns list draws, so a player can see at a
  glance that the update arrived;
* the packaged TOC's `## Version` — which the addon reads into `Const.VERSION` and `/pq status`
  prints;
* `PandaQuest/Core/Build.lua`, generated at packaging time and listed first in the packaged TOC.
  It sets `ns.Build` and carries the commit *date*, the one fact `## Version` cannot hold. It is
  not in the repository, and `check.py` fails if anybody commits one;
* the zip's archive comment, a JSON object with the commit subject and date, which is where the
  hub reads what /setup shows.

## Building it yourself

No toolchain, no install step. Python 3.9 or newer, and git for the version:

```sh
python3 check.py                  # the checks; -v names each one
python3 build.py version          # 0.2.<count>, whatever this checkout reaches
python3 build.py identity         # the build identity as shell lines, or --json
python3 build.py package --out "dist/PandaQuest-$(python3 build.py version).zip"
```

`build.py package` refuses an `--out` name the hub could not see, so the contract cannot be broken
by a typo at the command line.

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
`check.py`, builds the zip twice and compares them, and publishes it as the asset of a release
tagged `v<version>`. A pull request runs everything except the publish, and attaches the zip it
built as a run artifact, so a change can be installed and played before it is merged.

The checkout uses `fetch-depth: 0` and must keep doing so. A shallow clone does not fail and does
not fall back — measured, a depth-1 clone of this repository builds `PandaQuest-0.2.1.zip`, a name
the hub's pattern matches happily and sorts below every package it holds. So both `check.py` and
`build.py package` ask `git rev-parse --is-shallow-repository` and refuse, and `check.py` also
asserts the `fetch-depth: 0` line is still in the workflow.

## Checks, and what they cannot tell you

There is no Lua interpreter and no luacheck in this repository. The platform repository keeps
those, and `check.py` deliberately does not try to reproduce them. So the checks cannot tell you
the addon *works*; they tell you the package is not obviously broken:

* the TOC parses and declares `## Interface`, `## Title` and `## Version`;
* every file the TOC lists exists, **with the case it is listed with** — Windows does not care and
  the Linux machines that build and serve this do;
* every file `embeds.xml` pulls in exists too, recursively, since the TOC lists the XML and not
  its twenty libraries;
* the four points of the contract above, against a freshly built zip;
* the version is the series plus the measured commit count, the history behind it is not
  truncated, and the name it produces matches the hub's own regex.

## Licence and credit

Author: vem882 (`## Author` in the TOC).

The embedded libraries under `PandaQuest/Libs/` — Ace3, LibStub, CallbackHandler, LibDataBroker,
LibDBIcon and HereBeDragons — are other people's work and keep their own terms. What is written
down here is `PandaQuest/Libs/LICENSE-Ace3.txt`, `PandaQuest/Libs/README.md` and
`PandaQuest/Textures/Icons/LICENSE.md`; read those. This repository declares no licence of its own
at the root, and that is a statement about what is in the tree, not a grant.
