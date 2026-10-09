#!/usr/bin/env python3
"""The checks worth having in a repository with no toolchain.

    python3 .github/release/check.py            # run them all
    python3 .github/release/check.py -v         # name each one

Stdlib ``unittest`` and nothing else -- no pytest, no pip install, no Lua.  There is no Lua
interpreter here and no luacheck: the platform repository (github.com/vem882/pandawow) keeps
those, and this file deliberately does not try to reproduce them.  So these checks cannot tell
you the addon *works*; they tell you the package is not obviously broken, which is the class of
breakage a release can actually introduce:

* the TOC parses, and declares the fields the packaging and the client depend on;
* every file the TOC lists exists, with the case it is listed with -- a missing or
  wrongly-cased file is silent in-game on Windows and fatal on the hub's Linux builds;
* every file ``embeds.xml`` pulls in exists too, since the TOC lists the XML and not its
  contents;
* nothing packaged is unreachable, empty or from the development tree: a ``.lua`` no TOC line
  or XML include names is either a module the game never runs or a download nobody uses, a
  zero-byte entry is a generator that failed halfway, and a ``.py`` in an AddOns folder is how
  somebody comes to believe the addon needs Python;
* the zip's contract holds: the name the hub can see, every path under ``PandaQuest/``, the
  version stamped, the same bytes when built twice.

Nothing here asserts a number it did not measure: the version cases compute what git says and
compare, rather than hard-coding 84.  The one hard-coded number is the interface version, which
is not measurable from this repository -- it is what the 5.5.4 client expects.
"""

from __future__ import annotations

import io
import json
import re
import tempfile
import unittest
import xml.etree.ElementTree as ElementTree
import zipfile
from pathlib import Path
from unittest import mock

import build
import curseforge

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
#: nothing in the log, and every bug report that follows says "the addon does nothing".  This
#: is the same constant the platform repository's ``tools/tests/test_release_artifacts.py``
#: asserts (``MOP_CLASSIC_INTERFACE = 50504``); it moves when the game's patch level does.
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
        """Windows does not care and Linux does; the hub builds and serves on Linux."""
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
        dots, matching the hub's pattern, passing every other case here, and sorting below
        every package the hub holds.  So this case exists, and build.py's ``package`` refuses
        as well.  If it fails on a runner, the checkout lost ``fetch-depth: 0``.
        """
        self.assertFalse(build.is_shallow(), "shallow checkout: the commit count is not the count")

    def test_the_hub_can_see_the_file_name_it_produces(self) -> None:
        name = build.package_name(build.release_version())
        match = build.HUB_PACKAGE_PATTERN.match(name)
        self.assertIsNotNone(match, f"{name} does not match the hub's package pattern")
        # The hub orders with tuple(int(part) for part in version.split(".")).  This is that
        # expression; if it raises, the package is invisible to the ordering and not just
        # mis-sorted.
        assert match is not None
        tuple(int(part) for part in match.group(1).split("."))

    def test_a_name_with_a_v_in_it_is_refused(self) -> None:
        self.assertIsNone(build.HUB_PACKAGE_PATTERN.match("PandaQuest-v0.2.84.zip"))
        self.assertIsNone(build.HUB_PACKAGE_PATTERN.match("PandaQuest-0.2.84+abc1234.zip"))


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
        self.assertIn("not a name the hub can see", message)

    def test_it_refuses_a_name_whose_version_is_not_the_one_it_builds(self) -> None:
        """Right shape, wrong number: the hub then sorts by the name and advertises the comment.

        ``find_package`` orders candidates by the version in the file name and ``index_package``
        takes the manifest's version from the archive comment, so a mistyped digit produces a
        package the hub sorts at one version and serves as another -- and nothing reports it.
        """
        with mock.patch.object(build, "commit_count", return_value=self.COUNT), mock.patch.object(
            build, "is_shallow", return_value=False
        ):
            message = self._refuses("PandaQuest-9.9.9.zip")
        self.assertIn("says version 9.9.9", message)


class TheZipContract(unittest.TestCase):
    """Build once into memory and assert what the hub, the manifest and WoW depend on."""

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
        """Every archive path the packaged TOC reaches, directly or through an XML include.

        The client's own load order: the TOC names files and XML files, an XML names scripts
        and further XML.  Anything outside the closure is never run.
        """
        names = {name.lower(): name for name in self.archive.namelist()}
        prefix = f"{build.ADDON}/"
        _directives, listed = toc_lines(
            self.archive.read(f"{prefix}{build.ADDON}.toc").decode("utf-8-sig")
        )
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

        ``Database/Data/*.lua`` is generated by the platform repository's tooling and ``Libs/``
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
        and the hub goes on offering the previous build.
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

    SUMMARY = REPO / "curseforge" / "summary.txt"

    def test_the_game_version_is_what_the_toc_says(self) -> None:
        self.assertEqual(curseforge.game_version(50504), "5.5.4")
        interface = curseforge.toc_interface(TOC.read_text(encoding="utf-8"))
        self.assertEqual(interface, 50504)

    def test_only_an_exact_name_is_a_game_version(self) -> None:
        versions = [{"id": 1, "name": "5.5.4"}, {"id": 2, "name": "5.5.40"}, {"id": 3, "name": "5.4.8"}]
        self.assertEqual(curseforge.pick_version_ids(versions, "5.5.4"), [1])
        self.assertEqual(curseforge.pick_version_ids(versions, "9.9.9"), [])

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

    def test_the_summary_is_one_english_line_within_the_limit(self) -> None:
        text = self.SUMMARY.read_text(encoding="utf-8").rstrip("\n")
        self.assertNotIn("\n", text)
        self.assertTrue(text.isascii(), "the summary must be English")
        self.assertLessEqual(len(text), 250)
        self.assertGreaterEqual(len(text), 40)

    def test_the_upload_job_is_off_without_a_project_and_never_writes(self) -> None:
        text = (REPO / ".github" / "workflows" / "release.yml").read_text(encoding="utf-8")
        job = text[text.index("\n  curseforge:"):]
        self.assertIn("vars.CURSEFORGE_PROJECT_ID != ''", job)
        self.assertIn("contents: read", job)
        self.assertNotIn("contents: write", job)


if __name__ == "__main__":
    unittest.main()
