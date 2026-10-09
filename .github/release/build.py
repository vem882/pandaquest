#!/usr/bin/env python3
"""Package PandaQuest as the release asset the portal downloads.

    python3 .github/release/build.py version                 # 0.2.84 -- the release number, alone
    python3 .github/release/build.py identity                # BUILD=0.2.84+082c57d ... as shell lines
    python3 .github/release/build.py identity --json         # the same facts as one JSON object
    python3 .github/release/build.py package --out dist/PandaQuest-0.2.84.zip

Stdlib only, and no argument that points outside this repository: it has to run on a
GitHub-hosted runner with nothing installed on it.

What this is, and is not
------------------------
Packaging only: the version, the build identity and the deterministic zip.  There is no
installer here -- a player installs a release by unzipping it (README.md) -- and no publish
step of its own: the release is a GitHub release asset upload, which is atomic on GitHub's
side, and ``dist/`` is a scratch directory in a runner that is thrown away.

The version: 0.2.<commits reachable from HEAD>
---------------------------------------------
The series comes from ``## Version`` in the TOC; the last component is this repository's own
commit count, so it moves whenever a commit lands and nobody has to remember to bump it.
README.md, "The version", says how the number is formed.

Digits and dots only, which is a hard requirement and not a preference: the portal finds packages
with ``^PandaQuest-(\\d+(?:\\.\\d+)*)\\.zip$`` and orders them with
``tuple(int(part) for part in version.split("."))``.  A ``v``, a hyphen or a short sha
anywhere in the file name produces a zip the portal cannot see at all, and /setup then offers
nothing while looking perfectly healthy.  The commit sha still reaches the package -- it is
appended to the *build* identity, which goes into the TOC, into ``Core/Build.lua`` and into
the archive comment, none of which is a file name.

The build identity
------------------
``0.2.84+<short sha>``, with ``+dirty`` appended when ``PandaQuest/`` differs from that commit
-- tracked changes or untracked files, because this script packages whatever is in the tree,
committed or not.  A package that says "082c57d" while holding somebody's uncommitted Lua is a
lie a bug report cannot see through.  Only ``PandaQuest/`` counts: editing this script or the
README does not change one byte a player downloads.

It is stamped into the package four ways, and all of them are deterministic -- the commit date,
never the clock -- so that building the same commit twice produces the same bytes:

* the packaged TOC's ``## Title``, which is what the in-game AddOns list draws;
* the packaged TOC's ``## Version``, which the addon reads into ``Const.VERSION`` and
  ``/pq status`` prints;
* ``PandaQuest/Core/Build.lua``, generated and listed first in the packaged TOC, which sets
  ``ns.Build`` -- including the commit's *date*, the one fact of the four that ``## Version``
  cannot carry;
* the zip's archive comment, a JSON object with the commit subject and date, which is where
  the portal reads what /setup shows.  A comment rather than a second file beside the zip,
  because a release asset arrives alone.
"""

from __future__ import annotations

import argparse
import io
import json
import re
import subprocess
import sys
import zipfile
from collections.abc import Iterator, Sequence
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
ADDON = "PandaQuest"
ADDON_DIR = REPO / ADDON
TOC = ADDON_DIR / f"{ADDON}.toc"
DIST_DIR = REPO / "dist"

#: How many leading components of the TOC's ``## Version`` are kept by hand.  The rest is the
#: commit count.  ``0.2`` + 84 commits is ``0.2.84``.
SERIES_PARTS = 2

#: Where the generated file lands inside the addon, and how the TOC names it (WoW's TOC uses
#: backslashes; the zip entry does not).
BUILD_LUA = "Core/Build.lua"

#: The game-specific TOC suffix the Mists of Pandaria Classic client looks for first.
MISTS_SUFFIX = "_Mists"
BUILD_LUA_TOC_LINE = "Core\\Build.lua"

