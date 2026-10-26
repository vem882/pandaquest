# In-game test checklist: 0.2.267, 0.2.268 (and 0.2.270)

A short manual pass for the owner. The release checks (`python3 .github/release/check.py`) cannot run
the addon against the game, so these are the things only a game client can confirm.

Do each section once per game you play. Tick the column for the game you tested in:
**MoP** = Mists of Pandaria Classic 5.5.x, **Era** = Classic Era 1.15, **TBC** = TBC Anniversary 2.5,
**Fvr** = WoW Forever 1.60. Start every game with `/reload` after installing, and watch chat for red
Lua errors (or turn on `/console scriptErrors 1` first).

## 0.2.267: quest chains, item sources, quest-ID search

### Quest chain line (`/pq`, Quests tab)

Pick a quest that is part of a chain (MoP: the Wandering Isle's starting chain from *The Lesson of
the Burning Scroll*, 29408; Era/TBC/Fvr: Westfall's *The Defias Brotherhood* chain). Search it, open its page.

| Check | MoP | Era | TBC | Fvr |
|---|---|---|---|---|
| The page shows a **Chain** line, "Step N of M", and the next quest's name | | | | |
| **Hover** the line: a tooltip lists every step; done steps green, steps in your log gold | | | | |
| **Left-click** opens the next step's page | | | | |
| **Right-click** opens the step before (nothing happens on step 1, no error) | | | | |
| A quest with no chain shows no Chain line and no empty gap | | | | |
| **Window height**: at the default size nothing on the page is cut off at the bottom; resize the window from the corner grip smaller and larger and the page still fits | | | | |

### "Comes from" lines on item tooltips

| Check | MoP | Era | TBC | Fvr |
|---|---|---|---|---|
| Hover an item that drops from creatures (e.g. *Linen Cloth*, *Embersilk Cloth* in MoP): the tooltip lists up to three sources and "and N more" | | | | |
| A vendor item (e.g. *Refreshing Spring Water*) names the vendor | | | | |
| Bag items, the auction house, chat links and the character pane all get the lines, once (not doubled) | | | | |
| *Options > Tooltips > Show where items come from* **off**: the lines are gone at once; **on**: back | | | | |
| The toggle stays as you left it after `/reload` | | | | |

In Forever the tooltip lines come through `TooltipDataProcessor`, not the classic tooltip scripts:
that game is the one most worth a careful look.

### Quest-ID search

| Check | MoP | Era | TBC | Fvr |
|---|---|---|---|---|
| Type a quest ID (MoP `29408`; Era/TBC/Fvr `783`, *A Threat Within*) in the browser's name box: that quest is found | | | | |
| An ID that is not in the database (`9999999`) finds nothing and raises no error | | | | |
| Typing a name still works as before | | | | |

## 0.2.268: guild fields on the shared character row

These need quest data sharing switched **on** (*Options > Sync and privacy*) and a character in a guild.

1. Check what the game itself answers. The addon assumes the order
   `guildName, guildRankName, guildRankIndex, guildRealm` (rank index 0 = Guild Master, realm nil when
   the guild is on your own realm):

   ```
   /dump GetGuildInfo("player")
   /dump IsInGuild()
   ```

   Expected: `[1]` your guild's name, `[2]` your rank's name, `[3]` a number (0 if you are the Guild
   Master), `[4]` nil on your own realm's guild (a realm name only for a guild from another realm).
2. Check what PandaQuest stored (the key is `Name-Realm`):

   ```
   /reload
   /dump PandaQuestSync.characters
   ```

   Expected on your character's row: `guild`, `guildRank`, `guildRankIndex` equal `[1]`, `[2]`, `[3]`
   above; `guildRealm` absent on your own realm.

| Check | MoP | Era | TBC | Fvr |
|---|---|---|---|---|
| `/dump GetGuildInfo("player")` returns name, rank name, rank index, realm in that order | | | | |
| The row's `guild`, `guildRank`, `guildRankIndex` match it | | | | |
| Right after login (before the guild has loaded) the row keeps the guild it had; it is not blanked | | | | |
| Leave the guild (or use a guildless character): `guild = ""`, the rank fields gone | | | | |
| Get promoted/demoted: after the next `GUILD_ROSTER_UPDATE` (open the guild window) the rank fields follow | | | | |
| Sharing **off**: nothing new is written | | | | |
| The privacy line in the options names the guild name and rank | | | | |

The order was checked against Blizzard's own FrameXML for the classic clients
(`TabardFrame.lua`: `local guildName, rankName, rank = GetGuildInfo("player")` and `rank > 0` means
"not the Guild Master", in Gethe/wow-ui-source's `classic` and `classic_era` branches) and
warcraft.wiki.gg's API page (the same four returns for Retail, Forever 1.60.1, Mists 5.5.4, TBC 2.5.6 and
Vanilla 1.15.9). A different answer in game is a bug to report with the `/dump` output.

## 0.2.270: Forever beta data, community guide check

| Check | Fvr |
|---|---|
| `/pq` in Forever: the Quests window's header shows "WoW Forever beta data" in orange after the title, on every tab | |
| `/pq status` has a "WoW Forever beta data" line | |
| Quest pins, the arrow and the quest list have Forever quests (e.g. Northshire's starting quests) | |
| After 2026-11-04 23:00 UTC the label is gone (after a `/reload`) | |

| Check | MoP | Era | TBC | Fvr |
|---|---|---|---|---|
| No "WoW Forever beta data" label anywhere outside Forever | | | | |
| Copy MoP's `Interface/AddOns/PandaQuest/Database/Overrides/Community.lua` (written by the sync app) over the same file in another game's folder and `/reload`: one chat line says the guide was written for Mists of Pandaria Classic and was not loaded; no MoP guides show | – | | | |
| The sync app's own download for that game (`community.lua?game=<game>`, now tagged `game = "<game>"`) loads with no such line | | | | |
