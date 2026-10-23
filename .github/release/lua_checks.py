#!/usr/bin/env python3
"""The checks that run the addon's own Lua, under Lua 5.1 through lupa.

    python3 .github/release/lua_checks.py -v      # these alone
    python3 .github/release/check.py -v           # these and everything else

check.py is stdlib only and says so: a GitHub-hosted runner has no Lua and nothing here
pip-installs one.  These cases need ``lupa`` (``pip install lupa``; the portal's tools use 2.8), so
where it is missing -- on that runner -- every case reports itself skipped and names what is
missing.  Where it is installed, as on the machine the portal's data sync runs check.py on, they run
with everything else.

What they hold down is Core/Game.lua, the one file whose mistakes would cost a player data:

* which game a client is, from what GetBuildInfo and WOW_PROJECT_ID say (``GameDetection``);
* that a database for another game is never loaded, and that one which does not say is MoP's
  (``TheDatabaseCheck``);
* that the saved variables of every released shape come through ``ClaimSavedVariables`` with only
  ``game`` added, byte for byte as WoW would write them, and that another game's are set aside whole
  under ``foreign`` (``TheSavedVariables``, on the files in ``fixtures/savedvariables/``);
* that AceDB, with the addon's real defaults, keeps both through a load and a logout
  (``AceDBKeepsTheTag``).

A whole-addon run of the same fixtures (every module, the login, the logout) needs the WoW client
stub that lives in the portal repository (tools/wowstub), and is that repository's to run.
"""

from __future__ import annotations

import math
import re
import unittest
from pathlib import Path

try:
    from lupa.lua51 import LuaRuntime
except ImportError:  # pragma: no cover - the GitHub runner
    LuaRuntime = None

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
ADDON_DIR = REPO / "PandaQuest"
FIXTURES = HERE / "fixtures" / "savedvariables"
STORES = ("PandaQuestDB", "PandaQuestSync", "PandaQuestProf")
#: Declared in the TOC so WoW keeps it, and never touched: the removed Auction module's data.
RETIRED = ("PandaQuestAH",)
ALL_STORES = STORES + RETIRED

needs_lua = unittest.skipIf(LuaRuntime is None, "lupa (Lua 5.1 for Python) is not installed: pip install lupa")

#: What each client says about itself: GetBuildInfo's version and interface, WOW_PROJECT_ID, and
#: WOW_PROJECT_MISTS_CLASSIC (nil where the client does not define it).
MOP_CLIENT = ("5.5.4", 50504, 19, 19)
FOREVER_CLIENT = ("1.60.1", 16001, 18, None)
ERA_CLIENT = ("1.15.9", 11509, 2, None)
ANNIVERSARY_CLIENT = ("2.5.6", 20506, 5, None)
#: Retail: a game PandaQuest does not support.
RETAIL_CLIENT = ("11.2.5", 110205, 1, None)


# ------------------------------------------------------------------------------ helpers


def runtime():
    return LuaRuntime(unpack_returned_tuples=True)


def client(rt, version, interface, project, mists) -> None:
    """Make ``rt`` a client that reports these numbers (any of them may be None)."""
    stub = rt.eval("""
        function(version, interface, project, mists)
            if version or interface then
                GetBuildInfo = function() return version, "70000", "Oct 1 2026", interface end
            else
                GetBuildInfo = nil
            end
            WOW_PROJECT_ID = project
            WOW_PROJECT_MISTS_CLASSIC = mists
        end
    """)
    stub(version, interface, project, mists)


def addon_ns(rt):
    """A namespace with the two things Core/Game.lua prints through: ns.Log.Print and ns.L."""
    return rt.eval("""
        function()
            local chat = {}
            local ns = { chat = chat }
            ns.Log = { Print = function(fmt, ...) chat[#chat + 1] = string.format(fmt, ...) end,
                       Error = function() end, Warn = function() end, Info = function() end,
                       Debug = function() end }
            ns.L = setmetatable({}, { __index = function(_, key) return key end })
            return ns
        end
    """)()


def run_file(rt, ns, relative: str):
    """Run one addon file the way the client does: ``...`` is the addon's name and its namespace."""
    source = (ADDON_DIR / relative).read_text(encoding="utf-8")
    runner = rt.eval("""
        function(src, name, ns)
            local chunk, err = loadstring(src, name)
            if not chunk then error(err, 0) end
            return chunk("PandaQuest", ns)
        end
    """)
    return runner(source, "@" + relative, ns)