#: The portal's package pattern, which it uses to find the release asset.  check.py asserts the
#: built file name matches it, so the contract is tested where the file is made.
PORTAL_PACKAGE_PATTERN = re.compile(r"^PandaQuest-(\d+(?:\.\d+)*)\.zip$")

#: The archive comment is limited to 65535 bytes by the zip format; a commit subject is one
#: line and this bound only exists so a pathological one cannot make the write fail.
SUBJECT_LIMIT = 300

#: The version tag the packaged ``## Title`` carries, and the shape stamping replaces rather
#: than appends to -- so stamping an already-stamped TOC leaves one tag and not three.  Green
#: because Questie's is green and players already read it there.
TITLE_TAG = "|cff00ff00v%s|r"
TITLE_TAG_PATTERN = re.compile(r"\s*\|cff00ff00v[^|]*\|r\s*$", re.IGNORECASE)

#: Never shipped to the client: development leftovers and editor droppings.
EXCLUDED_NAMES = {".git", ".gitignore", "__pycache__", ".DS_Store", "Thumbs.db", ".pytest_cache"}
EXCLUDED_SUFFIXES = {".pyc", ".pyo", ".orig", ".rej", ".bak", ".swp"}

#: Every zip entry carries these three, and nothing that varies with the clock or the umask.
ZIP_DATE_TIME = (1980, 1, 1, 0, 0, 0)
ZIP_EXTERNAL_ATTR = 0o644 << 16

#: Passed to every ``writestr``, not to the ``ZipFile`` -- see :func:`zip_bytes` for why that
#: distinction is the difference between level 9 and level 6.  Deterministic either way, since
#: the level is the same for every entry of every build; it is the download size that moves.
ZIP_COMPRESS_LEVEL = 9


# ------------------------------------------------------------------------------- the tree


def _is_excluded(relative: Path) -> bool:
    if relative.name in EXCLUDED_NAMES or relative.suffix in EXCLUDED_SUFFIXES:
        return True
    return any(part in EXCLUDED_NAMES for part in relative.parts)


def iter_addon_files(root: Path | None = None) -> Iterator[Path]:
    """Yield every file that belongs in the shipped addon, sorted for determinism."""
    root = root or ADDON_DIR
    for path in sorted(root.rglob("*")):
        if path.is_file() and not _is_excluded(path.relative_to(root)):
            yield path


# ---------------------------------------------------------------------------- the version


def _git(*args: str, repo: Path | None = None) -> str:
    """One git answer, or "" when there is no git and no repository -- a tarball still builds."""
    try:
        result = subprocess.run(
            ["git", "-C", str(repo or REPO), *args],
            check=True,
            capture_output=True,
            text=True,
        )
    except (OSError, subprocess.CalledProcessError):
        return ""
    return result.stdout.strip()


def _is_number(part: str) -> bool:
    """A component the portal can turn back into an int: ASCII digits, nothing else.

    ``str.isdigit`` alone would accept ``'٣'``, which ``int()`` also accepts -- so a version
    built from it would pass every check here and produce a file name the portal's ``\\d``
    pattern rejects.
    """
    return bool(part) and part.isascii() and part.isdigit()


def read_toc_version(toc: Path | None = None) -> str:
    """The ``## Version`` field of the TOC, or ``0.0.0`` when it is missing.

    This is the *declared* version -- the series somebody types -- and not the number a
    release ships under; :func:`release_version` is that one.
    """
    try:
        text = (toc or TOC).read_text(encoding="utf-8-sig", errors="replace")
    except OSError:
        return "0.0.0"
    for line in text.splitlines():
        stripped = line.strip()
        if stripped.lower().startswith("## version:"):
            return stripped.split(":", 1)[1].strip() or "0.0.0"
    return "0.0.0"


def commit_count(repo: Path | None = None) -> int | None:
    """How many commits ``HEAD`` reaches, or None outside a git checkout.

    Reachable commits, not first-parent ones: merging a branch of three adds four, and what
    matters is only that the number never goes down while commits are only ever added.  A
    shallow clone counts what it was *given*, which is a smaller number and not a missing one
    -- see :func:`is_shallow`, which is the check that catches it.
    """
    count = _git("rev-list", "--count", "HEAD", repo=repo)
    return int(count) if _is_number(count) else None


