#!/usr/bin/env python3
"""Upload the release zip to CurseForge, with nothing but the standard library.

    python3 .github/release/curseforge.py upload --zip dist/PandaQuest-0.2.99.zip --project 1234567
    python3 .github/release/curseforge.py game-version      # 5.5.4, from ## Interface in the TOC

The token is read from the environment (``CF_API_TOKEN``) and never from an argument, so it does
not end up in a process list or a log.

Why this and not CurseForge's own packager: the zip that goes to CurseForge is the zip the
GitHub release carries -- the same bytes, built and checked once by ``build.py`` -- and the
platform hub's contract depends on that file's name and layout.  A second packer would produce a
second, different zip of the same tree.

What is NOT verified, because it needs a real project and token: the exact name CurseForge gives
Mists of Pandaria Classic 5.5.4 in ``/api/game/versions``.  This script looks for the version
string derived from the TOC (``5.5.4``) and fails loudly, listing what it did find, when there is
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
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
TOC = REPO / "PandaQuest" / "PandaQuest.toc"
CHANGELOG = REPO / "PandaQuest" / "CHANGELOG.md"
API = "https://wow.curseforge.com/api"
RELEASE_TYPES = ("alpha", "beta", "release")


def toc_interface(text: str) -> int:
    match = re.search(r"^##\s*Interface\s*:\s*(\d+)", text, re.M)
    if not match:
        raise ValueError("no ## Interface line in the TOC")
    return int(match.group(1))


def game_version(interface: int) -> str:
    """50504 -> '5.5.4': two digits per component, the way the client numbers its builds."""
    return "%d.%d.%d" % (interface // 10000, interface // 100 % 100, interface % 100)


def pick_version_ids(versions: list, wanted: str) -> list:
    """The ids of the entries named exactly ``wanted``; an empty list is the caller's failure."""
    return [entry["id"] for entry in versions if entry.get("name") == wanted]


def latest_changelog(text: str) -> str:
    """The newest ``## [...]`` section of CHANGELOG.md, or the whole file when it has none."""
    parts = re.split(r"(?m)^(?=## \[)", text)
    sections = [part for part in parts if part.startswith("## [")]
    return (sections[0] if sections else text).strip()


def release_tags() -> list:
    """The ``v<digits>`` tags of this checkout, newest first."""
    out = subprocess.run(["git", "-C", str(REPO), "tag", "--list", "v*", "--sort=-version:refname"],
                         capture_output=True, text=True, check=False).stdout
    return [tag for tag in out.split() if re.fullmatch(r"v\d+(?:\.\d+)*", tag)]


def previous_tag(tags: list, version: str):
    """The newest tag below ``v<version>``, or None."""
    key = lambda tag: tuple(int(part) for part in tag[1:].split("."))  # noqa: E731
    below = [tag for tag in tags if key(tag) < key("v" + version)]
    return below[0] if below else None


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


def upload(zip_path: Path, project: str, release_type: str) -> int:
    token = os.environ.get("CF_API_TOKEN", "")
    if not token:
        print("CF_API_TOKEN is not set; nothing uploaded.", file=sys.stderr)
        return 2
    if not re.fullmatch(r"\d+", project):
        print("the project id is the number on the project page, got %r" % project, file=sys.stderr)
        return 2
    wanted = game_version(toc_interface(TOC.read_text(encoding="utf-8")))

    versions = _call(urllib.request.Request(API + "/game/versions", headers={"X-Api-Token": token}))
    ids = pick_version_ids(versions, wanted)
    if not ids:
        names = sorted({str(entry.get("name")) for entry in versions})
        print("CurseForge lists no game version named %r. It lists: %s" % (wanted, ", ".join(names)),
              file=sys.stderr)
        return 1

    match = re.fullmatch(r"PandaQuest-(\d+(?:\.\d+)*)\.zip", zip_path.name)
    if not match:
        print("%s is not a PandaQuest-<version>.zip" % zip_path.name, file=sys.stderr)
        return 2
    version = match.group(1)
    previous = previous_tag(release_tags(), version)
    changelog = format_changelog(version, previous, commit_subjects(previous)) \
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
    sub.add_parser("game-version")
    up = sub.add_parser("upload")
    up.add_argument("--zip", required=True, type=Path)
    up.add_argument("--project", required=True)
    up.add_argument("--release-type", default="beta", choices=RELEASE_TYPES)
    args = parser.parse_args(argv)
    if args.command == "game-version":
        print(game_version(toc_interface(TOC.read_text(encoding="utf-8"))))
        return 0
    return upload(args.zip, args.project, args.release_type)


if __name__ == "__main__":
    sys.exit(main())
