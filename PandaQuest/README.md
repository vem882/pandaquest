# PandaQuest

Quest helper and navigator for **Mists of Pandaria Classic (5.5.4, Interface 50504)**.

PandaQuest shows an on-screen arrow that always points to the next sensible quest objective
(objective, turn-in, or the closest available quest), draws quest icons on the world map and
minimap, adds quest information to NPC and item tooltips, and links to Wowhead in game. The quest
database is derived from Questie's MoP data with its corrections applied.

## Install

1. Copy the `PandaQuest` folder into `World of Warcraft/_classic_/Interface/AddOns/`
   (or run `python3 tools/install.py --wow-dir <path>` from the repository).
2. Make sure the folder is named exactly `PandaQuest` and contains `PandaQuest.toc`.
3. Restart the game or `/reload`.

Optional: TomTom (waypoint mirroring) and Questie are detected automatically when present.

## Slash commands

`/pq` or `/pandaquest`:

| Command | Effect |
|---|---|
| `/pq` | open the options panel |
| `/pq help` | list commands |
| `/pq arrow` | toggle the navigation arrow |
| `/pq target [questID\|clear]` | pin a quest as the current target (no argument: show the current target) |
| `/pq next` | skip the current target |
| `/pq units meters\|yards` | distance units |
| `/pq wh [questID]` | Wowhead link for a quest (default: current target) |
| `/pq hide <questID>` / `/pq unhide <questID>` | hide a quest from the navigator / show it again |
| `/pq reset` | reset the arrow position and map pins |
| `/pq debug [0-4\|arrow]` | log level (0 error ... 4 trace) or arrow debug values |
| `/pq dump quest\|npc\|object\|item <id>` | print a database entry |
| `/pq status` | addon status |
| `/pq sync` | telemetry and community data status |
| `/pq lang auto\|enUS\|fiFI` | interface language |

## Saved variables

`PandaQuestDB` (settings, AceDB profiles) and `PandaQuestSync` (optional telemetry for the
PandaQuest Hub; disable with the Sync options).

## Development

See `docs/` (Finnish) for the module contract and `tools/` for the database builder, the
WoW API stub test harness (`python3 -m pytest tools/tests`) and the luacheck runner.

## License

Addon code: see the repository license. Embedded libraries keep their own licenses
(`Libs/README.md`).
