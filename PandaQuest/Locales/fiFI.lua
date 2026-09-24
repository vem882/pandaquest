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

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "Tietokanta valmis: %d tehtävää, %d NPC:tä, %d objektia, %d esinettä (%d ms).",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "PandaQuestin tietokantaa ei löytynyt. Asenna lisäosa uudelleen: Database/Data-tiedostot puuttuvat.",

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
    ["Wowhead link"] = "Wowhead-linkki",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "%d esiintymää täällä",
    ["Left-click: navigate here"] = "Vasen klikkaus: navigoi tänne",
    ["Right-click: more options"] = "Oikea klikkaus: lisää valintoja",
    ["Set as target"] = "Aseta kohteeksi",
    ["Hide quest: %s"] = "Piilota tehtävä: %s",
    ["Wowhead: %s"] = "Wowhead: %s",
    ["Starts: %s"] = "Aloittaa: %s",
    ["Turn in: %s"] = "Palauta: %s",
    ["Ends: %s"] = "Päättyy: %s",

    -- Map/NodeTooltip (docs/10 B3)
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
    ["Left-click the minimap button to toggle the arrow, right-click for these options."] =
        "Vasen klikkaus vaihtaa nuolen näkyvyyttä, oikea avaa nämä asetukset.",
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
    -- Map/Pins, Map/Icons (docs/10 B1-B2)
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

    -- Nodes/Professions (docs/10 D: ammattikohteet kartalla)
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
    ["Synchronisation"] = "Synkronointi",
    ["Questing data is stored in your SavedVariables and never uploaded on its own."] =
        "Tehtävätiedot tallennetaan SavedVariables-tiedostoon eikä niitä lähetetä itsestään.",
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
    ["Left-click: toggle the arrow"] = "Vasen klikkaus: nuoli päälle/pois",
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

    -- Sync / Consent (docs/07 B1: telemetria on pois päältä kunnes pelaaja sallii sen)
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

    -- Auction house (docs/08)
    ["Scan prices"] = "Skannaa hinnat",
    ["Stop scan (%d%%)"] = "Pysäytä skannaus (%d %%)",
    ["Scanning the auction house. Keep the window open; closing it cancels the scan."] =
        "Skannataan huutokauppaa. Pidä ikkuna auki; sen sulkeminen keskeyttää skannauksen.",
    ["Auction house scan finished: %d auctions of %d items in %s."] =
        "Huutokaupan skannaus valmis: %d huutokauppaa, %d esinettä, kesto %s.",
    ["The scan stopped at %d auctions to keep the saved file small."] =
        "Skannaus pysähtyi %d huutokauppaan, jotta tallennustiedosto pysyy pienenä.",
    ["A scan is already running."] = "Skannaus on jo käynnissä.",
    ["Open the auction house first, then press Scan prices or type /pq scan."] =
        "Avaa ensin huutokauppa ja paina sitten Skannaa hinnat tai kirjoita /pq scan.",
    ["This client offers no auction house listing PandaQuest can read."] =
        "Tämä peliversio ei tarjoa huutokauppalistausta, jota PandaQuest osaisi lukea.",
    ["Scan cancelled: the auction house window was closed."] =
        "Skannaus keskeytettiin: huutokauppaikkuna suljettiin.",
    ["Scan stopped: the auction house did not answer."] = "Skannaus pysähtyi: huutokauppa ei vastannut.",
    ["Scan stopped. Nothing was saved."] = "Skannaus pysäytettiin. Mitään ei tallennettu.",
    ["The auction house sent an empty listing. Nothing was saved."] =
        "Huutokauppa lähetti tyhjän listan. Mitään ei tallennettu.",
    ["No scan is running."] = "Skannausta ei ole käynnissä.",
    ["Scanning: %d%% (%d auctions read)."] = "Skannataan: %d %% (%d huutokauppaa luettu).",
    ["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."] =
        "Viimeisin skannaus %s (%s, %s): %d huutokauppaa, %d esinettä, %s sitten.",
    ["No auction house scan yet for this realm."] = "Tältä realmilta ei ole vielä huutokauppaskannausta.",
    ["AH minimum buyout"] = "Huutokauppa, halvin osto",
    ["AH market value"] = "Huutokauppa, markkina-arvo",
    ["bids only"] = "vain huutoja",
    ["%s, scanned %s ago"] = "%s, skannattu %s sitten",
    ["Auction house"] = "Huutokauppa",
    ["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] =
        "PandaQuest ei koskaan skannaa itsestään. Paina huutokauppaikkunan Skannaa hinnat -painiketta tai kirjoita /pq scan, kun ikkuna on auki.",
    ["Show the scan button on the auction house window"] = "Näytä skannauspainike huutokauppaikkunassa",
    ["Show auction prices on item tooltips"] = "Näytä huutokauppahinnat esineiden vihjeissä",
    ["The lowest buyout and the market value from your last scan on this realm, with how old it is."] =
        "Halvin ostohinta ja markkina-arvo viimeisimmästä skannauksestasi tällä realmilla sekä sen ikä.",
    ["Record my auction sales and purchases"] = "Kirjaa huutokauppamyyntini ja -ostoni",
    ["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."] =
        "Luetaan postilaatikon huutokauppakuiteista. Talteen jäävät esine, määrä ja hinta, ei koskaan toisen pelaajan nimeä.",

    -- Ammattireseptit (docs/11)
    ["/pq scan professions - read the open profession window"] =
        "/pq scan professions - lue auki oleva ammatti-ikkuna",
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

    -- Arkeologia (docs/11 B5 ja B6)
    ["This client does not offer the archaeology data PandaQuest reads."] =
        "Tämä asiakas ei tarjoa arkeologiatietoja, joita PandaQuest lukee.",
    ["This character has no archaeology races to read yet."] =
        "Tällä hahmolla ei ole vielä yhtään arkeologiakansaa luettavaksi.",
    ["No archaeology has been read on this character yet."] =
        "Tällä hahmolla ei ole vielä luettu arkeologiaa.",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] =
        "Arkeologia %d/%d: %d kansaa, %d esinettä, luettu %s sitten.",
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
    ["Puts an empty bar on screen for a moment so you can drag it."] =
        "Näyttää tyhjän palkin hetkeksi, jotta voit raahata sen paikalleen.",
    ["Reset bar position"] = "Palauta palkin sijainti",
    ["Dig site progress"] = "Kaivauspaikan edistyminen",
    ["Dig site complete"] = "Kaivauspaikka valmis",
    ["This client draws its own dig site progress bar."] =
        "Tämä asiakas piirtää oman kaivauspaikan edistymispalkkinsa.",
    ["The dig site bar is switched off in /pq options."] =
        "Kaivauspalkki on kytketty pois päältä asetuksissa (/pq).",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "Raahaa kaivauspalkki haluamaasi kohtaan. Se piiloutuu itsestään hetken kuluttua.",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.fiFI = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "fiFI")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
