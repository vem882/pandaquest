"""Targeted checks for the scheduled component pin publisher."""

import unittest
from unittest import mock

import refresh_component_pins as refresh


BASE = "b" * 40
CURRENT = "a" * 40
NEXT = "c" * 40
AUCTION = "d" * 40
PR_HEAD = "e" * 40


def release(version, *, state="uploaded", prerelease=False):
    return {
        "tagName": f"v{version}",
        "isDraft": False,
        "isPrerelease": prerelease,
        "assets": [{"name": f"PandaQuestDB-{version}.zip", "state": state}],
    }


def check(conclusion="SUCCESS", *, name="check and build the package", workflow="Release"):
    return {"name": name, "workflowName": workflow, "status": "COMPLETED", "conclusion": conclusion}


class ComponentCandidate(unittest.TestCase):
    def test_versions_are_compared_numerically(self):
        with mock.patch.object(refresh, "gh", side_effect=[release("0.2.1000"), {"sha": NEXT}]):
            self.assertEqual(refresh.wanted_component("database", CURRENT, "0.2.999"), (NEXT, "0.2.1000"))

    def test_old_or_prerelease_is_never_pinned(self):
        for item in (release("0.2.629"), release("0.2.631", prerelease=True)):
            with self.subTest(release=item), mock.patch.object(refresh, "gh", return_value=item) as github:
                self.assertEqual(refresh.wanted_component("database", CURRENT, "0.2.630"), (CURRENT, "0.2.630"))
                self.assertEqual(github.call_count, 1)

    def test_new_release_requires_uploaded_zip(self):
        with mock.patch.object(refresh, "gh", side_effect=[release("0.2.631", state="new"), {"sha": NEXT}]):
            self.assertEqual(refresh.wanted_component("database", CURRENT, "0.2.630"), (CURRENT, "0.2.630"))

    def test_moved_release_tag_cannot_replace_a_pin(self):
        with mock.patch.object(refresh, "gh", side_effect=[release("0.2.630"), {"sha": NEXT}]):
            with self.assertRaisesRegex(ValueError, "moved from pinned commit"):
                refresh.wanted_component("database", CURRENT, "0.2.630")


class CheckedPullRequest(unittest.TestCase):
    current = (
        {"database": CURRENT, "auction": AUCTION},
        {"database": "0.2.630", "auction": "0.2.628"},
    )
    desired = (
        {"database": NEXT, "auction": AUCTION},
        {"database": "0.2.631", "auction": "0.2.628"},
    )

    def existing(self, checks, *, parent=BASE, latest_main=BASE):
        pull = {
            "number": 500,
            "isDraft": False,
            "title": refresh.TITLE,
            "headRefOid": PR_HEAD,
            "mergeStateStatus": "CLEAN",
            "statusCheckRollup": checks,
        }
        commit = {
            "parents": [{"sha": parent}],
            "commit": {"message": refresh.TITLE},
            "files": [{"filename": name} for name in refresh.LOCK_FILES],
        }
        with mock.patch.object(refresh, "gh",
                               side_effect=[{"object": {"sha": BASE}}, [pull], commit,
                                            {"object": {"sha": latest_main}}]), \
                mock.patch.object(refresh, "locks", side_effect=[self.current, self.desired]), \
                mock.patch.object(refresh, "wanted_component", side_effect=[(NEXT, "0.2.631"), (AUCTION, "0.2.628")]), \
                mock.patch.object(refresh, "run", return_value=f"{PR_HEAD}\t{refresh.REF}") as commands, \
                mock.patch.object(refresh, "refresh_branch", return_value=True) as update:
            refresh.refresh()
        return commands, update

    def test_merges_only_the_packaged_head(self):
        commands, update = self.existing([check(), check("NEUTRAL", name="GitGuardian", workflow="")])
        commands.assert_any_call("gh", "pr", "merge", "500", "-R", refresh.CORE, "--squash",
                                 "--match-head-commit", PR_HEAD, "--delete-branch")
        update.assert_not_called()

    def test_pending_failed_or_missing_checks_cannot_merge(self):
        for checks in ([], [check("FAILURE")], [check(), {"name": "GitGuardian", "status": "IN_PROGRESS"}]):
            with self.subTest(checks=checks):
                commands, update = self.existing(checks)
                commands.assert_called_once_with("git", "ls-remote", refresh.REMOTE, refresh.REF)
                update.assert_not_called()

    def test_main_changed_since_previous_run_requires_new_ci(self):
        commands, update = self.existing([check()], parent="f" * 40)
        commands.assert_called_once_with("git", "ls-remote", refresh.REMOTE, refresh.REF)
        update.assert_called_once_with(BASE, PR_HEAD, *self.desired)

    def test_main_changed_during_current_run_cannot_merge(self):
        commands, update = self.existing([check()], latest_main="f" * 40)
        commands.assert_called_once_with("git", "ls-remote", refresh.REMOTE, refresh.REF)
        update.assert_not_called()

    def test_new_pin_updates_open_a_pull_request_for_ci(self):
        with mock.patch.object(refresh, "gh", side_effect=[{"object": {"sha": BASE}}, []]), \
                mock.patch.object(refresh, "locks", return_value=self.current), \
                mock.patch.object(refresh, "wanted_component", side_effect=[(NEXT, "0.2.631"), (AUCTION, "0.2.628")]), \
                mock.patch.object(refresh, "run", side_effect=["", "new pull request"]) as commands, \
                mock.patch.object(refresh, "refresh_branch", return_value=True) as update:
            refresh.refresh()
        update.assert_called_once_with(BASE, "", *self.desired)
        self.assertEqual(commands.call_args.args[:4], ("gh", "pr", "create", "-R"))


if __name__ == "__main__":
    unittest.main()
