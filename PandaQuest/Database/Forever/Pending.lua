-- WoW Forever: PandaQuest's quest database for this game ships with the game's launch, not before.
-- The owner's rule: no beta data in the addon. Questie's Forever data (QuestieDB 1.0.6) comes from the beta
-- and the stress test, so PandaQuest_Forever.toc / _Camelot.toc list this file instead of a database until
-- Forever's live data exists; Database/DB.lua then prints one line saying so instead of "reinstall".
-- When the database ships, .github/release/games.py lists Database/Forever/Data/*.lua here instead.
local _, ns = ...
ns.Data = ns.Data or {}
ns.Data.game = "forever"
ns.Data.pending = "4 November 2026"