def load_game(rt, version=None, interface=None, project=None, mists=None, ns=None):
    client(rt, version, interface, project, mists)
    ns = ns or addon_ns(rt)
    run_file(rt, ns, "Core/Game.lua")
    return ns


def chat(ns) -> list:
    lines = ns.chat
    return [lines[i] for i in range(1, len(lines) + 1)]


def _key_order(key):
    if isinstance(key, (int, float)) and not isinstance(key, bool):
        return (0, key, "")
    return (1, 0, str(key))


def _string(text: str) -> str:
    out = ['"']
    for char in text:
        if char == '"':
            out.append('\\"')
        elif char == "\\":
            out.append("\\\\")
        elif char == "\n":
            out.append("\\n")
        elif char == "\r":
            out.append("\\r")
        elif ord(char) < 32:
            out.append("\\%03d" % ord(char))
        else:
            out.append(char)
    out.append('"')
    return "".join(out)


def _number(value) -> str:
    if isinstance(value, int):
        return str(value)
    if math.isfinite(value) and value == int(value) and abs(value) < 2**53:
        return str(int(value))
    return repr(value)


def saved(rt, value, depth: int = 0) -> str:
    """``value`` as WoW writes it into SavedVariables: tabs, ``["key"] = value,``, ``-- [n]``.

    Keys are sorted (WoW writes them in table order), so two tables with the same contents give the
    same text whatever order they were built in.  Byte-identical text is the comparison these cases
    make, because it is what "the saved file did not change" means.
    """
    if rt.eval("type")(value) == "table":
        items = sorted(((key, value[key]) for key in value.keys()), key=lambda item: _key_order(item[0]))
        if not items:
            return "{\n" + "\t" * depth + "}"
        length = 0
        while value[length + 1] is not None:
            length += 1
        pad = "\t" * (depth + 1)
        lines = ["{"]
        for key, item in items:
            text = saved(rt, item, depth + 1)
            if isinstance(key, int) and 1 <= key <= length:
                lines.append(f"{pad}{text}, -- [{key}]")
            elif isinstance(key, str):
                lines.append(f"{pad}[{_string(key)}] = {text},")
            else:
                lines.append(f"{pad}[{_number(key)}] = {text},")
        lines.append("\t" * depth + "}")
        return "\n".join(lines)
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return _number(value)
    if isinstance(value, str):
        return _string(value)
    raise TypeError(f"WoW cannot save a {type(value)}")


def saved_file(rt) -> str:
    """The whole ``PandaQuest.lua`` WoW would write from ``rt``'s four saved variables."""
    found = rt.globals()
    return "".join(f"{name} = {saved(rt, found[name])}\n" for name in ALL_STORES if found[name] is not None)


def fixture(name: str) -> str:
    return (FIXTURES / name).read_text(encoding="utf-8")


def without_game_line(text: str, depth: int = 1) -> str:
    """The text with the store's own ``["game"] = ...`` line taken out, and only that one."""
    return re.sub(r'(?m)^' + "\t" * depth + r'\["game"\] = "[a-z]+",\n', "", text)


# ------------------------------------------------------------------------------ the cases


