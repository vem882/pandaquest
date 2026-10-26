#!/usr/bin/env python3
"""The checks worth having in a repository with no toolchain.

    python3 .github/release/check.py            # run them all
    python3 .github/release/check.py -v         # name each one

Stdlib ``unittest`` and nothing else -- no pytest, no pip install, no Lua.  There is no Lua
interpreter here and no luacheck: a Lua interpreter and a linter are
not part of this repository, and this file deliberately does not try to reproduce them.  So these checks cannot tell
you the addon *works*; they tell you the package is not obviously broken, which is the class of
breakage a release can actually introduce:

* the TOC parses, and declares the fields the packaging and the client depend on;
* every file the TOC lists exists, with the case it is listed with -- a missing or
  wrongly-cased file is silent in-game on Windows and fatal on Linux builds;
* every file ``embeds.xml`` pulls in exists too, since the TOC lists the XML and not its
  contents;
* nothing packaged is unreachable, empty or from the development tree: a ``.lua`` no TOC line
  or XML include names is either a module the game never runs or a download nobody uses, a
  zero-byte entry is a generator that failed halfway, and a ``.py`` in an AddOns folder is how
  somebody comes to believe the addon needs Python;
* the zip's contract holds: the name a consumer can see, every path under ``PandaQuest/``, the
  version stamped, the same bytes when built twice;
* every TOC is the one template filled for its game, the repository's ``PandaQuest.toc`` byte for
  byte, and each TOC tags the CurseForge file with its game's version *and* game version type.

Nothing here asserts a number it did not measure: the version cases compute what git says and
compare, rather than hard-coding 84.  The one hard-coded number is the interface version, which
is not measurable from this repository -- it is what the 5.5.4 client expects.
"""

from __future__ import annotations

import io
import json
import re
import struct
import tempfile
import unittest
import xml.etree.ElementTree as ElementTree
import zipfile
from pathlib import Path
from unittest import mock

import build
import curseforge
import games

# The checks that run the addon's Lua (Core/Game.lua, the saved-variable fixtures) need lupa, which a
# GitHub-hosted runner does not have; there they report themselves skipped. See lua_checks.py.
from lua_checks import AceDBKeepsTheTag, GameDetection, TheDatabaseCheck, TheSavedVariables  # noqa: F401
from waypoint_checks import PinpointRange, TheWayOwner, WayParser  # noqa: F401

REPO = Path(__file__).resolve().parents[2]
ADDON_DIR = REPO / build.ADDON
TOC = ADDON_DIR / f"{build.ADDON}.toc"

#: ``## Key: value``.  WoW also accepts localized suffixes (``## Notes-fiFI``), which this
#: allows through the hyphen.
DIRECTIVE = re.compile(r"^##\s*([A-Za-z][\w-]*)\s*:\s*(.*)$")

#: What the packaging or the client would miss if it were gone.  ``Interface`` decides whether
#: the client loads the addon at all; ``Title`` is what the AddOns list draws and what the
#: version is stamped into; ``Version`` supplies the series.
REQUIRED_DIRECTIVES = ("Interface", "Title", "Version")

#: The interface version Mists of Pandaria Classic 5.5.4 expects, asserted by value and not by
#: shape.  The client compares ``## Interface`` against its own build number and anything else
#: leaves the addon greyed out under "Load out of date AddOns" -- no error, no chat line,
#: nothing in the log, and every bug report that follows says "the addon does nothing".  It
#: moves when the game's patch level does.
MOP_CLASSIC_INTERFACE = "50504"

#: Nothing from the workshop reaches a player's AddOns folder.  ``build.py``'s exclusion lists
#: are supposed to keep these out; this is the independent statement of the same rule, so that
#: an exclusion list edited wrongly is caught by something that does not share it.
DEVELOPMENT_SUFFIXES = (".py", ".pyc", ".pyo")
DEVELOPMENT_PARTS = ("__pycache__", ".git", ".pytest_cache")


def toc_lines(text: str) -> tuple[dict[str, str], list[str]]:
    """Split a TOC into its ``## Key: value`` directives and its list of files.

    Comment lines (``#`` not followed by ``#``) and blank lines are dropped, which is what the
    client does.  A later directive wins, as it does in the client.
    """
    directives: dict[str, str] = {}
    files: list[str] = []
    for raw in text.splitlines():
        line = raw.strip()
        if not line:
            continue
        if line.startswith("##"):
            match = DIRECTIVE.match(line)
            if match:
                directives[match.group(1)] = match.group(2).strip()
            continue
        if line.startswith("#"):
            continue
        files.append(line)
    return directives, files


class TocParses(unittest.TestCase):
    def setUp(self) -> None:
        self.text = TOC.read_text(encoding="utf-8-sig")
        self.directives, self.files = toc_lines(self.text)

    def test_every_hash_hash_line_is_a_directive(self) -> None:
        """A ``##`` line that is not ``Key: value`` is a field the client silently drops."""
        bad = [
            line.strip()
            for line in self.text.splitlines()
            if line.strip().startswith("##") and not DIRECTIVE.match(line.strip())
        ]
        self.assertEqual(bad, [], "malformed ## directive lines")

    def test_the_directives_the_build_depends_on_are_there(self) -> None:
        for key in REQUIRED_DIRECTIVES:
            self.assertIn(key, self.directives)
            self.assertTrue(self.directives[key], f"## {key} is empty")

    def test_interface_is_the_mop_classic_number(self) -> None:
        """5.5.4 is interface 50504.  A wrong number makes the client mark the addon out of date.

        The value, not its shape: ``isdigit()`` alone passes 11507 and 99999 as happily as the
        right number, and a wrong interface version is silent in-game.  ``TheZipContract``
        asserts the same constant against the *packaged* TOC, which is the copy a player runs.
        """
        self.assertEqual(self.directives["Interface"], MOP_CLASSIC_INTERFACE)

    def test_the_declared_version_is_a_series_the_packaging_can_extend(self) -> None:
        """``release_version`` keeps the first two components and appends the commit count."""
        declared = self.directives["Version"]
        parts = declared.split(".")
        self.assertGreaterEqual(len(parts), build.SERIES_PARTS, f"{declared!r} has no series")
        for part in parts[: build.SERIES_PARTS]:
            self.assertTrue(build._is_number(part), f"{part!r} in {declared!r} is not ASCII digits")

    def test_no_file_is_listed_twice(self) -> None:
        """WoW loads a doubly-listed file twice; in this addon that re-registers event handlers."""
        seen = [name.lower() for name in self.files]
        self.assertEqual(sorted(seen), sorted(set(seen)), "a file is listed more than once")

    def test_the_generated_build_file_is_not_listed_or_committed(self) -> None:
        """``Core/Build.lua`` is written at packaging time; a real one would be shadowed."""
        listed = {name.replace("\\", "/").lower() for name in self.files}
        self.assertNotIn(build.BUILD_LUA.lower(), listed)
        self.assertFalse((ADDON_DIR / build.BUILD_LUA).exists())


class EveryListedFileExists(unittest.TestCase):
    """The TOC lists files with backslashes; the filesystem here uses forward slashes."""

    def setUp(self) -> None:
        _, self.files = toc_lines(TOC.read_text(encoding="utf-8-sig"))

    def test_every_toc_entry_is_a_file_on_disk(self) -> None:
        missing = [name for name in self.files if not (ADDON_DIR / name.replace("\\", "/")).is_file()]
        self.assertEqual(missing, [], "listed in the TOC, not in PandaQuest/")

    def test_the_case_matches(self) -> None:
        """Windows does not care and Linux does; Linux, where the release is built, does."""
        wrong = []
        for name in self.files:
            relative = Path(name.replace("\\", "/"))
            here = ADDON_DIR
            for part in relative.parts:
                entries = {child.name for child in here.iterdir()} if here.is_dir() else set()
                if part not in entries:
                    wrong.append(name)
                    break
                here = here / part
        self.assertEqual(wrong, [], "listed with a case that is not the case on disk")

    def test_every_file_embeds_xml_pulls_in_exists(self) -> None:
        """The TOC lists embeds.xml, not the libraries inside it."""
        missing: list[str] = []
        queue = [Path("embeds.xml")]
        seen: set[str] = set()
        while queue:
            current = queue.pop()
            key = current.as_posix().lower()
            if key in seen:
                continue
            seen.add(key)
            full = ADDON_DIR / current
            if not full.is_file():
                missing.append(current.as_posix())
                continue
            root = ElementTree.parse(full).getroot()
            for element in root.iter():
                tag = element.tag.rsplit("}", 1)[-1]
                referenced = element.get("file")
                if not referenced or tag not in ("Script", "Include"):
                    continue
                child = current.parent / referenced.replace("\\", "/")
                if tag == "Include":
                    queue.append(child)
                elif not (ADDON_DIR / child).is_file():
                    missing.append(child.as_posix())
        self.assertEqual(missing, [], "referenced by an embedded XML, not on disk")


