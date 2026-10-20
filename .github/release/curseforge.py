#!/usr/bin/env python3
"""Upload the release zip to CurseForge, with nothing but the standard library.

    python3 .github/release/curseforge.py upload --zip dist/PandaQuest-0.2.125.zip
    python3 .github/release/curseforge.py game-version      # 5.5.4: the game versions the package is tagged with
    python3 .github/release/curseforge.py game-version --zip dist/PandaQuest-0.2.125.zip

The token is read from the environment (``CF_API_TOKEN``) and never from an argument, so it does
not end up in a process list or a log.

Why this and not CurseForge's own packager: the zip that goes to CurseForge is the zip the
GitHub release carries -- the same bytes, built and checked once by ``build.py`` -- and the
the release asset's contract depends on that file's name and layout.  A second packer would produce a
second, different zip of the same tree.

Which game versions a file is tagged with
-----------------------------------------
Every TOC the package carries is read (``PandaQuest.toc``, ``PandaQuest_Mists.toc``, and later
``PandaQuest_Forever.toc``/``_Camelot.toc``), and each ``## Interface`` number is mapped to a game
of games.py and to a game version: 50504 is Mists of Pandaria Classic "5.5.4", 16001 is Forever
"1.60.1".  A CurseForge game version is then looked up by its name *and* its game version type
(Mists of Pandaria Classic 79434, Forever 88568), because a name alone can belong to two games.
The upload carries every id found, once.  A TOC whose suffix and interface name two different
games, an interface no game claims, and a version CurseForge does not list are all refused before
anything is sent.

What is NOT verified, because it needs a real project and token: the exact names CurseForge gives
those versions in ``/api/game/versions``.  This script looks for the version string derived from
each TOC (``5.5.4``) with that game's type, and fails loudly, listing what it did find, when there is
no match -- it never uploads against a guessed id.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
import urllib.request
import uuid
import zipfile
from pathlib import Path

import games

REPO = Path(__file__).resolve().parents[2]
ADDON = "PandaQuest"
CHANGELOG = REPO / "PandaQuest" / "CHANGELOG.md"
CHANGELOG_TXT = REPO / "PandaQuest" / "changelog.txt"
API = "https://wow.curseforge.com/api"
RELEASE_TYPES = ("alpha", "beta", "release")


def toc_interfaces(text: str) -> list:
    """Every number of ``## Interface``, which may list several (``50504, 16001``) since 10.2.7."""
    match = re.search(r"^##[ \t]*Interface[ \t]*:[ \t]*([0-9][0-9, \t]*)\r?$", text, re.M)
    numbers = [int(part) for part in re.split(r"[\s,]+", match.group(1)) if part] if match else []
    if not numbers:
        raise ValueError("no ## Interface line in the TOC")
    return numbers


def toc_interface(text: str) -> int:
    """The first ``## Interface`` number."""
    return toc_interfaces(text)[0]


