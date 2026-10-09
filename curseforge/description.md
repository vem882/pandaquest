# PandaQuest

An on-screen arrow that always points at your next sensible quest objective in **Mists of Pandaria
Classic 5.5.4**, with the quests, gathering nodes and flight times that lead you there drawn on the
world map and the minimap.

## Main features

- **Navigation arrow** – points to the next unfinished objective, ready turn-in or nearest available
  quest. Shows the quest name in difficulty colour, what to do, the distance (metres or yards) and an
  ETA calculated from your actual speed. Hides itself in instances, on taxis and in pet battles.
- **Quest pins** – objectives, turn-ins and available quests on the world map and minimap, merged per
  spawn cluster, with the current target highlighted.
- **Built-in quest database** – 17 693 quests, 60 224 NPCs, 20 326 objects and 80 049 items, with
  prerequisites, race/class/level/reputation/skill checks, so it knows which quests you can pick up.
- **Tooltips** – NPC and item tooltips list the quests they start, end or count towards. Pin tooltips
  show level range, type, respawn time, drop rate and live objective progress.
- **Respawn timers** – a static seed, community medians with their sample counts, and what your own
  session measured; the tooltip always says which one it is showing.
- **Gathering nodes** – ore, herbs, fishing pools, chests and rare spawns, filtered to the professions
  your character has. Pandaria's nodes are learned from play, because no downloadable source has them.
- **Flight times** – the flight master's tooltip shows how long a flight takes, and a bar runs during
  the flight. Routes are measured by flying them; an unknown route shows nothing instead of a guess.
- **Archaeology, professions and auctions** – a dig-site progress bar, reading your recipe books
  (`/pq scan professions`) and auction price scans that only ever start from a button or a command.
- **Tracker, notifications and Wowhead links** – distance on the Blizzard tracker, a message when a
  quest completes, and `/pq wh` for a copyable Wowhead link.
- **Options and languages** – a full options panel with profiles; English and Finnish.
- **Optional TomTom integration** – sends the current target to TomTom as a waypoint if you use it.

## Synchronisation is optional

PandaQuest works fully without it, and it is off by default. If you turn it on, the addon records what
you do while questing to a file on your own computer. The addon never uploads anything itself.

## Help complete the content

Mists of Pandaria's nodes, respawn timers and flight times are in no downloadable source, so the
content is completed from play and by contributors. The **PandaQuest portal at
[pd.zroot.it](https://pd.zroot.it)** is where that happens: join in and help fill the gaps.

## Commands

`/pq` opens the options, `/pq help` lists everything, `/pq status` shows the version and build.

## Questions and problems

Report problems on the issue tracker (link below). Please include the output of `/pq status` and the
Lua error text (`/console scriptErrors 1`, then `/reload`); `/pq debug 3` raises the log level while
you reproduce the problem.

## FAQ

**Do I need the portal?** No. PandaQuest works fully on its own.

**Is anything sent anywhere?** No. Addons cannot send data. Synchronisation, if you switch it on, only
writes a file on your computer.

**Why is a time missing?** Respawn timers and flight times are measured from play. A line whose value
is unknown is left out rather than guessed.

**Questie, TomTom, Leatrix Maps?** TomTom is supported as an optional waypoint target. PandaQuest does
not use or change Questie. Map-addon compatibility is built in but not yet confirmed on a live client.

**Other game versions?** No. It is built for Mists of Pandaria Classic 5.5.4 only.

## Not done yet

- Flight-path routing between continents
- A quest tracker of PandaQuest's own
- Measured timers, nodes and flight times for all of Pandaria
- Confirmation on a live client of the arrow's rotation and of auction scanning

## Languages and contributing

The interface is in English and Finnish (`/pq lang fiFI`); translations are welcome as pull requests.
You can also play with synchronisation on and use the portal, report wrong data with the quest ID, or
send code.

## Inspiration

Inspired by Questie, pfQuest and TomTom. PandaQuest does not copy their code. Data and assets taken
from other projects keep their own licences, listed in the addon's README.

## Suomeksi

**PandaQuest** on tehtäväapuri ja navigaattori Mists of Pandaria Classiciin (5.5.4). Nuoli osoittaa
aina seuraavaan järkevään tehtäväkohteeseen, ja tehtävät, keräyspisteet ja lentoajat näkyvät kartalla
ja minikartalla. Mukana on tehtävätietokanta, uudelleensyntymisajastimet, keräyspisteet,
lentoaikojen mittaus, arkeologia-, ammatti- ja huutokauppatyökalut sekä Wowhead-linkit.

Synkronointi on valinnainen ja oletuksena pois: addon toimii täysin ilman sitä eikä lähetä itse mitään.
Sisältöä täydennetään portaalissa [pd.zroot.it](https://pd.zroot.it), johon voit tulla mukaan.
Suomi valitaan komennolla `/pq lang fiFI`.

---

Source and issue tracker: <https://github.com/vem882/pandawow_addon>