class TheVersion(unittest.TestCase):
    def test_it_is_the_series_plus_this_repository_s_commit_count(self) -> None:
        count = build.commit_count()
        if count is None:
            self.skipTest("not a git checkout: release_version falls back to the declared version")
        series = build.read_toc_version().split(".")[: build.SERIES_PARTS]
        self.assertEqual(build.release_version(), ".".join([*series, str(count)]))

    def test_it_is_not_the_declared_version_in_a_real_checkout(self) -> None:
        """No git at all falls back to the TOC's series, which sorts below every release."""
        if build.commit_count() is None:
            self.skipTest("not a git checkout")
        self.assertNotEqual(build.release_version(), build.read_toc_version())

    def test_the_history_is_whole(self) -> None:
        """A shallow checkout is the quiet one, and it is not the fallback above.

        Measured, not assumed: ``git clone --depth 1`` of this repository answers
        ``rev-list --count HEAD`` with 1, so release_version returns ``0.2.1`` -- digits and
        dots, matching the asset-name pattern, passing every other case here, and sorting below
        every package a consumer holds.  So this case exists, and build.py's ``package`` refuses
        as well.  If it fails on a runner, the checkout lost ``fetch-depth: 0``.
        """
        self.assertFalse(build.is_shallow(), "shallow checkout: the commit count is not the count")

    def test_the_hub_can_see_the_file_name_it_produces(self) -> None:
        name = build.package_name(build.release_version())
        match = build.PORTAL_PACKAGE_PATTERN.match(name)
        self.assertIsNotNone(match, f"{name} does not match the asset-name pattern")
        # A consumer orders with tuple(int(part) for part in version.split(".")).  This is that
        # expression; if it raises, the package is invisible to the ordering and not just
        # mis-sorted.
        assert match is not None
        tuple(int(part) for part in match.group(1).split("."))

    def test_a_name_with_a_v_in_it_is_refused(self) -> None:
        self.assertIsNone(build.PORTAL_PACKAGE_PATTERN.match("PandaQuest-v0.2.84.zip"))
        self.assertIsNone(build.PORTAL_PACKAGE_PATTERN.match("PandaQuest-0.2.84+abc1234.zip"))


class ThePublishGuards(unittest.TestCase):
    """``package`` refuses three things outright.  Asserted here, not left to a runner to find.

    Every case forces the state rather than reading the environment, so none of them skips: a
    check that skips on the machine where the fault occurs is not a check.  The version cases
    above do skip outside a git checkout, and these are what covers that gap -- with git gone,
    ``commit_count`` returns None and the first guard below is the one that fires.
    """

    COUNT = 7  # any number; these cases are about the refusal, not about the count

    def _refuses(self, name: str) -> str:
        with tempfile.TemporaryDirectory() as directory:
            target = Path(directory) / name
            with self.assertRaises(SystemExit) as refused:
                build.package(target)
            self.assertFalse(target.exists(), "it refused but wrote the file anyway")
        return str(refused.exception)

    def test_it_refuses_when_git_cannot_answer(self) -> None:
        """No git means release_version falls back to the TOC's series and never moves again."""
        with mock.patch.object(build, "commit_count", return_value=None):
            message = self._refuses(f"PandaQuest-{build.read_toc_version()}.zip")
        self.assertIn("git could not answer", message)

    def test_it_refuses_a_shallow_checkout(self) -> None:
        with mock.patch.object(build, "commit_count", return_value=self.COUNT), mock.patch.object(
            build, "is_shallow", return_value=True
        ):
            message = self._refuses("PandaQuest-0.2.1.zip")
        self.assertIn("shallow", message)

    def test_it_refuses_a_name_the_hub_cannot_see(self) -> None:
        with mock.patch.object(build, "commit_count", return_value=self.COUNT), mock.patch.object(
            build, "is_shallow", return_value=False
        ):
            message = self._refuses("PandaQuest-v0.2.7.zip")
        self.assertIn("not a name the release asset rules allow", message)

    def test_it_refuses_a_name_whose_version_is_not_the_one_it_builds(self) -> None:
        """Right shape, wrong number: a consumer then sorts by the name and advertises the comment.

        ``find_package`` orders candidates by the version in the file name and ``index_package``
        takes the manifest's version from the archive comment, so a mistyped digit produces a
        package a consumer sorts at one version and serves as another -- and nothing reports it.
        """
        with mock.patch.object(build, "commit_count", return_value=self.COUNT), mock.patch.object(
            build, "is_shallow", return_value=False
        ):
            message = self._refuses("PandaQuest-9.9.9.zip")
        self.assertIn("says version 9.9.9", message)