@needs_lua
class GameDetection(unittest.TestCase):
    """``Game.Detect`` and the ``ns.Game.id`` a client gets when Core/Game.lua runs."""

    CASES = (
        (MOP_CLIENT, "mop"),
        (("5.5.5", 50505, None, None), "mop"),          # a later 5.5 patch, project constants gone
        (("5.5.4", None, None, None), "mop"),             # no interface number: the version says 5.5
        ((None, None, 19, 19), "mop"),                    # nothing but the project id
        (("5.5.4", 50504, 18, 19), "mop"),                # the interface decides before the project
        (FOREVER_CLIENT, "forever"),
        (("1.60.1", 16001, 1, None), "forever"),          # early Forever builds reported Retail's 1
        (("1.61.0", 16100, None, None), "forever"),
        ((None, None, 18, 19), "forever"),
        (ERA_CLIENT, "era"),
        (("1.15.8", 11508, None, None), "era"),           # Era's test realm, project constants gone
        (("1.15.9", None, None, None), "era"),            # no interface number: the version says 1.15
        ((None, None, 2, None), "era"),                   # nothing but WOW_PROJECT_CLASSIC
        (ANNIVERSARY_CLIENT, "anniversary"),
        (("2.5.7", 20507, None, None), "anniversary"),
        ((None, None, 5, None), "anniversary"),           # nothing but WOW_PROJECT_BURNING_CRUSADE_CLASSIC
        (("1.15.9", 11509, 5, None), "era"),              # the interface decides before the project
        ((None, 110205, 2, None), "unknown"),             # a project id beside a foreign interface decides nothing
        (RETAIL_CLIENT, "unknown"),                       # Retail
        ((None, None, None, None), "unknown"),            # nil == nil must not read as MoP
    )

    def test_each_client_is_the_game_it_says_it_is(self) -> None:
        for (version, interface, project, mists), expected in self.CASES:
            with self.subTest(version=version, interface=interface, project=project, mists=mists):
                rt = runtime()
                ns = load_game(rt, version, interface, project, mists)
                self.assertEqual(ns.Game.id, expected)
                self.assertEqual(ns.Game.Detect(version, interface, project, mists), expected)

    def test_the_client_facts_are_kept(self) -> None:
        rt = runtime()
        ns = load_game(rt, *MOP_CLIENT)
        self.assertEqual((ns.Game.version, ns.Game.interface, ns.Game.project), ("5.5.4", 50504, 19))
        self.assertEqual(ns.Game.Name("mop"), "Mists of Pandaria Classic")
        self.assertEqual(ns.Game.Name("forever"), "WoW Forever")
        self.assertEqual(ns.Game.Name("era"), "Classic Era")
        self.assertEqual(ns.Game.Name("anniversary"), "Burning Crusade Classic Anniversary")
        retail = load_game(runtime(), *RETAIL_CLIENT)
        self.assertIn("110205", retail.Game.Name("unknown"))


@needs_lua
class TheDatabaseCheck(unittest.TestCase):
    """A database is shown only in the game it was built for, and one that does not say is MoP's."""

    def test_the_data_game_defaults_to_mop(self) -> None:
        rt = runtime()
        ns = load_game(rt, *MOP_CLIENT)
        self.assertEqual(ns.Game.DataGame(), "mop")              # no ns.Data at all
        ns.Data = rt.table()
        self.assertEqual(ns.Game.DataGame(), "mop")              # a Meta.lua from before the line
        self.assertTrue(ns.Game.DataMatches())
        ns.Data.game = "forever"
        self.assertEqual(ns.Game.DataGame(), "forever")
        self.assertFalse(ns.Game.DataMatches())

    def test_the_shipped_database_is_mop(self) -> None:
        """Meta.lua says ``ns.Data.game = "mop"``, or -- rebuilt by a generator that does not write the
        line yet -- says nothing, which is MoP too.  Either way it loads in MoP."""
        rt = runtime()
        ns = load_game(rt, *MOP_CLIENT)
        run_file(rt, ns, "Database/Data/Meta.lua")
        self.assertIn(ns.Data.game, ("mop", None))
        self.assertEqual(ns.Game.DataGame(), "mop")
        self.assertTrue(ns.Game.DataMatches())

    def _db(self, client_facts, data_game):
        """Database/DB.lua over a two-quest database, with what it needs of the rest of the addon."""
        rt = runtime()
        ns = load_game(rt, *client_facts)
        setup = rt.eval("""
            function(ns, dataGame)
                ns.Schema = { questKeys = { name = 1 }, npcKeys = { name = 1 }, objectKeys = { name = 1 },
                              itemKeys = { name = 1 } }
                ns.Thread = { Run = function(fn) fn(); return {} end, Yield = function() end }
                ns.Data = { game = dataGame, quests = "return { [1] = {'A'}, [2] = {'B'} }",
                            npcs = "return {}", objects = "return {}", items = "return {}" }
            end
        """)
        setup(ns, data_game)
        run_file(rt, ns, "Database/DB.lua")
        return rt, ns

    def test_mop_data_loads_in_mop_as_before(self) -> None:
        for data_game in ("mop", None):
            with self.subTest(data_game=data_game):
                _rt, ns = self._db(MOP_CLIENT, data_game)
                self.assertTrue(ns.DB.Load())
                self.assertTrue(ns.DB.IsReady())
                self.assertEqual(ns.DB.GetQuestName(2), "B")
                self.assertFalse(any("database is for" in line for line in chat(ns)))

    def test_another_games_data_is_refused_with_one_line(self) -> None:
        for client_facts, data_game in ((FOREVER_CLIENT, "mop"), (FOREVER_CLIENT, None), (MOP_CLIENT, "forever"),
                                        (ERA_CLIENT, "mop"), (ERA_CLIENT, None), (ANNIVERSARY_CLIENT, "era"),
                                        (MOP_CLIENT, "anniversary")):
            with self.subTest(client=client_facts, data_game=data_game):
                _rt, ns = self._db(client_facts, data_game)
                self.assertFalse(ns.DB.Load())
                self.assertFalse(ns.DB.Load())
                self.assertFalse(ns.DB.IsReady())
                self.assertIsNone(ns.DB.GetQuestName(2), "not one row of it is readable")
                lines = [line for line in chat(ns) if "database is for" in line]
                self.assertEqual(len(lines), 1, "one line, however often Load is asked")
                self.assertIn(ns.Game.Name(ns.Game.DataGame()), lines[0])
                self.assertIn(ns.Game.Name(ns.Game.id), lines[0])


