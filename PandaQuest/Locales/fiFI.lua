-- Locales/fiFI.lua: Finnish translation. The WoW client never reports "fiFI" as its game locale,
-- so the strings are also kept in ns.LOCALE_TABLES.fiFI and Core/Init.lua applies them when the
-- user chose Finnish with "/pq lang fiFI" (or when GAME_LOCALE == "fiFI").
local _, ns = ...

local T = {
    -- Core / Init
    ["PandaQuest %s loaded. Type /pq to open it."] =
        "PandaQuest %s ladattu. Kirjoita /pq avataksesi sen.",
    ["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq to open PandaQuest and its settings."] =
        "Tervetuloa PandaQuestiin! Nuoli osoittaa seuraavaan tehtäväkohteeseen. Kirjoita /pq avataksesi PandaQuestin ja sen asetukset.",
    ["%s is not available yet."] = "%s ei ole vielä käytettävissä.",
    ["Unknown command: %s"] = "Tuntematon komento: %s",
    ["Available commands:"] = "Käytettävissä olevat komennot:",
    ["/pq - open PandaQuest: every quest, and the Settings button"] =
        "/pq - avaa PandaQuest: kaikki tehtävät ja Asetukset-painike",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - nuoli päälle/pois",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] = "/pq target [tehtäväID|clear] - kiinnitä tehtävä (tai näytä nykyinen kohde)",
    ["/pq next - skip the current target"] = "/pq next - ohita nykyinen kohde",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - etäisyysyksikkö",
    ["/pq wh [questID] - link to the quest's page on the PandaQuest portal"] =
        "/pq wh [tehtäväID] - linkki tehtävän sivulle PandaQuest-portaalissa",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <tehtäväID> - piilota tehtävä navigaattorista",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <tehtäväID> - näytä piilotettu tehtävä uudelleen",
    ["/pq reset - reset arrow position and map pins"] = "/pq reset - palauta nuolen sijainti ja karttapinnit",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - lokitaso",
    ["/pq dump quest|npc|object|item <id> - print database entry"] = "/pq dump quest|npc|object|item <id> - tulosta tietokantamerkintä",
    ["/pq status - addon status"] = "/pq status - addonin tila",
    ["/pq sync - telemetry and community data status"] = "/pq sync - telemetrian ja yhteisödatan tila",
    ["/pq lang auto|<locale> - interface language"] = "/pq lang auto|<kielikoodi> - käyttöliittymän kieli",
    ["Available languages: %s"] = "Käytettävissä olevat kielet: %s",
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
    ["Built %s from %s"] = "Koottu %s commitista %s",
    ["This is a build from a modified working tree; it is not a release."] =
        "Tämä on koottu muokatusta työhakemistosta; se ei ole julkaisu.",
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

    -- Action texts
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

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "Tietokanta valmis: %d tehtävää, %d NPC:tä, %d objektia, %d esinettä (%d ms).",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "PandaQuestin tietokantaa ei löytynyt. Asenna lisäosa uudelleen: Database/Data-tiedostot puuttuvat.",
    ["This PandaQuest database is for %s, but this game is %s. Quest data is off; install PandaQuest for this game."] =
        "Tämä PandaQuestin tietokanta on pelille %s, mutta tämä peli on %s. Tehtävätiedot ovat pois päältä; asenna PandaQuest tälle pelille.",
    ["Saved data from %s was set aside, not deleted (%s); this game starts its own."] =
        "Pelin %s tallennetut tiedot siirrettiin sivuun, niitä ei poistettu (%s); tämä peli aloittaa omansa.",
    ["PandaQuest's quest database for %s comes with the game's launch (%s). Until then the arrow, the map pins and the quest list have no data; everything else works."] =
        "PandaQuestin tehtävätietokanta pelille %s tulee pelin julkaisun myötä (%s). Siihen asti nuolella, karttamerkeillä ja tehtävälistalla ei ole tietoja; kaikki muu toimii.",
    ["WoW Forever beta data"] = "WoW Foreverin beetatiedot",
    ["The community guide in Community.lua was written for %s, not for %s, so it was not loaded. Run the PandaQuest app's sync for this game to get its own guide."] =
        "Community.lua-tiedoston yhteisöopas on tehty pelille %s eikä pelille %s, joten sitä ei ladattu. Synkronoi PandaQuest-sovelluksella tämän pelin oma opas.",
    ["quests can still change before the game's launch on 4 November 2026."] =
        "tehtävät voivat vielä muuttua ennen pelin julkaisua 4. marraskuuta 2026.",

    -- Nav (arrow, router, TomTom)
    ["Arrow locked."] = "Nuoli lukittu.",
    ["Arrow unlocked - drag it to move."] = "Nuoli vapautettu - raahaa hiirellä.",
    ["Close"] = "Sulje",
    ["Custom target"] = "Oma kohde",
    ["Distance"] = "Etäisyys",
    ["ETA"] = "Matka-aika",
    ["Hide this quest"] = "Piilota tämä tehtävä",
    ["Lock arrow"] = "Lukitse nuoli",
    ["Next target"] = "Seuraava kohde",
    ["Reset arrow position"] = "Palauta nuolen sijainti",
    ["Right-click: arrow menu"] = "Oikea klikkaus: nuolen valikko",
    ["Send to TomTom"] = "Lähetä TomTomiin",
    ["Shift-click: send to TomTom"] = "Shift+klikkaus: lähetä TomTomiin",
    ["Show distance in metres"] = "Näytä etäisyys metreinä",
    ["Show distance in yards"] = "Näytä etäisyys jaardeina",
    ["Show on map"] = "Näytä kartalla",
    ["TomTom is not loaded."] = "TomTom ei ole ladattuna.",
    ["Unlock arrow"] = "Vapauta nuoli",
    ["Link to the quest's page"] =
        "Linkki tehtävän sivulle",

    -- Nav/Waypoint (in-world waypoints, /way)
    ["Waypoints"] =
        "Reittipisteet",
    ["Waypoint"] =
        "Reittipiste",
    ["Ready for turn-in"] =
        "Valmis palautettavaksi",
    ["Quest available"] =
        "Tehtävä saatavilla",
    ["X: %.1f, Y: %.1f"] =
        "X: %.1f, Y: %.1f",
    ["Arrived at %s."] =
        "Perillä: %s.",
    ["Waypoint set: %s"] =
        "Reittipiste asetettu: %s",
    ["Waypoint cleared."] =
        "Reittipiste poistettu.",
    ["Usage: /way [zone] x y [label]"] =
        "Käyttö: /way [alue] x y [nimi]",
    ["Coordinates must be between 0 and 100."] =
        "Koordinaattien on oltava välillä 0-100.",
    ["Unknown zone: %s"] =
        "Tuntematon alue: %s",
    ["Did you mean: %s"] =
        "Tarkoititko: %s",
    ["You are not on a map with coordinates. Name the zone: /way <zone> x y"] =
        "Tässä ei ole koordinaatteja. Kerro alue: /way <alue> x y",
    ["Current waypoint: %s"] =
        "Nykyinen reittipiste: %s",
    ["No waypoint."] =
        "Ei reittipistettä.",
    ["Not possible in combat."] =
        "Ei onnistu taistelun aikana.",
    ["Mists of Pandaria Classic gives addons no way to put a marker on a spot in the 3D world."] =
        "Mists of Pandaria Classic ei anna lisäosille keinoa merkitä paikkaa 3D-maailmaan.",
    ["PandaQuest marks the quest NPC itself, over its nameplate, and shows the distance on the arrow."] =
        "PandaQuest merkitsee tehtävän NPC:n itse, sen nimikilven yläpuolelle, ja näyttää etäisyyden nuolessa.",
    ["Show waypoints"] =
        "Näytä reittipisteet",
    ["What to mark"] =
        "Mitä merkitään",
    ["Follow the tracked quest"] =
        "Seuraa seurattua tehtävää",
    ["The quest you track (or else the arrow's target) gets the waypoint: where to hand it in once it is complete."] =
        "Seuraamasi tehtävä (tai muuten nuolen kohde) saa reittipisteen: palautuspaikan, kun tehtävä on valmis.",
    ["Also mark unfinished objectives"] =
        "Merkitse myös keskeneräiset tavoitteet",
    ["Without this, only hand-ins, quest givers and points you set get a waypoint."] =
        "Ilman tätä reittipisteen saavat vain palautukset, tehtävänantajat ja itse asettamasi pisteet.",
    ["Show TomTom's waypoint"] =
        "Näytä TomTomin reittipiste",
    ["With TomTom installed, the waypoint TomTom's arrow follows is shown in PandaQuest's style."] =
        "Kun TomTom on asennettu, TomTomin nuolen reittipiste näytetään PandaQuestin tyylillä.",
    ["What to show"] =
        "Mitä näytetään",
    ["Distance on the arrow"] =
        "Etäisyys nuolessa",
    ["A badge with the distance and the travel time, above the arrow."] =
        "Merkki, etäisyys ja matka-aika nuolen yläpuolella.",
    ["Pinpoint over the NPC"] =
        "Tarkka merkki NPC:n yllä",
    ["Up close, the quest and what to do there, framed over the NPC's head with chevrons pointing at it."] =
        "Lähellä tehtävä ja mitä siellä tehdään, kehystettynä NPC:n pään yllä nuolenkärkien osoittaessa siihen.",
    ["Pinpoint distance (yards)"] =
        "Tarkan merkin etäisyys (jaardia)",
    ["Closer than this, the beam gives way to the Pinpoint label."] =
        "Tätä lähempänä valokeila vaihtuu tarkkaan merkkiin.",
    ["Light beam over the NPC"] =
        "Valokeila NPC:n yllä",
    ["Further out, a column of light over the NPC's nameplate, drawn only where the nameplate really is: no nameplate, no beam."] =
        "Kauempana valopylväs NPC:n nimikilven yllä, vain siellä missä nimikilpi todella on: ei nimikilpeä, ei valokeilaa.",
    ["Beam colour"] =
        "Valokeilan väri",
    ["Remove a /way point when you reach it"] =
        "Poista /way-piste, kun saavut perille",
    ["Nameplates"] =
        "Nimikilvet",
    ["Friendly NPC nameplates are off. The Pinpoint label and the beam need them: turn them on here or in the game's options."] =
        "NPC-nimikilvet ovat pois päältä. Tarkka merkki ja valokeila tarvitsevat ne: laita ne päälle tästä tai pelin asetuksista.",
    ["Friendly NPC nameplates are on. Inside dungeons the game keeps them from addons, so there the arrow carries on alone."] =
        "NPC-nimikilvet ovat päällä. Luolastoissa peli ei anna niitä lisäosille, joten siellä nuoli jatkaa yksin.",
    ["Turn on friendly NPC nameplates"] =
        "Laita ystävällisten NPC:iden nimikilvet päälle",
    ["Changes the game's setting nameplateShowFriendlyNpcs, only when you press this."] =
        "Muuttaa pelin asetusta nameplateShowFriendlyNpcs, vain kun painat tätä.",
    ["Current waypoint"] =
        "Nykyinen reittipiste",
    ["Clear the waypoint"] =
        "Poista reittipiste",
    ["Forgets the point or quest you chose; the waypoint follows the tracked quest again."] =
        "Unohtaa valitsemasi pisteen tai tehtävän; reittipiste seuraa taas seurattua tehtävää.",
    ["/way belongs to another addon here (%s), so PandaQuest shows that addon's waypoint where it can."] =
        "/way kuuluu täällä toiselle lisäosalle (%s), joten PandaQuest näyttää sen reittipisteen, kun voi.",
    ["/way [zone] x y [label] sets a waypoint, written the way TomTom writes it."] =
        "/way [alue] x y [nimi] asettaa reittipisteen TomTomin tapaan.",
    ["For example /way 35 79, /way Eversong Woods 35.0 79.0 Windrunner Spire or /way #94 35 79. /way clear removes it."] =
        "Esimerkiksi /way 35 79, /way Eversong Woods 35.0 79.0 Windrunner Spire tai /way #94 35 79. /way clear poistaa sen.",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "%d esiintymää täällä",
    ["Left-click: navigate here"] = "Vasen klikkaus: navigoi tänne",
    ["Right-click: more options"] = "Oikea klikkaus: lisää valintoja",
    ["Set as target"] = "Aseta kohteeksi",
    ["Hide quest: %s"] = "Piilota tehtävä: %s",
    ["Portal page: %s"] =
        "Portaalin sivu: %s",
    ["Starts: %s"] = "Aloittaa: %s",
    ["Turn in: %s"] = "Palauta: %s",
    ["Ends: %s"] = "Päättyy: %s",

    -- Map/NodeTooltip
    ["Level:"] = "Taso:",
    ["Type:"] = "Tyyppi:",
    ["Skill:"] = "Taito:",
    ["Respawn:"] = "Uudelleensyntymä:",
    ["Respawn in:"] = "Syntyy uudelleen:",
    ["~%s (%d)"] = "~%s (%d)",
    ["Sightings:"] = "Havaintoja:",
    ["Found by you:"] = "Löysit itse:",
    ["Also here:"] = "Myös tässä:",
    ["Unit"] = "Olento",
    ["Object"] = "Objekti",
    ["Item"] = "Esine",
    ["Area"] = "Alue",
    ["%d Sec"] = "%d s",
    ["%d Secs"] = "%d s",
    ["%d Min"] = "%d min",
    ["%d Mins"] = "%d min",
    ["%d Hour"] = "%d t",
    ["%d Hours"] = "%d t",

    -- UI/Options
    ["General"] = "Yleiset",
    ["PandaQuest works out of the box. Everything below is optional."] =
        "PandaQuest toimii heti asennuksen jälkeen. Kaikki alla oleva on vapaaehtoista.",
    ["Distance units"] = "Etäisyyden yksiköt",
    ["Metres are shown as '123 m', yards as '135 yd'."] =
        "Metrit näytetään muodossa '123 m', jaardit muodossa '135 yd'.",
    ["Show minimap button"] = "Näytä minikartan painike",
    ["Language"] = "Kieli",
    ["PandaQuest follows your game language; /pq lang overrides it."] =
        "PandaQuest seuraa pelin kieltä; /pq lang ohittaa sen.",
    ["Arrow"] = "Nuoli",
    ["Show the arrow"] = "Näytä nuoli",
    ["Hide it to navigate by map pins only."] = "Piilota, jos haluat navigoida pelkillä karttamerkeillä.",
    ["Lock the arrow in place"] = "Lukitse nuoli paikalleen",
    ["When unlocked, drag the arrow to move it."] = "Kun lukitus on pois, nuolta voi raahata hiirellä.",
    ["Show quest text"] = "Näytä tehtäväteksti",
    ["Quest name and the action to take under the arrow."] = "Tehtävän nimi ja seuraava toimenpide nuolen alla.",
    ["Show travel time"] = "Näytä matka-aika",
    ["Estimated time to the target at your current speed."] = "Arvioitu aika kohteeseen nykyisellä nopeudellasi.",
    ["Show community timings"] = "Näytä yhteisön ajat",
    ["Average completion time collected from other players, when available."] =
        "Muilta pelaajilta kerätty keskimääräinen suoritusaika, jos saatavilla.",
    ["Hide inside instances"] = "Piilota instansseissa",
    ["The arrow cannot guide you inside a dungeon or raid."] = "Nuoli ei osaa opastaa luolaston tai raidin sisällä.",
    ["Flash on arrival"] = "Välähdys perillä",
    ["A short glow when you reach the target."] = "Lyhyt hehku, kun saavut kohteeseen.",
    ["Appearance"] = "Ulkoasu",
    ["Size"] = "Koko",
    ["Arrow size relative to the default."] = "Nuolen koko suhteessa oletukseen.",
    ["Opacity"] = "Peittävyys",
    ["Text size"] = "Tekstin koko",
    ["Reset position"] = "Palauta sijainti",
    ["Moves the arrow back to the middle of the screen."] = "Siirtää nuolen takaisin ruudun keskelle.",
    ["Navigation"] = "Navigointi",
    ["Target selection"] = "Kohteen valinta",
    ["Auto weighs priority and distance; Focused quest follows one quest."] =
        "Automaattinen painottaa tärkeyttä ja etäisyyttä; Kiinnitetty tehtävä seuraa yhtä tehtävää.",
    ["Auto"] = "Automaattinen",
    ["Focused quest"] = "Kiinnitetty tehtävä",
    ["Nearest"] = "Lähin",
    ["Focused quest ID"] = "Kiinnitetyn tehtävän ID",
    ["Used by 'Focused quest'. Empty follows the quest you track in the log."] =
        "Käytössä 'Kiinnitetty tehtävä' -tilassa. Tyhjänä seuraa lokissa seurattua tehtävää.",
    ["Route to turn-ins"] = "Reititä palautuksiin",
    ["Completed quests are routed back to their quest giver."] =
        "Valmiit tehtävät reititetään takaisin tehtävänantajalle.",
    ["Route to new quests"] = "Reititä uusiin tehtäviin",
    ["Nearby quests you could pick up are added to the route."] =
        "Lähellä olevat otettavissa olevat tehtävät lisätään reitille.",
    ["New quest radius"] = "Uusien tehtävien säde",
    ["How far away a pickup may be to be routed to (yards)."] = "Kuinka kaukana otettava tehtävä saa olla (jaardia).",
    ["Maximum new quests"] = "Uusien tehtävien enimmäismäärä",
    ["How many pickups are routed at once."] = "Kuinka monta otettavaa tehtävää reititetään kerralla.",
    ["Arrival radius"] = "Saapumissäde",
    ["How close you must get before a target counts as reached (yards)."] =
        "Kuinka lähelle pitää päästä, jotta kohde lasketaan saavutetuksi (jaardia).",
    ["TomTom"] = "TomTom",
    ["TomTom waypoints"] = "TomTom-reittipisteet",
    ["Mirror sends the current target to TomTom as a waypoint."] =
        "Peilaus lähettää nykyisen kohteen TomTomiin reittipisteenä.",
    ["Off"] = "Pois",
    ["Mirror current target"] = "Peilaa nykyinen kohde",
    ["Map"] = "Kartta",
    ["Show objective pins"] = "Näytä tavoitemerkit",
    ["Where to go for the quests in your log."] = "Minne mennä lokin tehtävien vuoksi.",
    ["Show turn-in pins"] = "Näytä palautusmerkit",
    ["Quest givers waiting for a completed quest."] = "Tehtävänantajat, jotka odottavat valmista tehtävää.",
    ["Show available quest pins"] = "Näytä saatavilla olevien tehtävien merkit",
    ["Quests you could pick up."] = "Tehtävät, jotka voisit ottaa vastaan.",
    ["Show pins on the minimap"] = "Näytä merkit minikartalla",
    ["Keep distant pins on the minimap edge"] = "Pidä kaukaiset merkit minikartan reunalla",
    ["Off hides a pin as soon as it leaves the minimap."] =
        "Pois päältä piilottaa merkin heti, kun se poistuu minikartalta.",
    ["Merge nearby spawns"] = "Yhdistä lähekkäiset esiintymät",
    ["One pin for a pack of mobs instead of a dozen."] = "Yksi merkki mobilaumalle tusinan sijaan.",
    ["Pin size"] = "Merkin koko",
    ["Map pin size"] = "Kartan merkin koko",
    ["Minimap pin size"] = "Minikartan merkin koko",
    -- Map/Pins, Map/Icons
    ["Objective dot size"] = "Tavoitepisteen koko",
    ["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."] =
        "Tavoitteet ja keräilykohteet ovat pieniä pisteitä, väri tehtävän tai lajin mukaan; tehtävänantajat pitävät ikoninsa.",
    ["Maximum minimap pins"] = "Merkkien enimmäismäärä minikartalla",
    ["When there are more, the ones nearest to you are kept."] = "Jos niitä on enemmän, lähimmät säilytetään.",
    ["Minimap edge fade"] = "Minikartan reunahäivytys",
    ["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] =
        "Merkit himmenevät ja pienenevät tämän verran minikartan reunaa kohti mentäessä. 0 poistaa häivytyksen.",
    ["Which quests to show"] = "Mitkä tehtävät näytetään",
    ["Show low level quests"] = "Näytä matalatasoiset tehtävät",
    ["Quests that are grey for your level."] = "Tehtävät, jotka ovat tasollesi harmaita.",
    ["Show repeatable and daily quests"] = "Näytä toistuvat ja päivittäiset tehtävät",
    ["Show dungeon quests"] = "Näytä luolastotehtävät",
    ["Show raid quests"] = "Näytä raid-tehtävät",
    ["Show PvP quests"] = "Näytä PvP-tehtävät",
    ["Show pet battle quests"] = "Näytä lemmikkitaistelutehtävät",

    -- Nodes/Professions
    ["Gathering"] = "Keräily",
    ["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] =
        "Malmit, yrtit, kalastuspaikat, arkut ja harvinaiset spawnit, vain siellä missä sinä tai yhteisö on oikeasti löytänyt sellaisen.",
    ["Show gathering nodes"] = "Näytä keräilykohteet",
    ["Turns the whole layer off, whatever the boxes below say."] =
        "Sammuttaa koko tason riippumatta alla olevista valinnoista.",
    ["Which nodes"] = "Mitkä kohteet",
    ["Mining veins"] = "Malmisuonet",
    ["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] =
        "Malmisuonet. Piilotetaan jos Mining-taitosi ei riitä, ellet näytä myös niitä.",
    ["Herbs"] = "Yrtit",
    ["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] =
        "Yrttipaikat. Piilotetaan jos Herbalism-taitosi ei riitä, ellet näytä myös niitä.",
    ["Fishing pools"] = "Kalastuspaikat",
    ["Fishing pools on lakes, rivers and the coast."] =
        "Kalastuspaikat järvissä, joissa ja rannikolla.",
    ["Chests and treasures"] = "Arkut ja aarteet",
    ["Chests and lockboxes in the world; no gathering skill filters these."] =
        "Arkut ja lippaat maailmassa; keräilytaito ei suodata näitä.",
    ["Rare spawns"] = "Harvinaiset spawnit",
    ["Rare creatures, at the places a rare was looted."] =
        "Harvinaiset olennot, niissä paikoissa joissa sellainen on lootattu.",
    ["Which of them you can gather"] = "Mitkä niistä osaat kerätä",
    ["Only my professions"] = "Vain omat ammattini",
    ["A profession you have not learned contributes nothing at all."] =
        "Ammatti jota et ole opetellut ei tuo kartalle mitään.",
    ["Show nodes above my skill"] = "Näytä taitoni yli menevät kohteet",
    ["Drawn faded. Useful for planning where to level a gathering skill next."] =
        "Piirretään haaleana. Hyödyllinen kun suunnittelet missä nostat keräilytaitoa seuraavaksi.",
    ["Fade nodes and mobs until they respawn"] = "Häivytä kohteet ja viholliset kunnes ne palaavat",
    ["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] =
        "Keräämäsi kohde tai tappamasi vihollinen pysyy haaleana kunnes respawn-aika kertoo sen palanneen.",

    ["Tooltips"] = "Vihjeruudut",
    ["Add quest info to tooltips"] = "Lisää tehtävätiedot vihjeruutuihin",
    ["Shows which quests an NPC or item starts, ends or counts towards."] =
        "Näyttää, mitkä tehtävät NPC tai esine aloittaa tai päättää ja mihin se vaikuttaa.",
    ["Show quest IDs"] = "Näytä tehtävien ID:t",
    ["Useful when reporting missing data."] = "Hyödyllinen puuttuvista tiedoista raportoitaessa.",
    ["Show quest rewards"] = "Näytä tehtävien palkinnot",
    ["Money, experience and items under a quest you can pick up, on NPCs and map pins."] =
        "Raha, kokemus ja esineet otettavissa olevan tehtävän alla, NPC:issä ja karttamerkeissä.",
    ["Show NPC titles"] = "Näytä NPC:iden tittelit",
    ["The title under an NPC's name on map pins, such as <Innkeeper>."] =
        "Titteli NPC:n nimen alla karttamerkeissä, esimerkiksi <Innkeeper>.",
    ["Quest text in the quest browser"] = "Tehtävän teksti tehtäväselaimessa",
    ["What the quest giver says, under the objectives, as the PandaQuest portal read it off Wowhead."] =
        "Mitä tehtävänantaja sanoo, tavoitteiden alla, niin kuin PandaQuest-portaali sen Wowheadista luki.",
    ["Reward items and money in the quest browser"] = "Palkintoesineet ja raha tehtäväselaimessa",
    ["What a quest gives besides experience, as the PandaQuest portal read it off Wowhead."] =
        "Mitä tehtävästä saa kokemuksen lisäksi, niin kuin PandaQuest-portaali sen Wowheadista luki.",
    ["Tracker"] = "Seuranta",
    ["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] =
        "PandaQuest ei korvaa Blizzardin tehtäväseurantaa, vaan täydentää sitä.",
    ["Enhance the Blizzard tracker"] = "Täydennä Blizzardin seurantaa",
    ["Show distance on tracked quests"] = "Näytä etäisyys seuratuissa tehtävissä",
    ["Notifications"] = "Ilmoitukset",
    ["Show notifications"] = "Näytä ilmoitukset",
    ["A short message in the middle of the screen."] = "Lyhyt viesti ruudun keskellä.",
    ["Quest complete and turned in"] = "Tehtävä valmis ja palautettu",
    ["Next objective"] = "Seuraava tavoite",
    ["Play a sound"] = "Toista ääni",
    ["Preview"] = "Esikatselu",
    ["PandaQuest is ready."] = "PandaQuest on valmis.",
    ["Synchronisation (optional)"] = "Synkronointi (valinnainen)",
    ["Optional. PandaQuest works fully without it, and never uploads anything itself."] =
        "Valinnainen. PandaQuest toimii täysin ilman sitä, eikä lähetä itse mitään.",
    ["Record quest data"] = "Tallenna tehtävätietoja",
    ["Record movement breadcrumbs"] = "Tallenna liikkumisen välipisteitä",
    ["Occasional position samples that improve community routes."] =
        "Satunnaisia sijaintinäytteitä, jotka parantavat yhteisön reittejä.",
    ["Breadcrumb interval (seconds)"] = "Välipisteiden väli (sekuntia)",
    ["Sessions to keep"] = "Säilytettävät istunnot",
    ["Events per session"] = "Tapahtumia istuntoa kohden",
    ["Advanced"] = "Lisäasetukset",
    ["Log level"] = "Lokitaso",
    ["How much PandaQuest prints to chat."] = "Kuinka paljon PandaQuest tulostaa chattiin.",
    ["Errors"] = "Virheet",
    ["Warnings"] = "Varoitukset",
    ["Info"] = "Tiedot",
    ["Debug"] = "Vianetsintä",
    ["Trace"] = "Jäljitys",
    ["Arrow debug output"] = "Nuolen vianetsintätuloste",
    ["Prints the bearing values used by the arrow."] = "Tulostaa nuolen käyttämät suunta-arvot.",
    ["Redraw map pins"] = "Piirrä karttamerkit uudelleen",
    ["Print status to chat"] = "Tulosta tila chattiin",
    ["Profiles"] = "Profiilit",
    ["Options are not available; use /pq help for chat commands."] =
        "Asetukset eivät ole käytettävissä; käytä /pq help -komentoja.",

    -- UI (minimap button, tracker, notifications, Wowhead)
    ["Distance unknown"] = "Etäisyys tuntematon",
    ["Left-click: browse all quests"] = "Vasen klikkaus: selaa kaikkia tehtäviä",
    ["Right-click: open options"] = "Oikea klikkaus: avaa asetukset",
    ["Press Ctrl+C to copy the link:"] = "Kopioi linkki painamalla Ctrl+C:",
    ["Navigate to this quest"] = "Navigoi tähän tehtävään",
    ["the quest giver"] = "tehtävänantaja",
    ["unknown distance"] = "tuntematon etäisyys",
    ["%s complete"] = "%s valmis",
    ["Turned in: %s"] = "Palautettu: %s",

    -- Sync (telemetry, community data)
    ["Telemetry: %s"] = "Telemetria: %s",
    ["Events recorded this session: %d (%d dropped)"] = "Tapahtumia tässä istunnossa: %d (%d hylätty)",
    ["Sessions stored: %d, waiting for upload: %d"] = "Istuntoja tallessa: %d, lähetystä odottaa: %d",
    ["Last upload confirmed: %s"] = "Viimeisin vahvistettu lähetys: %s",
    ["never"] = "ei koskaan",
    ["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] =
        "Mitään ei tallenneta, kun telemetria on pois päältä. Voit kytkeä sen takaisin /pq-asetuksista.",
    ["No community data yet."] = "Yhteisödataa ei ole vielä.",
    ["Community data from %s"] = "Yhteisödata päivältä %s",
    ["Last gear snapshot: %s"] = "Viimeisin varustetilanne: %s",
    ["Gear snapshots: off."] = "Varustetilanteen tallennus: pois päältä.",

    -- Sync / Consent
    ["/pq consent - ask the data sharing question again"] = "/pq consent - kysy tiedonjakokysymys uudelleen",
    ["PandaQuest can send what you do while questing to the community hub."] =
        "PandaQuest voi lähettää yhteisöpalvelimelle sen, mitä teet tehtäviä suorittaessasi.",
    ["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] =
        "Eli tehtävät jotka otat ja palautat, mitä tapat ja lootaat, missä kuolet, sekä karttasijaintisi kellonaikoineen.",
    ["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] =
        "Niistä rakennetaan yhteiset tehtäväreitit. Keruu on pois päältä kunnes sallit sen, ja voit lopettaa ja poistaa milloin vain.",
    ["PandaQuest can share your quest data to build the community routes."] =
        "PandaQuest voi jakaa tehtävädatasi yhteisöreittien rakentamiseen.",
    ["It is off. Turn it on in /pq options if you want to take part."] =
        "Keruu on pois päältä. Laita se päälle asetuksista (/pq), jos haluat osallistua.",
    ["Share my quest data"] = "Jaa tehtävädatani",
    ["No thanks"] = "Ei kiitos",
    ["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] =
        "Kiitos. PandaQuest jakaa tehtävädatasi. Voit ottaa sen pois päältä milloin tahansa komennolla /pq sync.",
    ["Nothing will be collected. Turn it on any time in /pq options."] =
        "Mitään ei kerätä. Voit ottaa keruun käyttöön milloin tahansa asetuksista (/pq).",

    -- Skannaus
    ["No scan is running."] = "Skannausta ei ole käynnissä.",

    -- Ammattireseptit
    ["/pq scan professions - read the open profession window"] =
        "/pq scan professions - lue auki oleva ammatti-ikkuna",
    ["/pq scan archaeology - read your archaeology window"] =
        "/pq scan archaeology - lue arkeologia-ikkunasi",
    ["/pq digsite - show the dig site bar so you can move it"] =
        "/pq digsite - näytä kaivauspalkki, jotta voit siirtää sen",
    ["A profession scan is already running."] = "Ammattiskannaus on jo käynnissä.",
    ["Open a profession window first, then type /pq scan professions."] =
        "Avaa ensin ammatti-ikkuna ja kirjoita sitten /pq scan professions.",
    ["This client does not offer the recipe list PandaQuest reads."] =
        "Tämä peliversio ei tarjoa reseptilistaa, jota PandaQuest osaisi lukea.",
    ["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] =
        "Tuo ikkuna on toisen pelaajan reseptikirja, avattu linkistä. PandaQuest ei tallenna sitä.",
    ["This profession window lists no recipes."] = "Tässä ammatti-ikkunassa ei ole yhtään reseptiä.",
    ["The profession list has not arrived from the server yet. Try again in a moment."] =
        "Reseptilista ei ole vielä saapunut palvelimelta. Yritä hetken kuluttua uudelleen.",
    ["Nothing was saved: not one recipe in this window could be read whole."] =
        "Mitään ei tallennettu: yhtäkään tämän ikkunan reseptiä ei saatu luettua kokonaan.",
    ["The profession window changed while it was being read. Nothing was saved."] =
        "Ammatti-ikkuna vaihtui kesken lukemisen. Mitään ei tallennettu.",
    ["The window was read short, so the recipe book you already have was kept."] =
        "Ikkuna jäi vajaaksi, joten jo tallennettu reseptikirja säilytettiin.",
    ["Profession scan cancelled: the window was closed."] =
        "Ammattiskannaus keskeytettiin: ikkuna suljettiin.",
    ["Profession scan stopped. Nothing was saved."] = "Ammattiskannaus pysäytettiin. Mitään ei tallennettu.",
    ["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."] =
        "PandaQuest ei koske ammatti-ikkunaasi: se ei saa palautettua kohtaa %s sellaiseksi kuin jätit sen.",
    ["PandaQuest could not put your profession window back exactly as you left it."] =
        "PandaQuest ei saanut palautettua ammatti-ikkunaa täsmälleen sellaiseksi kuin jätit sen.",
    ["Profession scan finished: %s %d/%d, %d recipes in %s."] =
        "Ammattiskannaus valmis: %s %d/%d, %d reseptiä, kesto %s.",
    ["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."] =
        "%d reseptiä jäi pois, koska peli ei ollut vielä ladannut niitä loppuun. Avaa ikkuna uudelleen, niin ne luetaan loppuun.",
    ["The scan stopped at %d recipes to keep the saved file small."] =
        "Skannaus pysähtyi %d reseptiin, jotta tallennustiedosto pysyy pienenä.",
    ["Last scan of %s (%d/%d): %d recipes, %s ago."] =
        "Viimeisin skannaus: %s (%d/%d), %d reseptiä, %s sitten.",
    ["No profession has been scanned on this character yet."] =
        "Tällä hahmolla ei ole vielä skannattu yhtään ammattia.",
    ["Professions"] = "Ammatit",
    ["PandaQuest reads an open profession window once and puts your filters and collapsed categories back."] =
        "PandaQuest lukee auki olevan ammatti-ikkunan kerran ja palauttaa suodattimet ja suljetut ryhmät ennalleen.",
    ["Read my recipes when I open a profession"] = "Lue reseptini kun avaan ammatin",
    ["The recipes, their reagents and how hard each is for this character. Never a book opened from a link."] =
        "Reseptit, ainesosat ja kunkin vaikeus tälle hahmolle. Ei koskaan kirjaa, joka avattiin linkistä.",

    -- Flight master
    ["Flight time:"] = "Lentoaika:",
    ["~%s (%d flight)"] = "~%s (%d lento)",
    ["~%s (%d flights)"] = "~%s (%d lentoa)",
    ["~%s left (%d flights)"] = "~%s jäljellä (%d lentoa)",
    ["%s in the air"] = "%s ilmassa",
    ["Flight progress"] = "Lennon eteneminen",
    ["The flight bar is switched off in /pq options."] = "Lentopalkki on pois päältä: /pq options.",
    ["The flight bar is locked. Unlock it in /pq options to move it."] =
        "Lentopalkki on lukittu. Avaa lukitus /pq options -asetuksista siirtääksesi sitä.",
    ["Drag the flight bar where you want it. It hides itself again in a moment."] =
        "Vedä lentopalkki haluamaasi kohtaan. Se piiloutuu hetken kuluttua.",
    ["/pq flight - show the flight bar so you can drag it"] = "/pq flight - näytä lentopalkki siirtämistä varten",
    ["Flight master"] = "Lentomestari",
    ["PandaQuest times your own flights and shows what it measured. A route you have never flown shows nothing at all."] =
        "PandaQuest kellottaa omat lentosi ja näyttää mitä se mittasi. Reitistä, jota et ole lentänyt, ei näy mitään.",
    ["Show the flight time at the flight master"] = "Näytä lentoaika lentomestarilla",
    ["One line in the destination's tooltip, with how many of your own flights it rests on."] =
        "Yksi rivi kohteen tooltipissä, ja monenko oman lentosi varassa se on.",
    ["Show the progress bar while flying"] = "Näytä edistymispalkki lennon aikana",
    ["Progress and remaining time once the route has been flown twice; before that, only the time in the air."] =
        "Eteneminen ja jäljellä oleva aika, kun reitti on lennetty kahdesti; sitä ennen vain ilmassa kulunut aika.",
    -- Arkeologia
    ["This client does not offer the archaeology data PandaQuest reads."] =
        "Tämä asiakas ei tarjoa arkeologiatietoja, joita PandaQuest lukee.",
    ["This character has no archaeology races to read yet."] =
        "Tällä hahmolla ei ole vielä yhtään arkeologiakansaa luettavaksi.",
    ["Your artifact history has not arrived yet, so the archaeology PandaQuest already had was kept."] =
        "Esinehistoriasi ei ole vielä saapunut, joten aiempi arkeologialukema säilytettiin.",
    ["No archaeology has been read on this character yet."] =
        "Tällä hahmolla ei ole vielä luettu arkeologiaa.",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] =
        "Arkeologia %d/%d: %d kansaa, %d esinettä, luettu %s sitten.",
    ["Archaeology %d: %d races, %d artifacts, read %s ago."] =
        "Arkeologia %d: %d kansaa, %d esinettä, luettu %s sitten.",
    ["Archaeology: %d races, %d artifacts, read %s ago."] =
        "Arkeologia: %d kansaa, %d esinettä, luettu %s sitten.",
    ["Archaeology read: %d races, %d artifacts."] =
        "Arkeologia luettu: %d kansaa, %d esinettä.",
    ["The server has not sent your artifact history, so completion counts were left out."] =
        "Palvelin ei ole lähettänyt esinehistoriaasi, joten valmistumislukuja ei kirjattu.",
    ["Archaeology"] = "Arkeologia",
    ["Mists never shipped a dig site progress bar. PandaQuest draws one from the events the game already sends."] =
        "Mistsissä ei ole kaivauspaikan edistymispalkkia. PandaQuest piirtää sen tapahtumista, joita peli jo lähettää.",
    ["Read my archaeology when I open the window"] = "Lue arkeologiani kun avaan ikkunan",
    ["Your races, their keystone, your fragments and the artifacts you have. Only this character's own."] =
        "Kansasi, niiden avainkivi, sirpaleesi ja esineesi. Vain tämän hahmon omat.",
    ["Dig site progress bar"] = "Kaivauspaikan edistymispalkki",
    ["Show the dig site progress bar"] = "Näytä kaivauspaikan edistymispalkki",
    ["Appears when you survey and hides when you leave the dig site."] =
        "Tulee näkyviin kun kartoitat ja piiloutuu kun poistut kaivauspaikalta.",
    ["Lock the bar in place"] = "Lukitse palkki paikalleen",
    ["Unlocked, it can be dragged with the left mouse button."] =
        "Lukitsemattomana sitä voi raahata hiiren vasemmalla painikkeella.",
    ["Bar size"] = "Palkin koko",
    ["Show me where it is"] = "Näytä missä se on",
    ["Puts an empty bar on screen for a moment so you can find it, and drag it when it is unlocked."] =
        "Näyttää tyhjän palkin hetkeksi, jotta löydät sen ja voit raahata sen paikalleen, kun se ei ole lukittu.",
    ["Reset bar position"] = "Palauta palkin sijainti",
    ["Dig site progress"] = "Kaivauspaikan edistyminen",
    ["Dig site complete"] = "Kaivauspaikka valmis",
    ["This client draws its own dig site progress bar."] =
        "Tämä asiakas piirtää oman kaivauspaikan edistymispalkkinsa.",
    ["The dig site bar is switched off in /pq options."] =
        "Kaivauspalkki on kytketty pois päältä asetuksissa (/pq).",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "Raahaa kaivauspalkki haluamaasi kohtaan. Se piiloutuu itsestään hetken kuluttua.",
    ["The dig site bar is locked. Unlock it in /pq options to move it."] =
        "Kaivauspalkki on lukittu. Avaa lukitus asetuksissa (/pq), jos haluat siirtää sitä.",

    -- Database/QuestieDB (valinnainen QuestieDB-lisäosa)
    ["Quest database source"] = "Tehtävätietokannan lähde",
    ["Uses the QuestieDB addon, if it is installed and enabled, to complete PandaQuest's own database. Takes effect after /reload."] =
        "Täydentää PandaQuestin omaa tietokantaa QuestieDB-lisäosalla, jos se on asennettu ja käytössä. Tulee voimaan /reload-komennon jälkeen.",
    ["PandaQuest only"] = "Vain PandaQuest",
    ["Fill gaps from QuestieDB"] = "Täytä aukot QuestieDB:stä",
    ["QuestieDB values first"] = "QuestieDB:n arvot ensin",
    ["QuestieDB: %s"] = "QuestieDB: %s",
    ["QuestieDB: %s (%d entries added, %d refreshed)"] = "QuestieDB: %s (%d lisätty, %d päivitetty)",
    ["not used (off)"] = "ei käytössä (pois)",
    ["not installed"] = "ei asennettu",
    ["cannot be used (%s)"] = "ei käytettävissä (%s)",
    ["not read yet"] = "ei vielä luettu",
    -- Quest browser (UI/QuestBrowser.lua)
    ["/pq quests [questID] - browse every quest in the database"] = "/pq quests [tehtäväID] - selaa kaikkia tietokannan tehtäviä",
    ["Name"] = "Nimi",
    ["Level"] = "Taso",
    ["to"] = "–",
    ["My level"] = "Minun tasoni",
    ["My side"] = "Minun puoleni",
    ["Alliance"] = "Allianssi",
    ["Horde"] = "Horde",
    ["Both"] = "Molemmat",
    ["both factions"] = "molemmat puolet",
    ["Dungeon"] = "Luola",
    ["Raid"] = "Raidi",
    ["Group"] = "Ryhmä",
    ["PvP"] = "PvP",
    ["Daily"] = "Päivittäinen",
    ["Event"] = "Tapahtuma",
    ["Reset"] = "Nollaa",
    ["All quests"] = "Kaikki tehtävät",
    ["%d quests"] = "%d tehtävää",
    ["No quest matches these filters."] = "Mikään tehtävä ei vastaa näitä suodattimia.",
    ["Reading the quest database..."] = "Luetaan tehtävätietokantaa...",
    ["Quest"] = "Tehtävä",
    ["Zone"] = "Alue",
    ["Req."] = "Vaad.",
    ["XP"] = "XP",
    ["A level %d quest for %s, from level %d."] = "Tason %d tehtävä (%s), alkaen tasosta %d.",
    ["%d experience"] = "%d kokemusta",
    ["Not in the database."] = "Ei tietokannassa.",
    ["requires level"] = "vaatii tason",
    ["Yes"] = "Kyllä",
    ["No"] = "Ei",
    ["No location is known for this quest."] = "Tämän tehtävän sijaintia ei tiedetä.",
    ["Navigating to: %s"] = "Navigoidaan: %s",
    ["Start"] = "Alku",
    ["End"] = "Loppu",
    ["Difficulty"] = "Vaikeus",
    ["Side"] = "Puoli",
    ["Shareable"] = "Jaettava",
    ["Quest ID"] = "Tehtävä-ID",
    ["Rewards"] = "Palkinnot",
    ["You will receive:"] = "Saat:",
    ["Choose one of:"] = "Valitse yksi:",
    ["one of %d items"] = "yksi %d esineestä",
    ["Item %d"] = "Esine %d",
    ["%d XP"] = "%d XP",
    ["Reward: %s"] = "Palkinto: %s",
    ["Navigate"] = "Navigoi",
    ["Pick a quest from the list to see its page."] = "Valitse tehtävä listasta nähdäksesi sen sivun.",
    ["Categories"] = "Luokat",
    ["Loosen a filter, or press Reset."] = "Löysennä suodatinta tai paina Nollaa.",
    ["Quests"] = "Tehtävät",
    ["Shift-click: toggle the arrow"] = "Vaihto+klikkaus: nuoli päälle/pois",
    ["This is a beta build: new features are not yet confirmed in the game."] =
        "Tämä on beta-versio: uusia ominaisuuksia ei ole vielä vahvistettu pelissä.",
    -- Motion (UI/Motion.lua)
    ["Animations"] = "Animaatiot",
    ["Windows fade and settle, messages slide in, bars glide. Switch it off for a calmer interface."] =
        "Ikkunat häivytetään ja asetetaan paikoilleen, viestit liukuvat sisään ja palkit liikkuvat pehmeästi. Kytke pois, jos haluat rauhallisen.",
    ["Turn all interface motion on or off."] = "Kytke kaikki käyttöliittymän liike päälle tai pois.",
    ["Animation speed"] = "Animaation nopeus",
    ["1 is normal; 2 is twice as fast, 0.5 half as fast."] =
        "1 on normaali; 2 on kaksi kertaa nopeampi, 0,5 puolet hitaampi.",
    -- Options: language, tools
    ["Open the quest browser"] =
        "Avaa tehtäväselain",
    ["Browse every quest in the database, with a page and a map for each."] =
        "Selaa kaikkia tietokannan tehtäviä: jokaiselle oma sivu ja kartta.",
    ["Choose the language of PandaQuest's texts. Automatic follows the game's language."] =
        "Valitse PandaQuestin tekstien kieli. Automaattinen seuraa pelin kieltä.",
    ["Automatic (game language)"] =
        "Automaattinen (pelin kieli)",
    ["Reload the interface"] =
        "Lataa käyttöliittymä uudelleen",
    ["Reloads the game's interface so a changed language applies everywhere."] =
        "Lataa pelin käyttöliittymän uudelleen, jotta kielen vaihto tulee voimaan kaikkialla.",
    ["Tools"] =
        "Työkalut",
    ["Everything the chat commands do, as buttons. Nothing here needs a command."] =
        "Kaikki, mitä chat-komennot tekevät, painikkeina. Mikään tässä ei vaadi komentoa.",
    ["Skip the current target"] =
        "Ohita nykyinen kohde",
    ["Moves the arrow on to the next target."] =
        "Siirtää nuolen seuraavaan kohteeseen.",
    ["Stop following the pinned quest"] =
        "Lopeta kiinnitetyn tehtävän seuraaminen",
    ["Clears the quest pinned with the focus setting or the map's right-click menu."] =
        "Poistaa tehtävän, joka on kiinnitetty kohdeasetuksella tai kartan oikean klikkauksen valikolla.",
    ["Reset arrow position and map pins"] =
        "Nollaa nuolen sijainti ja karttapinnit",
    ["Link to the current target's page"] =
        "Linkki nykyisen kohteen sivulle",
    ["%d quests are hidden from the navigator."] =
        "%d tehtävää on piilotettu navigaattorista.",
    ["Show all hidden quests again"] =
        "Näytä kaikki piilotetut tehtävät uudelleen",
    ["Reading windows"] =
        "Ikkunoiden lukeminen",
    ["Read my professions now"] =
        "Lue ammattini nyt",
    ["Open the profession window first."] =
        "Avaa ensin ammatti-ikkuna.",
    ["Read my archaeology now"] =
        "Lue arkeologiani nyt",
    ["Open the archaeology window first."] =
        "Avaa ensin arkeologia-ikkuna.",
    ["Show synchronisation status"] =
        "Näytä synkronoinnin tila",
    ["Ask the data sharing question"] =
        "Kysy tiedonjakokysymys",
    -- Minimap button and broker text (UI/MinimapButton.lua)
    ["%d tracked quest"] =
        "%d seurattu tehtävä",
    ["%d tracked quests"] =
        "%d seurattua tehtävää",
    ["Flying to %s"] =
        "Lento: %s",
    ["Flying"] =
        "Lennolla",
    ["Last sync with the PandaQuest site: %s"] =
        "Viimeisin synkronointi PandaQuest-sivuston kanssa: %s",
    ["Lock the minimap button"] =
        "Lukitse minikartan painike",
    ["A locked button cannot be dragged around the minimap."] =
        "Lukittua painiketta ei voi raahata minikartan reunalla.",
    ["Show in the add-on compartment"] =
        "Näytä lisäosalokerossa",
    ["Adds PandaQuest to the add-on list under the minimap."] =
        "Lisää PandaQuestin minikartan alla olevaan lisäosaluetteloon.",

    -- The quest browser: scaling quests, reputation, the portal link (UI/QuestBrowser.lua)
    ["Scales"] =
        "Skaalautuu",
    ["A quest that scales with your level, for %s, from level %d."] =
        "Tasosi mukaan skaalautuva tehtävä, %s, tasolta %d alkaen.",
    ["faction %d"] =
        "maine %d",
    ["PandaQuest link"] =
        "PandaQuest-linkki",

    -- Modules (Core/Const.lua, Core/Init.lua, UI/Options.lua)
    ["/pq config [section] [option] [value] - change any setting from chat"] =
        "/pq config [osio] [asetus] [arvo] - muuta mitä tahansa asetusta chatista",
    ["That part of PandaQuest is switched off in the options, under Modules."] =
        "Se PandaQuestin osa on kytketty pois asetuksista, kohdasta Moduulit.",
    ["Modules"] = "Moduulit",
    ["Switch a part of PandaQuest off completely: it stops listening to the game and shows nothing. The parts not listed here always run."] =
        "Kytke PandaQuestin osa kokonaan pois: se lakkaa kuuntelemasta peliä eikä näytä mitään. Muut osat ovat aina käynnissä.",
    ["Navigation arrow"] = "Navigointinuoli",
    ["The arrow that points to your next quest objective."] = "Nuoli, joka osoittaa seuraavaan tehtäväkohteeseesi.",
    ["Map and minimap pins"] = "Kartan ja minikartan merkit",
    ["Quest pins and gathering nodes on the world map and the minimap."] =
        "Tehtävämerkit ja keräyspaikat maailmankartalla ja minikartalla.",
    ["Quest info in tooltips"] = "Tehtävätiedot vihjeruuduissa",
    ["Which quests an NPC or an item belongs to, on its tooltip."] =
        "Mihin tehtäviin NPC tai esine liittyy, sen vihjeruudussa.",
    ["Respawn timers"] = "Uudelleensyntymisajastimet",
    ["Times how long mobs and nodes take to come back, and fades them until they do."] =
        "Mittaa, kauanko olennoilla ja keräyspaikoilla kestää palata, ja himmentää ne siihen asti.",
    ["Gathering nodes"] = "Keräyspaikat",
    ["Ore, herbs, fishing pools, chests and rare spawns on the maps."] =
        "Malmit, yrtit, kalaparvet, arkut ja harvinaiset olennot kartoilla.",
    ["Quest tracker additions"] = "Tehtäväseurannan lisäykset",
    ["Distances and target buttons in the Blizzard quest tracker."] =
        "Etäisyydet ja kohdepainikkeet Blizzardin tehtäväseurannassa.",
    ["The short messages in the middle of the screen."] = "Lyhyet viestit keskellä ruutua.",
    ["The archaeology bar that fills while you survey a dig site."] =
        "Arkeologiapalkki, joka täyttyy, kun tutkit kaivauspaikkaa.",
    ["Recipe reader"] = "Reseptien lukija",
    ["Reads your recipes when you open a profession window."] = "Lukee reseptisi, kun avaat ammatti-ikkunan.",
    ["Archaeology reader"] = "Arkeologian lukija",
    ["Reads your archaeology races and artifacts when you open the archaeology window."] =
        "Lukee arkeologian kansasi ja esineesi, kun avaat arkeologiaikkunan.",
    ["Quest data recording"] = "Tehtävätietojen tallennus",
    ["Records quest data for the community routes, once you have agreed to share it."] =
        "Tallentaa tehtävätietoja yhteisön reitteihin, kun olet suostunut jakamaan ne.",
    ["Gear recording"] = "Varusteiden tallennus",
    ["Records your gear for the PandaQuest portal, together with the quest data."] =
        "Tallentaa varusteesi PandaQuest-portaalia varten tehtävätietojen kanssa.",
    -- /pq opens the quest browser (Core/Init.lua)
    ["/pq opens PandaQuest; everything else is in its Settings."] =
        "/pq avaa PandaQuestin; kaikki muu on sen asetuksissa.",
    ["/pq options - open the settings"] =
        "/pq options - avaa asetukset",
    ["/pq help all - every command"] =
        "/pq help all - kaikki komennot",
    -- The quest browser: the Settings button and what can be done with one quest (UI/QuestBrowser.lua)
    ["Show in the navigator"] =
        "Näytä navigaattorissa",
    ["Hide from the navigator"] =
        "Piilota navigaattorista",
    ["The arrow and the map pins follow this quest."] =
        "Nuoli ja karttamerkit seuraavat tätä tehtävää.",
    ["A hidden quest is left out of the arrow's route and the map pins. Settings > Hidden quests lists them."] =
        "Piilotettu tehtävä jätetään pois nuolen reitiltä ja karttamerkeistä. Asetukset > Piilotetut tehtävät listaa ne.",
    ["Opens the world map where this quest starts."] =
        "Avaa maailmankartan siihen kohtaan, josta tehtävä alkaa.",
    ["The quest's page on the PandaQuest portal, to copy into your browser."] =
        "Tehtävän sivu PandaQuest-portaalissa, kopioitavaksi selaimeen.",
    ["Settings"] =
        "Asetukset",
    ["Every PandaQuest setting: modules, arrow, map, tooltips, sync and privacy, language and more."] =
        "Kaikki PandaQuestin asetukset: moduulit, nuoli, kartta, vihjeruudut, synkronointi ja yksityisyys, kieli ja muuta.",
    -- Options: what used to be a chat command only (UI/Options.lua)
    ["The arrow, the flight bar and the dig site bar are back where they started."] =
        "Nuoli, lentopalkki ja kaivauspaikan palkki ovat taas alkuperäisillä paikoillaan.",
    ["No quest is hidden from the navigator."] =
        "Yhtään tehtävää ei ole piilotettu navigaattorista.",
    ["Modules switched on: %d of %d"] =
        "Moduuleja päällä: %d / %d",
    ["Every chat command still works, for macros. None of them is needed: everything is in these settings."] =
        "Kaikki chat-komennot toimivat yhä makroja varten. Mitään niistä ei tarvita: kaikki löytyy näistä asetuksista.",
    ["Synchronisation and privacy"] =
        "Synkronointi ja yksityisyys",
    ["Recorded when on: quests accepted and finished, objective progress, where on the map, your level, your guild name and rank, and how long it took."] =
        "Tallennetaan, kun päällä: hyväksytyt ja suoritetut tehtävät, tavoitteiden edistyminen, sijainti kartalla, tasosi, kiltasi nimi ja arvo sekä kesto.",
    ["Per character. Never chat, never other players' names. It stays on your computer unless you upload it with the PandaQuest app."] =
        "Hahmokohtaisesti. Ei koskaan chattia eikä muiden pelaajien nimiä. Tiedot pysyvät koneellasi, ellet lähetä niitä PandaQuest-sovelluksella.",
    ["Moving frames"] =
        "Ikkunoiden siirtäminen",
    ["The arrow, the flight bar and the dig site bar can be dragged where you want them while they are unlocked."] =
        "Nuolta, lentopalkkia ja kaivauspaikan palkkia voi raahata haluamaasi paikkaan, kun ne on vapautettu.",
    ["Unlock frames to move them"] =
        "Vapauta ikkunat siirtämistä varten",
    ["Unlocks the arrow, the flight bar and the dig site bar, and shows the two bars for a moment so you can find them."] =
        "Vapauttaa nuolen, lentopalkin ja kaivauspaikan palkin ja näyttää palkit hetken, jotta löydät ne.",
    ["Reset positions"] =
        "Palauta sijainnit",
    ["Puts the arrow, the flight bar and the dig site bar back where they started."] =
        "Siirtää nuolen, lentopalkin ja kaivauspaikan palkin takaisin alkuperäisille paikoilleen.",
    ["Hidden quests"] =
        "Piilotetut tehtävät",
    ["Hidden quest"] =
        "Piilotettu tehtävä",
    ["A hidden quest is left out of the arrow's route and the map pins."] =
        "Piilotettu tehtävä jätetään pois nuolen reitiltä ja karttamerkeistä.",
    ["Show this quest again"] =
        "Näytä tämä tehtävä taas",
    ["Status"] =
        "Tila",
    ["Refresh"] =
        "Päivitä",
    ["Database entry"] =
        "Tietokantamerkintä",
    ["Kind"] =
        "Laji",
    ["ID"] =
        "ID",
    ["Print the entry to chat"] =
        "Tulosta merkintä chattiin",
    ["Chat commands"] =
        "Chat-komennot",
    -- The main window (UI/MainWindow.lua)
    ["Options"] =
        "Asetukset",
    ["About & Help"] =
        "Tietoja ja ohjeet",
    ["Performance"] =
        "Suorituskyky",
    ["Search: %s"] =
        "Haku: %s",
    ["No setting matches."] =
        "Mikään asetus ei vastaa hakua.",
    ["Search all settings"] =
        "Hae kaikista asetuksista",
    ["Reset Settings"] =
        "Palauta asetukset",
    ["%s: %d settings back to their defaults."] =
        "%s: %d asetusta palautettu oletuksiin.",
    ["Reset every setting in %s to its default?"] =
        "Palautetaanko kaikki kohdan %s asetukset oletuksiin?",
    -- The main window's pages and categories (UI/Options.lua)
    ["Last upload the portal confirmed: %s"] =
        "Viimeisin portaalin vahvistama lähetys: %s",
    ["No upload confirmed by the portal yet."] =
        "Portaali ei ole vielä vahvistanut yhtään lähetystä.",
    ["Sessions waiting to be uploaded: %d"] =
        "Lähetystä odottavia istuntoja: %d",
    ["Database: %s, built %s"] =
        "Tietokanta: %s, koottu %s",
    ["%d quests, %d NPCs, %d objects, %d items"] =
        "%d tehtävää, %d NPC:tä, %d objektia, %d esinettä",
    ["This client does not report addon memory."] =
        "Tämä pelin versio ei kerro lisäosien muistinkäyttöä.",
    ["Memory: %.1f MB"] =
        "Muisti: %.1f Mt",
    ["%s: %s - %d events, %d messages, %d timers, %d buckets"] =
        "%s: %s - %d tapahtumaa, %d viestiä, %d ajastinta, %d kokoajaa",
    ["on"] =
        "päällä",
    ["off"] =
        "pois",
    ["Modules running: %d of %d"] =
        "Käynnissä olevia moduuleja: %d / %d",
    ["What changed in the recent versions. The whole list is changelog.txt in the addon's folder."] =
        "Mitä viimeisimmissä versioissa muuttui. Koko luettelo on lisäosan kansion tiedostossa changelog.txt.",
    ["Map & Minimap"] =
        "Kartta ja minikartta",
    ["Flight"] =
        "Lennot",
    ["Professions & Gathering"] =
        "Ammatit ja keräily",
    ["Sync & Privacy"] =
        "Synkronointi ja yksityisyys",
    ["Language & Units"] =
        "Kieli ja yksiköt",
    ["Release notes"] =
        "Julkaisutiedot",
    ["Other"] =
        "Muut",
    ["Synchronisation"] =
        "Synkronointi",
    ["Database"] =
        "Tietokanta",
    ["PandaQuest is a quest helper and navigator for Mists of Pandaria Classic."] =
        "PandaQuest on tehtäväapuri ja navigaattori Mists of Pandaria Classiciin.",
    ["An arrow to your next objective, quest pins on the map and minimap, gathering nodes with respawn timers."] =
        "Nuoli seuraavaan tavoitteeseen, tehtävämerkit kartalla ja minikartalla, keräyspaikat uudelleensyntymisajastimineen.",
    ["Flight times, archaeology and profession tools, and a page for every quest."] =
        "Lentoajat, arkeologia- ja ammattityökalut sekä sivu jokaiselle tehtävälle.",
    ["Type /pq to open this window. Quests lists every quest in the database; Options holds every setting."] =
        "Kirjoita /pq avataksesi tämän ikkunan. Tehtävät listaa kaikki tietokannan tehtävät; Asetuksissa on jokainen asetus.",
    ["Everything works without any of them."] =
        "Kaikki toimii ilman niitäkin.",
    ["The PandaQuest portal"] =
        "PandaQuest-portaali",
    ["Quest pages, routes, the community data and the bug tracker are at https://pd.zroot.it"] =
        "Tehtäväsivut, reitit, yhteisön tiedot ja vikailmoitukset löytyvät osoitteesta https://pd.zroot.it",
    ["Copy the portal's address"] =
        "Kopioi portaalin osoite",
    ["Credits and licences"] =
        "Tekijät ja lisenssit",
    ["PandaQuest is free software under the GNU General Public License v3."] =
        "PandaQuest on vapaa ohjelma GNU General Public License v3 -lisenssillä.",
    ["The quest database is built from Questie's Mists of Pandaria data (GPLv3)."] =
        "Tehtävätietokanta on koottu Questien Mists of Pandaria -tiedoista (GPLv3).",
    ["Embedded libraries keep their own licences: Ace3, LibStub, CallbackHandler, LibDataBroker, LibDBIcon, HereBeDragons."] =
        "Mukana olevilla kirjastoilla on omat lisenssinsä: Ace3, LibStub, CallbackHandler, LibDataBroker, LibDBIcon, HereBeDragons.",
    ["Inspired by Questie, pfQuest and TomTom; no code of theirs is copied."] =
        "Innoittajina Questie, pfQuest ja TomTom; niiden koodia ei ole kopioitu.",
    ["Commands"] =
        "Komennot",
    ["Show the chat commands"] =
        "Näytä chat-komennot",
    ["Every chat command still works, for macros. None of them is needed."] =
        "Kaikki chat-komennot toimivat yhä makroja varten. Mitään niistä ei tarvita.",
    ["What PandaQuest costs right now. Nothing here measures CPU: that would need the game's script profiling."] =
        "Mitä PandaQuest kuluttaa juuri nyt. Suoritinaikaa ei mitata: se vaatisi pelin skriptiprofiloinnin.",
    ["Modules, events and timers"] =
        "Moduulit, tapahtumat ja ajastimet",
    ["Window"] =
        "Ikkuna",
    ["Window size"] =
        "Ikkunan koko",
    ["The size of the PandaQuest window, on top of the game's own UI scale."] =
        "PandaQuest-ikkunan koko pelin oman käyttöliittymän skaalauksen päälle.",
    ["Reset the window"] =
        "Palauta ikkuna",
    ["Puts the PandaQuest window back in the middle of the screen at its first size."] =
        "Palauttaa PandaQuest-ikkunan keskelle ruutua alkuperäiseen kokoonsa.",
    ["Times your own flights; until a route is flown twice, uses the portal's times (all players' or estimated)."] =
        "Ajastaa omat lentosi; kunnes olet lentänyt reitin kahdesti, käyttää portaalin aikoja (kaikkien tai arvio).",
    ["Progress, remaining time and arrival time. Marked estimated when nobody has measured the route."] =
        "Eteneminen, jäljellä oleva aika ja saapumisaika. Merkitty arvioksi, kun reittiä ei ole kukaan mitannut.",
    ["One line in the destination's tooltip: the expected flight time and what it rests on."] =
        "Yksi rivi kohteen vihjeessä: odotettu lentoaika ja mihin se perustuu.",
    ["%s left"] =
        "%s jäljellä",
    ["~%s left (estimated)"] =
        "~%s jäljellä (arvio)",
    ["Arrives at %s"] =
        "Perillä klo %s",
    ["(estimated)"] =
        "(arvio)",
    ["%s (%d flights, all players)"] =
        "%s (%d lentoa, kaikki pelaajat)",
    ["~%s (estimated)"] =
        "~%s (arvio)",
    ["Quest mobs"] =
        "Tehtävän viholliset",
    ["Marks the NPCs your unfinished quests need you to kill, on their nameplates and tooltips."] =
        "Merkitsee hahmot, jotka keskeneräisissä tehtävissäsi pitää tappaa, niiden nimikilpiin ja vihjeisiin.",
    ["Turn on enemy nameplates (V) to see the marks."] =
        "Laita vihollisten nimikilvet päälle (V), niin näet merkit.",
    ["Mark quest mobs"] =
        "Merkitse tehtävän viholliset",
    ["Icon"] =
        "Kuvake",
    ["Quest mark (!)"] =
        "Tehtävämerkki (!)",
    ["Crossed swords"] =
        "Ristikkäiset miekat",
    ["PandaQuest's kill pin"] =
        "PandaQuestin tappomerkki",
    ["Tint the health bar"] =
        "Väritä elämäpalkki",
    ["A gold wash over the nameplate's health bar, with Blizzard's own nameplates."] =
        "Kultainen sävy nimikilven elämäpalkin päälle, Blizzardin omissa nimikilvissä.",
    ["Show the quest on the tooltip"] =
        "Näytä tehtävä vihjeessä",
    ["Quest: %s (%d/%d)"] =
        "Tehtävä: %s (%d/%d)",
    ["Quest: %s"] =
        "Tehtävä: %s",
    ["Quest: %s (talk to)"] =
        "Tehtävä: %s (puhu)",
    ["Turn in: %s"] =
        "Palauta: %s",
    ["Quest available: %s"] =
        "Tehtävä tarjolla: %s",
    ["Mark NPCs to talk to"] =
        "Merkitse NPC:t, joille pitää puhua",
    ["Mark where quests are turned in (?)"] =
        "Merkitse, minne tehtävät palautetaan (?)",
    ["Mark quest givers with a quest for you (!)"] =
        "Merkitse tehtävänantajat, joilla on sinulle tehtävä (!)",
    ["Quest givers and turn-ins are friendly NPCs: their marks need friendly nameplates (Shift-V)."] =
        "Tehtävänantajat ja palautuspaikat ovat ystävällisiä NPC:itä: niiden merkit tarvitsevat ystävälliset nimikilvet (Shift-V).",

    -- A TOC the game read before an update (Core/Init.lua, CheckLoadedFiles)
    ["PandaQuest was updated while the game was running, and the game still uses the old file list: %s did not load. Quit World of Warcraft completely and start it again; /reload is not enough."] =
        "PandaQuest päivittyi pelin ollessa käynnissä, ja peli käyttää yhä vanhaa tiedostoluetteloa: %s ei latautunut. Sulje World of Warcraft kokonaan ja käynnistä se uudelleen; /reload ei riitä.",
    -- Where an item comes from (Map/Tooltips.lua) and quest chains (Quest/Catalog.lua, UI/QuestBrowser.lua)
    ["Show where items come from"] = "Näytä, mistä esineet saa",
    ["On item tooltips: the creatures that drop it, where it is found and who sells it."] = "Esineiden vihjeissä: mitkä olennot sitä pudottavat, mistä sen löytää ja kuka sitä myy.",
    ["Drops from: %s"] = "Pudottaa: %s",
    ["Found in: %s"] = "Löytyy: %s",
    ["Comes out of: %s"] = "Saa avaamalla: %s",
    ["Sold by: %s"] = "Myyjä: %s",
    ["%s and %d more"] = "%s ja %d muuta",
    ["Chain"] = "Ketju",
    ["Quest chain"] = "Tehtäväketju",
    ["Step %d of %d"] = "Vaihe %d/%d",
    ["%s, then: %s"] = "%s, seuraavaksi: %s",
    ["%s, the last one"] = "%s, viimeinen",
    ["%s (this quest)"] = "%s (tämä tehtävä)",
    ["Not part of a chain."] = "Ei kuulu ketjuun.",
    ["Click: the next step. Right-click: the step before."] = "Napsautus: seuraava vaihe. Oikea napsautus: edellinen vaihe.",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.fiFI = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "fiFI")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