class TheZipContract(unittest.TestCase):
    """Build once into memory and assert what a consumer, the manifest and WoW depend on."""

    @classmethod
    def setUpClass(cls) -> None:
        cls.ident = build.identity()
        try:
            # build.zip_bytes and not a second construction here: a copy of the packing code in
            # the test is a test of the copy. Everything below is then an assertion about the
            # bytes build.py actually writes.
            cls.blob = build.zip_bytes(cls.ident)
        except SystemExit as refused:
            # build.py refuses rather than packaging something wrong -- a committed
            # Core/Build.lua, a missing TOC.  Re-raised as a failure so it is reported as one
            # and the rest of this file still runs; a bare SystemExit ends the process here and
            # takes every case after it with it.
            raise AssertionError(f"the package could not be built: {refused}") from refused
        cls.archive = zipfile.ZipFile(io.BytesIO(cls.blob))
        cls.infos = cls.archive.infolist()

    def _reachable(self) -> set[str]:
        """Every archive path a packaged TOC reaches, directly or through an XML include.

        The client's own load order: the TOC names files and XML files, an XML names scripts
        and further XML.  Anything outside the closure is never run.  Every game's TOC counts:
        Era's database is reached by ``PandaQuest_Vanilla.toc`` and by no other.
        """
        names = {name.lower(): name for name in self.archive.namelist()}
        prefix = f"{build.ADDON}/"
        listed: list[str] = []
        for name in self.archive.namelist():
            if name.count("/") == 1 and name.startswith(prefix) and name.endswith(".toc"):
                listed += toc_lines(self.archive.read(name).decode("utf-8-sig"))[1]
        reached: set[str] = set()
        queue = [prefix + entry.replace("\\", "/") for entry in listed]
        while queue:
            current = queue.pop()
            key = current.lower()
            if key in reached:
                continue
            reached.add(key)
            actual = names.get(key)
            if actual is None or not key.endswith(".xml"):
                continue
            root = ElementTree.fromstring(self.archive.read(actual).decode("utf-8-sig"))
            parent = actual.rsplit("/", 1)[0]
            for element in root.iter():
                tag = element.tag.rsplit("}", 1)[-1]
                referenced = element.get("file")
                if referenced and tag in ("Script", "Include"):
                    queue.append(parent + "/" + referenced.replace("\\", "/"))
        return reached

    def test_every_path_is_under_the_addon_folder(self) -> None:
        """``PandaQuest/`` is the folder WoW installs and what the update manifest's paths are."""
        outside = [info.filename for info in self.infos if not info.filename.startswith("PandaQuest/")]
        self.assertEqual(outside, [])

    def test_no_path_escapes_the_archive(self) -> None:
        for info in self.infos:
            self.assertNotIn("..", Path(info.filename).parts)
            self.assertFalse(info.filename.startswith("/"))
            self.assertNotIn("\\", info.filename)

    def test_the_entries_are_sorted_and_none_is_a_directory(self) -> None:
        names = [info.filename for info in self.infos]
        self.assertEqual(names, sorted(names))
        self.assertEqual([info.filename for info in self.infos if info.is_dir()], [])

    def test_the_metadata_carries_no_clock_and_no_umask(self) -> None:
        for info in self.infos:
            self.assertEqual(info.date_time, build.ZIP_DATE_TIME, info.filename)
            self.assertEqual(info.external_attr, build.ZIP_EXTERNAL_ATTR, info.filename)

    def test_building_it_twice_gives_the_same_bytes(self) -> None:
        self.assertEqual(build.zip_bytes(self.ident), self.blob)

    def test_every_shipped_file_in_the_tree_is_in_the_zip(self) -> None:
        """Walked here with rglob, deliberately, and not with ``build.iter_addon_files``.

        Building the expected set from the packer's own walk makes this case unable to fail on
        the thing it looks like it guards: a wrong entry in EXCLUDED_SUFFIXES that drops a
        shipped file moves both sides of the comparison together and the case stays green. So
        the expected set is stated independently -- every file with an extension the addon
        actually loads or draws, whatever build.py thinks about it.
        """
        shipped = {".lua", ".xml", ".toc", ".tga", ".blp", ".ttf", ".otf", ".md", ".txt"}
        packaged = set(self.archive.namelist())
        expected = {
            f"{build.ADDON}/{path.relative_to(ADDON_DIR).as_posix()}"
            for path in ADDON_DIR.rglob("*")
            if path.is_file() and path.suffix.lower() in shipped
        }
        self.assertEqual(sorted(expected - packaged), [], "in PandaQuest/, not in the zip")

    def test_the_zip_holds_nothing_from_the_development_tree(self) -> None:
        """The player gets the addon, not the workshop.

        A stray ``.py`` in an AddOns folder is how somebody comes to believe the addon needs
        Python installed. Stated against literal patterns rather than against build.py's
        exclusion lists, so that an exclusion list edited wrongly is caught by something that
        does not share it.
        """
        strays = sorted(
            name
            for name in self.archive.namelist()
            if name.lower().endswith(DEVELOPMENT_SUFFIXES)
            or any(part in DEVELOPMENT_PARTS for part in name.split("/"))
        )
        self.assertEqual(strays, [], "packaged, and no player has any use for it")

    def test_the_zip_ships_the_generated_database_and_the_embedded_libraries(self) -> None:
        """Neither is hand-written, which is exactly why they go missing.

        ``Database/Data/*.lua`` is generated outside this repository and ``Libs/``
        is vendored Ace3. A tree checked out without them still parses and still packages, and
        the result is an addon with no quest data and no AceAddon, which errors on the first
        line it runs.
        """
        names = set(self.archive.namelist())
        prefix = f"{build.ADDON}/"
        data = sorted(name for name in names if name.startswith(f"{prefix}Database/Data/"))
        self.assertNotEqual(data, [], "the zip has no Database/Data/: the addon has no quests")
        self.assertIn(
            f"{prefix}Libs/LibStub/LibStub.lua",
            names,
            "every embedded library loads through LibStub, so embeds.xml fails on its first Script",
        )

    def test_no_entry_is_empty(self) -> None:
        """A generator that fails halfway writes a zero-byte file, and packaging includes it."""
        empty = sorted(info.filename for info in self.infos if info.file_size == 0)
        self.assertEqual(empty, [], "zero bytes in the package")

    def test_nothing_packaged_is_unreachable(self) -> None:
        """A .lua no TOC line and no XML include names is never run by the game.

        Either somebody wrote a module and forgot the TOC line -- in which case the feature is
        simply absent in game and nothing else notices -- or the file is obsolete and is
        costing every player its bytes on every download.
        """
        reached = self._reachable()
        orphans = sorted(
            name
            for name in self.archive.namelist()
            if name.lower().endswith(".lua") and name.lower() not in reached
        )
        self.assertEqual(orphans, [], "in the zip, reached by no TOC line and no XML include")

    def test_everything_the_packaged_toc_names_is_packaged(self) -> None:
        """The other direction, against the zip rather than against the working tree."""
        packaged = {name.lower() for name in self.archive.namelist()}
        missing = sorted(name for name in self._reachable() if name not in packaged)
        self.assertEqual(missing, [], "named by the packaged TOC or an XML, not in the zip")

    def test_the_packaged_toc_is_stamped(self) -> None:
        text = self.archive.read("PandaQuest/PandaQuest.toc").decode("utf-8-sig")
        directives, files = toc_lines(text)
        self.assertEqual(directives["Version"], self.ident["build"])
        self.assertIn(build.shown_version(self.ident), directives["Title"])
        self.assertEqual(files[0], build.BUILD_LUA_TOC_LINE, "Core\\Build.lua must load first")

    def test_the_packaged_toc_declares_the_interface_the_client_expects(self) -> None:
        """Asserted against the packaged copy too: stamping rewrites this file."""
        text = self.archive.read("PandaQuest/PandaQuest.toc").decode("utf-8-sig")
        directives, _files = toc_lines(text)
        self.assertEqual(directives.get("Interface"), MOP_CLASSIC_INTERFACE)

    def test_the_toc_is_stamped_once_however_often_it_is_stamped(self) -> None:
        """Re-packaging an already-packaged TOC must not leave three version tags in the title."""
        once = build.stamp_toc(TOC.read_text(encoding="utf-8-sig"), self.ident)
        twice = build.stamp_toc(once, self.ident)
        self.assertEqual(once, twice)

    def test_the_generated_build_lua_holds_the_identity(self) -> None:
        text = self.archive.read(f"PandaQuest/{build.BUILD_LUA}").decode("utf-8")
        self.assertIn(f'version = "{self.ident["version"]}"', text)
        self.assertIn(f'build = "{self.ident["build"]}"', text)
        self.assertIn(f'commit = "{self.ident["commit"]}"', text)

    def test_the_archive_comment_is_the_identity_the_hub_reads(self) -> None:
        comment = json.loads(self.archive.comment.decode("utf-8"))
        self.assertEqual(comment["addon"], build.ADDON)
        self.assertEqual(comment["version"], self.ident["version"])
        self.assertEqual(comment["build"], self.ident["build"])
        for key in ("commit", "committed", "subject", "dirty"):
            self.assertIn(key, comment)

    def test_the_archive_is_readable(self) -> None:
        self.assertIsNone(self.archive.testzip(), "a member fails its CRC")


class TheWorkflow(unittest.TestCase):
    """The things about .github/workflows/release.yml that fail silently if they rot.

    Text checks on purpose: they hold even when PyYAML is not installed, which on a
    GitHub-hosted runner it is not.  ``assertIn`` would print the whole workflow on failure,
    so each one carries its own message instead.
    """

    WORKFLOW = REPO / ".github" / "workflows" / "release.yml"

    def setUp(self) -> None:
        if not self.WORKFLOW.is_file():
            self.fail(f"{self.WORKFLOW} is missing: nothing publishes a release")
        self.text = self.WORKFLOW.read_text(encoding="utf-8")

    def test_it_checks_out_the_whole_history(self) -> None:
        """Without fetch-depth: 0 the commit count is 1 and the release version goes backwards."""
        self.assertTrue(
            "fetch-depth: 0" in self.text,
            f"{self.WORKFLOW} no longer says fetch-depth: 0, so the release version would be 1",
        )

    def test_gh_is_told_which_repository_to_talk_to(self) -> None:
        """The release job has no checkout, and gh does not read GITHUB_REPOSITORY.

        gh resolves the repository from --repo, from GH_REPO, or from a git remote in the
        working directory.  The release job downloads an artifact and nothing else, so with
        none of those every gh call fails with "not a git repository", no asset is published,
        and a consumer goes on offering the previous build.
        """
        self.assertTrue(
            "GH_REPO:" in self.text,
            f"{self.WORKFLOW} no longer sets GH_REPO, so gh cannot find the repository at all",
        )

    def test_the_tag_is_pinned_to_the_commit_that_was_built(self) -> None:
        """Without --target, gh tags the default branch's latest state at publish time.

        The release notes and the zip's archive comment both name GITHUB_SHA, so a tag created
        from whatever main happens to be makes the three disagree, and `git checkout v<version>`
        gives a tree that is not the one a player downloaded.
        """
        self.assertTrue(
            "--target" in self.text,
            f"{self.WORKFLOW} no longer passes --target, so the tag can name a different commit",
        )

    def test_the_publish_is_checked_and_not_merely_printed(self) -> None:
        """A draft release with an asset attached is not served by the public releases API.

        `gh release create` with an asset creates a draft, uploads, then publishes, so a run
        that dies in the middle leaves one. isDraft has to be asserted, or the step summary
        says "published" about something no player can download.
        """
        self.assertTrue(
            "isDraft" in self.text,
            f"{self.WORKFLOW} no longer asks about isDraft, so a draft release reads as published",
        )

    def test_it_parses_as_yaml_when_a_parser_is_available(self) -> None:
        try:
            import yaml  # noqa: PLC0415 - optional, and deliberately not a dependency
        except ImportError:
            self.skipTest("PyYAML is not installed; the text checks above still ran")
        document = yaml.safe_load(self.text)
        self.assertIn("jobs", document)
        # "on:" is YAML 1.1 true, which is why it is read back this way rather than by name.
        triggers = document.get("on", document.get(True))
        self.assertIsNotNone(triggers, "the workflow has no triggers")
        for job in ("build", "release"):
            self.assertIn(job, document["jobs"])
        self.assertEqual(document["jobs"]["release"]["permissions"]["contents"], "write")