def is_shallow(repo: Path | None = None) -> bool:
    """True when the checkout's history is truncated, so its commit count is not the count.

    This is the failure ``fetch-depth: 0`` exists to prevent, and it is worth its own function
    because it does *not* show up as the fallback in :func:`release_version`.  Measured: a
    ``git clone --depth 1`` of this repository answers ``rev-list --count HEAD`` with ``1``,
    so the version is ``0.2.1`` -- well formed, digits and dots, passing every other check
    here, and sorting below every package the portal already has.  The portal does not fail on that;
    it goes on offering the previous build.  So :func:`package` refuses outright rather than
    producing a number nobody can tell is wrong by looking at it.

    It answers False for *two* different states: a whole history, and no git at all (``_git``
    returns "" on OSError, and "" is not "true").  Only the first is safe to publish from, so
    :func:`package` asks :func:`commit_count` separately -- see the guard there.
    """
    return _git("rev-parse", "--is-shallow-repository", repo=repo) == "true"


def release_version(toc: Path | None = None, repo: Path | None = None) -> str:
    """The number a release ships under: the TOC's series, then this commit's count.

    Falls back to the declared version when there is no git and no repository at all, so a
    source tarball builds a package named for what its TOC says rather than failing or
    inventing a count.  It does *not* fall back for a shallow clone, which answers with a real
    but wrong number; :func:`is_shallow` is that check.
    """
    declared = read_toc_version(toc)
    series = declared.split(".")[:SERIES_PARTS]
    count = commit_count(repo)
    if count is None or len(series) < SERIES_PARTS or not all(_is_number(part) for part in series):
        return declared
    return ".".join([*series, str(count)])


def package_name(version: str) -> str:
    """The one file name the portal will look at.  See :data:`PORTAL_PACKAGE_PATTERN`."""
    return f"{ADDON}-{version}.zip"


# --------------------------------------------------------------------------- the identity


def identity(repo: Path | None = None, paths: Sequence[str] = (ADDON,)) -> dict[str, object]:
    """The facts a package is stamped with.  See the module docstring for what "dirty" means."""
    repo = repo or REPO
    version = release_version(repo=repo)
    commit = _git("rev-parse", "--short", "HEAD", repo=repo) or "unknown"
    dirty = bool(_git("status", "--porcelain", "--untracked-files=all", "--", *paths, repo=repo))
    build = f"{version}+{commit}" + ("+dirty" if dirty else "")
    return {
        "addon": ADDON,
        "version": version,
        "build": build,
        "commit": commit,
        "dirty": dirty,
        "committed": _git("log", "-1", "--format=%cI", repo=repo),
        "subject": _git("log", "-1", "--format=%s", repo=repo)[:SUBJECT_LIMIT],
    }


# ------------------------------------------------------------------------------ stamping


def _lua_string(value: str) -> str:
    """A Lua 5.1 double-quoted literal.  Control bytes become ``\\ddd``, which 5.1 understands."""
    out = ['"']
    for char in value:
        code = ord(char)
        if char in '"\\':
            out.append("\\" + char)
        elif code < 32 or code == 127:
            out.append(f"\\{code:03d}")
        else:
            out.append(char)
    out.append('"')
    return "".join(out)


def build_lua(ident: dict[str, object]) -> str:
    """The generated ``Core/Build.lua``.  Data only: one table on the addon's own namespace."""
    fields = [
        ("version", _lua_string(str(ident["version"]))),
        ("build", _lua_string(str(ident["build"]))),
        ("commit", _lua_string(str(ident["commit"]))),
        ("dirty", "true" if ident["dirty"] else "false"),
        ("committed", _lua_string(str(ident["committed"]))),
    ]
    body = "\n".join(f"    {name} = {value}," for name, value in fields)
    return (
        "-- Core/Build.lua: generated when this package was built (build.py).\n"
        "-- It is not in the repository, and anything edited here is gone with the next package.\n"
        "-- The build this copy of PandaQuest came from, for /pq and for a bug report to quote.\n"
        "local _, ns = ...\n"
        "ns.Build = {\n"
        f"{body}\n"
        "}\n"
    )


