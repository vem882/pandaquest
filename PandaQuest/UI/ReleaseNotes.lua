-- UI/ReleaseNotes.lua: what changed, for Options > Release notes in PandaQuest's window.
--
-- The feature releases only, newest first, in the words of changelog.txt (every version here has its
-- section there; the release checks hold the two together). The data releases the portal's sync makes
-- every two hours are left out: a list of quests whose data changed is changelog.txt's job.
local _, ns = ...

ns.ReleaseNotes = {
    { version = "0.2.270", date = "2026-10-26", lines = {
        "database - WoW Forever ships its quest database: Questie's beta data, built like the other games'",
        "ui - Forever: the window header and /pq status say \"WoW Forever beta data\" until 4 Nov 23:00 UTC",
        "community - a Community.lua for another game is set aside with one chat line, not loaded",
    } },
    { version = "0.2.267", date = "2026-10-26", lines = {
        "quest browser - a quest's page says which step of its chain it is and names the next quest",
        "quest browser - a quest ID typed in the name box finds that quest",
        "tooltips - item tooltips say where the item comes from: drops, chests, containers, vendors",
    } },
    { version = "0.2.242", date = "2026-10-23", lines = {
        "core - new files of an update made while the game ran did not load: PandaQuest now says to restart",
        "quest mobs - kill-credit objectives mark their own group, not another creature of the quest twice",
        "quest mobs - talk-to NPCs, turn-in NPCs (?) and givers with a quest for you (!) are marked too",
    } },
    { version = "0.2.240", date = "2026-10-23", lines = {
        "auction - the auction house scan, mailbox sales and auction tooltip prices are removed",
    } },
    { version = "0.2.235", date = "2026-10-23", lines = {
        "ui - one PandaQuest window: Quests, Status, Options, About & Help and Performance",
        "options - categories with icons, sub-tabs, a search box and a reset button per category",
        "ui - the window remembers its place, size and scale per profile; Esc closes it",
    } },
    { version = "0.2.234", date = "2026-10-23", lines = {
        "ui - /pq opens PandaQuest: the quest browser with every quest; its Settings button opens the rest",
        "ui - a quest's page and right-click menu: navigate, hide or show, show on map, PandaQuest link",
        "ui - links go to the quest's page on the PandaQuest portal (pd.zroot.it) instead of Wowhead",
        "options - new sections: Status, Hidden quests, Moving frames; privacy text under Sync",
    } },
    { version = "0.2.233", date = "2026-10-23", lines = {
        "core - every part of PandaQuest is an Ace3 module, set up and started in the same order as before",
        "options - new Modules section: switch a part of the addon off completely, saved in the profile",
        "options - /pq config [section] [option] [value] changes any setting from chat",
        "languages - a text a language does not translate now reads in English, not the language before",
    } },
    { version = "0.2.230", date = "2026-10-23", lines = {
        "quest browser - the map on a quest's page stays: its tiles were drawn under the map's own ground",
        "quest browser - a quest that scales with your level reads \"Scales\", not -1",
    } },
    { version = "0.2.194", date = "2026-10-20", lines = {
        "core - the addon knows which game it runs in: Mists of Pandaria Classic, or later WoW Forever",
        "saved data - each saved variable is tagged with its game on load; nothing else in it changes",
    } },
}