class CurseForgeReadiness(unittest.TestCase):
    """The CurseForge upload is off until a project exists, so nothing else would notice it rot."""

    def test_the_zip_carries_the_mists_toc_beside_the_plain_one(self) -> None:
        ident = build.identity()
        content = build.entries(ident)
        plain = content["PandaQuest/PandaQuest.toc"]
        self.assertEqual(content["PandaQuest/PandaQuest_Mists.toc"], plain)
        text = plain.decode("utf-8")
        self.assertIn("## Interface: 50504", text)
        self.assertIn("## AllowLoadGameType: mists", text)
        # Committed beside the plain one, because CurseForge's own packager ships the tree's TOCs.
        self.assertEqual((ADDON_DIR / "PandaQuest_Mists.toc").read_bytes(), TOC.read_bytes())

    def test_the_game_version_is_what_the_toc_says(self) -> None:
        self.assertEqual(curseforge.game_version(50504), "5.5.4")
        interface = curseforge.toc_interface(TOC.read_text(encoding="utf-8"))
        self.assertEqual(interface, 50504)

    def test_only_an_exact_name_is_a_game_version(self) -> None:
        versions = [{"id": 1, "name": "5.5.4"}, {"id": 2, "name": "5.5.40"}, {"id": 3, "name": "5.4.8"}]
        self.assertEqual(curseforge.pick_version_ids(versions, "5.5.4"), [1])
        self.assertEqual(curseforge.pick_version_ids(versions, "9.9.9"), [])

    def test_a_game_version_is_its_name_and_its_type(self) -> None:
        """The same name under another game's type is another game's version, and is not picked."""
        versions = [
            {"id": 1, "name": "5.5.4", "gameVersionTypeID": games.MOP.curseforge_type},
            {"id": 2, "name": "5.5.4", "gameVersionTypeID": 517},
            {"id": 3, "name": "1.60.1", "gameVersionTypeID": games.FOREVER.curseforge_type},
        ]
        self.assertEqual(curseforge.pick_version_ids(versions, "5.5.4", games.MOP.curseforge_type), [1])
        self.assertEqual(curseforge.pick_version_ids(versions, "1.60.1", games.MOP.curseforge_type), [])
        wanted = [(games.MOP.curseforge_type, "5.5.4", games.MOP), (games.FOREVER.curseforge_type, "1.60.1", games.FOREVER)]
        self.assertEqual(curseforge.pick_all_version_ids(versions, wanted), ([1, 3], []))
        ids, problems = curseforge.pick_all_version_ids(versions[:2], wanted)
        self.assertEqual(ids, [1])
        self.assertEqual(len(problems), 1)
        self.assertIn("WoW Forever", problems[0])
        self.assertIn("88568", problems[0])

    def test_every_toc_the_package_carries_maps_to_its_game(self) -> None:
        """Six TOCs, four games, four game versions, each under its own game version type."""
        wanted = curseforge.wanted_versions(build.toc_texts())
        self.assertEqual([(type_id, name, game.key) for type_id, name, game in wanted],
                         [(67408, "1.15.9", "era"), (73246, "2.5.6", "anniversary"), (79434, "5.5.4", "mop"),
                          (88568, "1.60.1", "forever")])

    def test_forever_tocs_would_add_forever_1_60_1(self) -> None:
        """Prepared, not shipped: the mapping a package with Forever's TOCs would get (step A3)."""
        tocs = {
            "PandaQuest.toc": "## Interface: 50504\n",
            "PandaQuest_Mists.toc": "## Interface: 50504\n",
            "PandaQuest_Forever.toc": "## Interface: 16001\n",
            "PandaQuest_Camelot.toc": "## Interface: 16001\n",
        }
        wanted = curseforge.wanted_versions(tocs)
        self.assertEqual([(type_id, name, game.key) for type_id, name, game in wanted],
                         [(79434, "5.5.4", "mop"), (88568, "1.60.1", "forever")])
        both = curseforge.wanted_versions({"PandaQuest.toc": "## Interface: 50504, 16001\n"})
        self.assertEqual([game.key for _t, _n, game in both], ["mop", "forever"])

    def test_a_toc_for_the_wrong_game_or_no_game_is_refused(self) -> None:
        for name, text in (
            ("PandaQuest_Mists.toc", "## Interface: 16001\n"),     # the Mists client would read Forever's file
            ("PandaQuest_Forever.toc", "## Interface: 50504\n"),
            ("PandaQuest.toc", "## Interface: 110205\n"),          # Retail: not an addon target
            ("PandaQuest_Vanilla.toc", "## Interface: 20506\n"),   # Era's client would read TBC's file
            ("PandaQuest_TBC.toc", "## Interface: 11509\n"),
            ("PandaQuest.toc", "## Title: no interface\n"),
        ):
            with self.subTest(name=name, text=text), self.assertRaises(ValueError):
                curseforge.wanted_versions({name: text})

    def test_the_upload_is_tagged_from_the_packages_own_tocs(self) -> None:
        """Every TOC in the zip, mapped and looked up by name and type, sent once each."""
        import os  # noqa: PLC0415

        versions = [
            {"id": 11, "name": "5.5.4", "gameVersionTypeID": 79434},
            {"id": 12, "name": "5.5.4", "gameVersionTypeID": 517},
            {"id": 21, "name": "1.60.1", "gameVersionTypeID": 88568},
        ]
        sent = []

        def answer(request):
            if request.full_url.endswith("/game/versions"):
                return versions
            sent.append(request.data)
            return {"id": 99}

        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "PandaQuest-0.2.1.zip"
            notes = Path(tmp) / "changelog.txt"
            notes.write_text("0.2.1\n- x - y\n", encoding="utf-8")
            with zipfile.ZipFile(path, "w") as archive:
                for name, interface in (("PandaQuest.toc", 50504), ("PandaQuest_Mists.toc", 50504),
                                        ("PandaQuest_Forever.toc", 16001)):
                    archive.writestr(f"PandaQuest/{name}", f"## Interface: {interface}\n## X-Curse-Project-ID: 111\n")
            with mock.patch.dict(os.environ, {"CF_API_TOKEN": "x"}), \
                    mock.patch.object(curseforge, "_call", side_effect=answer):
                self.assertEqual(curseforge.upload(path, "111", "beta", notes), 0)
        self.assertEqual(len(sent), 1)
        self.assertIn(b'"gameVersions": [11, 21]', sent[0])

    def test_an_unmapped_toc_stops_the_upload_before_anything_is_sent(self) -> None:
        import os  # noqa: PLC0415

        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "PandaQuest-0.2.1.zip"
            with zipfile.ZipFile(path, "w") as archive:
                archive.writestr("PandaQuest/PandaQuest.toc", "## Interface: 110205\n## X-Curse-Project-ID: 111\n")
            with mock.patch.dict(os.environ, {"CF_API_TOKEN": "x"}), \
                    mock.patch.object(curseforge, "_call", side_effect=AssertionError("must not call")):
                self.assertEqual(curseforge.upload(path, "111", "beta"), 2)

    def test_the_changelog_is_the_newest_section(self) -> None:
        text = "# Changelog\n\n## [0.3] - x\nnew\n\n## [0.2] - y\nold\n"
        self.assertEqual(curseforge.latest_changelog(text), "## [0.3] - x\nnew")

    def test_the_upload_body_carries_metadata_and_the_file_unchanged(self) -> None:
        meta = curseforge.metadata("0.2.1", "notes", [7], "beta")
        content_type, body = curseforge.multipart({"metadata": json.dumps(meta)}, "a.zip", b"PK\x03\x04")
        boundary = content_type.split("boundary=")[1].encode()
        self.assertTrue(body.endswith(b"--" + boundary + b"--\r\n"))
        self.assertIn(b"PK\x03\x04", body)
        self.assertIn(b'"gameVersions": [7]', body)
        with self.assertRaises(ValueError):
            curseforge.metadata("0.2.1", "n", [7], "stable")

    def test_an_upload_to_another_project_is_refused_before_anything_is_sent(self) -> None:
        import os  # noqa: PLC0415
        from unittest import mock  # noqa: PLC0415

        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "PandaQuest-0.2.1.zip"
            with zipfile.ZipFile(path, "w") as archive:
                archive.writestr("PandaQuest/PandaQuest.toc", "## X-Curse-Project-ID: 111\n")
            self.assertEqual(curseforge.zip_project_id(path), "111")
            with mock.patch.dict(os.environ, {"CF_API_TOKEN": "x"}), \
                    mock.patch.object(curseforge, "_call", side_effect=AssertionError("must not call")):
                self.assertEqual(curseforge.upload(path, "222", "beta"), 2)

    def test_the_automatic_packaging_gets_the_addon_and_nothing_around_it(self) -> None:
        """CurseForge's webhook packages the repository root, and the addon is a subfolder."""
        meta = (REPO / ".pkgmeta").read_text(encoding="utf-8")
        self.assertRegex(meta, r"(?m)^package-as: PandaQuest$")
        self.assertRegex(meta, r"(?m)^  PandaQuest/PandaQuest: PandaQuest$")
        self.assertIn("filename: PandaQuest/changelog.txt", meta)
        # That package is every game's, like the release zip: no game's database is left out of it.
        ignored = re.findall(r"(?m)^  - (\S+)$", meta)
        self.assertNotIn("PandaQuest", ignored)
        for path in ignored:
            self.assertFalse(path.startswith("PandaQuest/"), f".pkgmeta leaves {path} out of the webhook package")
        # CurseForge's validator answered "Unknown markup type 'text'" to this key; what the
        # local packager accepts is not what CurseForge accepts, so the key stays out.
        self.assertNotRegex(meta, r"(?m)^\s*markup-type:")
        self.assertTrue((ADDON_DIR / "changelog.txt").is_file())

    def test_the_toc_names_the_sites_it_is_published_on(self) -> None:
        toc = TOC.read_text(encoding="utf-8")
        self.assertRegex(toc, r"(?m)^## X-Wago-ID: [A-Za-z0-9]+$")

    def test_the_package_names_the_project_it_is_for(self) -> None:
        self.assertEqual(curseforge.toc_project_id("## Title: x\n## X-Curse-Project-ID: 1735809\n"), "1735809")
        self.assertIsNone(curseforge.toc_project_id("## Title: x\n"))
        toc = TOC.read_text(encoding="utf-8")
        self.assertRegex(toc, r"(?m)^## X-Curse-Project-ID: \d+$")

    def test_a_file_update_says_what_changed_since_the_last_one(self) -> None:
        tags = ["v0.2.113", "v0.2.111", "v0.2.99"]
        self.assertEqual(curseforge.previous_tag(tags, "0.2.113"), "v0.2.111")
        self.assertEqual(curseforge.previous_tag(tags, "0.2.120"), "v0.2.113")
        self.assertIsNone(curseforge.previous_tag(tags, "0.2.99"))
        text = curseforge.format_changelog("0.2.120", "v0.2.113", ["Fix the arrow", "Add a bar"])
        self.assertIn("since v0.2.113", text)
        self.assertIn("- Fix the arrow", text)
        self.assertEqual(curseforge.format_changelog("0.2.120", "v0.2.113", []), "")

    def test_the_upload_is_its_own_workflow_and_only_by_hand(self) -> None:
        """CurseForge forbids updates made to boost visibility, so nothing uploads by itself."""
        text = (REPO / ".github" / "workflows" / "publish-curseforge.yml").read_text(encoding="utf-8")
        triggers = text[text.index("\non:"):text.index("\npermissions:")]
        self.assertIn("workflow_dispatch:", triggers)
        for automatic in ("push:", "pull_request:", "schedule:", "release:"):
            self.assertNotIn(automatic, triggers)
        self.assertIn("fetch-depth: 0", text)
        self.assertIn("curseforge/${RELEASE_TAG}", text, "the reservation tag that stops a second upload")
        self.assertIn("gh release download", text, "it uploads the published zip, it does not build one")
        release = (REPO / ".github" / "workflows" / "release.yml").read_text(encoding="utf-8")
        self.assertNotIn("CF_API_TOKEN", release, "the release workflow must not hold the token")

    def test_a_beta_tag_is_a_release_like_any_other_to_the_tools_that_read_tags(self) -> None:
        tags = ["v0.2.140-beta", "v0.2.137", "v0.2.125"]
        self.assertEqual(curseforge.tag_key("v0.2.140-beta"), (0, 2, 140))
        self.assertIsNone(curseforge.tag_key("curseforge/v0.2.140-beta"))
        self.assertEqual(curseforge.previous_tag(tags, "0.2.141"), "v0.2.140-beta")
        self.assertEqual(curseforge.previous_tag(tags, "0.2.140"), "v0.2.137", "the same number is not older")
        self.assertEqual(curseforge.tag_release_type("v0.2.140-beta"), "beta")
        self.assertEqual(curseforge.tag_release_type("v0.2.137"), "release")

    def test_the_workflows_know_the_beta_tag_and_the_prerelease_flag(self) -> None:
        release = (REPO / ".github" / "workflows" / "release.yml").read_text(encoding="utf-8")
        for needle in ("build.py tag", "--prerelease", "--latest=false", "isPrerelease", "(?:-beta)?"):
            self.assertIn(needle, release, f"release.yml lost {needle!r}")
        self.assertNotIn('tag="v${VERSION}"', release, "the tag is computed once, by build.py")
        publish = (REPO / ".github" / "workflows" / "publish-curseforge.yml").read_text(encoding="utf-8")
        for needle in ("(-beta)?", 'VERSION="${VERSION%-beta}"', "--exclude-drafts", "auto"):
            self.assertIn(needle, publish, f"publish-curseforge.yml lost {needle!r}")

    def test_the_avatar_is_the_size_curseforge_asks_for(self) -> None:
        data = (REPO / "assets" / "logo" / "panda-quest-400.png").read_bytes()
        width, height = struct.unpack(">II", data[16:24])
        self.assertEqual((width, height), (400, 400))


