#!/usr/bin/env python3
"""The games PandaQuest is built for: one row each, read by build.py and curseforge.py.

Stdlib only, like the rest of this directory.

A row says, for one game:

* what its TOC declares (``## Interface``, the lines only that game's TOC has, and the TOC lines of
  its database files) -- build.py writes each shipped game's TOC files from one template,
  ``PandaQuest.toc.template``, filled with these;
* which TOC file names the client of that game reads (the suffixes, and whether the plain
  ``PandaQuest.toc`` is this game's too);
* how CurseForge names it: a game version is a name ("5.5.4") *and* a game version type, and the
  name alone is not unique across games (curseforge.py);
* whether the package carries it at all (``shipped``).

Mists of Pandaria Classic is the only game shipped.  Forever's row is written down so that its numbers
are in one place before its TOCs exist (the portal repository's docs/13-forever-and-versions.md, sections
2.5 and 8): interface 16001, the ``_Forever`` and ``_Camelot`` suffixes, CurseForge game version type
88568.  It has no TOC lines yet, and build.py refuses to write a TOC for a game that has none.
"""

from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class Game:
    #: The key the addon (``ns.Game.id``, Core/Game.lua) and the portal use for the game.
    key: str
    #: How a person names it.
    name: str
    #: What this game's TOC declares in ``## Interface``.
    interface: int
    #: The interface numbers a client of this game reports, and so the ones a TOC can carry for it.
    interfaces: range
    #: The TOC suffixes this game's client looks for before the plain name (``PandaQuest_Mists.toc``).
    suffixes: tuple[str, ...]
    #: True when the plain ``PandaQuest.toc`` is this game's TOC as well: the file every client
    #: without a TOC of its own falls back to, and the one a package index reads.  One game at most.
    fallback: bool
    #: CurseForge's ``gameVersionTypeID`` for the game.
    curseforge_type: int
    #: Whether the package carries this game's TOC files.
    shipped: bool
    #: Lines only this game's TOC has, at the template's ``{{game-header}}`` line.
    header: tuple[str, ...] = ()
    #: This game's zone tables, at the template's ``{{zone-data}}`` line.
    zone_data: tuple[str, ...] = ()
    #: This game's database: the generated data and the override files, at ``{{data}}``.
    data: tuple[str, ...] = ()


MOP = Game(
    key="mop",
    name="Mists of Pandaria Classic",
    interface=50504,
    interfaces=range(50500, 50600),
    suffixes=("_Mists",),
    fallback=True,
    # BigWigsMods/packager's own table ("mists) game_id=79434"), which is where the type ids are
    # written down; CurseForge's API lists them only beside each version.
    curseforge_type=79434,
    shipped=True,
    header=(
        "# Mists of Pandaria Classic only (documented at warcraft.wiki.gg/wiki/TOC_format). The release also",
        "# carries this file under the name PandaQuest_Mists.toc, which the Mists client reads first.",
        "## AllowLoadGameType: mists",
    ),
    zone_data=("Database\\ZoneData.lua",),
    data=(
        "Database\\Data\\Meta.lua",
        "Database\\Data\\Quests.lua",
        "Database\\Data\\Npcs.lua",
        "Database\\Data\\Objects.lua",
        "Database\\Data\\Items.lua",
        "Database\\Data\\Seed.lua",
        "Database\\Overrides\\Wowhead.lua",
        "Database\\Overrides\\Community.lua",
        "Database\\Overrides\\Portal.lua",
    ),
)

FOREVER = Game(
    key="forever",
    name="WoW Forever",
    interface=16001,
    interfaces=range(16000, 17000),
    # Both: Blizzard may still rename "Camelot", and the CurseForge app, Wago and WowUp read either.
    suffixes=("_Forever", "_Camelot"),
    fallback=False,
    curseforge_type=88568,
    # Not until the addon has been made to work there (step A3): no TOC lines, no database.
    shipped=False,
)

#: Every game, in the order their TOCs are written and tagged.
GAMES: tuple[Game, ...] = (MOP, FOREVER)


def by_key(key: str) -> Game:
    for game in GAMES:
        if game.key == key:
            return game
    raise KeyError(key)


def by_interface(interface: int) -> Game | None:
    """The game a client reporting ``interface`` is, or None for a number no row claims."""
    for game in GAMES:
        if interface in game.interfaces:
            return game
    return None


def by_suffix(suffix: str) -> Game | None:
    """The game whose client reads ``PandaQuest<suffix>.toc``; "" is the plain file's game."""
    for game in GAMES:
        if (suffix == "" and game.fallback) or suffix in game.suffixes:
            return game
    return None


def shipped() -> tuple[Game, ...]:
    return tuple(game for game in GAMES if game.shipped)