def shown_version(ident: dict[str, object]) -> str:
    """What the addon list is made to say: the release number, and ``+dirty`` when it is not one.

    The short sha is deliberately left out -- it is in ``## Version`` and in ``/pq status``,
    where a bug report can quote it, and the list entry only has to answer "did my update
    arrive?".  A dirty build is marked because it is exactly the copy whose screenshot must
    not be believed.
    """
    return str(ident["version"]) + ("+dirty" if ident["dirty"] else "")


def title_with_version(title: str, shown: str) -> str:
    """``|cff5fd7ffPanda|rQuest`` -> ``|cff5fd7ffPanda|rQuest |cff00ff00v0.2.84|r``."""
    return f"{TITLE_TAG_PATTERN.sub('', title).rstrip()} {TITLE_TAG % shown}"


def stamp_toc(text: str, ident: dict[str, object]) -> str:
    """Put ``Core\\Build.lua`` first, the build in ``## Version``, and the version in ``## Title``.

    Before the first listed file rather than after a named one, so the stamp does not depend
    on which file happens to be first today; and a TOC with no ``## Version`` line gets one,
    because the addon reads the version from nowhere else.

    ``## Title`` is stamped as well because that is what the player actually sees: the
    in-game AddOns list draws the title and has no version column.  Whether 5.5.4 reads
    ``## Version`` anywhere a player can see is not verified -- stamping both costs one line
    and is right whichever of the two the live client uses.

    Stamping is idempotent: an existing version tag in the title is replaced rather than
    appended to, and an existing ``Core\\Build.lua`` line is dropped before the new one goes
    in.  Without the second of those, stamping a packaged TOC a second time -- a re-package, a
    copy somebody stamped by hand -- lists the generated file twice, and WoW runs a doubly
    listed file twice.  (check.py holds this down.)
    """
    build = str(ident["build"])
    shown = shown_version(ident)
    newline = "\r\n" if "\r\n" in text else "\n"
    already = {BUILD_LUA_TOC_LINE.lower(), BUILD_LUA.lower()}
    out: list[str] = []
    inserted = False
    versioned = False
    for line in text.splitlines():
        stripped = line.strip()
        if stripped.lower() in already:
            continue
        if stripped.lower().startswith("## version:"):
            out.append(f"## Version: {build}")
            versioned = True
            continue
        if stripped.lower().startswith("## title:"):
            out.append(f"## Title: {title_with_version(stripped.split(':', 1)[1].strip(), shown)}")
            continue
        if not inserted and stripped and not stripped.startswith("#"):
            out.append(BUILD_LUA_TOC_LINE)
            inserted = True
        out.append(line)
    if not versioned:
        header_end = next((i for i, line in enumerate(out) if not line.startswith("##")), len(out))
        out.insert(header_end, f"## Version: {build}")
    if not inserted:
        out.append(BUILD_LUA_TOC_LINE)
    return newline.join(out) + newline


# ----------------------------------------------------------------------------- packaging


def _entry(name: str) -> zipfile.ZipInfo:
    """The fixed metadata every entry carries: no clock, no umask, no host."""
    info = zipfile.ZipInfo(name, date_time=ZIP_DATE_TIME)
    info.compress_type = zipfile.ZIP_DEFLATED
    info.external_attr = ZIP_EXTERNAL_ATTR
    return info


