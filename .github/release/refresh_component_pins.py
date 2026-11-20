#!/usr/bin/env python3
"""Open and merge a checked core pull request for new component releases."""

from __future__ import annotations

import argparse
import base64
import json
import re
import subprocess
import tempfile
from pathlib import Path

CORE = "vem882/pandaquest"
REMOTE = f"https://github.com/{CORE}.git"
BRANCH = "codex/component-pins"
REF = f"refs/heads/{BRANCH}"
TITLE = "Refresh PandaQuest component releases"
COMPONENTS = {
    "database": ("vem882/pqDB", "PandaQuestDB"),
    "auction": ("vem882/pqAuction", "PandaQuestAuction"),
}
LOCK = "components.json"
VERSIONS = "component-versions.json"
LOCK_FILES = {LOCK, VERSIONS}
SHA = re.compile(r"[0-9a-f]{40}")
VERSION = re.compile(r"(?:0|[1-9][0-9]*)(?:\.(?:0|[1-9][0-9]*)){2}")


def run(*args: str, cwd: Path | None = None) -> str:
    return subprocess.run(args, cwd=cwd, check=True, text=True, stdout=subprocess.PIPE).stdout.strip()


def gh(*args: str):
    return json.loads(run("gh", *args))


def locks(head: str) -> tuple[dict[str, str], dict[str, str]]:
    def read(name: str) -> dict[str, str]:
        item = gh("api", f"repos/{CORE}/contents/{name}?ref={head}")
        return json.loads(base64.b64decode(item["content"]))

    pins, versions = read(LOCK), read(VERSIONS)
    if (
        set(pins) != set(COMPONENTS)
        or set(versions) != set(COMPONENTS)
        or any(not SHA.fullmatch(pin) for pin in pins.values())
        or any(not VERSION.fullmatch(version) for version in versions.values())
    ):
        raise ValueError(f"Invalid component locks at {head}")
    return pins, versions


def wanted_component(component: str, current_pin: str, current_version: str) -> tuple[str, str]:
    repo, addon = COMPONENTS[component]
    release = gh("release", "view", "-R", repo, "--json", "tagName,assets,isDraft,isPrerelease")
    tag = release["tagName"]
    version = tag.removeprefix("v")
    if (
        release["isDraft"] or release["isPrerelease"]
        or not tag.startswith("v") or not VERSION.fullmatch(version)
        or tuple(map(int, version.split("."))) < tuple(map(int, current_version.split(".")))
    ):
        return current_pin, current_version

    revision = gh("api", f"repos/{repo}/commits/tags/{tag}")["sha"]
    if not SHA.fullmatch(revision):
        raise ValueError(f"{repo} {tag} did not resolve to a commit")
    if version == current_version and revision != current_pin:
        raise ValueError(f"{repo} {tag} moved from pinned commit {current_pin} to {revision}")

    assets = release["assets"]
    if not any(asset["name"] == f"{addon}-{version}.zip" and asset["state"] == "uploaded" for asset in assets):
        print(f"{repo} {tag} is waiting for its checked ZIP.")
        return current_pin, current_version
    return revision, version


def package_checked(pull: dict) -> bool:
    checks = pull["statusCheckRollup"]
    acceptable = {"SUCCESS", "NEUTRAL", "SKIPPED"}
    return (
        pull["mergeStateStatus"] == "CLEAN"
        and any(
            check.get("name") == "check and build the package"
            and check.get("workflowName") == "Release"
            and check.get("conclusion") == "SUCCESS"
            for check in checks
        )
        and all(
            (check.get("status") == "COMPLETED" and check.get("conclusion") in acceptable)
            or check.get("state") == "SUCCESS"
            for check in checks
        )
    )


