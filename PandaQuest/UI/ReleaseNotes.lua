-- UI/ReleaseNotes.lua: what changed, for Options > Release notes in PandaQuest's window.
--
-- The feature releases only, newest first, in the words of changelog.txt (every version here has its
-- section there; the release checks hold the two together). The data releases the portal's sync makes
-- every two hours are left out: a list of quests whose data changed is changelog.txt's job.
local _, ns = ...

ns.ReleaseNotes = {
    { version = "0.2.199", date = "2026-10-21", lines = {
        "ui - one PandaQuest window: Quests, Status, Options, About & Help and Performance",
        "options - categories with icons, sub-tabs, a search box and a reset button per category",
        "ui - the window remembers its place, size and scale per profile; Esc closes it",
    } },
    { version = "0.2.198", date = "2026-10-21", lines = {
        "ui - /pq opens PandaQuest: the quest browser with every quest; its Settings button opens the rest",
        "ui - a quest's page and right-click menu: navigate, hide or show, show on map, copy link",
        "ui - links go to the quest's page on the PandaQuest portal (pd.zroot.it) instead of Wowhead",
        "options - new sections: Status, Hidden quests, Moving frames; privacy text under Sync",
    } },
    { version = "0.2.197", date = "2026-10-21", lines = {
        "core - every part of PandaQuest is an Ace3 module, set up and started in the same order as before",
        "options - new Modules section: switch a part of the addon off completely, saved in the profile",
        "options - /pq config [section] [option] [value] changes any setting from chat",
        "languages - a text a language does not translate now reads in English, not the language before",
    } },
    { version = "0.2.194", date = "2026-10-20", lines = {
        "core - the addon knows which game it runs in: Mists of Pandaria Classic, or later WoW Forever",
        "saved data - each saved variable is tagged with its game on load; nothing else in it changes",
    } },
}