class TheTocFiles(unittest.TestCase):
    """Every TOC is written from one template, and MoP's are today's TOC byte for byte.

    The repository keeps every game's TOC because CurseForge's own packager ships them as they are
    and tags the file for each; the release zip writes its copies from the template.  So what must
    hold is that the template, filled for each game, *is* the repository's TOC -- not "equivalent",
    the same bytes -- and that every game's TOC lists its own database and no other game's.
    """

    def test_the_repositorys_tocs_are_what_the_template_makes(self) -> None:
        """Every game's TOC is committed, byte for byte the template's: CurseForge's packager ships them."""
        for name, text in build.toc_texts().items():
            path = ADDON_DIR / name
            self.assertTrue(
                path.is_file() and path.read_bytes() == text.encode("utf-8"),
                f"{name} is missing or not what {build.TOC_TEMPLATE.name} makes: edit the template and "
                "run python3 .github/release/build.py tocs",
            )
        committed = sorted(path.name for path in ADDON_DIR.glob("*.toc"))
        self.assertEqual(committed, sorted(build.toc_texts()), "a TOC in PandaQuest/ that no game in games.py writes")
        self.assertTrue(build.write_tocs(check=True))

    ALL_TOCS = ["PandaQuest.toc", "PandaQuest_Camelot.toc", "PandaQuest_Forever.toc", "PandaQuest_Mists.toc",
                "PandaQuest_TBC.toc", "PandaQuest_Vanilla.toc"]

    def test_every_game_has_its_tocs_and_the_twins_have_the_same_bytes(self) -> None:
        tocs = build.toc_texts()
        self.assertEqual(sorted(tocs), self.ALL_TOCS)
        self.assertEqual(tocs["PandaQuest.toc"], tocs["PandaQuest_Mists.toc"])
        self.assertEqual(tocs["PandaQuest_Forever.toc"], tocs["PandaQuest_Camelot.toc"])
        content = build.entries(build.identity())
        packaged = sorted(name for name in content if name.count("/") == 1 and name.endswith(".toc"))
        self.assertEqual(packaged, [f"PandaQuest/{name}" for name in self.ALL_TOCS])
        self.assertEqual(content["PandaQuest/PandaQuest.toc"], content["PandaQuest/PandaQuest_Mists.toc"])
        self.assertEqual(content["PandaQuest/PandaQuest_Forever.toc"], content["PandaQuest/PandaQuest_Camelot.toc"])
        for name, interface in (("PandaQuest_Vanilla.toc", 11509), ("PandaQuest_TBC.toc", 20506),
                                ("PandaQuest_Forever.toc", 16001), ("PandaQuest_Mists.toc", 50504)):
            self.assertIn(f"## Interface: {interface}\n", tocs[name], name)

    def test_the_four_games(self) -> None:
        """Interfaces, suffixes and CurseForge types (BigWigsMods/packager's table) in one place."""
        self.assertEqual([game.key for game in games.shipped()], ["mop", "era", "anniversary", "forever"])
        rows = {game.key: (game.interface, game.suffixes, game.curseforge_type) for game in games.GAMES}
        self.assertEqual(rows, {
            "mop": (50504, ("_Mists",), 79434),
            "era": (11509, ("_Vanilla",), 67408),
            "anniversary": (20506, ("_TBC",), 73246),
            "forever": (16001, ("_Forever", "_Camelot"), 88568),
        })
        self.assertIs(games.by_interface(16001), games.FOREVER)
        self.assertIs(games.by_interface(50504), games.MOP)
        self.assertIs(games.by_interface(11509), games.ERA)
        self.assertIs(games.by_interface(11508), games.ERA)
        self.assertIs(games.by_interface(20506), games.ANNIVERSARY)
        self.assertIsNone(games.by_interface(110205))
        self.assertIs(games.by_suffix(""), games.MOP)
        self.assertIs(games.by_suffix("_TBC"), games.ANNIVERSARY)
        self.assertIs(games.by_suffix("_Camelot"), games.FOREVER)

    def test_each_toc_lists_its_own_database_and_no_other_games(self) -> None:
        """A client never parses another game's data: each TOC names its own folder only."""
        folders = {"mop": "database\\data\\", "era": "database\\era\\",
                   "anniversary": "database\\anniversary\\", "forever": "database\\forever\\"}
        shared_ok = {"database\\data\\seed.lua"}            # pfQuest's vanilla+tbc seed: Era's and TBC's too
        for game in games.shipped():
            name = f"PandaQuest{game.suffixes[0]}.toc"
            _directives, files = toc_lines(build.toc_texts()[name])
            own = [*game.zone_data, *game.data]
            self.assertEqual([entry for entry in files if entry in own], own, f"{name}: in that order")
            for other, folder in folders.items():
                if other == game.key:
                    continue
                strays = [entry for entry in files if entry.lower().startswith(folder) and entry.lower() not in shared_ok]
                self.assertEqual(strays, [], f"{name} lists {other}'s files")
            for entry in own:
                self.assertTrue((ADDON_DIR / entry.replace("\\", "/")).is_file(), entry)

    def test_forever_ships_its_database(self) -> None:
        """Forever's TOC lists its own generated database (beta data until launch), no Pending.lua."""
        _directives, files = toc_lines(build.toc_texts()["PandaQuest_Forever.toc"])
        forever = [entry for entry in files if entry.lower().startswith("database\\forever\\")]
        self.assertIn("Database\\Forever\\Data\\Quests.lua", forever)
        self.assertIn("Database\\Forever\\ZoneData.lua", forever)
        self.assertNotIn("Database\\Forever\\Pending.lua", forever)
        self.assertNotIn("Database\\Data\\Seed.lua", files)
        self.assertFalse((ADDON_DIR / "Database" / "Forever" / "Pending.lua").exists())

    def test_the_game_is_known_before_anything_reads_the_database(self) -> None:
        """Core/Game.lua is the first file, and the first after Core/Build.lua in the package."""
        _directives, files = toc_lines(TOC.read_text(encoding="utf-8-sig"))
        self.assertEqual(files[0], "Core\\Game.lua")
        packaged = build.entries(build.identity())["PandaQuest/PandaQuest_Mists.toc"].decode("utf-8")
        _directives, files = toc_lines(packaged)
        self.assertEqual(files[:2], [build.BUILD_LUA_TOC_LINE, "Core\\Game.lua"])

    def test_the_saved_variables_are_the_ones_core_game_lua_tags(self) -> None:
        """Every saved variable the TOC declares is one Game.ClaimSavedVariables tags, or a retired one."""
        directives, _files = toc_lines(TOC.read_text(encoding="utf-8-sig"))
        declared = [name.strip() for name in directives["SavedVariables"].split(",")]
        game = (ADDON_DIR / "Core" / "Game.lua").read_text(encoding="utf-8")
        listed = re.search(r"Game\.SAVED_VARIABLES = \{([^}]*)\}", game)
        retired = re.search(r"Game\.RETIRED_SAVED_VARIABLES = \{([^}]*)\}", game)
        self.assertIsNotNone(listed)
        self.assertIsNotNone(retired)
        assert listed is not None and retired is not None
        tagged = re.findall(r'"(\w+)"', listed.group(1))
        kept = re.findall(r'"(\w+)"', retired.group(1))
        self.assertEqual(sorted(tagged + kept), sorted(declared))
        self.assertFalse(set(tagged) & set(kept))

    def test_the_auction_data_stays_declared(self) -> None:
        """The Auction module is gone, but WoW deletes an undeclared saved variable at logout:
        PandaQuestAH must stay in the TOC so no player's stored scans are lost."""
        directives, _files = toc_lines(TOC.read_text(encoding="utf-8-sig"))
        declared = [name.strip() for name in directives["SavedVariables"].split(",")]
        self.assertIn("PandaQuestAH", declared)
        for path in ADDON_DIR.rglob("*.lua"):
            if path.parts[-3:-1] == ("Database", "Data") or "Libs" in path.parts:
                continue
            code = "\n".join(line.split("--", 1)[0] for line in path.read_text(encoding="utf-8").splitlines())
            if path.name == "Game.lua":
                code = re.sub(r"Game\.RETIRED_SAVED_VARIABLES = \{[^}]*\}", "", code)
            self.assertNotIn("PandaQuestAH", code, f"{path.relative_to(ADDON_DIR)} touches PandaQuestAH")
        self.assertNotIn("SavedVariablesPerCharacter", directives)

    def test_the_mop_toc_lists_its_own_database_and_nothing_else(self) -> None:
        _directives, files = toc_lines(build.toc_texts()["PandaQuest_Mists.toc"])
        own = [*games.MOP.zone_data, *games.MOP.data]
        self.assertEqual([name for name in files if name in own], own, "in that order")
        on_disk = sorted("Database\\Data\\" + path.name for path in (ADDON_DIR / "Database" / "Data").glob("*.lua"))
        self.assertEqual(sorted(name for name in games.MOP.data if name.startswith("Database\\Data\\")), on_disk)
        for folder in ("forever", "era", "anniversary"):
            self.assertFalse([name for name in files if name.lower().startswith(f"database\\{folder}\\")])

    def test_the_shared_part_is_the_same_for_every_game(self) -> None:
        """A game changes its own lines and its interface; the rest is the template, once."""
        import dataclasses  # noqa: PLC0415

        other = dataclasses.replace(
            games.FOREVER, shipped=True, header=("## X-Example: 1",),
            zone_data=("Database\\Forever\\ZoneData.lua",), data=("Database\\Forever\\Data\\Meta.lua",))

        def shared(game):
            own = {*game.notes, *game.header, *game.zone_data, *game.data, f"## Interface: {game.interface}"}
            return [line for line in build.render_toc(game).split("\n") if line not in own]

        self.assertEqual(shared(games.MOP), shared(other))
        for game in games.shipped():
            self.assertEqual(shared(games.MOP), shared(game), game.key)
        self.assertIn("## Interface: 16001", build.render_toc(other))
        self.assertNotIn("AllowLoadGameType", build.render_toc(other))

    def test_a_template_and_a_row_that_do_not_fit_are_refused(self) -> None:
        good = build.TOC_TEMPLATE.read_text(encoding="utf-8")
        for broken in (
            good.replace("{{data}}", "{{datas}}"),          # unknown placeholder
            good.replace("{{zone-data}}\n", ""),             # a game's lines with nowhere to go
            good.replace("{{interface}}", "50504"),
        ):
            with self.subTest(), self.assertRaises(SystemExit):
                build.render_toc(games.MOP, broken)
        self.assertNotIn("#~", build.render_toc(games.MOP), "template notes stay in the template")

    def test_a_tree_whose_toc_is_not_the_templates_is_not_packaged(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / f"{build.ADDON}.toc").write_text(TOC.read_text(encoding="utf-8") + "Extra.lua\n", encoding="utf-8")
            with self.assertRaises(SystemExit) as refused:
                build.entries(build.identity(), root)
            self.assertIn("build.py tocs", str(refused.exception))

    def test_a_tree_missing_a_games_toc_is_not_packaged(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            build.write_tocs(root=root)
            (root / "PandaQuest_TBC.toc").unlink()
            with self.assertRaises(SystemExit) as refused:
                build.entries(build.identity(), root)
            self.assertIn("PandaQuest_TBC.toc", str(refused.exception))

    def test_tocs_writes_the_template_and_check_writes_nothing(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            toc = root / "PandaQuest.toc"
            toc.write_text("## Interface: 1\n", encoding="utf-8")
            self.assertFalse(build.write_tocs(check=True, root=root))
            self.assertEqual(toc.read_text(encoding="utf-8"), "## Interface: 1\n")
            self.assertEqual(sorted(path.name for path in root.iterdir()), ["PandaQuest.toc"])
            self.assertFalse(build.write_tocs(root=root))
            self.assertEqual(toc.read_bytes(), TOC.read_bytes())
            for name in build.toc_texts():
                self.assertEqual((root / name).read_bytes(), (ADDON_DIR / name).read_bytes(), name)
            self.assertTrue(build.write_tocs(check=True, root=root))


class TheTranslations(unittest.TestCase):
    """Every locale file translates keys that exist, and keeps what the code formats into them.

    Coverage is not asserted: a key a locale has not translated reads as English, which is the
    designed fallback and what a new string looks like until somebody translates it. What would
    break the game is the other half: a key nobody reads (a typo that silently translates nothing),
    or a translation that drops or reorders a %s/%d the code passes a value for.
    """

    LOCALES = ADDON_DIR / "Locales"
    KEY = re.compile(r'^L\["((?:[^"\\]|\\.)*)"\] = true', re.M)
    PAIR = re.compile(r'\["((?:[^"\\]|\\.)*)"\]\s*=\s*"((?:[^"\\]|\\.)*)"')
    FORMAT = re.compile(r"%(?:\d+\$)?[-+ #0]*\d*(?:\.\d+)?[sdfgxXcoiu%]")

    def english(self) -> set:
        return set(self.KEY.findall((self.LOCALES / "enUS.lua").read_text(encoding="utf-8")))

    def files(self):
        return sorted(path for path in self.LOCALES.glob("*.lua") if path.name != "enUS.lua")

    def test_there_are_translations_to_check(self) -> None:
        self.assertGreater(len(self.english()), 300)
        names = {path.stem for path in self.files()}
        for locale in ("fiFI", "deDE", "frFR", "esES", "esMX", "itIT", "ptBR", "ruRU", "koKR", "zhCN", "zhTW"):
            self.assertIn(locale, names)

    def test_every_translated_key_is_an_english_key(self) -> None:
        english = self.english()
        for path in self.files():
            keys = {key for key, _ in self.PAIR.findall(path.read_text(encoding="utf-8"))}
            unknown = sorted(keys - english)
            self.assertEqual(unknown, [], f"{path.name} translates keys enUS.lua does not have: {unknown[:3]}")

    def test_a_translation_keeps_the_formats_colours_and_line_breaks_of_its_key(self) -> None:
        for path in self.files():
            for key, value in self.PAIR.findall(path.read_text(encoding="utf-8")):
                where = f"{path.name}: {key[:60]!r}"
                self.assertEqual(sorted(self.FORMAT.findall(key)), sorted(self.FORMAT.findall(value)),
                                 f"{where} changes the % formats")
                self.assertEqual(key.count("|c"), value.count("|c"), f"{where} changes colour codes")
                self.assertEqual(key.count("|r"), value.count("|r"), f"{where} changes colour resets")
                self.assertEqual(key.count("\\n"), value.count("\\n"), f"{where} changes line breaks")
                self.assertTrue(value.strip(), f"{where} is empty")

    def test_each_locale_file_registers_itself_under_its_own_name(self) -> None:
        toc = TOC.read_text(encoding="utf-8")
        for path in self.files():
            text = path.read_text(encoding="utf-8")
            self.assertIn(f"ns.LOCALE_TABLES.{path.stem} = T", text, path.name)
            self.assertIn(f'NewLocale("PandaQuest", "{path.stem}")', text, path.name)
            self.assertIn("Locales\\" + path.stem + ".lua", toc, f"{path.name} is not in the TOC")


class TheReleaseNotes(unittest.TestCase):
    """UI/ReleaseNotes.lua (Options > Release notes in the addon's window) quotes changelog.txt.

    Every version it lists has its section in changelog.txt, and every line it shows for a version is a
    line of that section, so the window can never announce a change the changelog does not have. The
    data releases the portal's sync makes are not required in it.
    """

    def test_every_release_note_is_a_line_of_its_changelog_section(self) -> None:
        notes = (ADDON_DIR / "UI" / "ReleaseNotes.lua").read_text(encoding="utf-8")
        changelog = (ADDON_DIR / "changelog.txt").read_text(encoding="utf-8")
        sections, version = {}, None
        for line in changelog.splitlines():
            if re.fullmatch(r"\d+(?:\.\d+)+", line):
                version = line
                sections[version] = []
            elif version and line.startswith("- "):
                sections[version].append(line[2:])
        found = re.findall(r'version = "([^"]+)", date = "[^"]*", lines = \{(.*?)\} \}', notes, re.S)
        self.assertTrue(found, "UI/ReleaseNotes.lua lists no release")
        for note_version, body in found:
            self.assertIn(note_version, sections, f"{note_version} is not a section of changelog.txt")
            for quoted in re.findall(r'"((?:[^"\\]|\\.)*)"', body):
                text = re.sub(r"\\(.)", r"\1", quoted)          # a Lua string's \" and \\
                self.assertIn(text, sections[note_version], f"{note_version}: {text!r} is not in changelog.txt")


class TheReleaseChannel(unittest.TestCase):
    """A beta says so in four places, and none of them is a file name a consumer reads."""

    def test_the_toc_declares_a_known_channel(self) -> None:
        self.assertIn(build.read_toc_channel(), build.CHANNELS)

    def test_an_unknown_channel_is_refused_not_guessed(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            toc = Path(tmp) / "X.toc"
            toc.write_text("## Interface: 50504\n## X-Release-Channel: nightly\n", encoding="utf-8")
            with self.assertRaises(SystemExit):
                build.read_toc_channel(toc)
            toc.write_text("## Interface: 50504\n", encoding="utf-8")
            self.assertEqual(build.read_toc_channel(toc), "stable")
            toc.write_text("## Interface: 50504\n## X-Release-Channel: BETA\n", encoding="utf-8")
            self.assertEqual(build.read_toc_channel(toc), "beta")

    def test_the_tag_carries_the_channel_and_the_asset_does_not(self) -> None:
        self.assertEqual(build.release_tag("0.2.140", "stable"), "v0.2.140")
        self.assertEqual(build.release_tag("0.2.140", "beta"), "v0.2.140-beta")
        self.assertIsNotNone(build.PORTAL_PACKAGE_PATTERN.match(build.package_name("0.2.140")))

    def test_the_title_says_beta_once_however_often_it_is_stamped(self) -> None:
        once = build.title_with_version("|cff5fd7ffPanda|rQuest", "0.2.140", "beta")
        self.assertTrue(once.endswith("|cffff9900beta|r"))
        twice = build.title_with_version(once, "0.2.141", "beta")
        self.assertEqual(twice.count("beta"), 1)
        self.assertIn("v0.2.141", twice)
        self.assertNotIn("beta", build.title_with_version(once, "0.2.141", "stable"))

    def test_the_package_carries_the_channel_in_its_toc_lua_and_comment(self) -> None:
        ident = build.identity()
        self.assertEqual(ident["channel"], build.read_toc_channel())
        content = build.entries(ident)
        lua = content["PandaQuest/Core/Build.lua"].decode("utf-8")
        self.assertIn(f'channel = "{ident["channel"]}"', lua)
        toc = content["PandaQuest/PandaQuest.toc"].decode("utf-8")
        version_line = [line for line in toc.splitlines() if line.startswith("## Version:")][0]
        self.assertNotIn("beta", version_line, "## Version stays digits")
        if ident["channel"] == "beta":
            title_line = [line for line in toc.splitlines() if line.startswith("## Title:")][0]
            self.assertIn("beta", title_line)
        comment = json.loads(zipfile.ZipFile(io.BytesIO(build.zip_bytes(ident))).comment.decode("utf-8"))
        self.assertEqual(comment["channel"], ident["channel"])


class TheSyncedData(unittest.TestCase):
    """The files the PandaQuest portal's data sync writes (README.md, "Data from the portal").

    Lua cannot be run here, so what is checked is their shape: each is listed before Database/DB.lua
    (which applies them while it loads), each builds its ``ns.Overrides.<name>`` with the four tables
    DB.lua walks, and none is past the size the sync itself refuses to write -- a file that large
    means something upstream wrote far more than a quest page holds.
    """

    #: The file, the name of its set in ns.Overrides, and the most bytes it may have (the sync's own
    #: MAX_WOWHEAD_BYTES for Wowhead.lua; Portal.lua is one row per moderator correction).
    FILES = (
        ("Database/Overrides/Wowhead.lua", "wowhead", 6 * 1024 * 1024),
        ("Database/Overrides/Portal.lua", "portal", 1024 * 1024),
    )

    def setUp(self) -> None:
        _, files = toc_lines(TOC.read_text(encoding="utf-8-sig"))
        self.order = [name.replace("\\", "/") for name in files]

    def test_each_is_loaded_before_the_database_applies_it(self) -> None:
        db = self.order.index("Database/DB.lua")
        for relative, _name, _limit in self.FILES:
            self.assertIn(relative, self.order, f"the TOC does not load {relative}")
            self.assertLess(self.order.index(relative), db, f"{relative} must load before Database/DB.lua")

    def test_each_builds_its_set_with_the_four_tables(self) -> None:
        for relative, name, _limit in self.FILES:
            text = (ADDON_DIR / relative).read_text(encoding="utf-8")
            self.assertIn(f"ns.Overrides.{name} = {{", text, relative)
            body = text.split(f"ns.Overrides.{name} = {{", 1)[1]
            for table in ("quests", "npcs", "objects", "items"):
                self.assertRegex(body, rf"(?m)^    {table} = \{{", f"{relative} lost its {table} table")
            self.assertIn("DO NOT EDIT BY HAND", text.splitlines()[0] + text.splitlines()[1], relative)

    def test_none_is_past_the_size_the_sync_refuses(self) -> None:
        for relative, _name, limit in self.FILES:
            size = (ADDON_DIR / relative).stat().st_size
            self.assertLessEqual(size, limit, f"{relative} is {size} bytes")

    def test_the_database_applies_the_wowhead_set_gap_only(self) -> None:
        """The sync fills only what the generated database lacks; DB.lua keeps that rule at load time,
        where the QuestieDB bridge may have filled the gap first, and the moderators' set comes last."""
        text = (ADDON_DIR / "Database" / "DB.lua").read_text(encoding="utf-8")
        self.assertIn('local OVERRIDE_SETS = { "wowhead", "community", "portal" }', text)
        self.assertIn("local FILL_ONLY = { wowhead = true }", text)
        self.assertIn("if not fillOnly or isBlank(row[index]) then", text)
        for accessor in ("function DB.GetQuestRewards(", "function DB.GetQuestDescription(", "function DB.GetExtra("):
            self.assertIn(accessor, text)


class TheChangelogMoves(unittest.TestCase):
    """A pull request that changes the addon says so in PandaQuest/changelog.txt.

    The version is the commit count, so it moves by itself; what does not move by itself is the
    sentence a player reads about it.  Only a pull request is judged: on main there is nothing
    to compare with, and without git or an origin/main the case is skipped, not failed.
    """

    def test_addon_changes_come_with_a_changelog_entry(self) -> None:
        import subprocess  # noqa: PLC0415

        def git(*args):
            return subprocess.run(["git", "-C", str(REPO), *args], capture_output=True, text=True)

        base = git("merge-base", "origin/main", "HEAD")
        if base.returncode != 0:
            self.skipTest("no origin/main to compare with")
        diff = git("diff", "--name-only", base.stdout.strip(), "HEAD")
        if diff.returncode != 0:
            self.skipTest("git could not produce a diff")
        changed = [line for line in diff.stdout.splitlines() if line.startswith("PandaQuest/")]
        if not changed:
            self.skipTest("nothing under PandaQuest/ differs from origin/main")
        self.assertIn(
            "PandaQuest/changelog.txt", changed,
            "PandaQuest/ changed (%s ...) but PandaQuest/changelog.txt did not: add a line under "
            "the version this change ships as" % ", ".join(changed[:3]),
        )

    def test_the_changelog_file_is_short_english_lines_newest_first(self) -> None:
        text = (ADDON_DIR / "changelog.txt").read_text(encoding="utf-8")
        self.assertTrue(text.isascii(), "changelog.txt must be plain English")
        versions, lines = [], 0
        for line in text.splitlines():
            if re.fullmatch(r"\d+(?:\.\d+)+", line):
                versions.append(tuple(int(part) for part in line.split(".")))
                lines = 0
            elif line.startswith("- "):
                lines += 1
                self.assertLessEqual(len(line), 100, "keep each change to one short line: " + line)
            elif line.startswith(" ") and line.strip():
                # What changed for the line above: "  - coordinates: 3 spawn points added in Badlands".
                self.assertTrue(line.startswith("  - "), "an indented line is '  - <what changed>': " + line)
                self.assertTrue(lines, "an indented line belongs under a change line: " + line)
                self.assertLessEqual(len(line), 100, "keep each change to one short line: " + line)
        self.assertTrue(versions, "no version section in changelog.txt")
        self.assertEqual(versions, sorted(versions, reverse=True), "newest version first")
        self.assertEqual(len(versions), len(set(versions)), "a version appears once")

    def test_the_upload_takes_its_changelog_from_the_versions_own_section(self) -> None:
        text = "header\n\n0.2.121\n- a - added\n- b - updated\n\n0.2.119\n- c - added\n"
        self.assertEqual(curseforge.txt_section(text, "0.2.121"), "- a - added\n- b - updated")
        self.assertEqual(curseforge.txt_section(text, "0.2.119"), "- c - added")
        self.assertEqual(curseforge.txt_section(text, "0.2.5"), "")

    def test_what_changed_stays_under_its_line(self) -> None:
        """The detail lines keep their indent, so markdown nests them under their change."""
        text = "0.2.130\n- quest 1 - A - updated\n  - reward money added (94s)\n- npc 2 - B - added\n\n0.2.129\n"
        self.assertEqual(curseforge.txt_section(text, "0.2.130"),
                         "- quest 1 - A - updated\n  - reward money added (94s)\n- npc 2 - B - added")

    @staticmethod
    def big_section(count: int) -> str:
        lines = ["- database - Wowhead data as the PandaQuest portal read it: 6,046 quests"]
        for i in range(count):
            lines += ["- quest %d - Quest %d - updated" % (i, i), "  - description added", "  - reward money added (9s)"]
        lines.append("- npc 7 - Seven - added")
        return "\n".join(lines)

    def test_a_long_changelog_becomes_a_summary_with_links(self) -> None:
        short = self.big_section(3)
        self.assertEqual(curseforge.fit_changelog(short, "0.2.130", "v0.2.130", 30000), short)
        long = self.big_section(2000)
        self.assertGreater(len(long), 30000)
        text = curseforge.fit_changelog(long, "0.2.130", "v0.2.130", 30000)
        self.assertLessEqual(len(text), 30000)
        self.assertIn("- database - Wowhead data as the PandaQuest portal read it: 6,046 quests", text)
        self.assertIn("- quest - 2,000 quests updated", text)
        self.assertIn("- npc - 1 NPC added", text)
        self.assertIn("2,001 changes, 4,000 lines saying what changed", text)
        self.assertIn("https://github.com/vem882/pandaquest/releases/tag/v0.2.130", text)
        self.assertIn("https://raw.githubusercontent.com/vem882/pandaquest/v0.2.130/PandaQuest/changelog.txt", text)
        self.assertNotIn("- quest 5 - Quest 5", text)

    def test_the_upload_sends_the_summary_of_a_long_section_and_the_release_gets_it_whole(self) -> None:
        import contextlib  # noqa: PLC0415
        import os  # noqa: PLC0415

        versions = [{"id": 11, "name": "5.5.4", "gameVersionTypeID": 79434}]
        sent = []

        def answer(request):
            if request.full_url.endswith("/game/versions"):
                return versions
            sent.append(request.data)
            return {"id": 99}

        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "PandaQuest-0.2.130.zip"
            notes = Path(tmp) / "changelog.txt"
            notes.write_text("0.2.130\n" + self.big_section(1200) + "\n\n0.2.129\n- x - y\n", encoding="utf-8")
            with zipfile.ZipFile(path, "w") as archive:
                archive.writestr("PandaQuest/PandaQuest.toc", "## Interface: 50504\n## X-Curse-Project-ID: 111\n")
            with mock.patch.dict(os.environ, {"CF_API_TOKEN": "x"}), \
                    mock.patch.object(curseforge, "_call", side_effect=answer):
                self.assertEqual(curseforge.upload(path, "111", "release", notes, "v0.2.130"), 0)
            meta = json.loads(sent[0].split(b'name="metadata"\r\n\r\n', 1)[1].split(b"\r\n--", 1)[0])
            self.assertLessEqual(len(meta["changelog"]), curseforge.CURSEFORGE_LIMIT)
            self.assertIn("releases/tag/v0.2.130", meta["changelog"])
            # the GitHub release notes carry it whole while it fits in GitHub's limit
            out = io.StringIO()
            with contextlib.redirect_stdout(out):
                curseforge.main(["notes", "--version", "0.2.130", "--tag", "v0.2.130", "--changelog-txt", str(notes)])
            self.assertTrue(out.getvalue().startswith("## Changes\n\n- database - "))
            self.assertIn("- quest 1199 - Quest 1199 - updated\n  - description added", out.getvalue())
            self.assertNotIn("too long", out.getvalue())

    def test_the_release_notes_carry_the_changelog(self) -> None:
        release = (REPO / ".github" / "workflows" / "release.yml").read_text(encoding="utf-8")
        for needle in ("curseforge.py notes", "release-notes/changes.md", "--notes-file notes.md"):
            self.assertIn(needle, release, f"release.yml lost {needle!r}")
        publish = (REPO / ".github" / "workflows" / "publish-curseforge.yml").read_text(encoding="utf-8")
        self.assertIn('--release-tag "${RELEASE_TAG}"', publish)


if __name__ == "__main__":
    unittest.main()
