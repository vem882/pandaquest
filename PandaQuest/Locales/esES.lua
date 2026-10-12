-- Locales/esES.lua: esES translation. Keys are the English text from Locales/enUS.lua.
-- luacheck: max line length 220
local _, ns = ...

local T = {
    -- Core / Init
    ["PandaQuest %s loaded. Type /pq for options, /pq help for commands."] =
        "PandaQuest %s cargado. Escribe /pq para ver las opciones y /pq help para ver los comandos.",
    ["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."] =
        "¡Te damos la bienvenida a PandaQuest! La flecha señala tu próximo objetivo de misión. Escribe /pq help para ver los comandos.",
    ["%s is not available yet."] = "%s aún no está disponible.",
    ["Unknown command: %s"] = "Comando desconocido: %s",
    ["Available commands:"] = "Comandos disponibles:",
    ["/pq - open options"] = "/pq - abrir las opciones",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - mostrar u ocultar la flecha de navegación",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] =
        "/pq target [questID|clear] - fijar una misión (o mostrar el objetivo actual)",
    ["/pq next - skip the current target"] = "/pq next - saltar el objetivo actual",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - unidades de distancia",
    ["/pq wh [questID] - Wowhead link"] = "/pq wh [questID] - enlace de Wowhead",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <questID> - ocultar una misión del navegador",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <questID> - volver a mostrar una misión oculta",
    ["/pq reset - reset arrow position and map pins"] = "/pq reset - restablecer la posición de la flecha y los marcadores del mapa",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - nivel de registro",
    ["/pq dump quest|npc|object|item <id> - print database entry"] =
        "/pq dump quest|npc|object|item <id> - mostrar una entrada de la base de datos",
    ["/pq status - addon status"] = "/pq status - estado del addon",
    ["/pq sync - telemetry and community data status"] = "/pq sync - estado de la telemetría y de los datos de la comunidad",
    ["/pq lang auto|<locale> - interface language"] = "/pq lang auto|<locale> - idioma de la interfaz",
    ["Available languages: %s"] = "Idiomas disponibles: %s",
    ["Units: %s"] = "Unidades: %s",
    ["meters"] = "metros",
    ["yards"] = "yardas",
    ["Usage: %s"] = "Uso: %s",
    ["Log level: %d (%s)"] = "Nivel de registro: %d (%s)",
    ["Arrow debug: %s"] = "Depuración de la flecha: %s",
    ["Language: %s (reload the UI to apply everywhere)"] = "Idioma: %s (recarga la interfaz para aplicarlo en todas partes)",
    ["Enabled"] = "Activado",
    ["Disabled"] = "Desactivado",
    ["Quest %d hidden."] = "Misión %d oculta.",
    ["Quest %d is visible again."] = "La misión %d vuelve a ser visible.",
    ["Current target: %s"] = "Objetivo actual: %s",
    ["No current target."] = "No hay objetivo actual.",
    ["No target found for quest %d."] = "No se ha encontrado ningún objetivo para la misión %d.",
    ["Not found: %s %d"] = "No encontrado: %s %d",
    ["Version %s"] = "Versión %s",
    ["Built %s from %s"] = "Compilado el %s desde %s",
    ["This is a build from a modified working tree; it is not a release."] =
        "Esta compilación procede de un árbol de trabajo modificado; no es una versión publicada.",
    ["Database: %s"] = "Base de datos: %s",
    ["ready"] = "lista",
    ["loading"] = "cargando",
    ["Quests in log: %d"] = "Misiones en el registro: %d",
    ["Targets: %d"] = "Objetivos: %d",
    ["Background jobs: %d"] = "Tareas en segundo plano: %d",
    ["Telemetry: %s, sessions stored: %d"] = "Telemetría: %s, sesiones guardadas: %d",
    ["Community data: %s"] = "Datos de la comunidad: %s",
    ["none"] = "ninguno",
    ["Arrow position and pins reset."] = "Posición de la flecha y marcadores restablecidos.",
    ["Profile changed: %s"] = "Perfil cambiado: %s",

    -- Action texts, used by Objectives.DescribeTarget
    ["Kill %s (%d/%d)"] = "Matar a %s (%d/%d)",
    ["Talk to %s"] = "Hablar con %s",
    ["Loot %s from %s (%d/%d)"] = "Saquear %s de %s (%d/%d)",
    ["Collect %s from %s (%d/%d)"] = "Recoger %s de %s (%d/%d)",
    ["Use %s (%d/%d)"] = "Usar %s (%d/%d)",
    ["Use %s on %s"] = "Usar %s en %s",
    ["Explore %s"] = "Explorar %s",
    ["Turn in to %s"] = "Entregar a %s",
    ["Pick up quest from %s"] = "Aceptar misión de %s",
    ["Kill %s"] = "Matar a %s",
    ["Loot %s from %s"] = "Saquear %s de %s",

    -- Shared UI strings
    ["Click: next target"] = "Clic: siguiente objetivo",
    ["Next: %s"] = "Siguiente: %s",
    ["%s complete - turn in to %s (%s)"] = "%s completada - entregar a %s (%s)",
    ["Community: avg %s"] = "Comunidad: media %s",

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "Base de datos lista: %d misiones, %d PNJ, %d objetos del mundo, %d objetos (%d ms).",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "No se encuentra la base de datos de PandaQuest. Reinstala el addon: faltan los archivos de Database/Data.",

    -- Nav (arrow, router, TomTom)
    ["Arrow locked."] = "Flecha bloqueada.",
    ["Arrow unlocked - drag it to move."] = "Flecha desbloqueada - arrástrala para moverla.",
    ["Close"] = "Cerrar",
    ["Custom target"] = "Objetivo personalizado",
    ["Distance"] = "Distancia",
    ["ETA"] = "Llegada est.",
    ["Hide this quest"] = "Ocultar esta misión",
    ["Lock arrow"] = "Bloquear flecha",
    ["Next target"] = "Siguiente objetivo",
    ["Reset arrow position"] = "Restablecer posición de la flecha",
    ["Right-click: arrow menu"] = "Clic derecho: menú de la flecha",
    ["Send to TomTom"] = "Enviar a TomTom",
    ["Shift-click: send to TomTom"] = "Mayús + clic: enviar a TomTom",
    ["Show distance in metres"] = "Mostrar la distancia en metros",
    ["Show distance in yards"] = "Mostrar la distancia en yardas",
    ["Show on map"] = "Mostrar en el mapa",
    ["TomTom is not loaded."] = "TomTom no está cargado.",
    ["Unlock arrow"] = "Desbloquear flecha",
    ["Wowhead link"] = "Enlace de Wowhead",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "%d puntos de aparición aquí",
    ["Left-click: navigate here"] = "Clic izquierdo: navegar hasta aquí",
    ["Right-click: more options"] = "Clic derecho: más opciones",
    ["Set as target"] = "Fijar como objetivo",
    ["Hide quest: %s"] = "Ocultar misión: %s",
    ["Wowhead: %s"] = "Wowhead: %s",
    ["Starts: %s"] = "Comienza: %s",
    ["Turn in: %s"] = "Entregar: %s",
    ["Ends: %s"] = "Termina: %s",

    -- Map/NodeTooltip
    ["Level:"] = "Nivel:",
    ["Type:"] = "Tipo:",
    ["Skill:"] = "Habilidad:",
    ["Respawn:"] = "Reaparición:",
    ["Respawn in:"] = "Reaparece en:",
    ["~%s (%d)"] = "~%s (%d)",
    ["Sightings:"] = "Avistamientos:",
    ["Found by you:"] = "Encontrado por ti:",
    ["Also here:"] = "También aquí:",
    ["Unit"] = "Unidad",
    ["Object"] = "Objeto del mundo",
    ["Item"] = "Objeto",
    ["Area"] = "Área",
    ["%d Sec"] = "%d s",
    ["%d Secs"] = "%d s",
    ["%d Min"] = "%d min",
    ["%d Mins"] = "%d min",
    ["%d Hour"] = "%d h",
    ["%d Hours"] = "%d h",

    -- UI/Options
    ["General"] = "General",
    ["PandaQuest works out of the box. Everything below is optional."] =
        "PandaQuest funciona sin tocar nada. Todo lo que hay debajo es opcional.",
    ["Distance units"] = "Unidades de distancia",
    ["Metres are shown as '123 m', yards as '135 yd'."] = "Los metros se muestran como '123 m' y las yardas como '135 yd'.",
    ["Show minimap button"] = "Mostrar el botón del minimapa",
    ["Left-click the minimap button to toggle the arrow, right-click for these options."] =
        "Clic izquierdo en el botón del minimapa para mostrar u ocultar la flecha; clic derecho para abrir estas opciones.",
    ["Language"] = "Idioma",
    ["PandaQuest follows your game language; /pq lang overrides it."] = "PandaQuest usa el idioma de tu juego; /pq lang lo sustituye.",
    ["Arrow"] = "Flecha",
    ["Show the arrow"] = "Mostrar la flecha",
    ["Hide it to navigate by map pins only."] = "Ocúltala para navegar solo con los marcadores del mapa.",
    ["Lock the arrow in place"] = "Bloquear la flecha en su sitio",
    ["When unlocked, drag the arrow to move it."] = "Si está desbloqueada, arrastra la flecha para moverla.",
    ["Show quest text"] = "Mostrar el texto de la misión",
    ["Quest name and the action to take under the arrow."] = "Nombre de la misión y acción que hay que realizar, bajo la flecha.",
    ["Show travel time"] = "Mostrar el tiempo de viaje",
    ["Estimated time to the target at your current speed."] = "Tiempo estimado hasta el objetivo a tu velocidad actual.",
    ["Show community timings"] = "Mostrar los tiempos de la comunidad",
    ["Average completion time collected from other players, when available."] =
        "Tiempo medio de finalización recogido de otros jugadores, si hay datos.",
    ["Hide inside instances"] = "Ocultar dentro de instancias",
    ["The arrow cannot guide you inside a dungeon or raid."] = "La flecha no puede guiarte dentro de una mazmorra o una banda.",
    ["Flash on arrival"] = "Destello al llegar",
    ["A short glow when you reach the target."] = "Un breve resplandor al alcanzar el objetivo.",
    ["Appearance"] = "Apariencia",
    ["Size"] = "Tamaño",
    ["Arrow size relative to the default."] = "Tamaño de la flecha respecto al predeterminado.",
    ["Opacity"] = "Opacidad",
    ["Text size"] = "Tamaño del texto",
    ["Reset position"] = "Restablecer posición",
    ["Moves the arrow back to the middle of the screen."] = "Devuelve la flecha al centro de la pantalla.",
    ["Navigation"] = "Navegación",
    ["Target selection"] = "Selección de objetivo",
    ["Auto weighs priority and distance; Focused quest follows one quest."] =
        "Automático pondera la prioridad y la distancia; Misión fijada sigue una sola misión.",
    ["Auto"] = "Automático",
    ["Focused quest"] = "Misión fijada",
    ["Nearest"] = "Más cercano",
    ["Focused quest ID"] = "ID de la misión fijada",
    ["Used by 'Focused quest'. Empty follows the quest you track in the log."] =
        "Lo usa 'Misión fijada'. Si está vacío, sigue la misión que rastreas en el registro.",
    ["Route to turn-ins"] = "Ruta hacia las entregas",
    ["Completed quests are routed back to their quest giver."] = "Las misiones completadas trazan la ruta de vuelta a su dador de misión.",
    ["Route to new quests"] = "Ruta hacia misiones nuevas",
    ["Nearby quests you could pick up are added to the route."] = "Las misiones cercanas que podrías aceptar se añaden a la ruta.",
    ["New quest radius"] = "Radio de misiones nuevas",
    ["How far away a pickup may be to be routed to (yards)."] =
        "Distancia máxima a la que puede estar una misión nueva para incluirla en la ruta (yardas).",
    ["Maximum new quests"] = "Máximo de misiones nuevas",
    ["How many pickups are routed at once."] = "Cuántas misiones nuevas entran en la ruta a la vez.",
    ["Arrival radius"] = "Radio de llegada",
    ["How close you must get before a target counts as reached (yards)."] =
        "Cuánto debes acercarte para que un objetivo cuente como alcanzado (yardas).",
    ["TomTom"] = "TomTom",
    ["TomTom waypoints"] = "Puntos de ruta de TomTom",
    ["Mirror sends the current target to TomTom as a waypoint."] = "Reflejar envía el objetivo actual a TomTom como punto de ruta.",
    ["Off"] = "Desactivado",
    ["Mirror current target"] = "Reflejar objetivo actual",
    ["Map"] = "Mapa",
    ["Show objective pins"] = "Mostrar marcadores de objetivos",
    ["Where to go for the quests in your log."] = "Adónde ir para las misiones de tu registro.",
    ["Show turn-in pins"] = "Mostrar marcadores de entrega",
    ["Quest givers waiting for a completed quest."] = "Dadores de misión que esperan una misión completada.",
    ["Show available quest pins"] = "Mostrar marcadores de misiones disponibles",
    ["Quests you could pick up."] = "Misiones que podrías aceptar.",
    ["Show pins on the minimap"] = "Mostrar marcadores en el minimapa",
    ["Keep distant pins on the minimap edge"] = "Mantener los marcadores lejanos en el borde del minimapa",
    ["Off hides a pin as soon as it leaves the minimap."] = "Desactivado, un marcador se oculta en cuanto sale del minimapa.",
    ["Merge nearby spawns"] = "Agrupar apariciones cercanas",
    ["One pin for a pack of mobs instead of a dozen."] = "Un marcador para un grupo de criaturas en lugar de una docena.",
    ["Pin size"] = "Tamaño de los marcadores",
    ["Map pin size"] = "Tamaño de los marcadores del mapa",
    ["Minimap pin size"] = "Tamaño de los marcadores del minimapa",
    -- Map/Pins, Map/Icons
    ["Objective dot size"] = "Tamaño de los puntos de objetivo",
    ["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."] =
        "Los objetivos y los nodos de recolección son puntos pequeños, coloreados por misión o por tipo; los dadores de misión conservan sus iconos.",
    ["Maximum minimap pins"] = "Máximo de marcadores en el minimapa",
    ["When there are more, the ones nearest to you are kept."] = "Si hay más, se conservan los más cercanos a ti.",
    ["Minimap edge fade"] = "Desvanecimiento en el borde del minimapa",
    ["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] =
        "Los marcadores se desvanecen y se encogen a partir de esta fracción del camino hasta el borde del minimapa. 0 lo desactiva.",
    ["Which quests to show"] = "Qué misiones mostrar",
    ["Show low level quests"] = "Mostrar misiones de nivel bajo",
    ["Quests that are grey for your level."] = "Misiones que son grises para tu nivel.",
    ["Show repeatable and daily quests"] = "Mostrar misiones repetibles y diarias",
    ["Show dungeon quests"] = "Mostrar misiones de mazmorra",
    ["Show raid quests"] = "Mostrar misiones de banda",
    ["Show PvP quests"] = "Mostrar misiones JcJ",
    ["Show pet battle quests"] = "Mostrar misiones de duelos de mascotas",

    -- Nodes/Professions
    ["Gathering"] = "Recolección",
    ["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] =
        "Minerales, hierbas, bancos de peces, cofres y criaturas raras, dibujados solo donde alguien (tú o la comunidad) ha encontrado uno de verdad.",
    ["Show gathering nodes"] = "Mostrar nodos de recolección",
    ["Turns the whole layer off, whatever the boxes below say."] = "Desactiva toda la capa, digan lo que digan las casillas de abajo.",
    ["Which nodes"] = "Qué nodos",
    ["Mining veins"] = "Filones de minería",
    ["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] =
        "Filones de mineral. Se ocultan si tu habilidad de Minería es demasiado baja, salvo que decidas mostrarlos también.",
    ["Herbs"] = "Hierbas",
    ["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] =
        "Hierbas del mundo. Se ocultan si tu habilidad de Herboristería es demasiado baja, salvo que decidas mostrarlas también.",
    ["Fishing pools"] = "Bancos de peces",
    ["Fishing pools on lakes, rivers and the coast."] = "Bancos de peces en lagos, ríos y en la costa.",
    ["Chests and treasures"] = "Cofres y tesoros",
    ["Chests and lockboxes in the world; no gathering skill filters these."] =
        "Cofres y cajas con cerradura del mundo; ninguna habilidad de recolección los filtra.",
    ["Rare spawns"] = "Criaturas raras",
    ["Rare creatures, at the places a rare was looted."] = "Criaturas raras, en los lugares donde se saqueó una.",
    ["Which of them you can gather"] = "Cuáles puedes recolectar",
    ["Only my professions"] = "Solo mis profesiones",
    ["A profession you have not learned contributes nothing at all."] = "Una profesión que no has aprendido no aporta nada en absoluto.",
    ["Show nodes above my skill"] = "Mostrar nodos por encima de mi habilidad",
    ["Drawn faded. Useful for planning where to level a gathering skill next."] =
        "Se dibujan atenuados. Útil para planificar dónde subir tu siguiente habilidad de recolección.",
    ["Fade nodes and mobs until they respawn"] = "Atenuar nodos y criaturas hasta que reaparezcan",
    ["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] =
        "Un nodo que has recolectado o una criatura que has matado se queda atenuado hasta que su temporizador de reaparición indica que ha vuelto.",

    ["Tooltips"] = "Tooltips",
    ["Add quest info to tooltips"] = "Añadir información de misiones a los tooltips",
    ["Shows which quests an NPC or item starts, ends or counts towards."] =
        "Muestra qué misiones inicia o termina un PNJ u objeto, o a cuáles contribuye.",
    ["Show quest IDs"] = "Mostrar los ID de misión",
    ["Useful when reporting missing data."] = "Útil al informar de datos que faltan.",
    ["Tracker"] = "Rastreador",
    ["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] =
        "PandaQuest no sustituye al rastreador de misiones de Blizzard; solo le añade cosas.",
    ["Enhance the Blizzard tracker"] = "Mejorar el rastreador de Blizzard",
    ["Show distance on tracked quests"] = "Mostrar la distancia en las misiones rastreadas",
    ["Notifications"] = "Notificaciones",
    ["Show notifications"] = "Mostrar notificaciones",
    ["A short message in the middle of the screen."] = "Un mensaje breve en el centro de la pantalla.",
    ["Quest complete and turned in"] = "Misión completada y entregada",
    ["Next objective"] = "Siguiente objetivo",
    ["Play a sound"] = "Reproducir un sonido",
    ["Preview"] = "Vista previa",
    ["PandaQuest is ready."] = "PandaQuest está listo.",
    ["Synchronisation (optional)"] = "Sincronización (opcional)",
    ["Optional. PandaQuest works fully without it, and never uploads anything itself."] =
        "Opcional. PandaQuest funciona por completo sin esto y nunca sube nada por su cuenta.",
    ["Record quest data"] = "Registrar datos de misiones",
    ["Record movement breadcrumbs"] = "Registrar el rastro de movimiento",
    ["Occasional position samples that improve community routes."] =
        "Muestras ocasionales de posición que mejoran las rutas de la comunidad.",
    ["Breadcrumb interval (seconds)"] = "Intervalo del rastro (segundos)",
    ["Sessions to keep"] = "Sesiones que conservar",
    ["Events per session"] = "Eventos por sesión",
    ["Advanced"] = "Avanzado",
    ["Log level"] = "Nivel de registro",
    ["How much PandaQuest prints to chat."] = "Cuánto escribe PandaQuest en el chat.",
    ["Errors"] = "Errores",
    ["Warnings"] = "Advertencias",
    ["Info"] = "Información",
    ["Debug"] = "Depuración",
    ["Trace"] = "Traza",
    ["Arrow debug output"] = "Salida de depuración de la flecha",
    ["Prints the bearing values used by the arrow."] = "Escribe los valores de rumbo que usa la flecha.",
    ["Redraw map pins"] = "Redibujar los marcadores del mapa",
    ["Print status to chat"] = "Mostrar el estado en el chat",
    ["Profiles"] = "Perfiles",
    ["Options are not available; use /pq help for chat commands."] =
        "Las opciones no están disponibles; usa /pq help para ver los comandos del chat.",

    -- UI (minimap button, tracker, notifications, Wowhead)
    ["Distance unknown"] = "Distancia desconocida",
    ["Left-click: toggle the arrow"] = "Clic izquierdo: mostrar u ocultar la flecha",
    ["Right-click: open options"] = "Clic derecho: abrir las opciones",
    ["Press Ctrl+C to copy the link:"] = "Pulsa Ctrl+C para copiar el enlace:",
    ["Navigate to this quest"] = "Navegar hasta esta misión",
    ["the quest giver"] = "quien dio la misión",
    ["unknown distance"] = "distancia desconocida",
    ["%s complete"] = "%s completada",
    ["Turned in: %s"] = "Entregada: %s",

    -- Sync (telemetry, community data)
    ["Telemetry: %s"] = "Telemetría: %s",
    ["Events recorded this session: %d (%d dropped)"] = "Eventos registrados en esta sesión: %d (%d descartados)",
    ["Sessions stored: %d, waiting for upload: %d"] = "Sesiones guardadas: %d, pendientes de subir: %d",
    ["Last upload confirmed: %s"] = "Última subida confirmada: %s",
    ["never"] = "nunca",
    ["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] =
        "No se registra nada mientras la telemetría esté desactivada. Vuelve a activarla en /pq options.",
    ["No community data yet."] = "Todavía no hay datos de la comunidad.",
    ["Community data from %s"] = "Datos de la comunidad de %s",
    ["Last gear snapshot: %s"] = "Última instantánea del equipo: %s",
    ["Gear snapshots: off."] = "Instantáneas del equipo: desactivadas.",

    -- Sync / Consent
    ["/pq consent - ask the data sharing question again"] = "/pq consent - volver a preguntar sobre compartir datos",
    ["PandaQuest can send what you do while questing to the community hub."] =
        "PandaQuest puede enviar al centro de la comunidad lo que haces mientras completas misiones.",
    ["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] =
        "Eso incluye las misiones que aceptas y terminas, lo que matas y saqueas, dónde mueres y tu posición en el mapa con la hora.",
    ["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] =
        "Sirve para crear las rutas de misiones compartidas. Está desactivado hasta que aceptes, y puedes detenerlo y borrarlo cuando quieras.",
    ["PandaQuest can share your quest data to build the community routes."] =
        "PandaQuest puede compartir tus datos de misiones para crear las rutas de la comunidad.",
    ["It is off. Turn it on in /pq options if you want to take part."] = "Está desactivado. Actívalo en /pq options si quieres participar.",
    ["Share my quest data"] = "Compartir mis datos de misiones",
    ["No thanks"] = "No, gracias",
    ["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] =
        "Gracias. PandaQuest compartirá tus datos de misiones. Puedes desactivarlo cuando quieras con /pq sync.",
    ["Nothing will be collected. Turn it on any time in /pq options."] =
        "No se recogerá nada. Puedes activarlo cuando quieras en /pq options.",

    -- Auction house: the scan, the invoices, the tooltip and the options section
    ["Scan prices"] = "Escanear precios",
    ["Stop scan (%d%%)"] = "Detener escaneo (%d%%)",
    ["Scanning the auction house. Keep the window open; closing it cancels the scan."] =
        "Escaneando la casa de subastas. Mantén la ventana abierta: si la cierras, se cancela el escaneo.",
    ["Auction house scan finished: %d auctions of %d items in %s."] =
        "Escaneo de la casa de subastas terminado: %d subastas de %d objetos en %s.",
    ["The scan stopped at %d auctions to keep the saved file small."] =
        "El escaneo se detuvo en %d subastas para que el archivo guardado no crezca demasiado.",
    ["A scan is already running."] = "Ya hay un escaneo en curso.",
    ["Open the auction house first, then press Scan prices or type /pq scan."] =
        "Abre primero la casa de subastas y luego pulsa Escanear precios o escribe /pq scan.",
    ["This client offers no auction house listing PandaQuest can read."] =
        "Este cliente no ofrece ninguna lista de la casa de subastas que PandaQuest pueda leer.",
    ["Scan cancelled: the auction house window was closed."] = "Escaneo cancelado: se cerró la ventana de la casa de subastas.",
    ["Scan stopped: the auction house did not answer."] = "Escaneo detenido: la casa de subastas no respondió.",
    ["Scan stopped. Nothing was saved."] = "Escaneo detenido. No se guardó nada.",
    ["The auction house sent an empty listing. Nothing was saved."] = "La casa de subastas envió una lista vacía. No se guardó nada.",
    ["No scan is running."] = "No hay ningún escaneo en curso.",
    ["Scanning: %d%% (%d auctions read)."] = "Escaneando: %d%% (%d subastas leídas).",
    ["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."] = "Último escaneo de %s (%s, %s): %d subastas de %d objetos, hace %s.",
    ["No auction house scan yet for this realm."] = "Todavía no hay ningún escaneo de la casa de subastas para este reino.",
    ["AH minimum buyout"] = "Compra mínima (CS)",
    ["AH market value"] = "Valor de mercado (CS)",
    ["bids only"] = "solo pujas",
    ["%s, scanned %s ago"] = "%s, escaneado hace %s",
    ["Auction house"] = "Casa de subastas",
    ["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] =
        "PandaQuest nunca escanea por su cuenta. Pulsa Escanear precios en la ventana de la casa de subastas o escribe /pq scan mientras esté abierta.",
    ["Show the scan button on the auction house window"] = "Mostrar el botón de escaneo en la ventana de la casa de subastas",
    ["Show auction prices on item tooltips"] = "Mostrar precios de subasta en los tooltips de objetos",
    ["The lowest buyout and the market value from your last scan on this realm, with how old it is."] =
        "La compra más baja y el valor de mercado de tu último escaneo en este reino, con su antigüedad.",
    ["Record my auction sales and purchases"] = "Registrar mis ventas y compras de subastas",
    ["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."] =
        "Se lee de las facturas de subasta de tu buzón. Se guardan el objeto, la cantidad y el precio, nunca el nombre del otro jugador.",
    -- Professions: the recipe scan, its refusals and the options section
    ["/pq scan professions - read the open profession window"] = "/pq scan professions - leer la ventana de profesión abierta",
    ["/pq scan archaeology - read your archaeology window"] = "/pq scan archaeology - leer tu ventana de arqueología",
    ["/pq digsite - show the dig site bar so you can move it"] =
        "/pq digsite - mostrar la barra de la zona de excavación para poder moverla",
    ["A profession scan is already running."] = "Ya hay un escaneo de profesión en curso.",
    ["Open a profession window first, then type /pq scan professions."] =
        "Abre primero una ventana de profesión y luego escribe /pq scan professions.",
    ["This client does not offer the recipe list PandaQuest reads."] = "Este cliente no ofrece la lista de recetas que lee PandaQuest.",
    ["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] =
        "Esa ventana es el libro de recetas de otro jugador, abierto desde un enlace. PandaQuest no lo registra.",
    ["This profession window lists no recipes."] = "Esta ventana de profesión no muestra ninguna receta.",
    ["The profession list has not arrived from the server yet. Try again in a moment."] =
        "La lista de la profesión aún no ha llegado del servidor. Inténtalo de nuevo en un momento.",
    ["Nothing was saved: not one recipe in this window could be read whole."] =
        "No se guardó nada: no se pudo leer entera ninguna receta de esta ventana.",
    ["The profession window changed while it was being read. Nothing was saved."] =
        "La ventana de profesión cambió mientras se leía. No se guardó nada.",
    ["The window was read short, so the recipe book you already have was kept."] =
        "La ventana se leyó incompleta, así que se conservó el libro de recetas que ya tenías.",
    ["Profession scan cancelled: the window was closed."] = "Escaneo de profesión cancelado: se cerró la ventana.",
    ["Profession scan stopped. Nothing was saved."] = "Escaneo de profesión detenido. No se guardó nada.",
    ["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."] =
        "PandaQuest no tocará tu ventana de profesión: no puede dejar %s tal como lo tenías.",
    ["PandaQuest could not put your profession window back exactly as you left it."] =
        "PandaQuest no pudo dejar tu ventana de profesión exactamente como la tenías.",
    ["Profession scan finished: %s %d/%d, %d recipes in %s."] = "Escaneo de profesión terminado: %s %d/%d, %d recetas en %s.",
    ["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."] =
        "Se omitieron %d recetas porque el juego no había terminado de cargarlas. Abre la ventana de nuevo para completarlas.",
    ["The scan stopped at %d recipes to keep the saved file small."] =
        "El escaneo se detuvo en %d recetas para que el archivo guardado no crezca demasiado.",
    ["Last scan of %s (%d/%d): %d recipes, %s ago."] = "Último escaneo de %s (%d/%d): %d recetas, hace %s.",
    ["No profession has been scanned on this character yet."] = "Todavía no se ha escaneado ninguna profesión de este personaje.",
    ["Professions"] = "Profesiones",
    ["PandaQuest reads an open profession window once and puts your filters and collapsed categories back."] =
        "PandaQuest lee una vez la ventana de profesión abierta y deja tus filtros y categorías contraídas como estaban.",
    ["Read my recipes when I open a profession"] = "Leer mis recetas al abrir una profesión",
    ["The recipes, their reagents and how hard each is for this character. Never a book opened from a link."] =
        "Las recetas, sus componentes y lo difícil que es cada una para este personaje. Nunca un libro abierto desde un enlace.",

    -- Flight master
    ["Flight time:"] = "Tiempo de vuelo:",
    ["~%s (%d flight)"] = "~%s (%d vuelo)",
    ["~%s (%d flights)"] = "~%s (%d vuelos)",
    ["~%s left (%d flights)"] = "~%s restantes (%d vuelos)",
    ["%s in the air"] = "%s en el aire",
    ["Flight progress"] = "Progreso del vuelo",
    ["The flight bar is switched off in /pq options."] = "La barra de vuelo está desactivada en /pq options.",
    ["The flight bar is locked. Unlock it in /pq options to move it."] =
        "La barra de vuelo está bloqueada. Desbloquéala en /pq options para moverla.",
    ["Drag the flight bar where you want it. It hides itself again in a moment."] =
        "Arrastra la barra de vuelo adonde quieras. Se volverá a ocultar en un momento.",
    ["/pq flight - show the flight bar so you can drag it"] = "/pq flight - mostrar la barra de vuelo para poder arrastrarla",
    ["Flight master"] = "Maestro de vuelo",
    ["PandaQuest times your own flights and shows what it measured. A route you have never flown shows nothing at all."] =
        "PandaQuest cronometra tus propios vuelos y muestra lo que midió. Una ruta que nunca has volado no muestra nada.",
    ["Show the flight time at the flight master"] = "Mostrar el tiempo de vuelo en el maestro de vuelo",
    ["One line in the destination's tooltip, with how many of your own flights it rests on."] =
        "Una línea en el tooltip del destino, con cuántos de tus propios vuelos respaldan el dato.",
    ["Show the progress bar while flying"] = "Mostrar la barra de progreso mientras vuelas",
    ["Progress and remaining time once the route has been flown twice; before that, only the time in the air."] =
        "Progreso y tiempo restante cuando la ruta se ha volado dos veces; antes, solo el tiempo en el aire.",
    -- Archaeology
    ["This client does not offer the archaeology data PandaQuest reads."] =
        "Este cliente no ofrece los datos de arqueología que lee PandaQuest.",
    ["This character has no archaeology races to read yet."] = "Este personaje aún no tiene razas de arqueología que leer.",
    ["Your artifact history has not arrived yet, so the archaeology PandaQuest already had was kept."] =
        "Tu historial de artefactos aún no ha llegado, así que se conservaron los datos de arqueología que PandaQuest ya tenía.",
    ["No archaeology has been read on this character yet."] = "Todavía no se ha leído la arqueología de este personaje.",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] = "Arqueología %d/%d: %d razas, %d artefactos, leída hace %s.",
    ["Archaeology %d: %d races, %d artifacts, read %s ago."] = "Arqueología %d: %d razas, %d artefactos, leída hace %s.",
    ["Archaeology: %d races, %d artifacts, read %s ago."] = "Arqueología: %d razas, %d artefactos, leída hace %s.",
    ["Archaeology read: %d races, %d artifacts."] = "Arqueología leída: %d razas, %d artefactos.",
    ["The server has not sent your artifact history, so completion counts were left out."] =
        "El servidor no ha enviado tu historial de artefactos, así que se omitieron los recuentos de completados.",
    ["Archaeology"] = "Arqueología",
    ["Mists never shipped a dig site progress bar. PandaQuest draws one from the events the game already sends."] =
        "Mists of Pandaria nunca incluyó una barra de progreso de la zona de excavación. PandaQuest dibuja una a partir de los eventos que el juego ya envía.",
    ["Read my archaeology when I open the window"] = "Leer mi arqueología al abrir la ventana",
    ["Your races, their keystone, your fragments and the artifacts you have. Only this character's own."] =
        "Tus razas, su piedra angular, tus fragmentos y los artefactos que tienes. Solo los de este personaje.",
    ["Dig site progress bar"] = "Barra de progreso de la zona de excavación",
    ["Show the dig site progress bar"] = "Mostrar la barra de progreso de la zona de excavación",
    ["Appears when you survey and hides when you leave the dig site."] =
        "Aparece al empezar a buscar y se oculta cuando sales de la zona de excavación.",
    ["Lock the bar in place"] = "Bloquear la barra en su sitio",
    ["Unlocked, it can be dragged with the left mouse button."] = "Desbloqueada, se puede arrastrar con el botón izquierdo del ratón.",
    ["Bar size"] = "Tamaño de la barra",
    ["Show me where it is"] = "Mostrarme dónde está",
    ["Puts an empty bar on screen for a moment so you can find it, and drag it when it is unlocked."] =
        "Muestra una barra vacía en pantalla un momento para que la encuentres, y puedas arrastrarla si está desbloqueada.",
    ["Reset bar position"] = "Restablecer posición de la barra",
    ["Dig site progress"] = "Progreso de la zona de excavación",
    ["Dig site complete"] = "Zona de excavación completada",
    ["This client draws its own dig site progress bar."] = "Este cliente dibuja su propia barra de progreso de la zona de excavación.",
    ["The dig site bar is switched off in /pq options."] = "La barra de la zona de excavación está desactivada en /pq options.",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "Arrastra la barra de la zona de excavación adonde quieras. Se volverá a ocultar en un momento.",
    ["The dig site bar is locked. Unlock it in /pq options to move it."] =
        "La barra de la zona de excavación está bloqueada. Desbloquéala en /pq options para moverla.",

    -- Database/QuestieDB (the optional QuestieDB addon)
    ["Quest database source"] = "Origen de la base de datos de misiones",
    ["Uses the QuestieDB addon, if it is installed and enabled, to complete PandaQuest's own database. Takes effect after /reload."] =
        "Usa el addon QuestieDB, si está instalado y activado, para completar la base de datos propia de PandaQuest. Se aplica tras /reload.",
    ["PandaQuest only"] = "Solo PandaQuest",
    ["Fill gaps from QuestieDB"] = "Rellenar huecos con QuestieDB",
    ["QuestieDB values first"] = "Valores de QuestieDB primero",
    ["QuestieDB: %s"] = "QuestieDB: %s",
    ["QuestieDB: %s (%d entries added, %d refreshed)"] = "QuestieDB: %s (%d entradas añadidas, %d actualizadas)",
    ["not used (off)"] = "no se usa (desactivado)",
    ["not installed"] = "no instalado",
    ["cannot be used (%s)"] = "no se puede usar (%s)",
    ["not read yet"] = "aún no leído",

    -- Quest browser, quest database source, language selection
    ["/pq quests [questID] - browse every quest in the database"] =
        "/pq quests [questID] - explorar todas las misiones de la base de datos",
    ["Name"] = "Nombre",
    ["Level"] = "Nivel",
    ["to"] = "a",
    ["My level"] = "Mi nivel",
    ["My side"] = "Mi facción",
    ["Alliance"] = "Alianza",
    ["Horde"] = "Horda",
    ["Both"] = "Ambas",
    ["both factions"] = "ambas facciones",
    ["Dungeon"] = "Mazmorra",
    ["Raid"] = "Banda",
    ["Group"] = "Grupo",
    ["PvP"] = "JcJ",
    ["Daily"] = "Diaria",
    ["Event"] = "Evento",
    ["Reset"] = "Limpiar",
    ["All quests"] = "Todas las misiones",
    ["%d quests"] = "%d misiones",
    ["No quest matches these filters."] = "Ninguna misión coincide con estos filtros.",
    ["Reading the quest database..."] = "Leyendo la base de datos de misiones...",
    ["Quest"] = "Misión",
    ["Zone"] = "Zona",
    ["Req."] = "Req.",
    ["XP"] = "XP",
    ["A level %d quest for %s, from level %d."] = "Misión de nivel %d (%s), desde el nivel %d.",
    ["%d experience"] = "%d puntos de experiencia",
    ["Not in the database."] = "No figura en la base de datos.",
    ["requires level"] = "requiere nivel",
    ["Yes"] = "Sí",
    ["No"] = "No",
    ["No location is known for this quest."] = "No se conoce ninguna ubicación para esta misión.",
    ["Navigating to: %s"] = "Navegando hasta: %s",
    ["Start"] = "Inicio",
    ["End"] = "Final",
    ["Difficulty"] = "Dificultad",
    ["Side"] = "Facción",
    ["Shareable"] = "Compartible",
    ["Quest ID"] = "ID misión",
    ["Rewards"] = "Recompensas",
    ["Navigate"] = "Navegar",
    ["Pick a quest from the list to see its page."] = "Elige una misión de la lista para ver su página.",
    ["Quests"] = "Misiones",
    ["Shift-click: browse all quests"] = "Mayús + clic: explorar todas las misiones",
    -- Beta notice and animation options
    ["This is a beta build: new features are not yet confirmed in the game."] =
        "Esta es una versión beta: las funciones nuevas aún no están confirmadas en el juego.",
    ["Animations"] =
        "Animaciones",
    ["Windows fade and settle, messages slide in, bars glide. Switch it off for a calmer interface."] =
        "Las ventanas aparecen con fundido y se asientan, los mensajes se deslizan y las barras avanzan con suavidad. Desactívalo para una interfaz más tranquila.",
    ["Turn all interface motion on or off."] =
        "Activa o desactiva todo el movimiento de la interfaz.",
    ["Animation speed"] =
        "Velocidad de animación",
    ["1 is normal; 2 is twice as fast, 0.5 half as fast."] =
        "1 es normal; 2 es el doble de rápido, 0,5 la mitad.",
    -- Options: language, tools
    ["Categories"] = "Categorías",
    ["Loosen a filter, or press Reset."] = "Relaja algún filtro o pulsa Limpiar.",
    ["Open the quest browser"] = "Abrir el explorador de misiones",
    ["Browse every quest in the database, with a page and a map for each."] =
        "Explora todas las misiones de la base de datos, con una página y un mapa para cada una.",
    ["Choose the language of PandaQuest's texts. Automatic follows the game's language."] =
        "Elige el idioma de los textos de PandaQuest. Automático sigue el idioma del juego.",
    ["Automatic (game language)"] = "Automático (idioma del juego)",
    ["Reload the interface"] = "Recargar la interfaz",
    ["Reloads the game's interface so a changed language applies everywhere."] =
        "Recarga la interfaz del juego para que el cambio de idioma se aplique en todas partes.",
    ["Tools"] = "Herramientas",
    ["Everything the chat commands do, as buttons. Nothing here needs a command."] =
        "Todo lo que hacen los comandos del chat, en forma de botones. Aquí no hace falta ningún comando.",
    ["Skip the current target"] = "Saltar el objetivo actual",
    ["Moves the arrow on to the next target."] = "Pasa la flecha al siguiente objetivo.",
    ["Stop following the pinned quest"] = "Dejar de seguir la misión fijada",
    ["Clears the quest pinned with the focus setting or the map's right-click menu."] =
        "Quita la misión fijada con el ajuste 'Misión fijada' o con el menú de clic derecho del mapa.",
    ["Reset arrow position and map pins"] = "Restablecer flecha y marcadores",
    ["Wowhead link for the current target"] = "Enlace de Wowhead del objetivo actual",
    ["%d quests are hidden from the navigator."] = "%d misiones están ocultas del navegador.",
    ["Show all hidden quests again"] = "Mostrar de nuevo las misiones ocultas",
    ["Reading windows"] = "Lectura de ventanas",
    ["Read my professions now"] = "Leer mis profesiones ahora",
    ["Open the profession window first."] = "Abre primero la ventana de profesión.",
    ["Read my archaeology now"] = "Leer mi arqueología ahora",
    ["Open the archaeology window first."] = "Abre primero la ventana de arqueología.",
    ["Show synchronisation status"] = "Mostrar el estado de sincronización",
    ["Ask the data sharing question"] = "Preguntar sobre compartir datos",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.esES = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "esES")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
