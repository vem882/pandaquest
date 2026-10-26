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

Four games are shipped (the portal repository's docs/13-forever-and-versions.md, sections 2.5 and 8):

* Mists of Pandaria Classic -- the plain ``PandaQuest.toc`` and ``_Mists``, byte for byte as before;
* Classic Era -- ``_Vanilla``, its database in ``Database/Era/``;
* TBC Anniversary -- ``_TBC``, its database in ``Database/Anniversary/``;
* WoW Forever -- ``_Forever`` and ``_Camelot``, byte-identical, its database in ``Database/Forever/``.
  Until the game launches (4 November 2026) that is Questie's beta data, as on the portal (the owner's
  decision of 2026-10-26); the addon labels it "WoW Forever beta data" until 2026-11-04 23:00 UTC.

Each TOC lists only its own game's database, so a client never parses another game's data.  The CurseForge
game version types are BigWigsMods/packager's (release.sh: ``classic) game_id=67408``, ``bcc) 73246``,
``mists) 79434``, ``forever) 88568``).
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
    #: The ``## Notes`` lines (with their localized variants), at the template's ``{{notes}}`` line.
    notes: tuple[str, ...] = ()
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
    notes=(
        "## Notes: Quest helper and navigator for Mists of Pandaria Classic",
        "## Notes-fiFI: Tehtäväapuri ja navigaattori Mists of Pandaria Classiciin",
        "## Notes-deDE: Questhelfer und Navigator für Mists of Pandaria Classic",
        "## Notes-esES: Ayudante de misiones y navegador para Mists of Pandaria Classic",
        "## Notes-esMX: Asistente de misiones y navegador para Mists of Pandaria Classic",
        "## Notes-frFR: Assistant de quêtes et navigateur pour Mists of Pandaria Classic",
        "## Notes-itIT: Assistente per le missioni e navigatore per Mists of Pandaria Classic",
        "## Notes-koKR: 판다리아의 안개 클래식을 위한 퀘스트 도우미 및 내비게이터",
        "## Notes-ptBR: Assistente de missões e navegador para Mists of Pandaria Classic",
        "## Notes-ruRU: Помощник по заданиям и навигатор для Mists of Pandaria Classic",
        "## Notes-zhCN: 熊猫人之谜 经典版 任务助手与导航",
        "## Notes-zhTW: 潘達利亞之謎 經典版 任務助手與導航",
    ),
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
        "Database\\Overrides\\Flights.lua",
    ),
)

def _notes(english: str, finnish: str) -> tuple[str, ...]:
    """A new game's ``## Notes``: English, which every other client language falls back to, and Finnish."""
    return (f"## Notes: {english}", f"## Notes-fiFI: {finnish}")


def _database(folder: str, *, seed: bool) -> tuple[str, ...]:
    """A game's database lines: its own folder's generated files and overrides, the companion's shared
    Community.lua, and -- for the games pfQuest describes (vanilla and TBC) -- its respawn/drop seed."""
    base = f"Database\\{folder}"
    return (
        f"{base}\\Data\\Meta.lua",
        f"{base}\\Data\\Quests.lua",
        f"{base}\\Data\\Npcs.lua",
        f"{base}\\Data\\Objects.lua",
        f"{base}\\Data\\Items.lua",
        *(("Database\\Data\\Seed.lua",) if seed else ()),
        f"{base}\\Overrides\\Wowhead.lua",
        "Database\\Overrides\\Community.lua",
        f"{base}\\Overrides\\Portal.lua",
    )


ERA = Game(
    key="era",
    name="Classic Era",
    interface=11509,
    interfaces=range(11500, 11600),
    # The suffix Questie and QuestieDB use; the packager maps it to its "classic" game type.
    suffixes=("_Vanilla",),
    fallback=False,
    curseforge_type=67408,
    shipped=True,
    notes=_notes("Quest helper and navigator for WoW Classic Era",
                 "Tehtäväapuri ja navigaattori WoW Classic Eraan"),
    zone_data=("Database\\Era\\ZoneData.lua",),
    # Seed.lua is pfQuest's vanilla+tbc respawn timers, drop rates and gathering nodes: Era's own world.
    data=_database("Era", seed=True),
)

ANNIVERSARY = Game(
    key="anniversary",
    name="Burning Crusade Classic Anniversary",
    interface=20506,
    interfaces=range(20500, 20600),
    suffixes=("_TBC",),
    fallback=False,
    # The packager's "bcc" type: TBC Anniversary is tagged as Burning Crusade Classic 2.5.x.
    curseforge_type=73246,
    shipped=True,
    notes=_notes("Quest helper and navigator for The Burning Crusade Classic Anniversary",
                 "Tehtäväapuri ja navigaattori The Burning Crusade Classic Anniversaryyn"),
    zone_data=("Database\\Anniversary\\ZoneData.lua",),
    data=_database("Anniversary", seed=True),
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
    shipped=True,
    notes=_notes("Quest helper and navigator for WoW Forever",
                 "Tehtäväapuri ja navigaattori WoW Foreveriin"),
    # Questie's Forever data, beta until launch (the owner's decision of 2026-10-26, like the portal);
    # Database/DB.lua's BetaNote() labels it in game until 2026-11-04 23:00 UTC.  No Seed.lua: pfQuest's
    # respawn and drop seed is vanilla's world, not Forever's.
    zone_data=("Database\\Forever\\ZoneData.lua",),
    data=_database("Forever", seed=False),
)

#: Every game, in the order their TOCs are written and tagged.
GAMES: tuple[Game, ...] = (MOP, ERA, ANNIVERSARY, FOREVER)


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