@needs_lua
class TheSavedVariables(unittest.TestCase):
    """Every released shape of PandaQuest.lua through ``ClaimSavedVariables``, compared as saved text.

    The fixtures are real files: what WoW writes after a session of 0.2.99 (the oldest release tag),
    0.2.191 (the last one before Core/Game.lua), and this version in MoP and in Forever.  Each case
    loads one as WoW does (the file is run, its assignments are the saved variables), claims it as
    the given game, and compares what WoW would write back.
    """

    UNTAGGED = ("untagged-0.2.99.lua", "untagged-0.2.191.lua")

    def claim(self, text: str | None, client_facts, times: int = 1):
        rt = runtime()
        if text is not None:
            rt.execute(text)
        before = {name: saved(rt, rt.globals()[name]) for name in ALL_STORES if rt.globals()[name] is not None}
        ns = load_game(rt, *client_facts)
        moved = None
        for _ in range(times):
            moved = ns.Game.ClaimSavedVariables()
        return rt, ns, before, moved

    def test_an_untagged_file_gains_only_the_game_tag_in_mop(self) -> None:
        for name in self.UNTAGGED:
            with self.subTest(fixture=name):
                original = fixture(name)
                rt, ns, before, moved = self.claim(original, MOP_CLIENT)
                after = saved_file(rt)
                self.assertEqual(len(moved), 0)
                self.assertEqual(chat(ns), [])
                for store in STORES:
                    self.assertEqual(rt.globals()[store].game, "mop", store)
                    self.assertIsNone(rt.globals()[store].foreign, store)
                    self.assertEqual(without_game_line(saved(rt, rt.globals()[store], 0)), before[store], store)
                for store in RETIRED:
                    self.assertEqual(saved(rt, rt.globals()[store]), before[store], store)
                # The whole file: the original, plus three lines, and nothing else.
                self.assertEqual(without_game_line(after), saved_file_of(original))
                self.assertEqual(after.count('["game"] = "mop"'), 3)

    def test_this_versions_mop_file_is_what_0_2_191_wrote_plus_the_tag(self) -> None:
        self.assertEqual(without_game_line(saved_file_of(fixture("tagged-mop.lua"))),
                         saved_file_of(fixture("untagged-0.2.191.lua")))

    def test_a_tagged_file_is_left_exactly_as_it_is(self) -> None:
        for name, client_facts in (("tagged-mop.lua", MOP_CLIENT), ("tagged-forever.lua", FOREVER_CLIENT)):
            with self.subTest(fixture=name):
                original = fixture(name)
                rt, ns, _before, moved = self.claim(original, client_facts)
                self.assertEqual(len(moved), 0)
                self.assertEqual(saved_file(rt), saved_file_of(original))
                self.assertEqual(chat(ns), [])

    def test_another_games_file_is_set_aside_whole(self) -> None:
        """Forever's saved variables in a MoP folder, and MoP's -- tagged or from before tags -- in Forever's."""
        for name, client_facts, game, other in (
            ("tagged-forever.lua", MOP_CLIENT, "mop", "forever"),
            ("tagged-mop.lua", FOREVER_CLIENT, "forever", "mop"),
            ("untagged-0.2.191.lua", FOREVER_CLIENT, "forever", "mop"),
            ("untagged-0.2.99.lua", FOREVER_CLIENT, "forever", "mop"),
            # The launcher can copy a MoP WTF folder into Era's or TBC Anniversary's: MoP's data is kept.
            ("tagged-mop.lua", ERA_CLIENT, "era", "mop"),
            ("untagged-0.2.191.lua", ERA_CLIENT, "era", "mop"),
            ("tagged-mop.lua", ANNIVERSARY_CLIENT, "anniversary", "mop"),
            ("untagged-0.2.99.lua", ANNIVERSARY_CLIENT, "anniversary", "mop"),
            ("tagged-forever.lua", ERA_CLIENT, "era", "forever"),
        ):
            with self.subTest(fixture=name, game=game):
                rt, ns, before, moved = self.claim(fixture(name), client_facts)
                self.assertEqual(len(moved), len(STORES))
                for store in STORES:
                    table = rt.globals()[store]
                    self.assertEqual(sorted(table.keys()), ["foreign", "game"], store)
                    self.assertEqual(table.game, game)
                    self.assertEqual(sorted(table.foreign.keys()), [other])
                    # byte for byte what the other game had written, its own tag (if any) included
                    self.assertEqual(saved(rt, table.foreign[other]), before[store], store)
                for store in RETIRED:
                    self.assertEqual(saved(rt, rt.globals()[store]), before[store], f"{store} is never touched")
                lines = chat(ns)
                self.assertEqual(len(lines), 1, "one line for all three")
                self.assertIn(ns.Game.Name(other), lines[0])
                for store in STORES:
                    self.assertIn(store, lines[0])

    def test_setting_aside_never_overwrites_what_was_set_aside_before(self) -> None:
        """A second copy of the same foreign game goes beside the first, and older foreign data stays put."""
        rt, ns, _before, _moved = self.claim(fixture("tagged-forever.lua"), MOP_CLIENT)
        first = saved(rt, rt.globals().PandaQuestSync.foreign.forever)
        # The folder is copied over again: Forever's data arrives once more, carrying MoP's set-aside copy.
        again = rt.eval("""
            function(store)
                local foreign = store.foreign
                local copy = { game = "forever", version = 1, sessions = {}, characters = {}, foreign = foreign }
                return copy
            end
        """)(rt.globals().PandaQuestSync)
        rt.globals().PandaQuestSync = again
        moved = ns.Game.ClaimSavedVariables()
        sync = rt.globals().PandaQuestSync
        self.assertEqual([moved[i].key for i in range(1, len(moved) + 1)], ["forever-2"])
        self.assertEqual(sorted(sync.foreign.keys()), ["forever", "forever-2"])
        self.assertEqual(saved(rt, sync.foreign.forever), first, "the first copy is untouched")
        self.assertIsNone(sync.foreign["forever-2"].foreign, "older foreign data is not buried deeper")
        self.assertEqual(sync.game, "mop")

    def test_claiming_twice_changes_nothing_the_second_time(self) -> None:
        for name, client_facts in (("untagged-0.2.191.lua", MOP_CLIENT), ("tagged-forever.lua", MOP_CLIENT),
                                   ("untagged-0.2.191.lua", FOREVER_CLIENT)):
            with self.subTest(fixture=name):
                once_rt, _ns, _before, _moved = self.claim(fixture(name), client_facts, times=1)
                twice_rt, ns, _before, moved = self.claim(fixture(name), client_facts, times=2)
                self.assertEqual(len(moved), 0)
                self.assertEqual(saved_file(twice_rt), saved_file(once_rt))
                self.assertLessEqual(len(chat(ns)), 1)

    def test_what_the_game_writes_back_reads_as_the_same_tables(self) -> None:
        """The claimed tables, written the way WoW writes them and read back, need no further change."""
        for name, client_facts in (("untagged-0.2.99.lua", MOP_CLIENT), ("tagged-forever.lua", MOP_CLIENT)):
            with self.subTest(fixture=name):
                rt, _ns, _before, _moved = self.claim(fixture(name), client_facts)
                written = saved_file(rt)
                again_rt, ns, _before, moved = self.claim(written, client_facts)
                self.assertEqual(len(moved), 0)
                self.assertEqual(saved_file(again_rt), written)
                self.assertEqual(chat(ns), [])

    def test_a_first_install_is_tagged_from_its_first_save(self) -> None:
        for client_facts, game in ((MOP_CLIENT, "mop"), (ERA_CLIENT, "era"), (ANNIVERSARY_CLIENT, "anniversary"),
                                   (FOREVER_CLIENT, "forever")):
            with self.subTest(game=game):
                rt, ns, _before, moved = self.claim(None, client_facts)
                self.assertEqual(len(moved), 0)
                self.assertEqual(saved_file(rt),
                                 "".join(f'{name} = {{\n\t["game"] = "{game}",\n}}\n' for name in STORES))
                self.assertEqual(chat(ns), [])

    def test_an_unknown_game_touches_nothing(self) -> None:
        for name in ("untagged-0.2.191.lua", "tagged-forever.lua", None):
            with self.subTest(fixture=name):
                original = fixture(name) if name else None
                rt, ns, _before, moved = self.claim(original, RETAIL_CLIENT)
                self.assertEqual(len(moved), 0)
                self.assertEqual(saved_file(rt), saved_file_of(original) if original else "")
                self.assertEqual(chat(ns), [])

    def test_a_saved_variable_that_is_not_a_table_is_left_alone(self) -> None:
        rt = runtime()
        rt.execute('PandaQuestProf = "not a table"; PandaQuestSync = { version = 1 }')
        ns = load_game(rt, *MOP_CLIENT)
        ns.Game.ClaimSavedVariables()
        self.assertEqual(rt.globals().PandaQuestProf, "not a table")
        self.assertIsNone(rt.globals().PandaQuestAH, "a retired saved variable is not even created")
        self.assertEqual(rt.globals().PandaQuestSync.game, "mop")
        self.assertEqual(rt.globals().PandaQuestSync.version, 1)


