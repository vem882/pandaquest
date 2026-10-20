-- Locales/itIT.lua: itIT translation. Keys are the English text from Locales/enUS.lua.
-- luacheck: max line length 220
local _, ns = ...

local T = {
    -- Core / Init
    ["PandaQuest %s loaded. Type /pq for options, /pq help for commands."] =
        "PandaQuest %s caricato. Digita /pq per le opzioni, /pq help per i comandi.",
    ["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."] =
        "Benvenuto in PandaQuest! La freccia indica il prossimo obiettivo delle tue missioni. Digita /pq help per i comandi.",
    ["%s is not available yet."] = "%s non è ancora disponibile.",
    ["Unknown command: %s"] = "Comando sconosciuto: %s",
    ["Available commands:"] = "Comandi disponibili:",
    ["/pq - open options"] = "/pq - apri le opzioni",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - mostra o nascondi la freccia di navigazione",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] =
        "/pq target [questID|clear] - fissa una missione (o mostra la destinazione attuale)",
    ["/pq next - skip the current target"] = "/pq next - salta la destinazione attuale",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - unità di distanza",
    ["/pq wh [questID] - Wowhead link"] = "/pq wh [questID] - link a Wowhead",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <questID> - nascondi una missione dal navigatore",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <questID> - mostra di nuovo una missione nascosta",
    ["/pq reset - reset arrow position and map pins"] = "/pq reset - reimposta la posizione della freccia e i segnaposto della mappa",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - livello di log",
    ["/pq dump quest|npc|object|item <id> - print database entry"] = "/pq dump quest|npc|object|item <id> - stampa una voce del database",
    ["/pq status - addon status"] = "/pq status - stato dell'addon",
    ["/pq sync - telemetry and community data status"] = "/pq sync - stato di telemetria e dati della community",
    ["/pq lang auto|<locale> - interface language"] = "/pq lang auto|<locale> - lingua dell'interfaccia",
    ["Available languages: %s"] = "Lingue disponibili: %s",
    ["Units: %s"] = "Unità: %s",
    ["meters"] = "metri",
    ["yards"] = "yard",
    ["Usage: %s"] = "Uso: %s",
    ["Log level: %d (%s)"] = "Livello di log: %d (%s)",
    ["Arrow debug: %s"] = "Debug della freccia: %s",
    ["Language: %s (reload the UI to apply everywhere)"] = "Lingua: %s (ricarica l'interfaccia per applicarla ovunque)",
    ["Enabled"] = "Abilitato",
    ["Disabled"] = "Disabilitato",
    ["Quest %d hidden."] = "Missione %d nascosta.",
    ["Quest %d is visible again."] = "La missione %d è di nuovo visibile.",
    ["Current target: %s"] = "Destinazione attuale: %s",
    ["No current target."] = "Nessuna destinazione attuale.",
    ["No target found for quest %d."] = "Nessuna destinazione trovata per la missione %d.",
    ["Not found: %s %d"] = "Non trovato: %s %d",
    ["Version %s"] = "Versione %s",
    ["Built %s from %s"] = "Compilato il %s dal commit %s",
    ["This is a build from a modified working tree; it is not a release."] =
        "Questa è una build ottenuta da un albero di lavoro modificato; non è una release.",
    ["Database: %s"] = "Database: %s",
    ["ready"] = "pronto",
    ["loading"] = "in caricamento",
    ["Quests in log: %d"] = "Missioni nel registro: %d",
    ["Targets: %d"] = "Destinazioni: %d",
    ["Background jobs: %d"] = "Attività in background: %d",
    ["Telemetry: %s, sessions stored: %d"] = "Telemetria: %s, sessioni salvate: %d",
    ["Community data: %s"] = "Dati della community: %s",
    ["none"] = "nessuno",
    ["Arrow position and pins reset."] = "Posizione della freccia e segnaposto reimpostati.",
    ["Profile changed: %s"] = "Profilo cambiato: %s",

    -- Action texts, used by Objectives.DescribeTarget
    ["Kill %s (%d/%d)"] = "Uccidi %s (%d/%d)",
    ["Talk to %s"] = "Parla con %s",
    ["Loot %s from %s (%d/%d)"] = "Saccheggia %s da %s (%d/%d)",
    ["Collect %s from %s (%d/%d)"] = "Raccogli %s da %s (%d/%d)",
    ["Use %s (%d/%d)"] = "Usa %s (%d/%d)",
    ["Use %s on %s"] = "Usa %s su %s",
    ["Explore %s"] = "Esplora %s",
    ["Turn in to %s"] = "Consegna a %s",
    ["Pick up quest from %s"] = "Accetta la missione da %s",
    ["Kill %s"] = "Uccidi %s",
    ["Loot %s from %s"] = "Saccheggia %s da %s",

    -- Shared UI strings
    ["Click: next target"] = "Clic: destinazione successiva",
    ["Next: %s"] = "Successivo: %s",
    ["%s complete - turn in to %s (%s)"] = "%s completata - consegna a %s (%s)",
    ["Community: avg %s"] = "Community: media %s",

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "Database pronto: %d missioni, %d PNG, %d entità, %d oggetti (%d ms).",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "Database di PandaQuest non trovato. Reinstalla l'addon: mancano i file di Database/Data.",

    -- Nav (arrow, router, TomTom)
    ["Arrow locked."] = "Freccia bloccata.",
    ["Arrow unlocked - drag it to move."] = "Freccia sbloccata - trascinala per spostarla.",
    ["Close"] = "Chiudi",
    ["Custom target"] = "Destinazione personalizzata",
    ["Distance"] = "Distanza",
    ["ETA"] = "Arrivo",
    ["Hide this quest"] = "Nascondi questa missione",
    ["Lock arrow"] = "Blocca la freccia",
    ["Next target"] = "Destinazione successiva",
    ["Reset arrow position"] = "Reimposta la posizione della freccia",
    ["Right-click: arrow menu"] = "Clic destro: menu della freccia",
    ["Send to TomTom"] = "Invia a TomTom",
    ["Shift-click: send to TomTom"] = "Maiusc-clic: invia a TomTom",
    ["Show distance in metres"] = "Mostra la distanza in metri",
    ["Show distance in yards"] = "Mostra la distanza in yard",
    ["Show on map"] = "Mostra sulla mappa",
    ["TomTom is not loaded."] = "TomTom non è caricato.",
    ["Unlock arrow"] = "Sblocca la freccia",
    ["Wowhead link"] = "Link Wowhead",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "%d punti di comparsa qui",
    ["Left-click: navigate here"] = "Clic sinistro: naviga qui",
    ["Right-click: more options"] = "Clic destro: altre opzioni",
    ["Set as target"] = "Imposta come destinazione",
    ["Hide quest: %s"] = "Nascondi missione: %s",
    ["Wowhead: %s"] = "Wowhead: %s",
    ["Starts: %s"] = "Inizia: %s",
    ["Turn in: %s"] = "Consegna: %s",
    ["Ends: %s"] = "Termina: %s",

    -- Map/NodeTooltip
    ["Level:"] = "Livello:",
    ["Type:"] = "Tipo:",
    ["Skill:"] = "Abilità:",
    ["Respawn:"] = "Ricomparsa:",
    ["Respawn in:"] = "Ricomparsa tra:",
    ["~%s (%d)"] = "~%s (%d)",
    ["Sightings:"] = "Avvistamenti:",
    ["Found by you:"] = "Trovati da te:",
    ["Also here:"] = "Anche qui:",
    ["Unit"] = "Unità",
    ["Object"] = "Entità",
    ["Item"] = "Oggetto",
    ["Area"] = "Area",
    ["%d Sec"] = "%d sec",
    ["%d Secs"] = "%d sec",
    ["%d Min"] = "%d min",
    ["%d Mins"] = "%d min",
    ["%d Hour"] = "%d ora",
    ["%d Hours"] = "%d ore",

    -- UI/Options
    ["General"] = "Generale",
    ["PandaQuest works out of the box. Everything below is optional."] =
        "PandaQuest funziona subito, senza configurazione. Tutto ciò che segue è facoltativo.",
    ["Distance units"] = "Unità di distanza",
    ["Metres are shown as '123 m', yards as '135 yd'."] = "I metri sono mostrati come '123 m', le yard come '135 yd'.",
    ["Show minimap button"] = "Mostra il pulsante della minimappa",
    ["Language"] = "Lingua",
    ["PandaQuest follows your game language; /pq lang overrides it."] =
        "PandaQuest segue la lingua del gioco; /pq lang la sostituisce.",
    ["Arrow"] = "Freccia",
    ["Show the arrow"] = "Mostra la freccia",
    ["Hide it to navigate by map pins only."] = "Nascondila per navigare solo con i segnaposto della mappa.",
    ["Lock the arrow in place"] = "Blocca la freccia nella posizione attuale",
    ["When unlocked, drag the arrow to move it."] = "Quando è sbloccata, trascina la freccia per spostarla.",
    ["Show quest text"] = "Mostra il testo della missione",
    ["Quest name and the action to take under the arrow."] = "Nome della missione e azione da compiere sotto la freccia.",
    ["Show travel time"] = "Mostra il tempo di viaggio",
    ["Estimated time to the target at your current speed."] =
        "Tempo stimato per raggiungere la destinazione alla tua velocità attuale.",
    ["Show community timings"] = "Mostra i tempi della community",
    ["Average completion time collected from other players, when available."] =
        "Tempo medio di completamento raccolto da altri giocatori, se disponibile.",
    ["Hide inside instances"] = "Nascondi nelle istanze",
    ["The arrow cannot guide you inside a dungeon or raid."] =
        "La freccia non può guidarti all'interno di una spedizione o di un'incursione.",
    ["Flash on arrival"] = "Lampeggia all'arrivo",
    ["A short glow when you reach the target."] = "Un breve bagliore quando raggiungi la destinazione.",
    ["Appearance"] = "Aspetto",
    ["Size"] = "Dimensione",
    ["Arrow size relative to the default."] = "Dimensione della freccia rispetto a quella predefinita.",
    ["Opacity"] = "Opacità",
    ["Text size"] = "Dimensione del testo",
    ["Reset position"] = "Reimposta posizione",
    ["Moves the arrow back to the middle of the screen."] = "Riporta la freccia al centro dello schermo.",
    ["Navigation"] = "Navigazione",
    ["Target selection"] = "Scelta della destinazione",
    ["Auto weighs priority and distance; Focused quest follows one quest."] =
        "Automatico valuta priorità e distanza; Missione scelta segue una sola missione.",
    ["Auto"] = "Automatico",
    ["Focused quest"] = "Missione scelta",
    ["Nearest"] = "Più vicina",
    ["Focused quest ID"] = "ID della missione scelta",
    ["Used by 'Focused quest'. Empty follows the quest you track in the log."] =
        "Usato da 'Missione scelta'. Se vuoto, segue la missione che monitori nel registro.",
    ["Route to turn-ins"] = "Percorso verso le consegne",
    ["Completed quests are routed back to their quest giver."] =
        "Le missioni completate vengono indirizzate di nuovo a chi le ha assegnate.",
    ["Route to new quests"] = "Percorso verso le nuove missioni",
    ["Nearby quests you could pick up are added to the route."] =
        "Le missioni vicine che potresti accettare vengono aggiunte al percorso.",
    ["New quest radius"] = "Raggio delle nuove missioni",
    ["How far away a pickup may be to be routed to (yards)."] =
        "A che distanza può trovarsi una missione da accettare per essere inclusa nel percorso (yard).",
    ["Maximum new quests"] = "Massimo di nuove missioni",
    ["How many pickups are routed at once."] =
        "Quante missioni da accettare vengono incluse nel percorso contemporaneamente.",
    ["Arrival radius"] = "Raggio di arrivo",
    ["How close you must get before a target counts as reached (yards)."] =
        "Quanto devi avvicinarti perché una destinazione sia considerata raggiunta (yard).",
    ["TomTom"] = "TomTom",
    ["TomTom waypoints"] = "Waypoint di TomTom",
    ["Mirror sends the current target to TomTom as a waypoint."] =
        "Rispecchia invia la destinazione attuale a TomTom come waypoint.",
    ["Off"] = "Disattivato",
    ["Mirror current target"] = "Rispecchia la destinazione attuale",
    ["Map"] = "Mappa",
    ["Show objective pins"] = "Mostra i segnaposto degli obiettivi",
    ["Where to go for the quests in your log."] = "Dove andare per le missioni nel tuo registro.",
    ["Show turn-in pins"] = "Mostra i segnaposto di consegna",
    ["Quest givers waiting for a completed quest."] =
        "Chi assegna missioni e attende la consegna di una missione completata.",
    ["Show available quest pins"] = "Mostra i segnaposto delle missioni disponibili",
    ["Quests you could pick up."] = "Missioni che potresti accettare.",
    ["Show pins on the minimap"] = "Mostra i segnaposto sulla minimappa",
    ["Keep distant pins on the minimap edge"] = "Mantieni i segnaposto lontani sul bordo della minimappa",
    ["Off hides a pin as soon as it leaves the minimap."] =
        "Se disattivato, un segnaposto viene nascosto non appena esce dalla minimappa.",
    ["Merge nearby spawns"] = "Unisci i punti di comparsa vicini",
    ["One pin for a pack of mobs instead of a dozen."] =
        "Un solo segnaposto per un gruppo di mob invece di una dozzina.",
    ["Pin size"] = "Dimensione dei segnaposto",
    ["Map pin size"] = "Dimensione dei segnaposto sulla mappa",
    ["Minimap pin size"] = "Dimensione dei segnaposto sulla minimappa",
    -- Map/Pins, Map/Icons
    ["Objective dot size"] = "Dimensione dei punti degli obiettivi",
    ["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."] =
        "Obiettivi e nodi di raccolta sono piccoli punti, colorati per missione o per tipo; chi assegna le missioni mantiene le proprie icone.",
    ["Maximum minimap pins"] = "Massimo di segnaposto sulla minimappa",
    ["When there are more, the ones nearest to you are kept."] =
        "Se ce ne sono di più, vengono mantenuti quelli più vicini a te.",
    ["Minimap edge fade"] = "Dissolvenza ai bordi della minimappa",
    ["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] =
        "I segnaposto sfumano e si rimpiccioliscono oltre questa porzione del tragitto verso il bordo della minimappa. 0 la disattiva.",
    ["Which quests to show"] = "Quali missioni mostrare",
    ["Show low level quests"] = "Mostra le missioni di basso livello",
    ["Quests that are grey for your level."] = "Missioni grigie per il tuo livello.",
    ["Show repeatable and daily quests"] = "Mostra le missioni ripetibili e giornaliere",
    ["Show dungeon quests"] = "Mostra le missioni delle spedizioni",
    ["Show raid quests"] = "Mostra le missioni delle incursioni",
    ["Show PvP quests"] = "Mostra le missioni PvP",
    ["Show pet battle quests"] = "Mostra le missioni delle battaglie tra mascotte",

    -- Nodes/Professions
    ["Gathering"] = "Raccolta",
    ["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] =
        "Minerali, erbe, banchi di pesci, forzieri e creature rare, mostrati solo dove tu o la community ne avete davvero trovato uno.",
    ["Show gathering nodes"] = "Mostra i nodi di raccolta",
    ["Turns the whole layer off, whatever the boxes below say."] =
        "Disattiva l'intero livello, qualunque cosa indichino le caselle qui sotto.",
    ["Which nodes"] = "Quali nodi",
    ["Mining veins"] = "Filoni di minerale",
    ["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] =
        "Filoni di minerale. Nascosti se la tua abilità di Estrazione è troppo bassa, a meno che tu non mostri anche quelli.",
    ["Herbs"] = "Erbe",
    ["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] =
        "Punti di comparsa delle erbe. Nascosti se la tua abilità di Erboristeria è troppo bassa, a meno che tu non mostri anche quelli.",
    ["Fishing pools"] = "Banchi di pesci",
    ["Fishing pools on lakes, rivers and the coast."] = "Banchi di pesci su laghi, fiumi e coste.",
    ["Chests and treasures"] = "Forzieri e tesori",
    ["Chests and lockboxes in the world; no gathering skill filters these."] =
        "Forzieri e scrigni chiusi nel mondo; nessuna abilità di raccolta li filtra.",
    ["Rare spawns"] = "Creature rare",
    ["Rare creatures, at the places a rare was looted."] =
        "Creature rare, nei punti in cui ne è stata saccheggiata una.",
    ["Which of them you can gather"] = "Quali di essi puoi raccogliere",
    ["Only my professions"] = "Solo le mie professioni",
    ["A profession you have not learned contributes nothing at all."] =
        "Una professione che non hai appreso non contribuisce in alcun modo.",
    ["Show nodes above my skill"] = "Mostra i nodi oltre la mia abilità",
    ["Drawn faded. Useful for planning where to level a gathering skill next."] =
        "Mostrati sbiaditi. Utile per pianificare dove aumentare la prossima abilità di raccolta.",
    ["Fade nodes and mobs until they respawn"] = "Sfuma nodi e mob fino alla ricomparsa",
    ["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] =
        "Un nodo che hai raccolto o un mob che hai ucciso resta sbiadito finché il timer di ricomparsa non indica che è tornato.",

    ["Tooltips"] = "Tooltip",
    ["Add quest info to tooltips"] = "Aggiungi informazioni sulle missioni ai tooltip",
    ["Shows which quests an NPC or item starts, ends or counts towards."] =
        "Mostra quali missioni un PNG o un oggetto avvia, conclude o fa avanzare.",
    ["Show quest IDs"] = "Mostra gli ID delle missioni",
    ["Useful when reporting missing data."] = "Utile per segnalare dati mancanti.",
    ["Tracker"] = "Tracker",
    ["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] =
        "PandaQuest non sostituisce il tracker delle missioni di Blizzard; lo integra soltanto.",
    ["Enhance the Blizzard tracker"] = "Potenzia il tracker di Blizzard",
    ["Show distance on tracked quests"] = "Mostra la distanza sulle missioni monitorate",
    ["Notifications"] = "Notifiche",
    ["Show notifications"] = "Mostra le notifiche",
    ["A short message in the middle of the screen."] = "Un breve messaggio al centro dello schermo.",
    ["Quest complete and turned in"] = "Missione completata e consegnata",
    ["Next objective"] = "Obiettivo successivo",
    ["Play a sound"] = "Riproduci un suono",
    ["Preview"] = "Anteprima",
    ["PandaQuest is ready."] = "PandaQuest è pronto.",
    ["Synchronisation (optional)"] = "Sincronizzazione (facoltativa)",
    ["Optional. PandaQuest works fully without it, and never uploads anything itself."] =
        "Facoltativa. PandaQuest funziona completamente anche senza e non carica mai nulla da solo.",
    ["Record quest data"] = "Registra i dati delle missioni",
    ["Record movement breadcrumbs"] = "Registra le tracce degli spostamenti",
    ["Occasional position samples that improve community routes."] =
        "Rilevamenti occasionali della posizione che migliorano i percorsi della community.",
    ["Breadcrumb interval (seconds)"] = "Intervallo delle tracce (secondi)",
    ["Sessions to keep"] = "Sessioni da conservare",
    ["Events per session"] = "Eventi per sessione",
    ["Advanced"] = "Avanzate",
    ["Log level"] = "Livello di log",
    ["How much PandaQuest prints to chat."] = "Quanto PandaQuest scrive in chat.",
    ["Errors"] = "Errori",
    ["Warnings"] = "Avvisi",
    ["Info"] = "Info",
    ["Debug"] = "Debug",
    ["Trace"] = "Trace",
    ["Arrow debug output"] = "Output di debug della freccia",
    ["Prints the bearing values used by the arrow."] = "Stampa i valori di direzione usati dalla freccia.",
    ["Redraw map pins"] = "Ridisegna i segnaposto della mappa",
    ["Print status to chat"] = "Stampa lo stato in chat",
    ["Profiles"] = "Profili",
    ["Options are not available; use /pq help for chat commands."] =
        "Le opzioni non sono disponibili; usa /pq help per i comandi della chat.",

    -- UI (minimap button, tracker, notifications, Wowhead)
    ["Distance unknown"] = "Distanza sconosciuta",
    ["Left-click: browse all quests"] = "Clic sinistro: sfoglia tutte le missioni",
    ["Right-click: open options"] = "Clic destro: apri le opzioni",
    ["Press Ctrl+C to copy the link:"] = "Premi Ctrl+C per copiare il link:",
    ["Navigate to this quest"] = "Naviga verso questa missione",
    ["the quest giver"] = "chi ha assegnato la missione",
    ["unknown distance"] = "distanza sconosciuta",
    ["%s complete"] = "%s completata",
    ["Turned in: %s"] = "Consegnata: %s",

    -- Sync (telemetry, community data)
    ["Telemetry: %s"] = "Telemetria: %s",
    ["Events recorded this session: %d (%d dropped)"] = "Eventi registrati in questa sessione: %d (%d scartati)",
    ["Sessions stored: %d, waiting for upload: %d"] = "Sessioni salvate: %d, in attesa di caricamento: %d",
    ["Last upload confirmed: %s"] = "Ultimo caricamento confermato: %s",
    ["never"] = "mai",
    ["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] =
        "Non viene registrato nulla finché la telemetria è disattivata. Riattivala in /pq options.",
    ["No community data yet."] = "Ancora nessun dato della community.",
    ["Community data from %s"] = "Dati della community del %s",
    ["Last gear snapshot: %s"] = "Ultimo snapshot dell'equipaggiamento: %s",
    ["Gear snapshots: off."] = "Snapshot dell'equipaggiamento: disattivati.",

    -- Sync / Consent
    ["/pq consent - ask the data sharing question again"] =
        "/pq consent - ripeti la domanda sulla condivisione dei dati",
    ["PandaQuest can send what you do while questing to the community hub."] =
        "PandaQuest può inviare all'hub della community ciò che fai mentre completi le missioni.",
    ["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] =
        "Cioè le missioni che accetti e porti a termine, ciò che uccidi e saccheggi, dove muori e la tua posizione sulla mappa con l'orario.",
    ["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] =
        "Serve a costruire i percorsi condivisi delle missioni. Resta disattivato finché non accetti, e puoi interromperlo ed eliminare i dati quando vuoi.",
    ["PandaQuest can share your quest data to build the community routes."] =
        "PandaQuest può condividere i dati delle tue missioni per costruire i percorsi della community.",
    ["It is off. Turn it on in /pq options if you want to take part."] =
        "È disattivato. Attivalo in /pq options se vuoi partecipare.",
    ["Share my quest data"] = "Condividi i dati delle mie missioni",
    ["No thanks"] = "No, grazie",
    ["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] =
        "Grazie. PandaQuest condividerà i dati delle tue missioni. Puoi disattivarlo in qualsiasi momento con /pq sync.",
    ["Nothing will be collected. Turn it on any time in /pq options."] =
        "Non verrà raccolto nulla. Puoi attivarlo in qualsiasi momento in /pq options.",

    -- Auction house: the scan, the invoices, the tooltip and the options section
    ["Scan prices"] = "Scansiona prezzi",
    ["Stop scan (%d%%)"] = "Ferma scansione (%d%%)",
    ["Scanning the auction house. Keep the window open; closing it cancels the scan."] =
        "Scansione della casa d'aste in corso. Tieni aperta la finestra: chiuderla annulla la scansione.",
    ["Auction house scan finished: %d auctions of %d items in %s."] =
        "Scansione della casa d'aste terminata: %d aste per %d oggetti in %s.",
    ["The scan stopped at %d auctions to keep the saved file small."] =
        "La scansione si è fermata a %d aste per mantenere piccolo il file salvato.",
    ["A scan is already running."] = "Una scansione è già in corso.",
    ["Open the auction house first, then press Scan prices or type /pq scan."] =
        "Apri prima la casa d'aste, poi premi Scansiona prezzi o digita /pq scan.",
    ["This client offers no auction house listing PandaQuest can read."] =
        "Questo client non offre alcun elenco della casa d'aste che PandaQuest possa leggere.",
    ["Scan cancelled: the auction house window was closed."] =
        "Scansione annullata: la finestra della casa d'aste è stata chiusa.",
    ["Scan stopped: the auction house did not answer."] =
        "Scansione interrotta: la casa d'aste non ha risposto.",
    ["Scan stopped. Nothing was saved."] = "Scansione interrotta. Non è stato salvato nulla.",
    ["The auction house sent an empty listing. Nothing was saved."] =
        "La casa d'aste ha inviato un elenco vuoto. Non è stato salvato nulla.",
    ["No scan is running."] = "Nessuna scansione in corso.",
    ["Scanning: %d%% (%d auctions read)."] = "Scansione: %d%% (%d aste lette).",
    ["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."] =
        "Ultima scansione di %s (%s, %s): %d aste per %d oggetti, %s fa.",
    ["No auction house scan yet for this realm."] = "Nessuna scansione della casa d'aste per questo reame.",
    ["AH minimum buyout"] = "Acquisto immediato minimo (CdA)",
    ["AH market value"] = "Valore di mercato (CdA)",
    ["bids only"] = "solo offerte",
    ["%s, scanned %s ago"] = "%s, scansionato %s fa",
    ["Auction house"] = "Casa d'aste",
    ["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] =
        "PandaQuest non esegue mai scansioni da solo. Premi Scansiona prezzi nella finestra della casa d'aste, oppure digita /pq scan mentre è aperta.",
    ["Show the scan button on the auction house window"] =
        "Mostra il pulsante di scansione nella finestra della casa d'aste",
    ["Show auction prices on item tooltips"] = "Mostra i prezzi d'asta nei tooltip degli oggetti",
    ["The lowest buyout and the market value from your last scan on this realm, with how old it is."] =
        "L'acquisto immediato più basso e il valore di mercato dell'ultima scansione su questo reame, con il tempo trascorso.",
    ["Record my auction sales and purchases"] = "Registra le mie vendite e i miei acquisti all'asta",
    ["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."] =
        "Letti dalle fatture d'asta nella tua cassetta delle lettere. Vengono conservati l'oggetto, la quantità e il prezzo, mai il nome dell'altro giocatore.",
    -- Professions: the recipe scan, its refusals and the options section
    ["/pq scan professions - read the open profession window"] =
        "/pq scan professions - leggi la finestra della professione aperta",
    ["/pq scan archaeology - read your archaeology window"] =
        "/pq scan archaeology - leggi la finestra di Archeologia",
    ["/pq digsite - show the dig site bar so you can move it"] =
        "/pq digsite - mostra la barra del sito di scavo per poterla spostare",
    ["A profession scan is already running."] = "Una scansione delle professioni è già in corso.",
    ["Open a profession window first, then type /pq scan professions."] =
        "Apri prima una finestra di professione, poi digita /pq scan professions.",
    ["This client does not offer the recipe list PandaQuest reads."] =
        "Questo client non offre l'elenco delle ricette che PandaQuest legge.",
    ["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] =
        "Quella finestra è il libro delle ricette di un altro giocatore, aperto da un link. PandaQuest non lo registra.",
    ["This profession window lists no recipes."] = "Questa finestra di professione non elenca alcuna ricetta.",
    ["The profession list has not arrived from the server yet. Try again in a moment."] =
        "L'elenco della professione non è ancora arrivato dal server. Riprova tra un attimo.",
    ["Nothing was saved: not one recipe in this window could be read whole."] =
        "Non è stato salvato nulla: nessuna ricetta di questa finestra è stata letta per intero.",
    ["The profession window changed while it was being read. Nothing was saved."] =
        "La finestra della professione è cambiata durante la lettura. Non è stato salvato nulla.",
    ["The window was read short, so the recipe book you already have was kept."] =
        "La finestra è stata letta in modo incompleto, quindi è stato conservato il libro delle ricette che avevi già.",
    ["Profession scan cancelled: the window was closed."] =
        "Scansione della professione annullata: la finestra è stata chiusa.",
    ["Profession scan stopped. Nothing was saved."] =
        "Scansione della professione interrotta. Non è stato salvato nulla.",
    ["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."] =
        "PandaQuest non toccherà la finestra della professione: non può ripristinare %s com'era prima.",
    ["PandaQuest could not put your profession window back exactly as you left it."] =
        "PandaQuest non è riuscito a riportare la finestra della professione esattamente come l'avevi lasciata.",
    ["Profession scan finished: %s %d/%d, %d recipes in %s."] =
        "Scansione della professione terminata: %s %d/%d, %d ricette in %s.",
    ["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."] =
        "%d ricette sono state escluse perché il gioco non aveva finito di caricarle. Riapri la finestra per completarle.",
    ["The scan stopped at %d recipes to keep the saved file small."] =
        "La scansione si è fermata a %d ricette per mantenere piccolo il file salvato.",
    ["Last scan of %s (%d/%d): %d recipes, %s ago."] = "Ultima scansione di %s (%d/%d): %d ricette, %s fa.",
    ["No profession has been scanned on this character yet."] =
        "Nessuna professione è ancora stata scansionata su questo personaggio.",
    ["Professions"] = "Professioni",
    ["PandaQuest reads an open profession window once and puts your filters and collapsed categories back."] =
        "PandaQuest legge una volta la finestra di una professione aperta e rimette a posto i tuoi filtri e le categorie compresse.",
    ["Read my recipes when I open a profession"] = "Leggi le mie ricette quando apro una professione",
    ["The recipes, their reagents and how hard each is for this character. Never a book opened from a link."] =
        "Le ricette, i loro reagenti e la difficoltà di ciascuna per questo personaggio. Mai un libro aperto da un link.",

    -- Flight master
    ["Flight time:"] = "Tempo di volo:",
    ["~%s (%d flight)"] = "~%s (%d volo)",
    ["~%s (%d flights)"] = "~%s (%d voli)",
    ["~%s left (%d flights)"] = "~%s rimanenti (%d voli)",
    ["%s in the air"] = "%s in volo",
    ["Flight progress"] = "Avanzamento del volo",
    ["The flight bar is switched off in /pq options."] = "La barra del volo è disattivata in /pq options.",
    ["The flight bar is locked. Unlock it in /pq options to move it."] =
        "La barra del volo è bloccata. Sbloccala in /pq options per spostarla.",
    ["Drag the flight bar where you want it. It hides itself again in a moment."] =
        "Trascina la barra del volo dove preferisci. Si nasconderà di nuovo tra un attimo.",
    ["/pq flight - show the flight bar so you can drag it"] =
        "/pq flight - mostra la barra del volo per poterla trascinare",
    ["Flight master"] = "Maestro di volo",
    ["PandaQuest times your own flights and shows what it measured. A route you have never flown shows nothing at all."] =
        "PandaQuest cronometra i tuoi voli e mostra ciò che ha misurato. Una tratta di volo che non hai mai percorso non mostra nulla.",
    ["Show the flight time at the flight master"] = "Mostra il tempo di volo presso il Maestro di volo",
    ["One line in the destination's tooltip, with how many of your own flights it rests on."] =
        "Una riga nel tooltip della destinazione, con il numero dei tuoi voli su cui si basa.",
    ["Show the progress bar while flying"] = "Mostra la barra di avanzamento durante il volo",
    ["Progress and remaining time once the route has been flown twice; before that, only the time in the air."] =
        "Avanzamento e tempo rimanente dopo che la tratta di volo è stata percorsa due volte; prima, solo il tempo in volo.",
    -- Archaeology
    ["This client does not offer the archaeology data PandaQuest reads."] =
        "Questo client non offre i dati di Archeologia che PandaQuest legge.",
    ["This character has no archaeology races to read yet."] =
        "Questo personaggio non ha ancora razze di Archeologia da leggere.",
    ["Your artifact history has not arrived yet, so the archaeology PandaQuest already had was kept."] =
        "La cronologia dei tuoi reperti non è ancora arrivata, quindi sono stati conservati i dati di Archeologia che PandaQuest aveva già.",
    ["No archaeology has been read on this character yet."] =
        "Nessun dato di Archeologia è ancora stato letto su questo personaggio.",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] =
        "Archeologia %d/%d: %d razze, %d reperti, letta %s fa.",
    ["Archaeology %d: %d races, %d artifacts, read %s ago."] =
        "Archeologia %d: %d razze, %d reperti, letta %s fa.",
    ["Archaeology: %d races, %d artifacts, read %s ago."] =
        "Archeologia: %d razze, %d reperti, letta %s fa.",
    ["Archaeology read: %d races, %d artifacts."] = "Archeologia letta: %d razze, %d reperti.",
    ["The server has not sent your artifact history, so completion counts were left out."] =
        "Il server non ha inviato la cronologia dei tuoi reperti, quindi i conteggi di completamento sono stati omessi.",
    ["Archaeology"] = "Archeologia",
    ["Mists never shipped a dig site progress bar. PandaQuest draws one from the events the game already sends."] =
        "Mists of Pandaria non ha mai incluso una barra di avanzamento del sito di scavo. PandaQuest ne disegna una a partire dagli eventi che il gioco già invia.",
    ["Read my archaeology when I open the window"] = "Leggi la mia Archeologia quando apro la finestra",
    ["Your races, their keystone, your fragments and the artifacts you have. Only this character's own."] =
        "Le tue razze, la loro pietra chiave, i tuoi frammenti e i reperti che possiedi. Solo quelli di questo personaggio.",
    ["Dig site progress bar"] = "Barra di avanzamento del sito di scavo",
    ["Show the dig site progress bar"] = "Mostra la barra di avanzamento del sito di scavo",
    ["Appears when you survey and hides when you leave the dig site."] =
        "Appare quando perlustri e si nasconde quando lasci il sito di scavo.",
    ["Lock the bar in place"] = "Blocca la barra nella posizione attuale",
    ["Unlocked, it can be dragged with the left mouse button."] =
        "Se sbloccata, si può trascinare con il tasto sinistro del mouse.",
    ["Bar size"] = "Dimensione della barra",
    ["Show me where it is"] = "Mostrami dov'è",
    ["Puts an empty bar on screen for a moment so you can find it, and drag it when it is unlocked."] =
        "Mostra per un momento una barra vuota sullo schermo, così puoi trovarla e, se è sbloccata, trascinarla.",
    ["Reset bar position"] = "Reimposta la posizione della barra",
    ["Dig site progress"] = "Avanzamento del sito di scavo",
    ["Dig site complete"] = "Sito di scavo completato",
    ["This client draws its own dig site progress bar."] =
        "Questo client disegna già una propria barra di avanzamento del sito di scavo.",
    ["The dig site bar is switched off in /pq options."] =
        "La barra del sito di scavo è disattivata in /pq options.",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "Trascina la barra del sito di scavo dove preferisci. Si nasconderà di nuovo tra un attimo.",
    ["The dig site bar is locked. Unlock it in /pq options to move it."] =
        "La barra del sito di scavo è bloccata. Sbloccala in /pq options per spostarla.",

    -- Database/QuestieDB (the optional QuestieDB addon)
    ["Quest database source"] = "Fonte del database delle missioni",
    ["Uses the QuestieDB addon, if it is installed and enabled, to complete PandaQuest's own database. Takes effect after /reload."] =
        "Usa l'addon QuestieDB, se è installato e abilitato, per completare il database di PandaQuest. Ha effetto dopo /reload.",
    ["PandaQuest only"] = "Solo PandaQuest",
    ["Fill gaps from QuestieDB"] = "Colma le lacune con QuestieDB",
    ["QuestieDB values first"] = "Valori di QuestieDB per primi",
    ["QuestieDB: %s"] = "QuestieDB: %s",
    ["QuestieDB: %s (%d entries added, %d refreshed)"] = "QuestieDB: %s (%d voci aggiunte, %d aggiornate)",
    ["not used (off)"] = "non in uso (disattivato)",
    ["not installed"] = "non installato",
    ["cannot be used (%s)"] = "non utilizzabile (%s)",
    ["not read yet"] = "non ancora letto",

    -- Quest browser, quest database source, language selection
    ["/pq quests [questID] - browse every quest in the database"] = "/pq quests [questID] - sfoglia tutte le missioni del database",
    ["Name"] = "Nome",
    ["Level"] = "Liv.",
    ["to"] = "a",
    ["My level"] = "Mio livello",
    ["My side"] = "Mia fazione",
    ["Alliance"] = "Alleanza",
    ["Horde"] = "Orda",
    ["Both"] = "Entrambe",
    ["both factions"] = "entrambe le fazioni",
    ["Dungeon"] = "Spediz.",
    ["Raid"] = "Incurs.",
    ["Group"] = "Gruppo",
    ["PvP"] = "PvP",
    ["Daily"] = "Giornal.",
    ["Event"] = "Evento",
    ["Reset"] = "Azzera",
    ["All quests"] = "Tutte le missioni",
    ["%d quests"] = "Missioni: %d",
    ["No quest matches these filters."] = "Nessuna missione corrisponde a questi filtri.",
    ["Reading the quest database..."] = "Lettura del database delle missioni...",
    ["Quest"] = "Missione",
    ["Zone"] = "Zona",
    ["Req."] = "Min.",
    ["XP"] = "XP",
    ["A level %d quest for %s, from level %d."] = "Missione di livello %d (%s), disponibile dal livello %d.",
    ["%d experience"] = "%d punti esperienza",
    ["Not in the database."] = "Non presente nel database.",
    ["requires level"] = "richiede il livello",
    ["Yes"] = "Sì",
    ["No"] = "No",
    ["No location is known for this quest."] = "Nessuna posizione nota per questa missione.",
    ["Navigating to: %s"] = "Navigazione verso: %s",
    ["Start"] = "Inizio",
    ["End"] = "Fine",
    ["Difficulty"] = "Difficoltà",
    ["Side"] = "Fazione",
    ["Shareable"] = "Condivisib.",
    ["Quest ID"] = "ID missione",
    ["Rewards"] = "Ricompense",
    ["Navigate"] = "Naviga",
    ["Pick a quest from the list to see its page."] = "Scegli una missione dall'elenco per vederne la pagina.",
    ["Quests"] = "Missioni",
    ["Shift-click: toggle the arrow"] = "Maiusc-clic: mostra o nascondi la freccia",
    -- Beta notice and animation options
    ["This is a beta build: new features are not yet confirmed in the game."] =
        "Questa è una versione beta: le nuove funzioni non sono ancora confermate nel gioco.",
    ["Animations"] =
        "Animazioni",
    ["Windows fade and settle, messages slide in, bars glide. Switch it off for a calmer interface."] =
        "Le finestre appaiono in dissolvenza e si assestano, i messaggi scorrono e le barre avanzano con fluidità. Disattiva per un'interfaccia più calma.",
    ["Turn all interface motion on or off."] =
        "Attiva o disattiva tutto il movimento dell'interfaccia.",
    ["Animation speed"] =
        "Velocità delle animazioni",
    ["1 is normal; 2 is twice as fast, 0.5 half as fast."] =
        "1 è normale; 2 è il doppio più veloce, 0,5 la metà.",
    -- Options: language, tools
    ["Categories"] = "Categorie",
    ["Loosen a filter, or press Reset."] = "Allenta un filtro o premi Azzera.",
    ["Open the quest browser"] = "Apri il browser delle missioni",
    ["Browse every quest in the database, with a page and a map for each."] =
        "Sfoglia tutte le missioni del database, con una pagina e una mappa per ciascuna.",
    ["Choose the language of PandaQuest's texts. Automatic follows the game's language."] =
        "Scegli la lingua dei testi di PandaQuest. Automatico segue la lingua del gioco.",
    ["Automatic (game language)"] = "Automatico (lingua del gioco)",
    ["Reload the interface"] = "Ricarica l'interfaccia",
    ["Reloads the game's interface so a changed language applies everywhere."] =
        "Ricarica l'interfaccia del gioco in modo che il cambio di lingua si applichi ovunque.",
    ["Tools"] = "Strumenti",
    ["Everything the chat commands do, as buttons. Nothing here needs a command."] =
        "Tutto ciò che fanno i comandi della chat, sotto forma di pulsanti. Qui non serve alcun comando.",
    ["Skip the current target"] = "Salta la destinazione attuale",
    ["Moves the arrow on to the next target."] = "Sposta la freccia sulla destinazione successiva.",
    ["Stop following the pinned quest"] = "Smetti di seguire la missione fissata",
    ["Clears the quest pinned with the focus setting or the map's right-click menu."] =
        "Rimuove la missione fissata con l'impostazione 'Missione scelta' o con il menu del clic destro sulla mappa.",
    ["Reset arrow position and map pins"] = "Reimposta freccia e segnaposto",
    ["Wowhead link for the current target"] = "Link Wowhead: destinazione attuale",
    ["%d quests are hidden from the navigator."] = "%d missioni sono nascoste dal navigatore.",
    ["Show all hidden quests again"] = "Mostra di nuovo le missioni nascoste",
    ["Reading windows"] = "Lettura delle finestre",
    ["Read my professions now"] = "Leggi ora le mie professioni",
    ["Open the profession window first."] = "Apri prima la finestra della professione.",
    ["Read my archaeology now"] = "Leggi ora la mia Archeologia",
    ["Open the archaeology window first."] = "Apri prima la finestra di Archeologia.",
    ["Show synchronisation status"] = "Mostra lo stato di sincronizzazione",
    ["Ask the data sharing question"] = "Ripeti la domanda sulla condivisione",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.itIT = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "itIT")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
