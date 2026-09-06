-- Locales/fiFI.lua: Finnish translation. The WoW client never reports "fiFI" as its game locale,
-- so the strings are also kept in ns.LOCALE_TABLES.fiFI and Core/Init.lua applies them when the
-- user chose Finnish with "/pq lang fiFI" (or when GAME_LOCALE == "fiFI").
local _, ns = ...

local T = {
    -- Core / Init
    ["PandaQuest %s loaded. Type /pq for options, /pq help for commands."] =
        "PandaQuest %s ladattu. Kirjoita /pq avataksesi asetukset, /pq help näyttää komennot.",
    ["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."] =
        "Tervetuloa PandaQuestiin! Nuoli osoittaa seuraavaan tehtäväkohteeseen. Kirjoita /pq help nähdäksesi komennot.",
    ["%s is not available yet."] = "%s ei ole vielä käytettävissä.",
    ["Unknown command: %s"] = "Tuntematon komento: %s",
    ["Available commands:"] = "Käytettävissä olevat komennot:",
    ["/pq - open options"] = "/pq - avaa asetukset",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - nuoli päälle/pois",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] = "/pq target [tehtäväID|clear] - kiinnitä tehtävä (tai näytä nykyinen kohde)",
    ["/pq next - skip the current target"] = "/pq next - ohita nykyinen kohde",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - etäisyysyksikkö",
    ["/pq wh [questID] - Wowhead link"] = "/pq wh [tehtäväID] - Wowhead-linkki",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <tehtäväID> - piilota tehtävä navigaattorista",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <tehtäväID> - näytä piilotettu tehtävä uudelleen",
    ["/pq reset - reset arrow position and map pins"] = "/pq reset - palauta nuolen sijainti ja karttapinnit",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - lokitaso",
    ["/pq dump quest|npc|object|item <id> - print database entry"] = "/pq dump quest|npc|object|item <id> - tulosta tietokantamerkintä",
    ["/pq status - addon status"] = "/pq status - addonin tila",
    ["/pq sync - telemetry and community data status"] = "/pq sync - telemetrian ja yhteisödatan tila",
    ["/pq lang auto|enUS|fiFI - interface language"] = "/pq lang auto|enUS|fiFI - käyttöliittymän kieli",
    ["Units: %s"] = "Yksikkö: %s",
    ["meters"] = "metriä",
    ["yards"] = "jaardia",
    ["Usage: %s"] = "Käyttö: %s",
    ["Log level: %d (%s)"] = "Lokitaso: %d (%s)",
    ["Arrow debug: %s"] = "Nuolen debug: %s",
    ["Language: %s (reload the UI to apply everywhere)"] = "Kieli: %s (lataa käyttöliittymä uudelleen, jotta muutos näkyy kaikkialla)",
    ["Enabled"] = "Käytössä",
    ["Disabled"] = "Pois käytöstä",
    ["Quest %d hidden."] = "Tehtävä %d piilotettu.",
    ["Quest %d is visible again."] = "Tehtävä %d näkyy jälleen.",
    ["Current target: %s"] = "Nykyinen kohde: %s",
    ["No current target."] = "Ei nykyistä kohdetta.",
    ["No target found for quest %d."] = "Tehtävälle %d ei löytynyt kohdetta.",
    ["Not found: %s %d"] = "Ei löytynyt: %s %d",
    ["Version %s"] = "Versio %s",
    ["Database: %s"] = "Tietokanta: %s",
    ["ready"] = "valmis",
    ["loading"] = "latautuu",
    ["Quests in log: %d"] = "Tehtäviä lokissa: %d",
    ["Targets: %d"] = "Kohteita: %d",
    ["Background jobs: %d"] = "Taustatöitä: %d",
    ["Telemetry: %s, sessions stored: %d"] = "Telemetria: %s, tallennettuja sessioita: %d",
    ["Community data: %s"] = "Yhteisödata: %s",
    ["none"] = "ei mitään",
    ["Arrow position and pins reset."] = "Nuolen sijainti ja pinnit palautettu.",
    ["Profile changed: %s"] = "Profiili vaihdettu: %s",

    -- Action texts (docs/06 section 9.3)
    ["Kill %s (%d/%d)"] = "Tapa %s (%d/%d)",
    ["Talk to %s"] = "Puhu: %s",
    ["Loot %s from %s (%d/%d)"] = "Kerää %s: %s (%d/%d)",
    ["Collect %s from %s (%d/%d)"] = "Kerää %s (%s) (%d/%d)",
    ["Use %s (%d/%d)"] = "Käytä %s (%d/%d)",
    ["Use %s on %s"] = "Käytä %s: %s",
    ["Explore %s"] = "Tutki %s",
    ["Turn in to %s"] = "Palauta: %s",
    ["Pick up quest from %s"] = "Ota tehtävä: %s",
    ["Kill %s"] = "Tapa %s",
    ["Loot %s from %s"] = "Kerää %s: %s",

    -- Shared UI strings
    ["Click: next target"] = "Klikkaa: seuraava kohde",
    ["Next: %s"] = "Seuraavaksi: %s",
    ["%s complete - turn in to %s (%s)"] = "%s valmis - palauta: %s (%s)",
    ["Community: avg %s"] = "Yhteisö: keskimäärin %s",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.fiFI = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "fiFI")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
