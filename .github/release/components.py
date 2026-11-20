#!/usr/bin/env python3
"""Assemble the core and the two pinned PandaQuest components."""

from __future__ import annotations

import argparse
import hashlib
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
VERSIONS = build.REPO / "component-versions.json"


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


def release_version(key: str) -> str:
    version = json.loads(VERSIONS.read_text(encoding="utf-8"))[key]
    if not re.fullmatch(r"[0-9]+(?:\.[0-9]+)+", version):
        raise ValueError(f"invalid released version for {key}")
    return version


def verified_component(source: zipfile.ZipFile, expected: dict[str, bytes], folder: str,
                       version: str, revision: str) -> dict[str, bytes]:
    identity = json.loads(source.comment)
    if identity["component"] != revision:
        raise ValueError(f"{folder} was not released from the pinned commit")
    names = source.namelist()
    note = f"{folder}/CHANGELOG.md"
    tracked = set(expected)
    generated_changelog = note in names and note not in tracked
    if generated_changelog:
        tracked.add(note)
    if len(names) != len(tracked) or set(names) != tracked:
        raise ValueError(f"{folder} archive contents do not match the pinned source")
    if any(source.read(path) != content for path, content in expected.items()):
        raise ValueError(f"{folder} does not match the pinned source")
    if generated_changelog:
        if source.getinfo(note).file_size > 256 * 1024:
            raise ValueError(f"{folder} release changelog is too large")
        data = source.read(note)
        if (
            not data.startswith(f"# {folder} {version}\n".encode())
            or hashlib.sha256(data).hexdigest() != identity.get("changelog_sha256")
        ):
            raise ValueError(f"{folder} release changelog does not match its release metadata")
        return {**expected, note: data}
    if "changelog_sha256" in identity:
        raise ValueError(f"{folder} archive is missing the release changelog")
    return expected


def assemble(core: Path, output: Path, checkouts: dict[str, Path], releases: Path | None = None) -> None:
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
        own_version = release_version(key)
        files = component_entries(checkout, folder, project, own_version)
        name = f"{folder}-{own_version}.zip"
        if releases is None:
            archive(output / name, files, {"component": refs[key], "version": own_version})
        else:
            package = (releases / name).read_bytes()
            with zipfile.ZipFile(releases / name) as source:
                files = verified_component(source, files, folder, own_version, refs[key])
            (output / name).write_bytes(package)
        combined.update(files)
    archive(output / f"PandaQuest-{version}.zip", combined, {**identity, "components": refs})


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--pin", choices=COMPONENTS)
    parser.add_argument("--version", choices=COMPONENTS)
    parser.add_argument("--releases", type=Path)
    parser.add_argument("--core", type=Path)
    parser.add_argument("--out", type=Path)
    for name in COMPONENTS:
        parser.add_argument(f"--{name}", type=Path)
    args = parser.parse_args()
    if args.pin:
        print(pins()[args.pin])
        return
    if args.version:
        print(release_version(args.version))
        return
    if not all((args.core, args.out, args.database, args.auction)):
        parser.error("assembly requires --core, --out, --database and --auction")
    assemble(args.core, args.out, {name: getattr(args, name) for name in COMPONENTS}, args.releases)


if __name__ == "__main__":
    main()