def entries(ident: dict[str, object], root: Path | None = None) -> dict[str, bytes]:
    """Every zip entry, by its path inside the archive.  Every key starts with ``PandaQuest/``.

    That prefix is the folder name WoW installs, and it is what the portal's update manifest is
    built from: its ``_safe_member`` drops every entry that does not begin with ``PandaQuest/``
    and ``index_package`` then refuses the package outright, because the TOC was one of the
    entries dropped.  It is built from :data:`ADDON` rather than from the checkout's directory
    name, which on a runner is the repository name and is not the same word.
    """
    root = root or ADDON_DIR
    found: dict[str, bytes] = {}
    for src in iter_addon_files(root):
        arc = f"{ADDON}/" + src.relative_to(root).as_posix()
        found[arc] = src.read_bytes()

    toc_name = f"{ADDON}/{ADDON}.toc"
    build_name = f"{ADDON}/{BUILD_LUA}"
    if toc_name not in found:
        raise SystemExit(f"{root} has no {ADDON}.toc; there is nothing to package")
    if build_name in found:
        # A file of this name in the tree would be silently replaced by the generated one, and
        # the packaged TOC would then list it twice.  Refusing is the only outcome a human
        # notices.
        raise SystemExit(
            f"{root} already contains {BUILD_LUA}. That name is generated at packaging time; "
            "rename the file or change BUILD_LUA in build.py."
        )
    # The client looks for ``<Addon>_Mists.toc`` before ``<Addon>.toc`` on Mists of Pandaria
    # Classic, and CurseForge reads the same suffix to tag the file's game version.  The plain TOC
    # stays because the portal indexes the package through it and every other client falls back
    # to it.  The Mists file is not kept in the repository: two copies in a tree drift, so it is
    # this very TOC, stamped once, written under the second name.
    mists_name = f"{ADDON}/{ADDON}{MISTS_SUFFIX}.toc"
    if mists_name in found:
        raise SystemExit(
            f"{root} already contains {ADDON}{MISTS_SUFFIX}.toc. It is generated at packaging "
            "time from the plain TOC; delete the file from the tree."
        )
    found[toc_name] = stamp_toc(found[toc_name].decode("utf-8-sig"), ident).encode("utf-8")
    found[mists_name] = found[toc_name]
    found[build_name] = build_lua(ident).encode("utf-8")
    return found