def refresh_branch(base: str, previous_head: str, pins: dict[str, str], versions: dict[str, str]) -> bool:
    # A disposable sparse checkout keeps the changes away from any active addon-sync worktree.
    with tempfile.TemporaryDirectory(prefix="pq-component-pins-") as temp:
        checkout = Path(temp)
        run("git", "clone", "--quiet", "--filter=blob:none", "--sparse", "--single-branch",
            "--branch", "main", REMOTE, temp)
        if run("git", "rev-parse", "HEAD", cwd=checkout) != base:
            print("PandaQuest main advanced. The next run will use the new base.")
            return False
        account = gh("api", "user")
        run("git", "config", "user.name", account["login"], cwd=checkout)
        run("git", "config", "user.email",
            f"{account['id']}+{account['login']}@users.noreply.github.com", cwd=checkout)
        for name, data in ((LOCK, pins), (VERSIONS, versions)):
            (checkout / name).write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
        run("git", "add", "--", LOCK, VERSIONS, cwd=checkout)
        run("git", "commit", "--quiet", "-m", TITLE, cwd=checkout)
        run("git", "push", f"--force-with-lease={REF}:{previous_head}", "origin", f"HEAD:{REF}", cwd=checkout)
    return True


def refresh(dry_run: bool = False) -> None:
    main_ref = f"repos/{CORE}/git/ref/heads/main"
    base = gh("api", main_ref)["object"]["sha"]
    current_pins, current_versions = locks(base)
    releases = {
        key: wanted_component(key, current_pins[key], current_versions[key])
        for key in COMPONENTS
    }
    pins = {key: pin for key, (pin, _) in releases.items()}
    versions = {key: version for key, (_, version) in releases.items()}
    if pins == current_pins and versions == current_versions:
        print("PandaQuest already pins the latest available component releases.")
        return
    print("PandaQuest component updates: " + ", ".join(
        f"{key} {current_versions[key]} -> {versions[key]}" for key in COMPONENTS
        if versions[key] != current_versions[key]
    ))
    if dry_run:
        return

    pulls = gh("pr", "list", "-R", CORE, "--base", "main", "--head", BRANCH, "--limit", "2",
               "--json", "number,title,headRefOid,isDraft,mergeStateStatus,statusCheckRollup")
    if len(pulls) > 1 or (pulls and (pulls[0]["title"] != TITLE or pulls[0]["isDraft"])):
        raise ValueError(f"{BRANCH} is in use by another pull request")
    pull = pulls[0] if pulls else None
    remote_ref = run("git", "ls-remote", REMOTE, REF)
    head = remote_ref.split()[0] if remote_ref else ""
    if pull and (not head or pull["headRefOid"] != head):
        print("The pin update branch just changed. The next run will check the new head.")
        return

    if head:
        commit = gh("api", f"repos/{CORE}/commits/{head}")
        parents = commit["parents"]
        changed = {item["filename"] for item in commit["files"]}
        if len(parents) != 1 or commit["commit"]["message"] != TITLE or changed != LOCK_FILES:
            raise ValueError(f"Unexpected commit on {BRANCH}: {head}")
        if parents[0]["sha"] == base and locks(head) == (pins, versions):
            if pull:
                if package_checked(pull) and gh("api", main_ref)["object"]["sha"] == base:
                    print(run("gh", "pr", "merge", str(pull["number"]), "-R", CORE, "--squash",
                              "--match-head-commit", head, "--delete-branch"))
                else:
                    print(f"PandaQuest #{pull['number']} is waiting for successful packaging checks.")
                return
        else:
            if not refresh_branch(base, head, pins, versions) or pull:
                return
    elif not refresh_branch(base, "", pins, versions):
        return

    print(run("gh", "pr", "create", "-R", CORE, "--base", "main", "--head", BRANCH, "--title", TITLE,
              "--body", "Use the latest stable database and auction ZIPs with the corresponding source commits."))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dry-run", action="store_true", help="check component versions without changing GitHub")
    args = parser.parse_args()
    refresh(args.dry_run)


if __name__ == "__main__":
    main()
