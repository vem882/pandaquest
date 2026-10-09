# PandaQuest

**Quest helper and navigator for Mists of Pandaria Classic (5.5.4).**

PandaQuest puts an arrow on your screen that always points at your next sensible quest objective —
an objective, a turn-in or the nearest available quest — and shows quests, gathering nodes and
flight times on the world map and minimap.

## Features

- **Navigation arrow** with the quest name, the action, distance and an ETA from your real speed
- **Quest pins** on the world map and minimap, with tooltips on NPCs and items
- **Quest database**: 17 693 quests, 60 224 NPCs, 20 326 objects and 80 049 items
- **Respawn timers** and drop rates on pins, always saying where the number came from
- **Gathering nodes**: ore, herbs, fishing pools, chests and rares, learned from play
- **Flight times** on the flight master and a progress bar in flight
- **Archaeology** dig-site bar, **profession** recipe reading and **auction** price scans
- **Wowhead links**, an options panel, English and Finnish
- Optional **TomTom** integration

## Synchronisation is optional

PandaQuest works fully without it and it is off by default. If you turn it on it records what you do
while questing to a file on your own computer; the addon never uploads anything itself.

## Help complete the content

Mists of Pandaria's nodes, respawn timers and flight times are in no downloadable source, so the
content is completed from play and by contributors. The **PandaQuest portal at
[pd.zroot.it](https://pd.zroot.it)** is where that happens — join in and help fill the gaps.

## Commands

`/pq` opens the options, `/pq help` lists everything.

## Install

Install with the CurseForge app, or unzip the release from
[GitHub](https://github.com/vem882/pandawow_addon/releases) into
`World of Warcraft/_classic_/Interface/AddOns/`. Built for **Mists of Pandaria Classic 5.5.4** only.

## Questions and problems

- **Issues:** <https://github.com/vem882/pandawow_addon/issues>
- Include the output of `/pq status` and the Lua error text (`/console scriptErrors 1`, then `/reload`).
- `/pq debug 3` raises the log level while you reproduce the problem.

## FAQ

**Do I need the portal?** No. PandaQuest works fully on its own.

**Is anything sent anywhere?** No. Addons cannot send data. Synchronisation, if you switch it on, only
writes a file on your computer.

**Why is a time missing?** Respawn timers and flight times are measured from play. A line whose value
is unknown is left out rather than guessed.

**Questie, TomTom, Leatrix Maps?** TomTom is supported as an optional waypoint target. PandaQuest does
not use or change Questie. Map-addon compatibility is built in but not yet confirmed on a live client.

## Languages

English and Finnish. Select Finnish with `/pq lang fiFI`. Translations are welcome as pull requests.

## Contributing

Play with synchronisation on and use the portal, report wrong data with the quest ID, translate, or
send code. See the repository README.

## Not done yet

- Flight-path routing between continents
- A tracker of PandaQuest's own
- Measured timers, nodes and flight times for all of Pandaria
- Confirmation on a live client of the arrow's rotation and of auction scanning

## Inspiration

Inspired by Questie, pfQuest and TomTom. PandaQuest does not copy their code. Data and assets taken
from other projects keep their own licences, listed in the addon's README.

Source and issues: <https://github.com/vem882/pandawow_addon>