def zip_bytes(ident: dict[str, object], root: Path | None = None) -> bytes:
    """The deterministic archive as bytes: sorted names, fixed timestamps, fixed mode bits.

    ``compresslevel`` goes on each ``writestr`` and not on the ``ZipFile``.  The constructor's
    level is only copied onto an entry when ``writestr`` builds the ZipInfo itself; here
    :func:`_entry` hands it a ready-made one, whose ``_compresslevel`` is None, so a level set
    on the ZipFile is silently ignored and every member is deflated at zlib's default 6.
    Measured on this tree: 7,567,468 bytes that way against 7,443,566 with the level applied --
    123,902 bytes of download that the code already claimed to be saving.  
    """
    buffer = io.BytesIO()
    content = entries(ident, root)
    with zipfile.ZipFile(buffer, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for name in sorted(content):
            archive.writestr(_entry(name), content[name], compresslevel=ZIP_COMPRESS_LEVEL)
        archive.comment = json.dumps(ident, sort_keys=True, separators=(",", ":")).encode("utf-8")
    return buffer.getvalue()


def write_zip(target: Path, ident: dict[str, object], root: Path | None = None) -> None:
    """Write :func:`zip_bytes` to disk.  One construction, so check.py cannot test a second one."""
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(zip_bytes(ident, root))


def package(
    target: Path | None = None,
    allow_shallow: bool = False,
    allow_no_git: bool = False,
) -> tuple[Path, dict[str, object]]:
    """Build the stamped addon zip.  Returns where it landed and the identity it carries."""
    if commit_count() is None and not allow_no_git:
        # The quieter sibling of the shallow case, and the worse one. Without git,
        # release_version falls back to the TOC's declared series -- measured here, 0.2.0:
        # digits and dots, matching the portal's pattern, and a number that never moves again, so
        # every later release publishes under the same tag. Refusing is the only outcome a
        # human notices, exactly as for the shallow case below.
        raise SystemExit(
            f"git could not answer here, so the version would be {release_version()} -- the "
            "TOC's declared series and not this repository's commit count. That name matches "
            "the portal's pattern, so nothing downstream reports it, and it does not move when "
            "the next commit lands. Build from a git checkout with git installed. "
            "--allow-no-git builds anyway, for a source tarball nobody publishes."
        )
    if is_shallow() and not allow_shallow:
        raise SystemExit(
            f"this checkout is shallow, so the version would be {release_version()} instead of "
            "the real commit count -- a package the portal sorts below every one it already has, "
            "and it reports nothing when that happens. Fetch the whole history "
            "(git fetch --unshallow, or fetch-depth: 0 in the workflow). --allow-shallow builds "
            "anyway, for a local experiment whose file name is wrong on purpose."
        )
    ident = identity()
    target = target or DIST_DIR / package_name(str(ident["version"]))
    named = PORTAL_PACKAGE_PATTERN.match(target.name)
    if not named:
        # The portal lists dist/ and matches this pattern; a name it does not match is a package
        # no player is ever offered, and nothing downstream reports the omission.
        raise SystemExit(
            f"{target.name} is not a name the portal can see. It must match "
            f"{PORTAL_PACKAGE_PATTERN.pattern} -- digits and dots only, no 'v' and no sha."
        )
    if named.group(1) != ident["version"]:
        # The shape being right is not enough. The portal reads the version twice and from two
        # places: find_package orders candidates by the number in the FILE NAME, and
        # index_package takes the manifest's version from the ARCHIVE COMMENT, which wins. A
        # file whose name and comment disagree makes the portal disagree with itself -- it sorts
        # the package at one version and advertises another -- and one mistyped digit is
        # enough. Both numbers are in hand right here, so compare them.
        raise SystemExit(
            f"{target.name} says version {named.group(1)}, but this tree builds "
            f"{ident['version']}. The portal sorts packages by the name and reads the version out "
            f"of the archive comment, so the two must agree. Use "
            f"{package_name(str(ident['version']))}."
        )
    write_zip(target, ident)
    return target, ident


# ----------------------------------------------------------------------------------- main


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    commands = parser.add_subparsers(dest="command", required=True)
    # Its own subcommand rather than a field of `identity`, because the workflow wants one word
    # on stdout and nothing else: VERSION="$(python3 .github/release/build.py version)" cannot go wrong the way
    # grepping a KEY=value block for the right line can, and the number goes into a file name
    # where a stray space is a zip the portal's pattern does not match.
    commands.add_parser("version", help="print the release version and nothing else")
    shown = commands.add_parser("identity", help="print the build identity of the current tree")
    shown.add_argument("--json", action="store_true", help="one JSON object instead of shell lines")
    packaged = commands.add_parser("package", help="build the stamped addon zip")
    packaged.add_argument("--out", type=Path, help=f"default: dist/{package_name('<version>')}")
    packaged.add_argument(
        "--allow-shallow",
        action="store_true",
        help="build from a truncated history anyway; the version will be wrong (see is_shallow)",
    )
    packaged.add_argument(
        "--allow-no-git",
        action="store_true",
        help="build without git anyway; the version falls back to the TOC's series and stops moving",
    )
    args = parser.parse_args(argv)

    if args.command == "version":
        print(release_version())
        return 0
    if args.command == "identity":
        ident = identity()
        if args.json:
            print(json.dumps(ident, sort_keys=True))
        else:
            for key in ("build", "version", "commit", "dirty", "committed"):
                value = str(ident[key]).lower() if key == "dirty" else ident[key]
                print(f"{key.upper()}={value}")
        return 0

    target, ident = package(
        args.out, allow_shallow=args.allow_shallow, allow_no_git=args.allow_no_git
    )
    size = target.stat().st_size
    print(f"wrote {target} ({size} bytes, {size / 1024 / 1024:.1f} MiB) as {ident['build']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
