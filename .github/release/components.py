#!/usr/bin/env python3
"""Assemble the core and the two pinned PandaQuest components."""

from __future__ import annotations

import argparse
import json
import re
import zipfile
from pathlib import Path

import build
import curseforge

COMPONENTS = {
    "database": ("PandaQuestDB", "1807827"),
    "auction": ("PandaQuestAuction", "1807835"),
}
LOCK = build.REPO / "components.json"


def pins() -> dict[str, str]:
    refs = json.loads(LOCK.read_text(encoding="utf-8"))
    if set(refs) != set(COMPONENTS) or any(
        not isinstance(ref, str) or not re.fullmatch(r"[0-9a-f]{40}", ref) for ref in refs.values()
    ):
        raise ValueError("components.json must pin the database and auction to full commit SHAs")
    return refs


def component_entries(checkout: Path, folder: str, project: str, version: str) -> dict[str, bytes]:
    root = checkout / folder
    files = {path.relative_to(root).as_posix(): path.read_bytes() for path in build.iter_addon_files(root)}
    core_tocs = build.toc_texts()
    expected = {folder + name[len(build.ADDON):] for name in core_tocs}
    if {name for name in files if "/" not in name and name.endswith(".toc")} != expected:
        raise ValueError(f"{folder} must supply the same game TOCs as PandaQuest")
    for name in expected:
        content = files[name].decode("utf-8")
        core_name = build.ADDON + name[len(folder):]
        if curseforge.toc_interfaces(content) != curseforge.toc_interfaces(core_tocs[core_name]):
            raise ValueError(f"{name} has mismatched game interfaces")
        if curseforge.toc_project_id(content) != project:
            raise ValueError(f"{name} must declare CurseForge project {project}")
        for line in content.splitlines():
            path = line.strip().replace("\\", "/")
            if path and not path.startswith("#") and path not in files:
                raise ValueError(f"{name} references missing file {path}")
        stamped, count = re.subn(r"(?mi)^## Version:.*$", f"## Version: {version}", content)
        if count != 1:
            raise ValueError(f"{name} must declare exactly one Version")
        files[name] = stamped.encode("utf-8")
    return {f"{folder}/{name}": content for name, content in files.items()}


def archive(path: Path, files: dict[str, bytes], identity: dict) -> None:
    with zipfile.ZipFile(path, "w", compression=zipfile.ZIP_DEFLATED) as output:
        for name, data in sorted(files.items()):
            output.writestr(build._entry(name), data, compresslevel=build.ZIP_COMPRESS_LEVEL)
        output.comment = json.dumps(identity, sort_keys=True, separators=(",", ":")).encode()


def assemble(core: Path, output: Path, checkouts: dict[str, Path]) -> None:
    refs = pins()
    output.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(core) as source:
        identity = json.loads(source.comment)
        combined = {entry: source.read(entry) for entry in source.namelist()}
    version = identity["version"]
    for key, (folder, project) in COMPONENTS.items():
        checkout = checkouts[key]
        if build._git("rev-parse", "HEAD", repo=checkout) != refs[key]:
            raise ValueError(f"{key} checkout does not match components.json")
        if build._git("status", "--porcelain", "--", folder, repo=checkout):
            raise ValueError(f"{key} contains uncommitted addon files")
        files = component_entries(checkout, folder, project, version)
        archive(output / f"{folder}-{version}.zip", files, {**identity, "component": refs[key]})
        combined.update(files)
    archive(output / f"PandaQuest-{version}.zip", combined, {**identity, "components": refs})


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--pin", choices=COMPONENTS)
    parser.add_argument("--core", type=Path)
    parser.add_argument("--out", type=Path)
    for name in COMPONENTS:
        parser.add_argument(f"--{name}", type=Path)
    args = parser.parse_args()
    if args.pin:
        print(pins()[args.pin])
        return
    if not all((args.core, args.out, args.database, args.auction)):
        parser.error("assembly requires --core, --out, --database and --auction")
    assemble(args.core, args.out, {name: getattr(args, name) for name in COMPONENTS})


if __name__ == "__main__":
    main()
