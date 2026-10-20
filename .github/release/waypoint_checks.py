#!/usr/bin/env python3
"""The parts of Nav/Waypoint.lua that need no game client, run under Lua 5.1 through lupa.

    python3 .github/release/waypoint_checks.py -v     # these alone
    python3 .github/release/check.py -v               # these and everything else

Like lua_checks.py, every case reports itself skipped where ``lupa`` is not installed (the
GitHub-hosted runner). The module's behaviour in a running addon -- the nameplate anchoring, the card
on the arrow, enable and disable, saved variables of older releases -- needs the WoW client stub and
is tested in the portal repository (tools/tests/test_waypoint.py). What is held down here:

* ``/way`` reads TomTom's forms: ``x y``, ``x, y``, decimal commas, a zone name or ``#uiMapID``
  before the numbers, a label after them, and the words that clear (``WayParser``);
* bad input is refused with a reason, never half-read;
* ``/way`` is only taken when no other addon has it (``TheWayOwner``);
* the Pinpoint range has its hysteresis and the beam its fade (``PinpointRange``).
"""

from __future__ import annotations

import unittest

from lua_checks import addon_ns, needs_lua, run_file, runtime

FAKE_ADDON = """
function(ns)
    -- Just enough of the addon for Nav/Waypoint.lua to load: the AceAddon object answers NewModule
    -- with a plain table, LibStub has no libraries, and there are no options to register with.
    ns.PQ = {
        GetModule = function() return nil end,
        NewModule = function(_, name)
            local module = { moduleName = name }
            function module:IsEnabled() return false end
            return module
        end,
    }
    ns.Compat = {}
    LibStub = function() return nil end
    SlashCmdList = {}
end
"""


def load_waypoint(rt):
    ns = addon_ns(rt)
    rt.eval(FAKE_ADDON)(ns)
    run_file(rt, ns, "Core/Const.lua")
    run_file(rt, ns, "Core/Util.lua")
    run_file(rt, ns, "Nav/Waypoint.lua")
    return ns, ns.Waypoint


@needs_lua
class WayParser(unittest.TestCase):
    def setUp(self) -> None:
        self.rt = runtime()
        self.ns, self.wp = load_waypoint(self.rt)

    def parse(self, text):
        """(parsed, error): ParseWay returns one value on success and two on a refusal."""
        result = self.wp.ParseWay(text)
        return result if isinstance(result, tuple) else (result, None)

    def test_tomtoms_forms(self) -> None:
        cases = {
            "35 79": (None, 35, 79, None),
            "35.0, 79.0": (None, 35, 79, None),
            "35,5 79,5": (None, 35.5, 79.5, None),
            "35.5 79.25 Windrunner Spire": (None, 35.5, 79.25, "Windrunner Spire"),
            "Eversong Woods 35.0 79.0 Windrunner Spire": ("Eversong Woods", 35, 79, "Windrunner Spire"),
            "#94 35 79": ("#94", 35, 79, None),
            "  Kun-Lai Summit   50 50   Camp 2 ": ("Kun-Lai Summit", 50, 50, "Camp 2"),
        }
        for text, expected in cases.items():
            parsed, err = self.parse(text)
            self.assertIsNone(err, text)
            self.assertEqual(parsed.action, "set", text)
            self.assertEqual((parsed.zone, parsed.x, parsed.y, parsed.label), expected, text)

    def test_clear_and_show(self) -> None:
        for word in ("clear", "reset", "OFF", "remove"):
            self.assertEqual(self.parse(word)[0].action, "clear", word)
        self.assertEqual(self.parse("")[0].action, "show")
        self.assertEqual(self.parse("   ")[0].action, "show")

    def test_bad_input_is_refused_with_a_reason(self) -> None:
        for text, reason in (("hello", "Usage"), ("35", "Usage"), ("Eversong Woods", "Usage"),
                             ("101 5", "between 0 and 100"), ("5 -3", "between 0 and 100")):
            parsed, err = self.parse(text)
            self.assertIsNone(parsed, text)
            self.assertIn(reason, err, text)

    def test_coordinates_are_shown_the_way_the_label_reads_them(self) -> None:
        self.assertEqual(self.wp.FormatCoords(35, 79), "X: 35.0, Y: 79.0")
        self.assertEqual(self.wp.FormatCoords(35.04, 79.06), "X: 35.0, Y: 79.1")

    def test_a_uimapid_is_a_zone(self) -> None:
        self.assertEqual(self.wp.ResolveZone("#371")[0], 371)

    def test_an_npc_is_read_from_its_guid(self) -> None:
        self.assertEqual(self.wp.NpcIdFromGuid("Creature-0-3132-870-20-59173-00004C4D46"), 59173)
        self.assertIsNone(self.wp.NpcIdFromGuid("Player-1234-0ABCDEF0"))
        self.assertIsNone(self.wp.NpcIdFromGuid(None))


@needs_lua
class TheWayOwner(unittest.TestCase):
    def setUp(self) -> None:
        self.rt = runtime()
        self.ns, self.wp = load_waypoint(self.rt)

    def test_nobody_owns_it_by_default(self) -> None:
        self.assertIsNone(self.wp.WayOwner())

    def test_another_addons_way_is_found_whatever_its_case(self) -> None:
        self.rt.execute('SLASH_TOMTOM_WAY1 = "/way"; SLASH_TOMTOM_WAY2 = "/tway"; '
                        'SlashCmdList["TOMTOM_WAY"] = function() end')
        self.assertEqual(self.wp.WayOwner(), "TOMTOM_WAY")
        self.rt.execute('SlashCmdList["TOMTOM_WAY"] = nil; SLASH_X1 = "/x"; SLASH_X2 = "/WAY"; '
                        'SlashCmdList["X"] = function() end')
        self.assertEqual(self.wp.WayOwner(), "X")

    def test_tomtom_counts_even_before_its_slash_command_is_seen(self) -> None:
        self.ns.TomTomBridge = self.rt.eval("{ IsAvailable = function() return true end }")
        self.assertEqual(self.wp.WayOwner(), "TOMTOM")


@needs_lua
class PinpointRange(unittest.TestCase):
    def setUp(self) -> None:
        self.rt = runtime()
        self.ns, self.wp = load_waypoint(self.rt)

    def test_the_label_shows_inside_the_distance_and_holds_a_little_beyond(self) -> None:
        pin = self.wp.IsPinpoint
        self.assertTrue(pin(19.9, 20, False))
        self.assertTrue(pin(20, 20, False))
        self.assertFalse(pin(20.5, 20, False))
        self.assertTrue(pin(21.9, 20, True))
        self.assertFalse(pin(22.5, 20, True))
        self.assertTrue(pin(None, 20, False))

    def test_the_beam_fades_towards_the_label(self) -> None:
        alpha = self.wp.BeamAlpha
        self.assertAlmostEqual(alpha(20, 20), 0.3)
        self.assertAlmostEqual(alpha(100, 20), 1.0)
        self.assertLess(alpha(25, 20), alpha(30, 20))
        self.assertEqual(alpha(None, 20), 1)

    def test_the_defaults_are_new_keys_only(self) -> None:
        defaults = self.ns.DEFAULTS
        self.assertEqual(defaults.profile.waypoint.pinpointDistance, 20)
        self.assertTrue(defaults.profile.waypoint.enabled)
        self.assertEqual(len(list(defaults.char.waypoint.keys())), 0)


if __name__ == "__main__":
    unittest.main()