def saved_file_of(text: str) -> str:
    """A fixture's text, loaded and written back the way WoW writes it (comments and order dropped)."""
    rt = runtime()
    rt.execute(text)
    return saved_file(rt)


@needs_lua
class AceDBKeepsTheTag(unittest.TestCase):
    """PandaQuestDB is AceDB's: ``game`` and ``foreign`` sit beside its sections and survive a logout.

    AceDB with the addon's real defaults (Core/Const.lua) is loaded over the fixtures, the claim runs
    first as it does in Core/Init.lua, the profile and the character are read through AceDB, and the
    logout handler -- which strips every value equal to its default and every empty section -- runs.
    What is left must be the original plus the tag.
    """

    WOW = """
        local frame = { scripts = {} }
        function frame:RegisterEvent() end
        function frame:SetScript(name, fn) self.scripts[name] = fn end
        function CreateFrame() return frame end
        LOGOUT = function() frame.scripts.OnEvent(frame, "PLAYER_LOGOUT") end
        function GetRealmName() return "Mirage Raceway" end
        function UnitName() return "Testpanda" end
        function UnitClass() return "Monk", "MONK" end
        function UnitRace() return "Pandaren", "Pandaren" end
        function UnitFactionGroup() return "Alliance" end
        function GetLocale() return "enUS" end
        function GetCurrentRegion() return 3 end
        function GetCurrentRegionName() return "EU" end
        function geterrorhandler() return function(err) error(err, 0) end end
    """

    def session(self, text: str, client_facts):
        rt = runtime()
        rt.execute(text)
        before = saved(rt, rt.globals().PandaQuestDB)
        rt.execute(self.WOW)
        ns = load_game(rt, *client_facts)
        for library in ("Libs/LibStub/LibStub.lua", "Libs/CallbackHandler-1.0/CallbackHandler-1.0.lua",
                        "Libs/AceDB-3.0/AceDB-3.0.lua", "Core/Const.lua"):
            run_file(rt, ns, library)
        ns.Game.ClaimSavedVariables()
        rt.eval("""
            function(ns)
                local db = LibStub("AceDB-3.0"):New("PandaQuestDB", ns.DEFAULTS, true)
                local _ = db.profile.arrow, db.char.hiddenQuests, db.global.telemetry
                LOGOUT()
            end
        """)(ns)
        return rt, before

    def test_an_untagged_db_comes_back_with_the_tag_and_nothing_else_changed(self) -> None:
        for name in TheSavedVariables.UNTAGGED:
            with self.subTest(fixture=name):
                rt, before = self.session(fixture(name), MOP_CLIENT)
                after = saved(rt, rt.globals().PandaQuestDB)
                self.assertEqual(rt.globals().PandaQuestDB.game, "mop")
                self.assertEqual(without_game_line(after), before)

    def test_another_games_db_stays_aside_through_acedb(self) -> None:
        rt, before = self.session(fixture("tagged-forever.lua"), MOP_CLIENT)
        db = rt.globals().PandaQuestDB
        self.assertEqual(db.game, "mop")
        self.assertEqual(saved(rt, db.foreign.forever), before)
        self.assertEqual(saved(rt, db.profileKeys), '{\n\t["Testpanda - Mirage Raceway"] = "Default",\n}')


if __name__ == "__main__":
    unittest.main()
