-- Locales/frFR.lua: frFR translation. Keys are the English text from Locales/enUS.lua.
-- luacheck: max line length 220
local _, ns = ...

local T = {
    ["PandaQuest %s loaded. Type /pq for options, /pq help for commands."] =
        "PandaQuest %s chargé. Tapez /pq pour les options, /pq help pour les commandes.",
    ["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."] =
        "Bienvenue dans PandaQuest ! La flèche indique votre prochain objectif de quête. Tapez /pq help pour les commandes.",
    ["%s is not available yet."] = "%s n'est pas encore disponible.",
    ["Unknown command: %s"] = "Commande inconnue : %s",
    ["Available commands:"] = "Commandes disponibles :",
    ["/pq - open options"] = "/pq - ouvrir les options",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - afficher/masquer la flèche de navigation",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] =
        "/pq target [questID|clear] - épingler une quête (ou afficher la cible actuelle)",
    ["/pq next - skip the current target"] = "/pq next - passer la cible actuelle",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - unités de distance",
    ["/pq wh [questID] - Wowhead link"] = "/pq wh [questID] - lien Wowhead",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <questID> - masquer une quête du navigateur",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <questID> - afficher de nouveau une quête masquée",
    ["/pq reset - reset arrow position and map pins"] = "/pq reset - réinitialiser la position de la flèche et les marqueurs de la carte",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - niveau de journal",
    ["/pq dump quest|npc|object|item <id> - print database entry"] =
        "/pq dump quest|npc|object|item <id> - afficher une entrée de la base de données",
    ["/pq status - addon status"] = "/pq status - état de l'addon",
    ["/pq sync - telemetry and community data status"] = "/pq sync - état de la télémétrie et des données de la communauté",
    ["/pq lang auto|<locale> - interface language"] = "/pq lang auto|<locale> - langue de l'interface",
    ["Available languages: %s"] = "Langues disponibles : %s",
    ["Units: %s"] = "Unités : %s",
    ["meters"] = "mètres",
    ["yards"] = "yards",
    ["Usage: %s"] = "Utilisation : %s",
    ["Log level: %d (%s)"] = "Niveau de journal : %d (%s)",
    ["Arrow debug: %s"] = "Débogage de la flèche : %s",
    ["Language: %s (reload the UI to apply everywhere)"] = "Langue : %s (recharger l'interface pour l'appliquer partout)",
    ["Enabled"] = "Activé",
    ["Disabled"] = "Désactivé",
    ["Quest %d hidden."] = "Quête %d masquée.",
    ["Quest %d is visible again."] = "La quête %d est de nouveau visible.",
    ["Current target: %s"] = "Cible actuelle : %s",
    ["No current target."] = "Aucune cible actuelle.",
    ["No target found for quest %d."] = "Aucune cible trouvée pour la quête %d.",
    ["Not found: %s %d"] = "Introuvable : %s %d",
    ["Version %s"] = "Version %s",
    ["Built %s from %s"] = "Compilé le %s depuis %s",
    ["This is a build from a modified working tree; it is not a release."] =
        "Version compilée depuis une arborescence de travail modifiée ; ce n'est pas une version publiée.",
    ["Database: %s"] = "Base de données : %s",
    ["ready"] = "prête",
    ["loading"] = "chargement en cours",
    ["Quests in log: %d"] = "Quêtes dans le journal : %d",
    ["Targets: %d"] = "Cibles : %d",
    ["Background jobs: %d"] = "Tâches en arrière-plan : %d",
    ["Telemetry: %s, sessions stored: %d"] = "Télémétrie : %s, sessions enregistrées : %d",
    ["Community data: %s"] = "Données de la communauté : %s",
    ["none"] = "aucune",
    ["Arrow position and pins reset."] = "Position de la flèche et marqueurs réinitialisés.",
    ["Profile changed: %s"] = "Profil modifié : %s",

    -- Action texts, used by Objectives.DescribeTarget
    ["Kill %s (%d/%d)"] = "Tuer %s (%d/%d)",
    ["Talk to %s"] = "Parler à %s",
    ["Loot %s from %s (%d/%d)"] = "Récupérer %s sur %s (%d/%d)",
    ["Collect %s from %s (%d/%d)"] = "Collecter %s sur %s (%d/%d)",
    ["Use %s (%d/%d)"] = "Utiliser %s (%d/%d)",
    ["Use %s on %s"] = "Utiliser %s sur %s",
    ["Explore %s"] = "Explorer %s",
    ["Turn in to %s"] = "Rendre la quête à %s",
    ["Pick up quest from %s"] = "Prendre la quête auprès de %s",
    ["Kill %s"] = "Tuer %s",
    ["Loot %s from %s"] = "Récupérer %s sur %s",

    -- Shared UI strings
    ["Click: next target"] = "Clic : cible suivante",
    ["Next: %s"] = "Suivant : %s",
    ["%s complete - turn in to %s (%s)"] = "%s : quête terminée - rendre à %s (%s)",
    ["Community: avg %s"] = "Communauté : moy. %s",

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "Base de données prête : %d quêtes, %d PNJ, %d objets du monde, %d objets (%d ms).",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "Base de données PandaQuest introuvable. Réinstaller l'addon : les fichiers Database/Data sont manquants.",

    -- Nav (arrow, router, TomTom)
    ["Arrow locked."] = "Flèche verrouillée.",
    ["Arrow unlocked - drag it to move."] = "Flèche déverrouillée - la faire glisser pour la déplacer.",
    ["Close"] = "Fermer",
    ["Custom target"] = "Cible personnalisée",
    ["Distance"] = "Distance",
    ["ETA"] = "Arrivée dans",
    ["Hide this quest"] = "Masquer cette quête",
    ["Lock arrow"] = "Verrouiller la flèche",
    ["Next target"] = "Cible suivante",
    ["Reset arrow position"] = "Réinitialiser la position de la flèche",
    ["Right-click: arrow menu"] = "Clic droit : menu de la flèche",
    ["Send to TomTom"] = "Envoyer à TomTom",
    ["Shift-click: send to TomTom"] = "Maj-clic : envoyer à TomTom",
    ["Show distance in metres"] = "Afficher la distance en mètres",
    ["Show distance in yards"] = "Afficher la distance en yards",
    ["Show on map"] = "Afficher sur la carte",
    ["TomTom is not loaded."] = "TomTom n'est pas chargé.",
    ["Unlock arrow"] = "Déverrouiller la flèche",
    ["Wowhead link"] = "Lien Wowhead",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "%d apparitions ici",
    ["Left-click: navigate here"] = "Clic gauche : naviguer ici",
    ["Right-click: more options"] = "Clic droit : plus d'options",
    ["Set as target"] = "Définir comme cible",
    ["Hide quest: %s"] = "Masquer la quête : %s",
    ["Wowhead: %s"] = "Wowhead : %s",
    ["Starts: %s"] = "Début : %s",
    ["Turn in: %s"] = "Rendre : %s",
    ["Ends: %s"] = "Fin : %s",

    -- Map/NodeTooltip
    ["Level:"] = "Niveau :",
    ["Type:"] = "Type :",
    ["Skill:"] = "Compétence :",
    ["Respawn:"] = "Réapparition :",
    ["Respawn in:"] = "Réapparition dans :",
    ["~%s (%d)"] = "~%s (%d)",
    ["Sightings:"] = "Observations :",
    ["Found by you:"] = "Trouvé par vous :",
    ["Also here:"] = "Aussi ici :",
    ["Unit"] = "Unité",
    ["Object"] = "Objet du monde",
    ["Item"] = "Objet",
    ["Area"] = "Zone",
    ["%d Sec"] = "%d seconde",
    ["%d Secs"] = "%d secondes",
    ["%d Min"] = "%d minute",
    ["%d Mins"] = "%d minutes",
    ["%d Hour"] = "%d heure",
    ["%d Hours"] = "%d heures",

    -- UI/Options
    ["General"] = "Général",
    ["PandaQuest works out of the box. Everything below is optional."] =
        "PandaQuest fonctionne dès l'installation. Tout ce qui suit est facultatif.",
    ["Distance units"] = "Unités de distance",
    ["Metres are shown as '123 m', yards as '135 yd'."] = "Les mètres s'affichent sous la forme '123 m', les yards sous la forme '135 yd'.",
    ["Show minimap button"] = "Afficher le bouton de la minicarte",
    ["Left-click the minimap button to toggle the arrow, right-click for these options."] =
        "Clic gauche sur le bouton de la minicarte : afficher/masquer la flèche ; clic droit : ces options.",
    ["Language"] = "Langue",
    ["PandaQuest follows your game language; /pq lang overrides it."] =
        "PandaQuest suit la langue du jeu ; /pq lang permet de la modifier.",
    ["Arrow"] = "Flèche",
    ["Show the arrow"] = "Afficher la flèche",
    ["Hide it to navigate by map pins only."] = "La masquer pour naviguer uniquement avec les marqueurs de la carte.",
    ["Lock the arrow in place"] = "Verrouiller la flèche",
    ["When unlocked, drag the arrow to move it."] = "Déverrouillée, la flèche se déplace par glisser-déposer.",
    ["Show quest text"] = "Afficher le texte de la quête",
    ["Quest name and the action to take under the arrow."] = "Nom de la quête et action à effectuer sous la flèche.",
    ["Show travel time"] = "Afficher le temps de trajet",
    ["Estimated time to the target at your current speed."] = "Temps estimé jusqu'à la cible à votre vitesse actuelle.",
    ["Show community timings"] = "Afficher les durées de la communauté",
    ["Average completion time collected from other players, when available."] =
        "Temps de réalisation moyen relevé auprès d'autres joueurs, lorsqu'il est disponible.",
    ["Hide inside instances"] = "Masquer dans les instances",
    ["The arrow cannot guide you inside a dungeon or raid."] = "La flèche ne peut pas guider dans un donjon ou un raid.",
    ["Flash on arrival"] = "Lueur à l'arrivée",
    ["A short glow when you reach the target."] = "Une brève lueur lorsque la cible est atteinte.",
    ["Appearance"] = "Apparence",
    ["Size"] = "Taille",
    ["Arrow size relative to the default."] = "Taille de la flèche par rapport à la valeur par défaut.",
    ["Opacity"] = "Opacité",
    ["Text size"] = "Taille du texte",
    ["Reset position"] = "Réinitialiser la position",
    ["Moves the arrow back to the middle of the screen."] = "Replace la flèche au centre de l'écran.",
    ["Navigation"] = "Navigation",
    ["Target selection"] = "Sélection de la cible",
    ["Auto weighs priority and distance; Focused quest follows one quest."] =
        "Auto tient compte de la priorité et de la distance ; Quête focalisée suit une seule quête.",
    ["Auto"] = "Auto",
    ["Focused quest"] = "Quête focalisée",
    ["Nearest"] = "Plus proche",
    ["Focused quest ID"] = "ID de la quête focalisée",
    ["Used by 'Focused quest'. Empty follows the quest you track in the log."] =
        "Utilisé par « Quête focalisée ». Si vide, la quête suivie dans le journal est utilisée.",
    ["Route to turn-ins"] = "Itinéraire vers les quêtes à rendre",
    ["Completed quests are routed back to their quest giver."] = "Les quêtes terminées renvoient vers leur donneur de quête.",
    ["Route to new quests"] = "Itinéraire vers les nouvelles quêtes",
    ["Nearby quests you could pick up are added to the route."] =
        "Les quêtes proches que vous pouvez prendre sont ajoutées à l'itinéraire.",
    ["New quest radius"] = "Rayon des nouvelles quêtes",
    ["How far away a pickup may be to be routed to (yards)."] =
        "Distance maximale d'une quête à prendre pour être ajoutée à l'itinéraire (yards).",
    ["Maximum new quests"] = "Nombre maximal de nouvelles quêtes",
    ["How many pickups are routed at once."] = "Nombre de quêtes à prendre ajoutées à l'itinéraire en même temps.",
    ["Arrival radius"] = "Rayon d'arrivée",
    ["How close you must get before a target counts as reached (yards)."] =
        "Distance à atteindre pour qu'une cible compte comme atteinte (yards).",
    ["TomTom"] = "TomTom",
    ["TomTom waypoints"] = "Points de passage TomTom",
    ["Mirror sends the current target to TomTom as a waypoint."] = "Reproduire envoie la cible actuelle à TomTom comme point de passage.",
    ["Off"] = "Désactivé",
    ["Mirror current target"] = "Reproduire la cible actuelle",
    ["Map"] = "Carte",
    ["Show objective pins"] = "Afficher les marqueurs d'objectifs",
    ["Where to go for the quests in your log."] = "Où aller pour les quêtes de votre journal.",
    ["Show turn-in pins"] = "Afficher les marqueurs de remise de quête",
    ["Quest givers waiting for a completed quest."] = "Donneurs de quête qui attendent une quête terminée.",
    ["Show available quest pins"] = "Afficher les marqueurs des quêtes disponibles",
    ["Quests you could pick up."] = "Quêtes que vous pouvez prendre.",
    ["Show pins on the minimap"] = "Afficher les marqueurs sur la minicarte",
    ["Keep distant pins on the minimap edge"] = "Garder les marqueurs lointains au bord de la minicarte",
    ["Off hides a pin as soon as it leaves the minimap."] = "Si désactivé, un marqueur est masqué dès qu'il sort de la minicarte.",
    ["Merge nearby spawns"] = "Regrouper les apparitions proches",
    ["One pin for a pack of mobs instead of a dozen."] = "Un seul marqueur pour un groupe de monstres au lieu d'une douzaine.",
    ["Pin size"] = "Taille des marqueurs",
    ["Map pin size"] = "Taille des marqueurs de la carte",
    ["Minimap pin size"] = "Taille des marqueurs de la minicarte",
    -- Map/Pins, Map/Icons
    ["Objective dot size"] = "Taille des points d'objectif",
    ["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."] =
        "Les objectifs et les points de récolte sont de petits points, colorés par quête ou par type ; les donneurs de quête gardent leurs icônes.",
    ["Maximum minimap pins"] = "Nombre maximal de marqueurs sur la minicarte",
    ["When there are more, the ones nearest to you are kept."] = "S'il y en a davantage, les plus proches de vous sont conservés.",
    ["Minimap edge fade"] = "Fondu au bord de la minicarte",
    ["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] =
        "Les marqueurs s'estompent et rétrécissent au-delà de cette part du chemin vers le bord de la minicarte. 0 le désactive.",
    ["Which quests to show"] = "Quêtes à afficher",
    ["Show low level quests"] = "Afficher les quêtes de bas niveau",
    ["Quests that are grey for your level."] = "Quêtes grises pour votre niveau.",
    ["Show repeatable and daily quests"] = "Afficher les quêtes répétables et journalières",
    ["Show dungeon quests"] = "Afficher les quêtes de donjon",
    ["Show raid quests"] = "Afficher les quêtes de raid",
    ["Show PvP quests"] = "Afficher les quêtes JcJ",
    ["Show pet battle quests"] = "Afficher les quêtes de combats de mascottes",

    -- Nodes/Professions
    ["Gathering"] = "Récolte",
    ["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] =
        "Minerai, herbes, bancs de poissons, coffres et créatures rares, affichés uniquement là où vous ou la communauté en avez réellement trouvé.",
    ["Show gathering nodes"] = "Afficher les points de récolte",
    ["Turns the whole layer off, whatever the boxes below say."] = "Désactive toute la couche, quelles que soient les cases ci-dessous.",
    ["Which nodes"] = "Quels points",
    ["Mining veins"] = "Filons de minerai",
    ["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] =
        "Filons de minerai. Masqués si votre compétence en Minage est trop faible, sauf si vous affichez aussi ceux-ci.",
    ["Herbs"] = "Herbes",
    ["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] =
        "Emplacements d'herbes. Masqués si votre compétence en Herboristerie est trop faible, sauf si vous affichez aussi ceux-ci.",
    ["Fishing pools"] = "Bancs de poissons",
    ["Fishing pools on lakes, rivers and the coast."] = "Bancs de poissons sur les lacs, les rivières et la côte.",
    ["Chests and treasures"] = "Coffres et trésors",
    ["Chests and lockboxes in the world; no gathering skill filters these."] =
        "Coffres et coffrets verrouillés du monde ; aucune compétence de récolte ne les filtre.",
    ["Rare spawns"] = "Créatures rares",
    ["Rare creatures, at the places a rare was looted."] = "Créatures rares, là où le butin d'une créature rare a été récupéré.",
    ["Which of them you can gather"] = "Ce que vous pouvez récolter",
    ["Only my professions"] = "Uniquement mes métiers",
    ["A profession you have not learned contributes nothing at all."] = "Un métier non appris n'affiche absolument rien.",
    ["Show nodes above my skill"] = "Afficher les points au-dessus de ma compétence",
    ["Drawn faded. Useful for planning where to level a gathering skill next."] =
        "Affichés estompés. Utile pour planifier où monter prochainement une compétence de récolte.",
    ["Fade nodes and mobs until they respawn"] = "Estomper les points et monstres jusqu'à leur réapparition",
    ["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] =
        "Un point récolté ou un monstre tué reste estompé jusqu'à ce que son minuteur de réapparition indique son retour.",

    ["Tooltips"] = "Infobulles",
    ["Add quest info to tooltips"] = "Ajouter les infos de quête aux infobulles",
    ["Shows which quests an NPC or item starts, ends or counts towards."] =
        "Indique les quêtes qu'un PNJ ou un objet lance, termine ou fait progresser.",
    ["Show quest IDs"] = "Afficher les ID de quête",
    ["Useful when reporting missing data."] = "Utile pour signaler des données manquantes.",
    ["Tracker"] = "Suivi",
    ["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] =
        "PandaQuest ne remplace pas le suivi de quêtes de Blizzard ; il ne fait que le compléter.",
    ["Enhance the Blizzard tracker"] = "Améliorer le suivi de Blizzard",
    ["Show distance on tracked quests"] = "Afficher la distance sur les quêtes suivies",
    ["Notifications"] = "Notifications",
    ["Show notifications"] = "Afficher les notifications",
    ["A short message in the middle of the screen."] = "Un court message au centre de l'écran.",
    ["Quest complete and turned in"] = "Quête terminée et rendue",
    ["Next objective"] = "Objectif suivant",
    ["Play a sound"] = "Jouer un son",
    ["Preview"] = "Aperçu",
    ["PandaQuest is ready."] = "PandaQuest est prêt.",
    ["Synchronisation (optional)"] = "Synchronisation (facultative)",
    ["Optional. PandaQuest works fully without it, and never uploads anything itself."] =
        "Facultatif. PandaQuest fonctionne parfaitement sans cela et n'envoie jamais rien de lui-même.",
    ["Record quest data"] = "Enregistrer les données de quête",
    ["Record movement breadcrumbs"] = "Enregistrer les traces de déplacement",
    ["Occasional position samples that improve community routes."] =
        "Relevés de position occasionnels qui améliorent les itinéraires de la communauté.",
    ["Breadcrumb interval (seconds)"] = "Intervalle des traces (secondes)",
    ["Sessions to keep"] = "Sessions à conserver",
    ["Events per session"] = "Événements par session",
    ["Advanced"] = "Avancé",
    ["Log level"] = "Niveau de journal",
    ["How much PandaQuest prints to chat."] = "Quantité de messages que PandaQuest affiche dans le chat.",
    ["Errors"] = "Erreurs",
    ["Warnings"] = "Avertissements",
    ["Info"] = "Infos",
    ["Debug"] = "Débogage",
    ["Trace"] = "Trace",
    ["Arrow debug output"] = "Sortie de débogage de la flèche",
    ["Prints the bearing values used by the arrow."] = "Affiche les valeurs de relèvement utilisées par la flèche.",
    ["Redraw map pins"] = "Redessiner les marqueurs de la carte",
    ["Print status to chat"] = "Afficher l'état dans le chat",
    ["Profiles"] = "Profils",
    ["Options are not available; use /pq help for chat commands."] =
        "Les options ne sont pas disponibles ; utiliser /pq help pour les commandes du chat.",

    -- UI (minimap button, tracker, notifications, Wowhead)
    ["Distance unknown"] = "Distance inconnue",
    ["Left-click: toggle the arrow"] = "Clic gauche : afficher/masquer la flèche",
    ["Right-click: open options"] = "Clic droit : ouvrir les options",
    ["Press Ctrl+C to copy the link:"] = "Appuyer sur Ctrl+C pour copier le lien :",
    ["Navigate to this quest"] = "Naviguer vers cette quête",
    ["the quest giver"] = "le donneur de quête",
    ["unknown distance"] = "distance inconnue",
    ["%s complete"] = "%s : quête terminée",
    ["Turned in: %s"] = "Quête rendue : %s",

    -- Sync (telemetry, community data)
    ["Telemetry: %s"] = "Télémétrie : %s",
    ["Events recorded this session: %d (%d dropped)"] = "Événements enregistrés durant cette session : %d (%d perdus)",
    ["Sessions stored: %d, waiting for upload: %d"] = "Sessions enregistrées : %d, en attente d'envoi : %d",
    ["Last upload confirmed: %s"] = "Dernier envoi confirmé : %s",
    ["never"] = "jamais",
    ["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] =
        "Rien n'est enregistré tant que la télémétrie est désactivée. La réactiver dans /pq options.",
    ["No community data yet."] = "Pas encore de données de la communauté.",
    ["Community data from %s"] = "Données de la communauté du %s",
    ["Last gear snapshot: %s"] = "Dernier instantané de l'équipement : %s",
    ["Gear snapshots: off."] = "Instantanés de l'équipement : désactivés.",

    -- Sync / Consent
    ["/pq consent - ask the data sharing question again"] = "/pq consent - reposer la question du partage des données",
    ["PandaQuest can send what you do while questing to the community hub."] =
        "PandaQuest peut envoyer au hub de la communauté ce que vous faites pendant vos quêtes.",
    ["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] =
        "Cela comprend les quêtes que vous acceptez et terminez, ce que vous tuez et récupérez, l'endroit où vous mourez, ainsi que votre position sur la carte avec l'heure.",
    ["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] =
        "Ces données servent à construire les itinéraires de quête partagés. Désactivé tant que vous n'avez pas accepté ; arrêt et suppression possibles à tout moment.",
    ["PandaQuest can share your quest data to build the community routes."] =
        "PandaQuest peut partager vos données de quête pour construire les itinéraires de la communauté.",
    ["It is off. Turn it on in /pq options if you want to take part."] = "Désactivé. À activer dans /pq options pour participer.",
    ["Share my quest data"] = "Partager mes données de quête",
    ["No thanks"] = "Non merci",
    ["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] =
        "Merci. PandaQuest partagera vos données de quête. Désactivable à tout moment avec /pq sync.",
    ["Nothing will be collected. Turn it on any time in /pq options."] = "Rien ne sera collecté. Activable à tout moment dans /pq options.",

    -- Auction house: the scan, the invoices, the tooltip and the options section
    ["Scan prices"] = "Analyser les prix",
    ["Stop scan (%d%%)"] = "Arrêter l'analyse (%d%%)",
    ["Scanning the auction house. Keep the window open; closing it cancels the scan."] =
        "Analyse de l'hôtel des ventes en cours. Laisser la fenêtre ouverte : la fermer annule l'analyse.",
    ["Auction house scan finished: %d auctions of %d items in %s."] =
        "Analyse de l'hôtel des ventes terminée : %d enchères pour %d objets en %s.",
    ["The scan stopped at %d auctions to keep the saved file small."] =
        "L'analyse s'est arrêtée à %d enchères pour garder un fichier de sauvegarde léger.",
    ["A scan is already running."] = "Une analyse est déjà en cours.",
    ["Open the auction house first, then press Scan prices or type /pq scan."] =
        "Ouvrir d'abord l'hôtel des ventes, puis cliquer sur Analyser les prix ou taper /pq scan.",
    ["This client offers no auction house listing PandaQuest can read."] =
        "Ce client ne propose aucune liste de l'hôtel des ventes que PandaQuest puisse lire.",
    ["Scan cancelled: the auction house window was closed."] = "Analyse annulée : la fenêtre de l'hôtel des ventes a été fermée.",
    ["Scan stopped: the auction house did not answer."] = "Analyse arrêtée : l'hôtel des ventes n'a pas répondu.",
    ["Scan stopped. Nothing was saved."] = "Analyse arrêtée. Rien n'a été enregistré.",
    ["The auction house sent an empty listing. Nothing was saved."] =
        "L'hôtel des ventes a envoyé une liste vide. Rien n'a été enregistré.",
    ["No scan is running."] = "Aucune analyse en cours.",
    ["Scanning: %d%% (%d auctions read)."] = "Analyse : %d%% (%d enchères lues).",
    ["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."] =
        "Dernière analyse de %s (%s, %s) : %d enchères pour %d objets, il y a %s.",
    ["No auction house scan yet for this realm."] = "Pas encore d'analyse de l'hôtel des ventes pour ce royaume.",
    ["AH minimum buyout"] = "Achat immédiat min. (HV)",
    ["AH market value"] = "Valeur marchande (HV)",
    ["bids only"] = "enchères seulement",
    ["%s, scanned %s ago"] = "%s, analysé il y a %s",
    ["Auction house"] = "Hôtel des ventes",
    ["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] =
        "PandaQuest n'analyse jamais de lui-même. Cliquer sur Analyser les prix dans la fenêtre de l'hôtel des ventes, ou taper /pq scan pendant qu'elle est ouverte.",
    ["Show the scan button on the auction house window"] = "Afficher le bouton d'analyse dans la fenêtre de l'hôtel des ventes",
    ["Show auction prices on item tooltips"] = "Afficher les prix de l'hôtel des ventes dans les infobulles d'objets",
    ["The lowest buyout and the market value from your last scan on this realm, with how old it is."] =
        "Le prix d'achat immédiat le plus bas et la valeur marchande de votre dernière analyse sur ce royaume, avec son ancienneté.",
    ["Record my auction sales and purchases"] = "Enregistrer mes ventes et achats à l'hôtel des ventes",
    ["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."] =
        "Relevé à partir des factures de l'hôtel des ventes dans votre boîte aux lettres. L'objet, la quantité et le prix sont conservés, jamais le nom de l'autre joueur.",
    -- Professions: the recipe scan, its refusals and the options section
    ["/pq scan professions - read the open profession window"] = "/pq scan professions - lire la fenêtre de métier ouverte",
    ["/pq scan archaeology - read your archaeology window"] = "/pq scan archaeology - lire votre fenêtre d'archéologie",
    ["/pq digsite - show the dig site bar so you can move it"] =
        "/pq digsite - afficher la barre du site de fouilles pour pouvoir la déplacer",
    ["A profession scan is already running."] = "Une analyse de métier est déjà en cours.",
    ["Open a profession window first, then type /pq scan professions."] =
        "Ouvrir d'abord une fenêtre de métier, puis taper /pq scan professions.",
    ["This client does not offer the recipe list PandaQuest reads."] = "Ce client ne propose pas la liste de recettes que PandaQuest lit.",
    ["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] =
        "Cette fenêtre est le livre de recettes d'un autre joueur, ouvert depuis un lien. PandaQuest ne l'enregistre pas.",
    ["This profession window lists no recipes."] = "Cette fenêtre de métier ne contient aucune recette.",
    ["The profession list has not arrived from the server yet. Try again in a moment."] =
        "La liste des métiers n'a pas encore été reçue du serveur. Réessayer dans un instant.",
    ["Nothing was saved: not one recipe in this window could be read whole."] =
        "Rien n'a été enregistré : aucune recette de cette fenêtre n'a pu être lue en entier.",
    ["The profession window changed while it was being read. Nothing was saved."] =
        "La fenêtre de métier a changé pendant la lecture. Rien n'a été enregistré.",
    ["The window was read short, so the recipe book you already have was kept."] =
        "La lecture de la fenêtre est incomplète : le livre de recettes déjà enregistré a été conservé.",
    ["Profession scan cancelled: the window was closed."] = "Analyse de métier annulée : la fenêtre a été fermée.",
    ["Profession scan stopped. Nothing was saved."] = "Analyse de métier arrêtée. Rien n'a été enregistré.",
    ["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."] =
        "PandaQuest ne touchera pas à votre fenêtre de métier : il ne pourrait pas la remettre comme vous l'aviez laissée (%s).",
    ["PandaQuest could not put your profession window back exactly as you left it."] =
        "PandaQuest n'a pas pu remettre votre fenêtre de métier exactement comme vous l'aviez laissée.",
    ["Profession scan finished: %s %d/%d, %d recipes in %s."] = "Analyse de métier terminée : %s %d/%d, %d recettes en %s.",
    ["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."] =
        "%d recettes ont été omises, le jeu n'ayant pas fini de les charger. Rouvrir la fenêtre pour les compléter.",
    ["The scan stopped at %d recipes to keep the saved file small."] =
        "L'analyse s'est arrêtée à %d recettes pour garder un fichier de sauvegarde léger.",
    ["Last scan of %s (%d/%d): %d recipes, %s ago."] = "Dernière analyse de %s (%d/%d) : %d recettes, il y a %s.",
    ["No profession has been scanned on this character yet."] = "Aucun métier n'a encore été analysé sur ce personnage.",
    ["Professions"] = "Métiers",
    ["PandaQuest reads an open profession window once and puts your filters and collapsed categories back."] =
        "PandaQuest lit une seule fois une fenêtre de métier ouverte, puis remet en place vos filtres et vos catégories réduites.",
    ["Read my recipes when I open a profession"] = "Lire mes recettes à l'ouverture d'un métier",
    ["The recipes, their reagents and how hard each is for this character. Never a book opened from a link."] =
        "Les recettes, leurs composants et la difficulté de chacune pour ce personnage. Jamais un livre ouvert depuis un lien.",

    -- Flight master
    ["Flight time:"] = "Durée du vol :",
    ["~%s (%d flight)"] = "~%s (%d vol)",
    ["~%s (%d flights)"] = "~%s (%d vols)",
    ["~%s left (%d flights)"] = "~%s restant (%d vols)",
    ["%s in the air"] = "%s en vol",
    ["Flight progress"] = "Progression du vol",
    ["The flight bar is switched off in /pq options."] = "La barre de vol est désactivée dans /pq options.",
    ["The flight bar is locked. Unlock it in /pq options to move it."] =
        "La barre de vol est verrouillée. La déverrouiller dans /pq options pour la déplacer.",
    ["Drag the flight bar where you want it. It hides itself again in a moment."] =
        "Faire glisser la barre de vol à l'endroit voulu. Elle se masquera de nouveau dans un instant.",
    ["/pq flight - show the flight bar so you can drag it"] = "/pq flight - afficher la barre de vol pour pouvoir la déplacer",
    ["Flight master"] = "Maître de vol",
    ["PandaQuest times your own flights and shows what it measured. A route you have never flown shows nothing at all."] =
        "PandaQuest chronomètre vos propres vols et affiche ce qu'il a mesuré. Un trajet jamais effectué n'affiche rien du tout.",
    ["Show the flight time at the flight master"] = "Afficher la durée du vol chez le maître de vol",
    ["One line in the destination's tooltip, with how many of your own flights it rests on."] =
        "Une ligne dans l'infobulle de la destination, avec le nombre de vos propres vols sur lesquels elle repose.",
    ["Show the progress bar while flying"] = "Afficher la barre de progression pendant le vol",
    ["Progress and remaining time once the route has been flown twice; before that, only the time in the air."] =
        "Progression et temps restant une fois le trajet effectué deux fois ; avant cela, uniquement le temps passé en vol.",
    -- Archaeology
    ["This client does not offer the archaeology data PandaQuest reads."] =
        "Ce client ne propose pas les données d'archéologie que PandaQuest lit.",
    ["This character has no archaeology races to read yet."] = "Ce personnage n'a pas encore de races d'archéologie à lire.",
    ["Your artifact history has not arrived yet, so the archaeology PandaQuest already had was kept."] =
        "L'historique de vos artefacts n'est pas encore arrivé ; les données d'archéologie déjà enregistrées par PandaQuest ont été conservées.",
    ["No archaeology has been read on this character yet."] = "Aucune donnée d'archéologie n'a encore été lue sur ce personnage.",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] = "Archéologie %d/%d : %d races, %d artefacts, lue il y a %s.",
    ["Archaeology %d: %d races, %d artifacts, read %s ago."] = "Archéologie %d : %d races, %d artefacts, lue il y a %s.",
    ["Archaeology: %d races, %d artifacts, read %s ago."] = "Archéologie : %d races, %d artefacts, lue il y a %s.",
    ["Archaeology read: %d races, %d artifacts."] = "Archéologie lue : %d races, %d artefacts.",
    ["The server has not sent your artifact history, so completion counts were left out."] =
        "Le serveur n'a pas envoyé l'historique de vos artefacts : les décomptes de complétion ont été omis.",
    ["Archaeology"] = "Archéologie",
    ["Mists never shipped a dig site progress bar. PandaQuest draws one from the events the game already sends."] =
        "Mists of Pandaria n'a jamais inclus de barre de progression de site de fouilles. PandaQuest en dessine une à partir des événements que le jeu envoie déjà.",
    ["Read my archaeology when I open the window"] = "Lire mon archéologie à l'ouverture de la fenêtre",
    ["Your races, their keystone, your fragments and the artifacts you have. Only this character's own."] =
        "Vos races, leur clé de voûte, vos fragments et les artefacts que vous possédez. Uniquement ceux de ce personnage.",
    ["Dig site progress bar"] = "Barre de progression du site de fouilles",
    ["Show the dig site progress bar"] = "Afficher la barre de progression du site de fouilles",
    ["Appears when you survey and hides when you leave the dig site."] =
        "S'affiche lors d'une prospection et se masque en quittant le site de fouilles.",
    ["Lock the bar in place"] = "Verrouiller la barre",
    ["Unlocked, it can be dragged with the left mouse button."] =
        "Déverrouillée, elle peut être déplacée avec le bouton gauche de la souris.",
    ["Bar size"] = "Taille de la barre",
    ["Show me where it is"] = "Montrer où elle se trouve",
    ["Puts an empty bar on screen for a moment so you can find it, and drag it when it is unlocked."] =
        "Affiche un instant une barre vide à l'écran pour la repérer, et la déplacer si elle est déverrouillée.",
    ["Reset bar position"] = "Réinitialiser la position de la barre",
    ["Dig site progress"] = "Progression du site de fouilles",
    ["Dig site complete"] = "Site de fouilles terminé",
    ["This client draws its own dig site progress bar."] = "Ce client affiche sa propre barre de progression du site de fouilles.",
    ["The dig site bar is switched off in /pq options."] = "La barre du site de fouilles est désactivée dans /pq options.",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "Faire glisser la barre du site de fouilles à l'endroit voulu. Elle se masquera de nouveau dans un instant.",
    ["The dig site bar is locked. Unlock it in /pq options to move it."] =
        "La barre du site de fouilles est verrouillée. La déverrouiller dans /pq options pour la déplacer.",

    -- Database/QuestieDB (the optional QuestieDB addon)
    ["Quest database source"] = "Source de la base de données de quêtes",
    ["Uses the QuestieDB addon, if it is installed and enabled, to complete PandaQuest's own database. Takes effect after /reload."] =
        "Utilise l'addon QuestieDB, s'il est installé et activé, pour compléter la base de données de PandaQuest. Prend effet après /reload.",
    ["PandaQuest only"] = "PandaQuest uniquement",
    ["Fill gaps from QuestieDB"] = "Combler les lacunes avec QuestieDB",
    ["QuestieDB values first"] = "Valeurs de QuestieDB en priorité",
    ["QuestieDB: %s"] = "QuestieDB : %s",
    ["QuestieDB: %s (%d entries added, %d refreshed)"] = "QuestieDB : %s (%d entrées ajoutées, %d actualisées)",
    ["not used (off)"] = "non utilisé (désactivé)",
    ["not installed"] = "non installé",
    ["cannot be used (%s)"] = "inutilisable (%s)",
    ["not read yet"] = "pas encore lu",

    -- Quest browser, quest database source, language selection
    ["/pq quests [questID] - browse every quest in the database"] =
        "/pq quests [questID] - parcourir toutes les quêtes de la base de données",
    ["Name"] = "Nom",
    ["Level"] = "Niveau",
    ["to"] = "à",
    ["My level"] = "Mon niveau",
    ["My side"] = "Ma faction",
    ["Alliance"] = "Alliance",
    ["Horde"] = "Horde",
    ["Both"] = "Les deux",
    ["both factions"] = "les deux factions",
    ["Dungeon"] = "Donjon",
    ["Raid"] = "Raid",
    ["Group"] = "Groupe",
    ["PvP"] = "JcJ",
    ["Daily"] = "Journ.",
    ["Event"] = "Événement",
    ["Reset"] = "Réinit.",
    ["All quests"] = "Toutes les quêtes",
    ["%d quests"] = "Quêtes : %d",
    ["No quest matches these filters."] = "Aucune quête ne correspond à ces filtres.",
    ["Reading the quest database..."] = "Lecture de la base de données de quêtes...",
    ["Quest"] = "Quête",
    ["Zone"] = "Zone",
    ["Req."] = "Min.",
    ["XP"] = "XP",
    ["A level %d quest for %s, from level %d."] = "Quête de niveau %d (%s), à partir du niveau %d.",
    ["%d experience"] = "%d points d'expérience",
    ["Not in the database."] = "Absent de la base de données.",
    ["requires level"] = "requiert le niveau",
    ["Yes"] = "Oui",
    ["No"] = "Non",
    ["No location is known for this quest."] = "Aucun emplacement connu pour cette quête.",
    ["Navigating to: %s"] = "Navigation vers : %s",
    ["Start"] = "Début",
    ["End"] = "Fin",
    ["Difficulty"] = "Difficulté",
    ["Side"] = "Faction",
    ["Shareable"] = "Partageable",
    ["Quest ID"] = "ID de quête",
    ["Rewards"] = "Récompenses",
    ["Navigate"] = "Naviguer",
    ["Pick a quest from the list to see its page."] = "Choisir une quête dans la liste pour afficher sa page.",
    ["Quests"] = "Quêtes",
    ["Shift-click: browse all quests"] = "Maj-clic : parcourir toutes les quêtes",
    -- Beta notice and animation options
    ["This is a beta build: new features are not yet confirmed in the game."] =
        "Ceci est une version bêta : les nouvelles fonctions ne sont pas encore confirmées en jeu.",
    ["Animations"] =
        "Animations",
    ["Windows fade and settle, messages slide in, bars glide. Switch it off for a calmer interface."] =
        "Les fenêtres apparaissent en fondu et se posent, les messages glissent et les barres progressent en douceur. Désactiver pour une interface plus calme.",
    ["Turn all interface motion on or off."] =
        "Activer ou désactiver tous les mouvements de l'interface.",
    ["Animation speed"] =
        "Vitesse des animations",
    ["1 is normal; 2 is twice as fast, 0.5 half as fast."] =
        "1 est normal ; 2 est deux fois plus rapide, 0,5 deux fois plus lent.",
    -- Options: language, tools
    ["Open the quest browser"] = "Ouvrir l'explorateur de quêtes",
    ["Browse every quest in the database, with a page and a map for each."] =
        "Parcourir toutes les quêtes de la base de données, avec une page et une carte pour chacune.",
    ["Choose the language of PandaQuest's texts. Automatic follows the game's language."] =
        "Choisir la langue des textes de PandaQuest. Automatique suit la langue du jeu.",
    ["Automatic (game language)"] = "Automatique (langue du jeu)",
    ["Reload the interface"] = "Recharger l'interface",
    ["Reloads the game's interface so a changed language applies everywhere."] =
        "Recharge l'interface du jeu afin qu'une langue modifiée s'applique partout.",
    ["Tools"] = "Outils",
    ["Everything the chat commands do, as buttons. Nothing here needs a command."] =
        "Tout ce que font les commandes du chat, sous forme de boutons. Aucune commande n'est nécessaire ici.",
    ["Skip the current target"] = "Passer la cible actuelle",
    ["Moves the arrow on to the next target."] = "Fait passer la flèche à la cible suivante.",
    ["Stop following the pinned quest"] = "Ne plus suivre la quête épinglée",
    ["Clears the quest pinned with the focus setting or the map's right-click menu."] =
        "Efface la quête épinglée avec le réglage de focalisation ou avec le menu clic droit de la carte.",
    ["Reset arrow position and map pins"] = "Réinitialiser flèche et marqueurs",
    ["Wowhead link for the current target"] = "Lien Wowhead pour la cible actuelle",
    ["%d quests are hidden from the navigator."] = "%d quêtes sont masquées du navigateur.",
    ["Show all hidden quests again"] = "Réafficher toutes les quêtes masquées",
    ["Reading windows"] = "Lecture des fenêtres",
    ["Read my professions now"] = "Lire mes métiers maintenant",
    ["Open the profession window first."] = "Ouvrir d'abord la fenêtre de métier.",
    ["Read my archaeology now"] = "Lire mon archéologie maintenant",
    ["Open the archaeology window first."] = "Ouvrir d'abord la fenêtre d'archéologie.",
    ["Show synchronisation status"] = "Afficher l'état de la synchronisation",
    ["Ask the data sharing question"] = "Question sur le partage des données",
    ["Categories"] = "Catégories",
    ["Loosen a filter, or press Reset."] = "Assouplir un filtre ou cliquer sur « Réinit. ».",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.frFR = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "frFR")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