def game_version(interface: int) -> str:
    """50504 -> '5.5.4': two digits per component, the way the client numbers its builds."""
    return "%d.%d.%d" % (interface // 10000, interface // 100 % 100, interface % 100)


def toc_suffix(name: str):
    """``PandaQuest_Mists.toc`` -> "_Mists", ``PandaQuest.toc`` -> "", anything else None."""
    match = re.fullmatch(re.escape(ADDON) + r"([-_][A-Za-z]+)?\.toc", name)
    return (match.group(1) or "") if match else None


def toc_targets(name: str, text: str) -> list:
    """What one TOC tags the file with: ``[(game, "5.5.4"), ...]``, one per interface number.

    The suffix says which game's client reads the file, and every interface in it has to be that
    game's; the plain TOC may be any known game's.  Anything else is a package that would be tagged
    for a game it does not load in, so it raises.
    """
    suffix = toc_suffix(name)
    if suffix is None:
        raise ValueError("%s is not a %s TOC" % (name, ADDON))
    by_suffix = games.by_suffix(suffix) if suffix else None
    if suffix and by_suffix is None:
        raise ValueError("%s: no game in games.py reads the suffix %s" % (name, suffix))
    targets = []
    for interface in toc_interfaces(text):
        game = games.by_interface(interface)
        if game is None:
            raise ValueError("%s: interface %d belongs to no game in games.py" % (name, interface))
        if by_suffix is not None and game is not by_suffix:
            raise ValueError("%s is read by %s's client, but interface %d is %s's"
                             % (name, by_suffix.name, interface, game.name))
        targets.append((game, game_version(interface)))
    return targets


def wanted_versions(tocs: dict) -> list:
    """``{toc name: text}`` -> ``[(game version type, version name, game), ...]``, each pair once."""
    seen = {}
    for name in sorted(tocs):
        for game, version in toc_targets(name, tocs[name]):
            seen.setdefault((game.curseforge_type, version), game)
    return [(type_id, version, game) for (type_id, version), game in sorted(seen.items())]


def zip_tocs(zip_path: Path) -> dict:
    """The TOC files at the top of the package's addon folder, by name."""
    with zipfile.ZipFile(zip_path) as archive:
        return {
            entry.split("/", 1)[1]: archive.read(entry).decode("utf-8-sig")
            for entry in archive.namelist()
            if entry.startswith(ADDON + "/") and entry.count("/") == 1 and entry.lower().endswith(".toc")
        }


def pick_version_ids(versions: list, wanted: str, type_id=None) -> list:
    """The ids of the entries named exactly ``wanted`` -- and of game version type ``type_id``, when
    one is given; an empty list is the caller's failure."""
    return [entry["id"] for entry in versions
            if entry.get("name") == wanted and (type_id is None or entry.get("gameVersionTypeID") == type_id)]


def pick_all_version_ids(versions: list, wanted: list) -> tuple:
    """-> (ids, problems): the ids of every ``(type, name, game)`` wanted, and one line per missing one."""
    ids, problems = [], []
    for type_id, name, game in wanted:
        found = pick_version_ids(versions, name, type_id)
        if not found:
            listed = sorted({str(entry.get("name")) for entry in versions if entry.get("gameVersionTypeID") == type_id})
            problems.append("CurseForge lists no %s game version named %r (type %d). Of that type it lists: %s"
                            % (game.name, name, type_id, ", ".join(listed) or "nothing"))
        ids.extend(i for i in found if i not in ids)
    return ids, problems


def latest_changelog(text: str) -> str:
    """The newest ``## [...]`` section of CHANGELOG.md, or the whole file when it has none."""
    parts = re.split(r"(?m)^(?=## \[)", text)
    sections = [part for part in parts if part.startswith("## [")]
    return (sections[0] if sections else text).strip()


TAG_PATTERN = re.compile(r"v(\d+(?:\.\d+)*)(?:-beta)?")


def tag_key(tag: str):
    """The numeric version of a release tag, ``v0.2.140-beta`` and ``v0.2.140`` both (0, 2, 140)."""
    match = TAG_PATTERN.fullmatch(tag)
    return tuple(int(part) for part in match.group(1).split(".")) if match else None


def tag_release_type(tag: str) -> str:
    """What CurseForge should call the file: ``-beta`` in the tag is a beta, anything else a release."""
    return "beta" if tag.endswith("-beta") else "release"


def release_tags() -> list:
    """The release tags (``v0.2.140``, ``v0.2.140-beta``) of this checkout, newest first.

    Sorted here by the number and not by git: git's version sort puts ``v0.2.140-beta`` after
    ``v0.2.140``, and a number is what "newest" means.
    """
    out = subprocess.run(["git", "-C", str(REPO), "tag", "--list", "v*"],
                         capture_output=True, text=True, check=False).stdout
    tags = [tag for tag in out.split() if tag_key(tag) is not None]
    return sorted(tags, key=lambda tag: (tag_key(tag), not tag.endswith("-beta")), reverse=True)


def previous_tag(tags: list, version: str):
    """The newest tag whose number is below ``version``, or None. The suffix plays no part."""
    wanted = tuple(int(part) for part in version.split("."))
    below = [tag for tag in tags if tag_key(tag) is not None and tag_key(tag) < wanted]
    return max(below, key=lambda tag: (tag_key(tag), not tag.endswith("-beta"))) if below else None


def format_changelog(version: str, previous, subjects: list) -> str:
    """What changed in this file, as CurseForge's rules ask of every upload."""
    if not subjects:
        return ""
    since = "since %s" % previous if previous else "in this release"
    return "## PandaQuest %s\n\nChanges %s:\n\n%s" % (
        version, since, "\n".join("- %s" % subject for subject in subjects))


def commit_subjects(previous) -> list:
    """Subjects of the non-merge commits that touched PandaQuest/ since ``previous``."""
    span = ["%s..HEAD" % previous] if previous else ["HEAD"]
    out = subprocess.run(["git", "-C", str(REPO), "log", "--no-merges", "--format=%s", *span, "--", "PandaQuest"],
                         capture_output=True, text=True, check=False).stdout
    return [line.strip() for line in out.splitlines() if line.strip()]


def toc_project_id(text: str):
    """``## X-Curse-Project-ID: 1735809`` -> "1735809", or None."""
    match = re.search(r"^##\s*X-Curse-Project-ID\s*:\s*(\d+)\s*$", text, re.M)
    return match.group(1) if match else None


def zip_project_id(zip_path: Path):
    """The project id the package's own TOC names, or None."""
    with zipfile.ZipFile(zip_path) as archive:
        return toc_project_id(archive.read("PandaQuest/PandaQuest.toc").decode("utf-8-sig"))


def txt_section(text: str, version: str) -> str:
    """The lines under ``version`` in changelog.txt, or "" when that version has no section."""
    section = []
    inside = False
    for line in text.splitlines():
        if re.fullmatch(r"\d+(?:\.\d+)+", line.strip()):
            if inside:
                break
            inside = line.strip() == version
            continue
        if inside and line.strip():
            section.append(line.strip())
    return "\n".join(section)


def metadata(version: str, changelog: str, game_version_ids: list, release_type: str) -> dict:
    if release_type not in RELEASE_TYPES:
        raise ValueError("release type must be one of %s" % (RELEASE_TYPES,))
    return {
        "displayName": version,
        "changelog": changelog,
        "changelogType": "markdown",
        "releaseType": release_type,
        "gameVersions": list(game_version_ids),
    }


def multipart(fields: dict, filename: str, data: bytes) -> tuple:
    """-> (content type, body) for a metadata field and one file."""
    boundary = uuid.uuid4().hex
    lines = []
    for name, value in fields.items():
        lines += ["--%s" % boundary, 'Content-Disposition: form-data; name="%s"' % name, "", value]
    head = "\r\n".join(lines + [
        "--%s" % boundary,
        'Content-Disposition: form-data; name="file"; filename="%s"' % filename,
        "Content-Type: application/zip", "", ""])
    body = head.encode("utf-8") + data + ("\r\n--%s--\r\n" % boundary).encode("ascii")
    return "multipart/form-data; boundary=%s" % boundary, body


def _call(request: urllib.request.Request):
    with urllib.request.urlopen(request, timeout=60) as response:  # noqa: S310 - fixed https host
        return json.loads(response.read().decode("utf-8"))


def upload(zip_path: Path, project, release_type: str, changelog_txt=None) -> int:
    token = os.environ.get("CF_API_TOKEN", "")
    if not token:
        print("CF_API_TOKEN is not set; nothing uploaded.", file=sys.stderr)
        return 2
    in_package = zip_project_id(zip_path)
    project = project or in_package
    if not project or not re.fullmatch(r"\d+", project):
        print("no project id: pass --project or ship ## X-Curse-Project-ID in the TOC", file=sys.stderr)
        return 2
    if in_package != project:
        # The id in the URL decides where the file lands; the one in the package says where it was
        # meant to go. A mismatch is a package built for another project, or one built before the
        # id was in the TOC -- neither is something to send.
        print("the package's TOC names project %s, not %s; nothing uploaded." % (in_package, project),
              file=sys.stderr)
        return 2
    # The package's own TOCs, not this checkout's: the zip is the release's, and the checkout may
    # be a later commit.
    try:
        wanted = wanted_versions(zip_tocs(zip_path))
    except ValueError as problem:
        print("%s; nothing uploaded." % problem, file=sys.stderr)
        return 2
    if not wanted:
        print("%s carries no %s TOC; nothing uploaded." % (zip_path.name, ADDON), file=sys.stderr)
        return 2

    versions = _call(urllib.request.Request(API + "/game/versions", headers={"X-Api-Token": token}))
    ids, problems = pick_all_version_ids(versions, wanted)
    if problems:
        for line in problems:
            print(line, file=sys.stderr)
        print("nothing uploaded.", file=sys.stderr)
        return 1

    match = re.fullmatch(r"PandaQuest-(\d+(?:\.\d+)*)\.zip", zip_path.name)
    if not match:
        print("%s is not a PandaQuest-<version>.zip" % zip_path.name, file=sys.stderr)
        return 2
    version = match.group(1)
    previous = previous_tag(release_tags(), version)
    notes = changelog_txt or CHANGELOG_TXT
    own = txt_section(notes.read_text(encoding="utf-8"), version) if notes.is_file() else ""
    changelog = own \
        or format_changelog(version, previous, commit_subjects(previous)) \
        or latest_changelog(CHANGELOG.read_text(encoding="utf-8"))
    meta = metadata(version, changelog, ids, release_type)
    content_type, body = multipart({"metadata": json.dumps(meta)}, zip_path.name, zip_path.read_bytes())
    answer = _call(urllib.request.Request(
        "%s/projects/%s/upload-file" % (API, project), data=body, method="POST",
        headers={"X-Api-Token": token, "Content-Type": content_type}))
    print("uploaded %s to project %s as file %s (game versions %s)" %
          (zip_path.name, project, answer.get("id"), ids))
    return 0


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    sub = parser.add_subparsers(dest="command", required=True)
    shown = sub.add_parser("game-version")
    shown.add_argument("--zip", type=Path, help="read the TOCs of this package (default: the TOCs build.py writes)")
    up = sub.add_parser("upload")
    up.add_argument("--zip", required=True, type=Path)
    up.add_argument("--project", help="default: ## X-Curse-Project-ID from the package's TOC")
    up.add_argument("--release-type", default="beta", choices=RELEASE_TYPES)
    up.add_argument("--changelog-txt", type=Path,
                    help="changelog.txt as it was at the release (default: this checkout's)")
    args = parser.parse_args(argv)
    if args.command == "game-version":
        if args.zip:
            tocs = zip_tocs(args.zip)
        else:
            import build  # noqa: PLC0415 - only this command needs the packaging code

            tocs = build.toc_texts()
        for _type_id, version, _game in wanted_versions(tocs):
            print(version)
        return 0
    return upload(args.zip, args.project, args.release_type, args.changelog_txt)


if __name__ == "__main__":
    sys.exit(main())
