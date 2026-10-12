-- Locales/deDE.lua: deDE translation. Keys are the English text from Locales/enUS.lua.
-- luacheck: max line length 220
local _, ns = ...

local T = {
    -- Core / Init
    ["PandaQuest %s loaded. Type /pq for options, /pq help for commands."] =
        "PandaQuest %s geladen. Mit /pq öffnest du die Optionen, /pq help zeigt alle Befehle.",
    ["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."] =
        "Willkommen bei PandaQuest! Der Pfeil zeigt auf dein nächstes Questziel. Mit /pq help siehst du alle Befehle.",
    ["%s is not available yet."] = "%s ist noch nicht verfügbar.",
    ["Unknown command: %s"] = "Unbekannter Befehl: %s",
    ["Available commands:"] = "Verfügbare Befehle:",
    ["/pq - open options"] = "/pq - Optionen öffnen",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - Navigationspfeil ein- oder ausblenden",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] =
        "/pq target [questID|clear] - Quest als Ziel festlegen (oder aktuelles Ziel anzeigen)",
    ["/pq next - skip the current target"] = "/pq next - aktuelles Ziel überspringen",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - Entfernungseinheit",
    ["/pq wh [questID] - Wowhead link"] = "/pq wh [questID] - Wowhead-Link",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <questID> - Quest im Navigator ausblenden",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <questID> - ausgeblendete Quest wieder anzeigen",
    ["/pq reset - reset arrow position and map pins"] = "/pq reset - Pfeilposition und Kartenmarkierungen zurücksetzen",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - Protokollstufe",
    ["/pq dump quest|npc|object|item <id> - print database entry"] = "/pq dump quest|npc|object|item <id> - Datenbankeintrag ausgeben",
    ["/pq status - addon status"] = "/pq status - Addon-Status",
    ["/pq sync - telemetry and community data status"] = "/pq sync - Status von Telemetrie und Community-Daten",
    ["/pq lang auto|<locale> - interface language"] = "/pq lang auto|<locale> - Sprache der Benutzeroberfläche",
    ["Available languages: %s"] = "Verfügbare Sprachen: %s",
    ["Units: %s"] = "Einheiten: %s",
    ["meters"] = "Meter",
    ["yards"] = "Yards",
    ["Usage: %s"] = "Verwendung: %s",
    ["Log level: %d (%s)"] = "Protokollstufe: %d (%s)",
    ["Arrow debug: %s"] = "Pfeil-Debug: %s",
    ["Language: %s (reload the UI to apply everywhere)"] =
        "Sprache: %s (zum vollständigen Übernehmen die Benutzeroberfläche neu laden)",
    ["Enabled"] = "Aktiviert",
    ["Disabled"] = "Deaktiviert",
    ["Quest %d hidden."] = "Quest %d ausgeblendet.",
    ["Quest %d is visible again."] = "Quest %d wird wieder angezeigt.",
    ["Current target: %s"] = "Aktuelles Ziel: %s",
    ["No current target."] = "Kein aktuelles Ziel.",
    ["No target found for quest %d."] = "Für Quest %d wurde kein Ziel gefunden.",
    ["Not found: %s %d"] = "Nicht gefunden: %s %d",
    ["Version %s"] = "Version %s",
    ["Built %s from %s"] = "Erstellt %s aus %s",
    ["This is a build from a modified working tree; it is not a release."] =
        "Dies ist ein Build aus einem geänderten Arbeitsverzeichnis, kein Release.",
    ["Database: %s"] = "Datenbank: %s",
    ["ready"] = "bereit",
    ["loading"] = "lädt",
    ["Quests in log: %d"] = "Quests im Questlog: %d",
    ["Targets: %d"] = "Ziele: %d",
    ["Background jobs: %d"] = "Hintergrundaufgaben: %d",
    ["Telemetry: %s, sessions stored: %d"] = "Telemetrie: %s, gespeicherte Sitzungen: %d",
    ["Community data: %s"] = "Community-Daten: %s",
    ["none"] = "keine",
    ["Arrow position and pins reset."] = "Pfeilposition und Markierungen zurückgesetzt.",
    ["Profile changed: %s"] = "Profil gewechselt: %s",

    -- Action texts, used by Objectives.DescribeTarget
    ["Kill %s (%d/%d)"] = "%s töten (%d/%d)",
    ["Talk to %s"] = "Mit %s sprechen",
    ["Loot %s from %s (%d/%d)"] = "%s von %s plündern (%d/%d)",
    ["Collect %s from %s (%d/%d)"] = "%s von %s sammeln (%d/%d)",
    ["Use %s (%d/%d)"] = "%s benutzen (%d/%d)",
    ["Use %s on %s"] = "%s auf %s benutzen",
    ["Explore %s"] = "%s erkunden",
    ["Turn in to %s"] = "Bei %s abgeben",
    ["Pick up quest from %s"] = "Quest von %s annehmen",
    ["Kill %s"] = "%s töten",
    ["Loot %s from %s"] = "%s von %s plündern",

    -- Shared UI strings
    ["Click: next target"] = "Klick: nächstes Ziel",
    ["Next: %s"] = "Nächstes: %s",
    ["%s complete - turn in to %s (%s)"] = "%s abgeschlossen - Abgabe bei %s (%s)",
    ["Community: avg %s"] = "Community: Ø %s",

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "Datenbank bereit: %d Quests, %d NPCs, %d Objekte, %d Gegenstände (%d ms).",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "PandaQuest-Datenbank nicht gefunden. Installiere das Addon neu: Die Dateien in Database/Data fehlen.",

    -- Nav (arrow, router, TomTom)
    ["Arrow locked."] = "Pfeil gesperrt.",
    ["Arrow unlocked - drag it to move."] = "Pfeil entsperrt - zum Verschieben ziehen.",
    ["Close"] = "Schließen",
    ["Custom target"] = "Eigenes Ziel",
    ["Distance"] = "Entfernung",
    ["ETA"] = "Ankunft",
    ["Hide this quest"] = "Diese Quest ausblenden",
    ["Lock arrow"] = "Pfeil sperren",
    ["Next target"] = "Nächstes Ziel",
    ["Reset arrow position"] = "Pfeilposition zurücksetzen",
    ["Right-click: arrow menu"] = "Rechtsklick: Pfeilmenü",
    ["Send to TomTom"] = "An TomTom senden",
    ["Shift-click: send to TomTom"] = "Umschalt-Klick: an TomTom senden",
    ["Show distance in metres"] = "Entfernung in Metern anzeigen",
    ["Show distance in yards"] = "Entfernung in Yards anzeigen",
    ["Show on map"] = "Auf der Karte anzeigen",
    ["TomTom is not loaded."] = "TomTom ist nicht geladen.",
    ["Unlock arrow"] = "Pfeil entsperren",
    ["Wowhead link"] = "Wowhead-Link",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "%d Spawns hier",
    ["Left-click: navigate here"] = "Linksklick: hierher navigieren",
    ["Right-click: more options"] = "Rechtsklick: weitere Optionen",
    ["Set as target"] = "Als Ziel festlegen",
    ["Hide quest: %s"] = "Quest ausblenden: %s",
    ["Wowhead: %s"] = "Wowhead: %s",
    ["Starts: %s"] = "Beginnt: %s",
    ["Turn in: %s"] = "Abgeben: %s",
    ["Ends: %s"] = "Endet: %s",

    -- Map/NodeTooltip
    ["Level:"] = "Stufe:",
    ["Type:"] = "Typ:",
    ["Skill:"] = "Fertigkeit:",
    ["Respawn:"] = "Respawn:",
    ["Respawn in:"] = "Respawn in:",
    ["~%s (%d)"] = "~%s (%d)",
    ["Sightings:"] = "Sichtungen:",
    ["Found by you:"] = "Von dir gefunden:",
    ["Also here:"] = "Auch hier:",
    ["Unit"] = "Einheit",
    ["Object"] = "Objekt",
    ["Item"] = "Gegenstand",
    ["Area"] = "Gebiet",
    ["%d Sec"] = "%d Sek.",
    ["%d Secs"] = "%d Sek.",
    ["%d Min"] = "%d Min.",
    ["%d Mins"] = "%d Min.",
    ["%d Hour"] = "%d Std.",
    ["%d Hours"] = "%d Std.",

    -- UI/Options
    ["General"] = "Allgemein",
    ["PandaQuest works out of the box. Everything below is optional."] =
        "PandaQuest funktioniert sofort ohne Einrichtung. Alles Folgende ist optional.",
    ["Distance units"] = "Entfernungseinheit",
    ["Metres are shown as '123 m', yards as '135 yd'."] = "Meter werden als '123 m', Yards als '135 yd' angezeigt.",
    ["Show minimap button"] = "Minikarten-Schaltfläche anzeigen",
    ["Left-click the minimap button to toggle the arrow, right-click for these options."] =
        "Linksklick auf die Minikarten-Schaltfläche blendet den Pfeil ein oder aus, Rechtsklick öffnet diese Optionen.",
    ["Language"] = "Sprache",
    ["PandaQuest follows your game language; /pq lang overrides it."] =
        "PandaQuest richtet sich nach deiner Spielsprache; /pq lang überschreibt das.",
    ["Arrow"] = "Pfeil",
    ["Show the arrow"] = "Pfeil anzeigen",
    ["Hide it to navigate by map pins only."] = "Ausblenden, um nur anhand der Kartenmarkierungen zu navigieren.",
    ["Lock the arrow in place"] = "Pfeil an seiner Position sperren",
    ["When unlocked, drag the arrow to move it."] = "Ist er entsperrt, lässt sich der Pfeil per Ziehen verschieben.",
    ["Show quest text"] = "Questtext anzeigen",
    ["Quest name and the action to take under the arrow."] = "Questname und auszuführende Aktion unter dem Pfeil.",
    ["Show travel time"] = "Reisezeit anzeigen",
    ["Estimated time to the target at your current speed."] =
        "Geschätzte Zeit bis zum Ziel bei deiner aktuellen Geschwindigkeit.",
    ["Show community timings"] = "Community-Zeiten anzeigen",
    ["Average completion time collected from other players, when available."] =
        "Durchschnittliche Abschlusszeit anderer Spieler, sofern verfügbar.",
    ["Hide inside instances"] = "In Instanzen ausblenden",
    ["The arrow cannot guide you inside a dungeon or raid."] =
        "Der Pfeil kann dich in Dungeons und Schlachtzügen nicht leiten.",
    ["Flash on arrival"] = "Bei Ankunft aufblitzen",
    ["A short glow when you reach the target."] = "Ein kurzes Leuchten, wenn du das Ziel erreichst.",
    ["Appearance"] = "Aussehen",
    ["Size"] = "Größe",
    ["Arrow size relative to the default."] = "Pfeilgröße relativ zur Standardgröße.",
    ["Opacity"] = "Deckkraft",
    ["Text size"] = "Textgröße",
    ["Reset position"] = "Position zurücksetzen",
    ["Moves the arrow back to the middle of the screen."] = "Setzt den Pfeil zurück in die Bildschirmmitte.",
    ["Navigation"] = "Navigation",
    ["Target selection"] = "Zielauswahl",
    ["Auto weighs priority and distance; Focused quest follows one quest."] =
        "Automatisch wägt Priorität und Entfernung ab; Fokussierte Quest folgt einer einzelnen Quest.",
    ["Auto"] = "Automatisch",
    ["Focused quest"] = "Fokussierte Quest",
    ["Nearest"] = "Nächstgelegene",
    ["Focused quest ID"] = "ID der fokussierten Quest",
    ["Used by 'Focused quest'. Empty follows the quest you track in the log."] =
        "Wird von 'Fokussierte Quest' verwendet. Leer folgt der Quest, die du im Questlog verfolgst.",
    ["Route to turn-ins"] = "Zu Questabgaben leiten",
    ["Completed quests are routed back to their quest giver."] =
        "Abgeschlossene Quests führen zurück zu ihrem Questgeber.",
    ["Route to new quests"] = "Zu neuen Quests leiten",
    ["Nearby quests you could pick up are added to the route."] =
        "Nahe Quests, die du annehmen könntest, werden der Route hinzugefügt.",
    ["New quest radius"] = "Radius für neue Quests",
    ["How far away a pickup may be to be routed to (yards)."] =
        "Wie weit eine Questannahme höchstens entfernt sein darf, um angesteuert zu werden (Yards).",
    ["Maximum new quests"] = "Maximale Anzahl neuer Quests",
    ["How many pickups are routed at once."] = "Wie viele Questannahmen gleichzeitig angesteuert werden.",
    ["Arrival radius"] = "Ankunftsradius",
    ["How close you must get before a target counts as reached (yards)."] =
        "Wie nah du herankommen musst, damit ein Ziel als erreicht gilt (Yards).",
    ["TomTom"] = "TomTom",
    ["TomTom waypoints"] = "TomTom-Wegpunkte",
    ["Mirror sends the current target to TomTom as a waypoint."] =
        "Spiegeln sendet das aktuelle Ziel als Wegpunkt an TomTom.",
    ["Off"] = "Aus",
    ["Mirror current target"] = "Aktuelles Ziel spiegeln",
    ["Map"] = "Karte",
    ["Show objective pins"] = "Questzielmarkierungen anzeigen",
    ["Where to go for the quests in your log."] = "Wohin du für die Quests in deinem Questlog musst.",
    ["Show turn-in pins"] = "Abgabemarkierungen anzeigen",
    ["Quest givers waiting for a completed quest."] = "Questgeber, die auf eine abgeschlossene Quest warten.",
    ["Show available quest pins"] = "Markierungen für verfügbare Quests anzeigen",
    ["Quests you could pick up."] = "Quests, die du annehmen könntest.",
    ["Show pins on the minimap"] = "Markierungen auf der Minikarte anzeigen",
    ["Keep distant pins on the minimap edge"] = "Ferne Markierungen am Minikartenrand behalten",
    ["Off hides a pin as soon as it leaves the minimap."] =
        "Aus blendet eine Markierung aus, sobald sie die Minikarte verlässt.",
    ["Merge nearby spawns"] = "Nahe Spawns zusammenfassen",
    ["One pin for a pack of mobs instead of a dozen."] = "Eine Markierung für eine Gruppe Mobs statt Dutzender.",
    ["Pin size"] = "Markierungsgröße",
    ["Map pin size"] = "Größe der Kartenmarkierungen",
    ["Minimap pin size"] = "Größe der Minikartenmarkierungen",
    -- Map/Pins, Map/Icons
    ["Objective dot size"] = "Größe der Zielpunkte",
    ["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."] =
        "Questziele und Sammelpunkte sind kleine Punkte, nach Quest oder Art eingefärbt; Questgeber behalten ihre Symbole.",
    ["Maximum minimap pins"] = "Maximale Anzahl Minikartenmarkierungen",
    ["When there are more, the ones nearest to you are kept."] =
        "Bei mehr bleiben die am nächsten gelegenen erhalten.",
    ["Minimap edge fade"] = "Ausblenden am Minikartenrand",
    ["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] =
        "Markierungen werden ab diesem Anteil des Weges zum Minikartenrand blasser und kleiner. 0 schaltet es aus.",
    ["Which quests to show"] = "Anzuzeigende Quests",
    ["Show low level quests"] = "Quests niedriger Stufe anzeigen",
    ["Quests that are grey for your level."] = "Quests, die für deine Stufe grau sind.",
    ["Show repeatable and daily quests"] = "Wiederholbare und tägliche Quests anzeigen",
    ["Show dungeon quests"] = "Dungeon-Quests anzeigen",
    ["Show raid quests"] = "Schlachtzugsquests anzeigen",
    ["Show PvP quests"] = "PvP-Quests anzeigen",
    ["Show pet battle quests"] = "Haustierkampf-Quests anzeigen",

    -- Nodes/Professions
    ["Gathering"] = "Sammeln",
    ["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] =
        "Erz, Kräuter, Fischschwärme, Truhen und seltene Spawns - nur dort eingezeichnet, wo du oder die Community tatsächlich etwas gefunden hat.",
    ["Show gathering nodes"] = "Sammelpunkte anzeigen",
    ["Turns the whole layer off, whatever the boxes below say."] =
        "Schaltet die gesamte Ebene aus, unabhängig von den Kästchen darunter.",
    ["Which nodes"] = "Welche Sammelpunkte",
    ["Mining veins"] = "Erzvorkommen",
    ["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] =
        "Erzvorkommen. Ausgeblendet, wenn dein Bergbau zu niedrig ist, außer du lässt diese ebenfalls anzeigen.",
    ["Herbs"] = "Kräuter",
    ["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] =
        "Kräutervorkommen. Ausgeblendet, wenn deine Kräuterkunde zu niedrig ist, außer du lässt diese ebenfalls anzeigen.",
    ["Fishing pools"] = "Fischschwärme",
    ["Fishing pools on lakes, rivers and the coast."] = "Fischschwärme auf Seen, Flüssen und an der Küste.",
    ["Chests and treasures"] = "Truhen und Schätze",
    ["Chests and lockboxes in the world; no gathering skill filters these."] =
        "Truhen und Schließkassetten in der Welt; keine Sammelfertigkeit filtert diese.",
    ["Rare spawns"] = "Seltene Spawns",
    ["Rare creatures, at the places a rare was looted."] =
        "Seltene Kreaturen an den Orten, an denen eine geplündert wurde.",
    ["Which of them you can gather"] = "Was du davon sammeln kannst",
    ["Only my professions"] = "Nur meine Berufe",
    ["A profession you have not learned contributes nothing at all."] =
        "Ein Beruf, den du nicht erlernt hast, trägt gar nichts bei.",
    ["Show nodes above my skill"] = "Sammelpunkte über meiner Fertigkeit anzeigen",
    ["Drawn faded. Useful for planning where to level a gathering skill next."] =
        "Blass dargestellt. Nützlich, um zu planen, wo du deine Sammelfertigkeit als Nächstes steigerst.",
    ["Fade nodes and mobs until they respawn"] = "Sammelpunkte und Mobs bis zum Respawn verblassen lassen",
    ["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] =
        "Ein Sammelpunkt, den du genutzt, oder ein Mob, den du getötet hast, bleibt blass, bis der Respawn-Timer sein Wiedererscheinen anzeigt.",

    ["Tooltips"] = "Tooltips",
    ["Add quest info to tooltips"] = "Questinfos zu Tooltips hinzufügen",
    ["Shows which quests an NPC or item starts, ends or counts towards."] =
        "Zeigt, welche Quests ein NPC oder Gegenstand startet, beendet oder voranbringt.",
    ["Show quest IDs"] = "Quest-IDs anzeigen",
    ["Useful when reporting missing data."] = "Nützlich, um fehlende Daten zu melden.",
    ["Tracker"] = "Questverfolgung",
    ["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] =
        "PandaQuest ersetzt die Blizzard-Questverfolgung nicht, sondern ergänzt sie nur.",
    ["Enhance the Blizzard tracker"] = "Blizzard-Questverfolgung erweitern",
    ["Show distance on tracked quests"] = "Entfernung bei verfolgten Quests anzeigen",
    ["Notifications"] = "Benachrichtigungen",
    ["Show notifications"] = "Benachrichtigungen anzeigen",
    ["A short message in the middle of the screen."] = "Eine kurze Nachricht in der Bildschirmmitte.",
    ["Quest complete and turned in"] = "Quest abgeschlossen und abgegeben",
    ["Next objective"] = "Nächstes Questziel",
    ["Play a sound"] = "Sound abspielen",
    ["Preview"] = "Vorschau",
    ["PandaQuest is ready."] = "PandaQuest ist bereit.",
    ["Synchronisation (optional)"] = "Synchronisierung (optional)",
    ["Optional. PandaQuest works fully without it, and never uploads anything itself."] =
        "Optional. PandaQuest funktioniert auch ohne vollständig und lädt selbst nie etwas hoch.",
    ["Record quest data"] = "Questdaten aufzeichnen",
    ["Record movement breadcrumbs"] = "Bewegungsspuren aufzeichnen",
    ["Occasional position samples that improve community routes."] =
        "Gelegentliche Positionsstichproben, die die Community-Routen verbessern.",
    ["Breadcrumb interval (seconds)"] = "Intervall der Bewegungsspuren (Sekunden)",
    ["Sessions to keep"] = "Zu behaltende Sitzungen",
    ["Events per session"] = "Ereignisse pro Sitzung",
    ["Advanced"] = "Erweitert",
    ["Log level"] = "Protokollstufe",
    ["How much PandaQuest prints to chat."] = "Wie viel PandaQuest im Chat ausgibt.",
    ["Errors"] = "Fehler",
    ["Warnings"] = "Warnungen",
    ["Info"] = "Info",
    ["Debug"] = "Debug",
    ["Trace"] = "Trace",
    ["Arrow debug output"] = "Pfeil-Debug-Ausgabe",
    ["Prints the bearing values used by the arrow."] = "Gibt die vom Pfeil verwendeten Peilwerte aus.",
    ["Redraw map pins"] = "Kartenmarkierungen neu zeichnen",
    ["Print status to chat"] = "Status im Chat ausgeben",
    ["Profiles"] = "Profile",
    ["Options are not available; use /pq help for chat commands."] =
        "Optionen sind nicht verfügbar; /pq help zeigt die Chatbefehle.",

    -- UI (minimap button, tracker, notifications, Wowhead)
    ["Distance unknown"] = "Entfernung unbekannt",
    ["Left-click: toggle the arrow"] = "Linksklick: Pfeil ein- oder ausblenden",
    ["Right-click: open options"] = "Rechtsklick: Optionen öffnen",
    ["Press Ctrl+C to copy the link:"] = "Strg+C drücken, um den Link zu kopieren:",
    ["Navigate to this quest"] = "Zu dieser Quest navigieren",
    ["the quest giver"] = "dem Questgeber",
    ["unknown distance"] = "unbekannte Entfernung",
    ["%s complete"] = "%s abgeschlossen",
    ["Turned in: %s"] = "Abgegeben: %s",

    -- Sync (telemetry, community data)
    ["Telemetry: %s"] = "Telemetrie: %s",
    ["Events recorded this session: %d (%d dropped)"] = "In dieser Sitzung aufgezeichnete Ereignisse: %d (%d verworfen)",
    ["Sessions stored: %d, waiting for upload: %d"] = "Gespeicherte Sitzungen: %d, auf Upload wartend: %d",
    ["Last upload confirmed: %s"] = "Letzter Upload bestätigt: %s",
    ["never"] = "nie",
    ["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] =
        "Solange die Telemetrie aus ist, wird nichts aufgezeichnet. Aktiviere sie in /pq options wieder.",
    ["No community data yet."] = "Noch keine Community-Daten.",
    ["Community data from %s"] = "Community-Daten von %s",
    ["Last gear snapshot: %s"] = "Letzter Ausrüstungs-Snapshot: %s",
    ["Gear snapshots: off."] = "Ausrüstungs-Snapshots: aus.",

    -- Sync / Consent
    ["/pq consent - ask the data sharing question again"] = "/pq consent - die Frage zur Datenfreigabe erneut stellen",
    ["PandaQuest can send what you do while questing to the community hub."] =
        "PandaQuest kann deine Aktivitäten beim Questen an den Community-Hub senden.",
    ["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] =
        "Das umfasst die Quests, die du annimmst und abschließt, was du tötest und plünderst, wo du stirbst, sowie deine Kartenposition samt Uhrzeit.",
    ["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] =
        "Daraus entstehen die gemeinsamen Questrouten. Es bleibt aus, bis du zustimmst, und du kannst es jederzeit beenden und löschen.",
    ["PandaQuest can share your quest data to build the community routes."] =
        "PandaQuest kann deine Questdaten teilen, um die Community-Routen aufzubauen.",
    ["It is off. Turn it on in /pq options if you want to take part."] =
        "Es ist ausgeschaltet. Schalte es in /pq options ein, wenn du teilnehmen möchtest.",
    ["Share my quest data"] = "Meine Questdaten teilen",
    ["No thanks"] = "Nein, danke",
    ["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] =
        "Danke. PandaQuest teilt deine Questdaten. Du kannst es jederzeit mit /pq sync ausschalten.",
    ["Nothing will be collected. Turn it on any time in /pq options."] =
        "Es wird nichts gesammelt. Du kannst es jederzeit in /pq options einschalten.",

    -- Auction house: the scan, the invoices, the tooltip and the options section
    ["Scan prices"] = "Preise scannen",
    ["Stop scan (%d%%)"] = "Scan stoppen (%d%%)",
    ["Scanning the auction house. Keep the window open; closing it cancels the scan."] =
        "Das Auktionshaus wird gescannt. Lass das Fenster geöffnet; beim Schließen wird der Scan abgebrochen.",
    ["Auction house scan finished: %d auctions of %d items in %s."] =
        "Auktionshaus-Scan abgeschlossen: %d Auktionen von %d Gegenständen in %s.",
    ["The scan stopped at %d auctions to keep the saved file small."] =
        "Der Scan wurde bei %d Auktionen beendet, um die gespeicherte Datei klein zu halten.",
    ["A scan is already running."] = "Ein Scan läuft bereits.",
    ["Open the auction house first, then press Scan prices or type /pq scan."] =
        "Öffne zuerst das Auktionshaus und klicke dann auf 'Preise scannen' oder gib /pq scan ein.",
    ["This client offers no auction house listing PandaQuest can read."] =
        "Dieser Client bietet keine Auktionshausliste, die PandaQuest lesen kann.",
    ["Scan cancelled: the auction house window was closed."] =
        "Scan abgebrochen: Das Auktionshausfenster wurde geschlossen.",
    ["Scan stopped: the auction house did not answer."] = "Scan gestoppt: Das Auktionshaus hat nicht geantwortet.",
    ["Scan stopped. Nothing was saved."] = "Scan gestoppt. Es wurde nichts gespeichert.",
    ["The auction house sent an empty listing. Nothing was saved."] =
        "Das Auktionshaus hat eine leere Liste gesendet. Es wurde nichts gespeichert.",
    ["No scan is running."] = "Es läuft kein Scan.",
    ["Scanning: %d%% (%d auctions read)."] = "Scan läuft: %d%% (%d Auktionen gelesen).",
    ["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."] =
        "Letzter Scan von %s (%s, %s): %d Auktionen von %d Gegenständen, vor %s.",
    ["No auction house scan yet for this realm."] = "Noch kein Auktionshaus-Scan für diesen Realm.",
    ["AH minimum buyout"] = "Niedrigster AH-Sofortkaufpreis",
    ["AH market value"] = "AH-Marktwert",
    ["bids only"] = "nur Gebote",
    ["%s, scanned %s ago"] = "%s, gescannt vor %s",
    ["Auction house"] = "Auktionshaus",
    ["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] =
        "PandaQuest scannt nie von selbst. Klicke im Auktionshausfenster auf 'Preise scannen' oder gib /pq scan ein, solange es geöffnet ist.",
    ["Show the scan button on the auction house window"] = "Scan-Schaltfläche im Auktionshausfenster anzeigen",
    ["Show auction prices on item tooltips"] = "Auktionspreise in Gegenstands-Tooltips anzeigen",
    ["The lowest buyout and the market value from your last scan on this realm, with how old it is."] =
        "Der niedrigste Sofortkaufpreis und der Marktwert aus deinem letzten Scan auf diesem Realm, samt Alter der Daten.",
    ["Record my auction sales and purchases"] = "Meine Auktionsverkäufe und -käufe aufzeichnen",
    ["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."] =
        "Wird aus den Auktionsrechnungen in deinem Briefkasten gelesen. Gegenstand, Menge und Preis werden gespeichert, nie der Name des anderen Spielers.",
    -- Professions: the recipe scan, its refusals and the options section
    ["/pq scan professions - read the open profession window"] =
        "/pq scan professions - das geöffnete Berufsfenster lesen",
    ["/pq scan archaeology - read your archaeology window"] = "/pq scan archaeology - dein Archäologiefenster lesen",
    ["/pq digsite - show the dig site bar so you can move it"] =
        "/pq digsite - die Ausgrabungsstätten-Leiste anzeigen, damit du sie verschieben kannst",
    ["A profession scan is already running."] = "Ein Berufs-Scan läuft bereits.",
    ["Open a profession window first, then type /pq scan professions."] =
        "Öffne zuerst ein Berufsfenster und gib dann /pq scan professions ein.",
    ["This client does not offer the recipe list PandaQuest reads."] =
        "Dieser Client bietet die Rezeptliste nicht, die PandaQuest liest.",
    ["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] =
        "Dieses Fenster zeigt das Rezeptbuch eines anderen Spielers, geöffnet über einen Link. PandaQuest zeichnet es nicht auf.",
    ["This profession window lists no recipes."] = "Dieses Berufsfenster listet keine Rezepte auf.",
    ["The profession list has not arrived from the server yet. Try again in a moment."] =
        "Die Berufsliste ist noch nicht vom Server eingetroffen. Versuche es gleich noch einmal.",
    ["Nothing was saved: not one recipe in this window could be read whole."] =
        "Es wurde nichts gespeichert: Kein einziges Rezept in diesem Fenster konnte vollständig gelesen werden.",
    ["The profession window changed while it was being read. Nothing was saved."] =
        "Das Berufsfenster hat sich während des Lesens geändert. Es wurde nichts gespeichert.",
    ["The window was read short, so the recipe book you already have was kept."] =
        "Das Fenster wurde nur unvollständig gelesen, daher blieb das bereits vorhandene Rezeptbuch erhalten.",
    ["Profession scan cancelled: the window was closed."] =
        "Berufs-Scan abgebrochen: Das Fenster wurde geschlossen.",
    ["Profession scan stopped. Nothing was saved."] = "Berufs-Scan gestoppt. Es wurde nichts gespeichert.",
    ["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."] =
        "PandaQuest berührt dein Berufsfenster nicht: %s lässt sich nicht so zurücksetzen, wie du es verlassen hast.",
    ["PandaQuest could not put your profession window back exactly as you left it."] =
        "PandaQuest konnte dein Berufsfenster nicht genau so zurücksetzen, wie du es verlassen hast.",
    ["Profession scan finished: %s %d/%d, %d recipes in %s."] =
        "Berufs-Scan abgeschlossen: %s %d/%d, %d Rezepte in %s.",
    ["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."] =
        "%d Rezepte wurden ausgelassen, weil das Spiel sie noch nicht fertig geladen hatte. Öffne das Fenster erneut, um sie zu vervollständigen.",
    ["The scan stopped at %d recipes to keep the saved file small."] =
        "Der Scan wurde bei %d Rezepten beendet, um die gespeicherte Datei klein zu halten.",
    ["Last scan of %s (%d/%d): %d recipes, %s ago."] = "Letzter Scan von %s (%d/%d): %d Rezepte, vor %s.",
    ["No profession has been scanned on this character yet."] =
        "Auf diesem Charakter wurde noch kein Beruf gescannt.",
    ["Professions"] = "Berufe",
    ["PandaQuest reads an open profession window once and puts your filters and collapsed categories back."] =
        "PandaQuest liest ein geöffnetes Berufsfenster einmal und stellt deine Filter und eingeklappten Kategorien wieder her.",
    ["Read my recipes when I open a profession"] = "Meine Rezepte lesen, wenn ich einen Beruf öffne",
    ["The recipes, their reagents and how hard each is for this character. Never a book opened from a link."] =
        "Die Rezepte, ihre Reagenzien und wie schwierig jedes für diesen Charakter ist. Nie ein über einen Link geöffnetes Buch.",

    -- Flight master
    ["Flight time:"] = "Flugzeit:",
    ["~%s (%d flight)"] = "~%s (%d Flug)",
    ["~%s (%d flights)"] = "~%s (%d Flüge)",
    ["~%s left (%d flights)"] = "~%s verbleibend (%d Flüge)",
    ["%s in the air"] = "%s in der Luft",
    ["Flight progress"] = "Flugfortschritt",
    ["The flight bar is switched off in /pq options."] = "Die Flugleiste ist in /pq options ausgeschaltet.",
    ["The flight bar is locked. Unlock it in /pq options to move it."] =
        "Die Flugleiste ist gesperrt. Entsperre sie in /pq options, um sie zu verschieben.",
    ["Drag the flight bar where you want it. It hides itself again in a moment."] =
        "Ziehe die Flugleiste an die gewünschte Stelle. Sie blendet sich gleich wieder aus.",
    ["/pq flight - show the flight bar so you can drag it"] =
        "/pq flight - die Flugleiste anzeigen, damit du sie ziehen kannst",
    ["Flight master"] = "Flugmeister",
    ["PandaQuest times your own flights and shows what it measured. A route you have never flown shows nothing at all."] =
        "PandaQuest stoppt die Zeit deiner eigenen Flüge und zeigt, was es gemessen hat. Eine Route, die du nie geflogen bist, zeigt gar nichts.",
    ["Show the flight time at the flight master"] = "Flugzeit beim Flugmeister anzeigen",
    ["One line in the destination's tooltip, with how many of your own flights it rests on."] =
        "Eine Zeile im Tooltip des Ziels, mit der Anzahl deiner eigenen Flüge, auf denen sie beruht.",
    ["Show the progress bar while flying"] = "Fortschrittsleiste während des Flugs anzeigen",
    ["Progress and remaining time once the route has been flown twice; before that, only the time in the air."] =
        "Fortschritt und Restzeit, sobald die Route zweimal geflogen wurde; davor nur die Zeit in der Luft.",
    -- Archaeology
    ["This client does not offer the archaeology data PandaQuest reads."] =
        "Dieser Client bietet nicht die Archäologiedaten, die PandaQuest liest.",
    ["This character has no archaeology races to read yet."] =
        "Dieser Charakter hat noch keine Archäologie-Völker zum Lesen.",
    ["Your artifact history has not arrived yet, so the archaeology PandaQuest already had was kept."] =
        "Dein Artefaktverlauf ist noch nicht eingetroffen, daher blieben die bereits vorhandenen Archäologiedaten erhalten.",
    ["No archaeology has been read on this character yet."] =
        "Auf diesem Charakter wurde noch keine Archäologie gelesen.",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] =
        "Archäologie %d/%d: %d Völker, %d Artefakte, gelesen vor %s.",
    ["Archaeology %d: %d races, %d artifacts, read %s ago."] =
        "Archäologie %d: %d Völker, %d Artefakte, gelesen vor %s.",
    ["Archaeology: %d races, %d artifacts, read %s ago."] =
        "Archäologie: %d Völker, %d Artefakte, gelesen vor %s.",
    ["Archaeology read: %d races, %d artifacts."] = "Archäologie gelesen: %d Völker, %d Artefakte.",
    ["The server has not sent your artifact history, so completion counts were left out."] =
        "Der Server hat deinen Artefaktverlauf nicht gesendet, daher wurden die Abschlusszahlen ausgelassen.",
    ["Archaeology"] = "Archäologie",
    ["Mists never shipped a dig site progress bar. PandaQuest draws one from the events the game already sends."] =
        "Mists of Pandaria hatte nie eine Fortschrittsleiste für Ausgrabungsstätten. PandaQuest zeichnet eine anhand der Ereignisse, die das Spiel ohnehin sendet.",
    ["Read my archaeology when I open the window"] = "Meine Archäologie lesen, wenn ich das Fenster öffne",
    ["Your races, their keystone, your fragments and the artifacts you have. Only this character's own."] =
        "Deine Völker, ihre Schlüsselsteine, deine Fragmente und die Artefakte, die du hast. Nur die dieses Charakters.",
    ["Dig site progress bar"] = "Fortschrittsleiste der Ausgrabungsstätte",
    ["Show the dig site progress bar"] = "Fortschrittsleiste der Ausgrabungsstätte anzeigen",
    ["Appears when you survey and hides when you leave the dig site."] =
        "Erscheint, wenn du eine Ausgrabungsstätte absuchst, und verschwindet, wenn du sie verlässt.",
    ["Lock the bar in place"] = "Leiste an ihrer Position sperren",
    ["Unlocked, it can be dragged with the left mouse button."] =
        "Entsperrt lässt sie sich mit der linken Maustaste ziehen.",
    ["Bar size"] = "Leistengröße",
    ["Show me where it is"] = "Zeig mir, wo sie ist",
    ["Puts an empty bar on screen for a moment so you can find it, and drag it when it is unlocked."] =
        "Zeigt kurz eine leere Leiste auf dem Bildschirm, damit du sie findest; entsperrt kannst du sie ziehen.",
    ["Reset bar position"] = "Leistenposition zurücksetzen",
    ["Dig site progress"] = "Fortschritt der Ausgrabungsstätte",
    ["Dig site complete"] = "Ausgrabungsstätte abgeschlossen",
    ["This client draws its own dig site progress bar."] =
        "Dieser Client zeichnet eine eigene Fortschrittsleiste für Ausgrabungsstätten.",
    ["The dig site bar is switched off in /pq options."] =
        "Die Ausgrabungsstätten-Leiste ist in /pq options ausgeschaltet.",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "Ziehe die Ausgrabungsstätten-Leiste an die gewünschte Stelle. Sie blendet sich gleich wieder aus.",
    ["The dig site bar is locked. Unlock it in /pq options to move it."] =
        "Die Ausgrabungsstätten-Leiste ist gesperrt. Entsperre sie in /pq options, um sie zu verschieben.",

    -- Database/QuestieDB (the optional QuestieDB addon)
    ["Quest database source"] = "Quelle der Quest-Datenbank",
    ["Uses the QuestieDB addon, if it is installed and enabled, to complete PandaQuest's own database. Takes effect after /reload."] =
        "Nutzt das Addon QuestieDB, sofern installiert und aktiviert, um die eigene Datenbank von PandaQuest zu ergänzen. Wirkt nach /reload.",
    ["PandaQuest only"] = "Nur PandaQuest",
    ["Fill gaps from QuestieDB"] = "Lücken aus QuestieDB füllen",
    ["QuestieDB values first"] = "QuestieDB-Werte zuerst",
    ["QuestieDB: %s"] = "QuestieDB: %s",
    ["QuestieDB: %s (%d entries added, %d refreshed)"] = "QuestieDB: %s (%d Einträge hinzugefügt, %d aktualisiert)",
    ["not used (off)"] = "nicht verwendet (aus)",
    ["not installed"] = "nicht installiert",
    ["cannot be used (%s)"] = "nicht nutzbar (%s)",
    ["not read yet"] = "noch nicht gelesen",

    -- Quest browser, quest database source, language selection
    ["/pq quests [questID] - browse every quest in the database"] =
        "/pq quests [questID] - alle Quests der Datenbank durchsuchen",
    ["Name"] = "Name",
    ["Level"] = "Stufe",
    ["to"] = "bis",
    ["My level"] = "Meine Stufe",
    ["My side"] = "Meine Fraktion",
    ["Alliance"] = "Allianz",
    ["Horde"] = "Horde",
    ["Both"] = "Beide",
    ["both factions"] = "beide Fraktionen",
    ["Dungeon"] = "Dungeon",
    ["Raid"] = "Raid",
    ["Group"] = "Gruppe",
    ["PvP"] = "PvP",
    ["Daily"] = "Täglich",
    ["Event"] = "Ereignis",
    ["Reset"] = "Leeren",
    ["All quests"] = "Alle Quests",
    ["%d quests"] = "%d Quests",
    ["No quest matches these filters."] = "Keine Quest entspricht diesen Filtern.",
    ["Reading the quest database..."] = "Quest-Datenbank wird gelesen...",
    ["Quest"] = "Quest",
    ["Zone"] = "Zone",
    ["Req."] = "Min.",
    ["XP"] = "EP",
    ["A level %d quest for %s, from level %d."] = "Eine Quest der Stufe %d (%s), ab Stufe %d.",
    ["%d experience"] = "%d Erfahrungspunkte",
    ["Not in the database."] = "Nicht in der Datenbank.",
    ["requires level"] = "erfordert Stufe",
    ["Yes"] = "Ja",
    ["No"] = "Nein",
    ["No location is known for this quest."] = "Für diese Quest ist kein Ort bekannt.",
    ["Navigating to: %s"] = "Navigation zu: %s",
    ["Start"] = "Beginn",
    ["End"] = "Ende",
    ["Difficulty"] = "Schwierigk.",
    ["Side"] = "Fraktion",
    ["Shareable"] = "Teilbar",
    ["Quest ID"] = "Quest-ID",
    ["Rewards"] = "Belohnungen",
    ["Navigate"] = "Navigieren",
    ["Pick a quest from the list to see its page."] =
        "Wähle eine Quest aus der Liste, um ihre Detailseite anzuzeigen.",
    ["Quests"] = "Quests",
    ["Shift-click: browse all quests"] = "Umschalt-Klick: alle Quests durchsuchen",
    -- Beta notice and animation options
    ["This is a beta build: new features are not yet confirmed in the game."] =
        "Dies ist ein Beta-Build: Neue Funktionen sind im Spiel noch nicht bestätigt.",
    ["Animations"] =
        "Animationen",
    ["Windows fade and settle, messages slide in, bars glide. Switch it off for a calmer interface."] =
        "Fenster blenden ein und setzen sich, Meldungen gleiten herein, Balken laufen weich. Ausschalten für eine ruhigere Oberfläche.",
    ["Turn all interface motion on or off."] =
        "Alle Bewegungen der Oberfläche ein- oder ausschalten.",
    ["Animation speed"] =
        "Animationsgeschwindigkeit",
    ["1 is normal; 2 is twice as fast, 0.5 half as fast."] =
        "1 ist normal; 2 ist doppelt so schnell, 0,5 halb so schnell.",
    -- Options: language, tools
    ["Open the quest browser"] = "Quest-Browser öffnen",
    ["Browse every quest in the database, with a page and a map for each."] =
        "Alle Quests der Datenbank durchsuchen, jeweils mit eigener Seite und Karte.",
    ["Choose the language of PandaQuest's texts. Automatic follows the game's language."] =
        "Wähle die Sprache der PandaQuest-Texte. Automatisch folgt der Spielsprache.",
    ["Automatic (game language)"] = "Automatisch (Spielsprache)",
    ["Reload the interface"] = "Benutzeroberfläche neu laden",
    ["Reloads the game's interface so a changed language applies everywhere."] =
        "Lädt die Benutzeroberfläche des Spiels neu, damit eine geänderte Sprache überall übernommen wird.",
    ["Tools"] = "Werkzeuge",
    ["Everything the chat commands do, as buttons. Nothing here needs a command."] =
        "Alles, was die Chatbefehle tun, als Schaltflächen. Hier ist kein Befehl nötig.",
    ["Skip the current target"] = "Aktuelles Ziel überspringen",
    ["Moves the arrow on to the next target."] = "Setzt den Pfeil auf das nächste Ziel.",
    ["Stop following the pinned quest"] = "Festgelegte Quest nicht mehr verfolgen",
    ["Clears the quest pinned with the focus setting or the map's right-click menu."] =
        "Entfernt die Quest, die mit der Fokus-Einstellung oder dem Rechtsklickmenü der Karte festgelegt wurde.",
    ["Reset arrow position and map pins"] = "Pfeil und Markierungen zurücksetzen",
    ["Wowhead link for the current target"] = "Wowhead-Link für das aktuelle Ziel",
    ["%d quests are hidden from the navigator."] = "%d Quests sind im Navigator ausgeblendet.",
    ["Show all hidden quests again"] = "Ausgeblendete Quests wieder anzeigen",
    ["Reading windows"] = "Fenster lesen",
    ["Read my professions now"] = "Meine Berufe jetzt lesen",
    ["Open the profession window first."] = "Öffne zuerst das Berufsfenster.",
    ["Read my archaeology now"] = "Meine Archäologie jetzt lesen",
    ["Open the archaeology window first."] = "Öffne zuerst das Archäologiefenster.",
    ["Show synchronisation status"] = "Synchronisierungsstatus anzeigen",
    ["Ask the data sharing question"] = "Frage zur Datenfreigabe stellen",
    ["Categories"] = "Kategorien",
    ["Loosen a filter, or press Reset."] = "Lockere einen Filter oder klicke auf 'Leeren'.",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.deDE = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "deDE")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
