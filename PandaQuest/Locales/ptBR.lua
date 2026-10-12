-- Locales/ptBR.lua: ptBR translation. Keys are the English text from Locales/enUS.lua.
-- luacheck: max line length 220
local _, ns = ...

local T = {
    -- Core / Init
    ["PandaQuest %s loaded. Type /pq for options, /pq help for commands."] =
        "PandaQuest %s carregado. Digite /pq para ver as opções, /pq help para ver os comandos.",
    ["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."] =
        "Boas-vindas ao PandaQuest! A seta aponta para o próximo objetivo de missão. Digite /pq help para ver os comandos.",
    ["%s is not available yet."] = "%s ainda não está disponível.",
    ["Unknown command: %s"] = "Comando desconhecido: %s",
    ["Available commands:"] = "Comandos disponíveis:",
    ["/pq - open options"] = "/pq - abrir as opções",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - mostrar ou ocultar a seta de navegação",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] =
        "/pq target [questID|clear] - fixar uma missão (ou mostrar o destino atual)",
    ["/pq next - skip the current target"] = "/pq next - pular o destino atual",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - unidades de distância",
    ["/pq wh [questID] - Wowhead link"] = "/pq wh [questID] - link do Wowhead",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <questID> - ocultar uma missão do navegador",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <questID> - mostrar novamente uma missão oculta",
    ["/pq reset - reset arrow position and map pins"] = "/pq reset - redefinir a posição da seta e os marcadores do mapa",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - nível de log",
    ["/pq dump quest|npc|object|item <id> - print database entry"] = "/pq dump quest|npc|object|item <id> - exibir uma entrada do banco de dados",
    ["/pq status - addon status"] = "/pq status - status do addon",
    ["/pq sync - telemetry and community data status"] = "/pq sync - status da telemetria e dos dados da comunidade",
    ["/pq lang auto|<locale> - interface language"] = "/pq lang auto|<locale> - idioma da interface",
    ["Available languages: %s"] = "Idiomas disponíveis: %s",
    ["Units: %s"] = "Unidades: %s",
    ["meters"] = "metros",
    ["yards"] = "jardas",
    ["Usage: %s"] = "Uso: %s",
    ["Log level: %d (%s)"] = "Nível de log: %d (%s)",
    ["Arrow debug: %s"] = "Depuração da seta: %s",
    ["Language: %s (reload the UI to apply everywhere)"] = "Idioma: %s (recarregue a interface para aplicar em todos os lugares)",
    ["Enabled"] = "Ativado",
    ["Disabled"] = "Desativado",
    ["Quest %d hidden."] = "Missão %d ocultada.",
    ["Quest %d is visible again."] = "A missão %d está visível novamente.",
    ["Current target: %s"] = "Destino atual: %s",
    ["No current target."] = "Nenhum destino atual.",
    ["No target found for quest %d."] = "Nenhum destino encontrado para a missão %d.",
    ["Not found: %s %d"] = "Não encontrado: %s %d",
    ["Version %s"] = "Versão %s",
    ["Built %s from %s"] = "Compilado em %s a partir de %s",
    ["This is a build from a modified working tree; it is not a release."] =
        "Esta é uma compilação de uma árvore de trabalho modificada; não é uma versão oficial.",
    ["Database: %s"] = "Banco de dados: %s",
    ["ready"] = "pronto",
    ["loading"] = "carregando",
    ["Quests in log: %d"] = "Missões no registro: %d",
    ["Targets: %d"] = "Destinos: %d",
    ["Background jobs: %d"] = "Tarefas em segundo plano: %d",
    ["Telemetry: %s, sessions stored: %d"] = "Telemetria: %s, sessões armazenadas: %d",
    ["Community data: %s"] = "Dados da comunidade: %s",
    ["none"] = "nenhum",
    ["Arrow position and pins reset."] = "Posição da seta e marcadores redefinidos.",
    ["Profile changed: %s"] = "Perfil alterado: %s",

    -- Action texts, used by Objectives.DescribeTarget
    ["Kill %s (%d/%d)"] = "Mate %s (%d/%d)",
    ["Talk to %s"] = "Fale com %s",
    ["Loot %s from %s (%d/%d)"] = "Saqueie %s de %s (%d/%d)",
    ["Collect %s from %s (%d/%d)"] = "Colete %s de %s (%d/%d)",
    ["Use %s (%d/%d)"] = "Use %s (%d/%d)",
    ["Use %s on %s"] = "Use %s em %s",
    ["Explore %s"] = "Explore %s",
    ["Turn in to %s"] = "Entregue a %s",
    ["Pick up quest from %s"] = "Aceite a missão de %s",
    ["Kill %s"] = "Mate %s",
    ["Loot %s from %s"] = "Saqueie %s de %s",

    -- Shared UI strings
    ["Click: next target"] = "Clique: próximo destino",
    ["Next: %s"] = "Próximo: %s",
    ["%s complete - turn in to %s (%s)"] = "%s concluída - entregue a %s (%s)",
    ["Community: avg %s"] = "Comunidade: média de %s",

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "Banco de dados pronto: %d missões, %d NPCs, %d objetos, %d itens (%d ms).",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "Banco de dados do PandaQuest não encontrado. Reinstale o addon: os arquivos de Database/Data estão faltando.",

    -- Nav (arrow, router, TomTom)
    ["Arrow locked."] = "Seta bloqueada.",
    ["Arrow unlocked - drag it to move."] = "Seta desbloqueada - arraste-a para movê-la.",
    ["Close"] = "Fechar",
    ["Custom target"] = "Destino personalizado",
    ["Distance"] = "Distância",
    ["ETA"] = "Tempo estimado",
    ["Hide this quest"] = "Ocultar esta missão",
    ["Lock arrow"] = "Bloquear seta",
    ["Next target"] = "Próximo destino",
    ["Reset arrow position"] = "Redefinir posição da seta",
    ["Right-click: arrow menu"] = "Clique direito: menu da seta",
    ["Send to TomTom"] = "Enviar para o TomTom",
    ["Shift-click: send to TomTom"] = "Shift+clique: enviar para o TomTom",
    ["Show distance in metres"] = "Mostrar distância em metros",
    ["Show distance in yards"] = "Mostrar distância em jardas",
    ["Show on map"] = "Mostrar no mapa",
    ["TomTom is not loaded."] = "O TomTom não está carregado.",
    ["Unlock arrow"] = "Desbloquear seta",
    ["Wowhead link"] = "Link do Wowhead",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "%d pontos de aparecimento aqui",
    ["Left-click: navigate here"] = "Clique esquerdo: navegar até aqui",
    ["Right-click: more options"] = "Clique direito: mais opções",
    ["Set as target"] = "Definir como destino",
    ["Hide quest: %s"] = "Ocultar missão: %s",
    ["Wowhead: %s"] = "Wowhead: %s",
    ["Starts: %s"] = "Inicia: %s",
    ["Turn in: %s"] = "Entregar: %s",
    ["Ends: %s"] = "Termina: %s",

    -- Map/NodeTooltip
    ["Level:"] = "Nível:",
    ["Type:"] = "Tipo:",
    ["Skill:"] = "Habilidade:",
    ["Respawn:"] = "Reaparecimento:",
    ["Respawn in:"] = "Reaparece em:",
    ["~%s (%d)"] = "~%s (%d)",
    ["Sightings:"] = "Avistamentos:",
    ["Found by you:"] = "Encontrado por você:",
    ["Also here:"] = "Também aqui:",
    ["Unit"] = "Unidade",
    ["Object"] = "Objeto",
    ["Item"] = "Item",
    ["Area"] = "Área",
    ["%d Sec"] = "%d seg",
    ["%d Secs"] = "%d seg",
    ["%d Min"] = "%d min",
    ["%d Mins"] = "%d min",
    ["%d Hour"] = "%d hora",
    ["%d Hours"] = "%d horas",

    -- UI/Options
    ["General"] = "Geral",
    ["PandaQuest works out of the box. Everything below is optional."] = "O PandaQuest funciona sem configuração. Tudo abaixo é opcional.",
    ["Distance units"] = "Unidades de distância",
    ["Metres are shown as '123 m', yards as '135 yd'."] = "Metros aparecem como '123 m' e jardas como '135 yd'.",
    ["Show minimap button"] = "Mostrar botão do minimapa",
    ["Left-click the minimap button to toggle the arrow, right-click for these options."] =
        "Clique esquerdo no botão do minimapa para mostrar ou ocultar a seta; clique direito para abrir estas opções.",
    ["Language"] = "Idioma",
    ["PandaQuest follows your game language; /pq lang overrides it."] = "O PandaQuest usa o idioma do seu jogo; /pq lang substitui essa escolha.",
    ["Arrow"] = "Seta",
    ["Show the arrow"] = "Mostrar a seta",
    ["Hide it to navigate by map pins only."] = "Oculte-a para navegar apenas pelos marcadores do mapa.",
    ["Lock the arrow in place"] = "Bloquear a seta no lugar",
    ["When unlocked, drag the arrow to move it."] = "Quando desbloqueada, arraste a seta para movê-la.",
    ["Show quest text"] = "Mostrar texto da missão",
    ["Quest name and the action to take under the arrow."] = "Nome da missão e a ação a realizar, sob a seta.",
    ["Show travel time"] = "Mostrar tempo de viagem",
    ["Estimated time to the target at your current speed."] = "Tempo estimado até o destino na sua velocidade atual.",
    ["Show community timings"] = "Mostrar tempos da comunidade",
    ["Average completion time collected from other players, when available."] =
        "Tempo médio de conclusão coletado de outros jogadores, quando disponível.",
    ["Hide inside instances"] = "Ocultar dentro de instâncias",
    ["The arrow cannot guide you inside a dungeon or raid."] = "A seta não consegue guiar você dentro de uma masmorra ou raide.",
    ["Flash on arrival"] = "Brilho ao chegar",
    ["A short glow when you reach the target."] = "Um brilho rápido ao chegar ao destino.",
    ["Appearance"] = "Aparência",
    ["Size"] = "Tamanho",
    ["Arrow size relative to the default."] = "Tamanho da seta em relação ao padrão.",
    ["Opacity"] = "Opacidade",
    ["Text size"] = "Tamanho do texto",
    ["Reset position"] = "Redefinir posição",
    ["Moves the arrow back to the middle of the screen."] = "Move a seta de volta ao centro da tela.",
    ["Navigation"] = "Navegação",
    ["Target selection"] = "Seleção de destino",
    ["Auto weighs priority and distance; Focused quest follows one quest."] =
        "Automático pondera prioridade e distância; Missão em foco segue uma única missão.",
    ["Auto"] = "Automático",
    ["Focused quest"] = "Missão em foco",
    ["Nearest"] = "Mais próximo",
    ["Focused quest ID"] = "ID da missão em foco",
    ["Used by 'Focused quest'. Empty follows the quest you track in the log."] =
        "Usado por 'Missão em foco'. Vazio segue a missão que você rastreia no registro.",
    ["Route to turn-ins"] = "Rota para entregas",
    ["Completed quests are routed back to their quest giver."] = "A rota leva de volta ao doador das missões concluídas.",
    ["Route to new quests"] = "Rota para novas missões",
    ["Nearby quests you could pick up are added to the route."] = "Missões próximas que você pode aceitar são adicionadas à rota.",
    ["New quest radius"] = "Raio para novas missões",
    ["How far away a pickup may be to be routed to (yards)."] = "A que distância uma missão a aceitar pode estar para entrar na rota (jardas).",
    ["Maximum new quests"] = "Máximo de novas missões",
    ["How many pickups are routed at once."] = "Quantas missões a aceitar entram na rota de uma vez.",
    ["Arrival radius"] = "Raio de chegada",
    ["How close you must get before a target counts as reached (yards)."] =
        "A que distância você precisa chegar para o destino contar como alcançado (jardas).",
    ["TomTom"] = "TomTom",
    ["TomTom waypoints"] = "Waypoints do TomTom",
    ["Mirror sends the current target to TomTom as a waypoint."] = "Espelhar envia o destino atual ao TomTom como waypoint.",
    ["Off"] = "Desligado",
    ["Mirror current target"] = "Espelhar destino atual",
    ["Map"] = "Mapa",
    ["Show objective pins"] = "Mostrar marcadores de objetivos",
    ["Where to go for the quests in your log."] = "Aonde ir para as missões no seu registro.",
    ["Show turn-in pins"] = "Mostrar marcadores de entrega",
    ["Quest givers waiting for a completed quest."] = "Doadores de missão esperando uma missão concluída.",
    ["Show available quest pins"] = "Mostrar marcadores de missões disponíveis",
    ["Quests you could pick up."] = "Missões que você pode aceitar.",
    ["Show pins on the minimap"] = "Mostrar marcadores no minimapa",
    ["Keep distant pins on the minimap edge"] = "Manter marcadores distantes na borda do minimapa",
    ["Off hides a pin as soon as it leaves the minimap."] = "Desligado oculta o marcador assim que ele sai do minimapa.",
    ["Merge nearby spawns"] = "Agrupar aparecimentos próximos",
    ["One pin for a pack of mobs instead of a dozen."] = "Um marcador para um bando de monstros, em vez de uma dúzia.",
    ["Pin size"] = "Tamanho dos marcadores",
    ["Map pin size"] = "Tamanho dos marcadores do mapa",
    ["Minimap pin size"] = "Tamanho dos marcadores do minimapa",
    -- Map/Pins, Map/Icons
    ["Objective dot size"] = "Tamanho dos pontos de objetivo",
    ["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."] =
        "Objetivos e pontos de coleta são pequenos pontos, coloridos por missão ou por tipo; os doadores de missão mantêm seus ícones.",
    ["Maximum minimap pins"] = "Máximo de marcadores no minimapa",
    ["When there are more, the ones nearest to you are kept."] = "Havendo mais, os mais próximos de você são mantidos.",
    ["Minimap edge fade"] = "Esmaecimento na borda do minimapa",
    ["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] =
        "Os marcadores esmaecem e diminuem depois dessa parte do caminho até a borda do minimapa. 0 desliga.",
    ["Which quests to show"] = "Quais missões mostrar",
    ["Show low level quests"] = "Mostrar missões de nível baixo",
    ["Quests that are grey for your level."] = "Missões que estão cinzas para o seu nível.",
    ["Show repeatable and daily quests"] = "Mostrar missões repetíveis e diárias",
    ["Show dungeon quests"] = "Mostrar missões de masmorra",
    ["Show raid quests"] = "Mostrar missões de raide",
    ["Show PvP quests"] = "Mostrar missões de JxJ",
    ["Show pet battle quests"] = "Mostrar missões de batalha de mascotes",

    -- Nodes/Professions
    ["Gathering"] = "Coleta",
    ["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] =
        "Minério, ervas, cardumes, baús e criaturas raras, mostrados somente onde você ou a comunidade realmente os encontrou.",
    ["Show gathering nodes"] = "Mostrar pontos de coleta",
    ["Turns the whole layer off, whatever the boxes below say."] = "Desliga a camada inteira, independentemente das caixas abaixo.",
    ["Which nodes"] = "Quais pontos",
    ["Mining veins"] = "Filões de minério",
    ["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] =
        "Filões de minério. Ocultos quando sua habilidade de Mineração é muito baixa, a menos que você mostre esses também.",
    ["Herbs"] = "Ervas",
    ["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] =
        "Pontos de ervas. Ocultos quando sua habilidade de Herborismo é muito baixa, a menos que você mostre esses também.",
    ["Fishing pools"] = "Cardumes",
    ["Fishing pools on lakes, rivers and the coast."] = "Cardumes em lagos, rios e na costa.",
    ["Chests and treasures"] = "Baús e tesouros",
    ["Chests and lockboxes in the world; no gathering skill filters these."] =
        "Baús e caixas trancadas no mundo; nenhuma habilidade de coleta filtra estes.",
    ["Rare spawns"] = "Criaturas raras",
    ["Rare creatures, at the places a rare was looted."] = "Criaturas raras, nos lugares onde um raro foi saqueado.",
    ["Which of them you can gather"] = "Quais deles você pode coletar",
    ["Only my professions"] = "Apenas minhas profissões",
    ["A profession you have not learned contributes nothing at all."] = "Uma profissão que você não aprendeu não contribui com nada.",
    ["Show nodes above my skill"] = "Mostrar pontos acima da minha habilidade",
    ["Drawn faded. Useful for planning where to level a gathering skill next."] =
        "Aparecem esmaecidos. Úteis para planejar onde evoluir a próxima habilidade de coleta.",
    ["Fade nodes and mobs until they respawn"] = "Esmaecer pontos e monstros até que reapareçam",
    ["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] =
        "Um ponto que você coletou ou um monstro que você matou fica esmaecido até o cronômetro de reaparecimento indicar que voltou.",

    ["Tooltips"] = "Tooltips",
    ["Add quest info to tooltips"] = "Adicionar informações de missão às tooltips",
    ["Shows which quests an NPC or item starts, ends or counts towards."] =
        "Mostra quais missões um NPC ou item inicia, termina ou ajuda a concluir.",
    ["Show quest IDs"] = "Mostrar IDs de missão",
    ["Useful when reporting missing data."] = "Útil ao relatar dados ausentes.",
    ["Tracker"] = "Rastreador",
    ["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] =
        "O PandaQuest não substitui o rastreador de missões da Blizzard; apenas acrescenta informações a ele.",
    ["Enhance the Blizzard tracker"] = "Aprimorar o rastreador da Blizzard",
    ["Show distance on tracked quests"] = "Mostrar distância nas missões rastreadas",
    ["Notifications"] = "Notificações",
    ["Show notifications"] = "Mostrar notificações",
    ["A short message in the middle of the screen."] = "Uma mensagem curta no centro da tela.",
    ["Quest complete and turned in"] = "Missão concluída e entregue",
    ["Next objective"] = "Próximo objetivo",
    ["Play a sound"] = "Tocar um som",
    ["Preview"] = "Pré-visualizar",
    ["PandaQuest is ready."] = "O PandaQuest está pronto.",
    ["Synchronisation (optional)"] = "Sincronização (opcional)",
    ["Optional. PandaQuest works fully without it, and never uploads anything itself."] =
        "Opcional. O PandaQuest funciona totalmente sem isto e nunca envia nada por conta própria.",
    ["Record quest data"] = "Registrar dados de missões",
    ["Record movement breadcrumbs"] = "Registrar rastros de movimento",
    ["Occasional position samples that improve community routes."] = "Amostras ocasionais de posição que melhoram as rotas da comunidade.",
    ["Breadcrumb interval (seconds)"] = "Intervalo dos rastros (segundos)",
    ["Sessions to keep"] = "Sessões a manter",
    ["Events per session"] = "Eventos por sessão",
    ["Advanced"] = "Avançado",
    ["Log level"] = "Nível de log",
    ["How much PandaQuest prints to chat."] = "Quanto o PandaQuest escreve no chat.",
    ["Errors"] = "Erros",
    ["Warnings"] = "Avisos",
    ["Info"] = "Informações",
    ["Debug"] = "Depuração",
    ["Trace"] = "Rastreamento",
    ["Arrow debug output"] = "Saída de depuração da seta",
    ["Prints the bearing values used by the arrow."] = "Imprime os valores de direção usados pela seta.",
    ["Redraw map pins"] = "Redesenhar marcadores do mapa",
    ["Print status to chat"] = "Imprimir status no chat",
    ["Profiles"] = "Perfis",
    ["Options are not available; use /pq help for chat commands."] =
        "As opções não estão disponíveis; use /pq help para ver os comandos de chat.",

    -- UI (minimap button, tracker, notifications, Wowhead)
    ["Distance unknown"] = "Distância desconhecida",
    ["Left-click: toggle the arrow"] = "Clique esquerdo: mostrar ou ocultar a seta",
    ["Right-click: open options"] = "Clique direito: abrir opções",
    ["Press Ctrl+C to copy the link:"] = "Pressione Ctrl+C para copiar o link:",
    ["Navigate to this quest"] = "Navegar até esta missão",
    ["the quest giver"] = "quem deu a missão",
    ["unknown distance"] = "distância desconhecida",
    ["%s complete"] = "%s concluída",
    ["Turned in: %s"] = "Entregue: %s",

    -- Sync (telemetry, community data)
    ["Telemetry: %s"] = "Telemetria: %s",
    ["Events recorded this session: %d (%d dropped)"] = "Eventos registrados nesta sessão: %d (%d descartados)",
    ["Sessions stored: %d, waiting for upload: %d"] = "Sessões armazenadas: %d, aguardando envio: %d",
    ["Last upload confirmed: %s"] = "Último envio confirmado: %s",
    ["never"] = "nunca",
    ["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] =
        "Nada é registrado enquanto a telemetria está desativada. Reative-a em /pq options.",
    ["No community data yet."] = "Ainda não há dados da comunidade.",
    ["Community data from %s"] = "Dados da comunidade de %s",
    ["Last gear snapshot: %s"] = "Último instantâneo do equipamento: %s",
    ["Gear snapshots: off."] = "Instantâneos do equipamento: desligados.",

    -- Sync / Consent
    ["/pq consent - ask the data sharing question again"] = "/pq consent - perguntar novamente sobre o compartilhamento de dados",
    ["PandaQuest can send what you do while questing to the community hub."] =
        "O PandaQuest pode enviar à central da comunidade o que você faz enquanto cumpre missões.",
    ["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] =
        "Isso inclui as missões que você aceita e conclui, o que você mata e saqueia, onde você morre e sua posição no mapa com o horário.",
    ["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] =
        "Isso monta as rotas de missão compartilhadas. Fica desativado até você aceitar, e você pode parar e apagar os dados quando quiser.",
    ["PandaQuest can share your quest data to build the community routes."] =
        "O PandaQuest pode compartilhar seus dados de missão para montar as rotas da comunidade.",
    ["It is off. Turn it on in /pq options if you want to take part."] = "Está desativado. Ative em /pq options se quiser participar.",
    ["Share my quest data"] = "Compartilhar meus dados de missão",
    ["No thanks"] = "Não, obrigado",
    ["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] =
        "Obrigado. O PandaQuest vai compartilhar seus dados de missão. Desative quando quiser com /pq sync.",
    ["Nothing will be collected. Turn it on any time in /pq options."] = "Nada será coletado. Ative quando quiser em /pq options.",

    -- Auction house: the scan, the invoices, the tooltip and the options section
    ["Scan prices"] = "Escanear preços",
    ["Stop scan (%d%%)"] = "Parar escaneamento (%d%%)",
    ["Scanning the auction house. Keep the window open; closing it cancels the scan."] =
        "Escaneando a casa de leilões. Mantenha a janela aberta; fechá-la cancela o escaneamento.",
    ["Auction house scan finished: %d auctions of %d items in %s."] = "Escaneamento da casa de leilões concluído: %d leilões de %d itens em %s.",
    ["The scan stopped at %d auctions to keep the saved file small."] = "O escaneamento parou em %d leilões para manter o arquivo salvo pequeno.",
    ["A scan is already running."] = "Um escaneamento já está em andamento.",
    ["Open the auction house first, then press Scan prices or type /pq scan."] =
        "Abra primeiro a casa de leilões e, em seguida, clique em Escanear preços ou digite /pq scan.",
    ["This client offers no auction house listing PandaQuest can read."] =
        "Este cliente não oferece nenhuma lista da casa de leilões que o PandaQuest consiga ler.",
    ["Scan cancelled: the auction house window was closed."] = "Escaneamento cancelado: a janela da casa de leilões foi fechada.",
    ["Scan stopped: the auction house did not answer."] = "Escaneamento interrompido: a casa de leilões não respondeu.",
    ["Scan stopped. Nothing was saved."] = "Escaneamento interrompido. Nada foi salvo.",
    ["The auction house sent an empty listing. Nothing was saved."] = "A casa de leilões enviou uma lista vazia. Nada foi salvo.",
    ["No scan is running."] = "Nenhum escaneamento em andamento.",
    ["Scanning: %d%% (%d auctions read)."] = "Escaneando: %d%% (%d leilões lidos).",
    ["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."] = "Último escaneamento de %s (%s, %s): %d leilões de %d itens, há %s.",
    ["No auction house scan yet for this realm."] = "Ainda não há escaneamento da casa de leilões para este reino.",
    ["AH minimum buyout"] = "Compra imediata mínima (leilão)",
    ["AH market value"] = "Valor de mercado (leilão)",
    ["bids only"] = "somente lances",
    ["%s, scanned %s ago"] = "%s, escaneado há %s",
    ["Auction house"] = "Casa de leilões",
    ["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] =
        "O PandaQuest nunca escaneia por conta própria. Clique em Escanear preços na janela da casa de leilões ou digite /pq scan com ela aberta.",
    ["Show the scan button on the auction house window"] = "Mostrar o botão de escaneamento na janela da casa de leilões",
    ["Show auction prices on item tooltips"] = "Mostrar preços de leilão nas tooltips de itens",
    ["The lowest buyout and the market value from your last scan on this realm, with how old it is."] =
        "A menor compra imediata e o valor de mercado do seu último escaneamento neste reino, com o tempo decorrido desde então.",
    ["Record my auction sales and purchases"] = "Registrar minhas vendas e compras de leilão",
    ["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."] =
        "Lido das faturas de leilão na sua caixa de correio. O item, a quantidade e o preço são guardados, nunca o nome do outro jogador.",
    -- Professions: the recipe scan, its refusals and the options section
    ["/pq scan professions - read the open profession window"] = "/pq scan professions - ler a janela de profissão aberta",
    ["/pq scan archaeology - read your archaeology window"] = "/pq scan archaeology - ler a sua janela de Arqueologia",
    ["/pq digsite - show the dig site bar so you can move it"] = "/pq digsite - mostrar a barra do sítio de escavação para poder movê-la",
    ["A profession scan is already running."] = "Um escaneamento de profissão já está em andamento.",
    ["Open a profession window first, then type /pq scan professions."] =
        "Abra primeiro uma janela de profissão e depois digite /pq scan professions.",
    ["This client does not offer the recipe list PandaQuest reads."] = "Este cliente não oferece a lista de receitas que o PandaQuest lê.",
    ["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] =
        "Esta janela é o livro de receitas de outro jogador, aberto por um link. O PandaQuest não o registra.",
    ["This profession window lists no recipes."] = "Esta janela de profissão não lista nenhuma receita.",
    ["The profession list has not arrived from the server yet. Try again in a moment."] =
        "A lista de profissões ainda não chegou do servidor. Tente novamente em instantes.",
    ["Nothing was saved: not one recipe in this window could be read whole."] =
        "Nada foi salvo: nenhuma receita desta janela pôde ser lida por inteiro.",
    ["The profession window changed while it was being read. Nothing was saved."] = "A janela de profissão mudou durante a leitura. Nada foi salvo.",
    ["The window was read short, so the recipe book you already have was kept."] =
        "A janela foi lida de forma incompleta, então o livro de receitas que você já tinha foi mantido.",
    ["Profession scan cancelled: the window was closed."] = "Escaneamento de profissão cancelado: a janela foi fechada.",
    ["Profession scan stopped. Nothing was saved."] = "Escaneamento de profissão interrompido. Nada foi salvo.",
    ["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."] =
        "O PandaQuest não vai mexer na sua janela de profissão: ele não consegue restaurar %s como você deixou.",
    ["PandaQuest could not put your profession window back exactly as you left it."] =
        "O PandaQuest não conseguiu restaurar sua janela de profissão exatamente como você a deixou.",
    ["Profession scan finished: %s %d/%d, %d recipes in %s."] = "Escaneamento de profissão concluído: %s %d/%d, %d receitas em %s.",
    ["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."] =
        "%d receitas ficaram de fora porque o jogo ainda não terminou de carregá-las. Abra a janela novamente para concluí-las.",
    ["The scan stopped at %d recipes to keep the saved file small."] = "O escaneamento parou em %d receitas para manter o arquivo salvo pequeno.",
    ["Last scan of %s (%d/%d): %d recipes, %s ago."] = "Último escaneamento de %s (%d/%d): %d receitas, há %s.",
    ["No profession has been scanned on this character yet."] = "Nenhuma profissão foi escaneada neste personagem ainda.",
    ["Professions"] = "Profissões",
    ["PandaQuest reads an open profession window once and puts your filters and collapsed categories back."] =
        "O PandaQuest lê uma janela de profissão aberta uma vez e restaura seus filtros e categorias recolhidas.",
    ["Read my recipes when I open a profession"] = "Ler minhas receitas ao abrir uma profissão",
    ["The recipes, their reagents and how hard each is for this character. Never a book opened from a link."] =
        "As receitas, seus reagentes e a dificuldade de cada uma para este personagem. Nunca um livro aberto por link.",

    -- Flight master
    ["Flight time:"] = "Tempo de voo:",
    ["~%s (%d flight)"] = "~%s (%d voo)",
    ["~%s (%d flights)"] = "~%s (%d voos)",
    ["~%s left (%d flights)"] = "~%s restantes (%d voos)",
    ["%s in the air"] = "%s no ar",
    ["Flight progress"] = "Progresso do voo",
    ["The flight bar is switched off in /pq options."] = "A barra de voo está desativada em /pq options.",
    ["The flight bar is locked. Unlock it in /pq options to move it."] =
        "A barra de voo está bloqueada. Desbloqueie-a em /pq options para movê-la.",
    ["Drag the flight bar where you want it. It hides itself again in a moment."] =
        "Arraste a barra de voo para onde quiser. Ela se oculta de novo em instantes.",
    ["/pq flight - show the flight bar so you can drag it"] = "/pq flight - mostrar a barra de voo para poder arrastá-la",
    ["Flight master"] = "Mestre de Voo",
    ["PandaQuest times your own flights and shows what it measured. A route you have never flown shows nothing at all."] =
        "O PandaQuest cronometra seus próprios voos e mostra o que mediu. Uma rota que você nunca voou não mostra nada.",
    ["Show the flight time at the flight master"] = "Mostrar o tempo de voo no Mestre de Voo",
    ["One line in the destination's tooltip, with how many of your own flights it rests on."] =
        "Uma linha na tooltip do destino, com quantos dos seus próprios voos servem de base.",
    ["Show the progress bar while flying"] = "Mostrar a barra de progresso durante o voo",
    ["Progress and remaining time once the route has been flown twice; before that, only the time in the air."] =
        "Progresso e tempo restante depois que a rota for voada duas vezes; antes disso, apenas o tempo no ar.",
    -- Archaeology
    ["This client does not offer the archaeology data PandaQuest reads."] = "Este cliente não oferece os dados de Arqueologia que o PandaQuest lê.",
    ["This character has no archaeology races to read yet."] = "Este personagem ainda não tem raças de Arqueologia para ler.",
    ["Your artifact history has not arrived yet, so the archaeology PandaQuest already had was kept."] =
        "Seu histórico de artefatos ainda não chegou, então a Arqueologia que o PandaQuest já tinha foi mantida.",
    ["No archaeology has been read on this character yet."] = "Nenhuma Arqueologia foi lida neste personagem ainda.",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] = "Arqueologia %d/%d: %d raças, %d artefatos, lida há %s.",
    ["Archaeology %d: %d races, %d artifacts, read %s ago."] = "Arqueologia %d: %d raças, %d artefatos, lida há %s.",
    ["Archaeology: %d races, %d artifacts, read %s ago."] = "Arqueologia: %d raças, %d artefatos, lida há %s.",
    ["Archaeology read: %d races, %d artifacts."] = "Arqueologia lida: %d raças, %d artefatos.",
    ["The server has not sent your artifact history, so completion counts were left out."] =
        "O servidor não enviou seu histórico de artefatos, então as contagens de conclusão ficaram de fora.",
    ["Archaeology"] = "Arqueologia",
    ["Mists never shipped a dig site progress bar. PandaQuest draws one from the events the game already sends."] =
        "Mists of Pandaria nunca incluiu uma barra de progresso do sítio de escavação. O PandaQuest desenha uma a partir dos eventos que o jogo já envia.",
    ["Read my archaeology when I open the window"] = "Ler minha Arqueologia ao abrir a janela",
    ["Your races, their keystone, your fragments and the artifacts you have. Only this character's own."] =
        "Suas raças, a pedra-chave de cada uma, seus fragmentos e os artefatos que você tem. Somente os deste personagem.",
    ["Dig site progress bar"] = "Barra de progresso do sítio de escavação",
    ["Show the dig site progress bar"] = "Mostrar a barra de progresso do sítio de escavação",
    ["Appears when you survey and hides when you leave the dig site."] =
        "Aparece quando você pesquisa e se oculta ao sair do sítio de escavação.",
    ["Lock the bar in place"] = "Bloquear a barra no lugar",
    ["Unlocked, it can be dragged with the left mouse button."] = "Desbloqueada, pode ser arrastada com o botão esquerdo do mouse.",
    ["Bar size"] = "Tamanho da barra",
    ["Show me where it is"] = "Mostrar onde está",
    ["Puts an empty bar on screen for a moment so you can find it, and drag it when it is unlocked."] =
        "Coloca uma barra vazia na tela por um instante para você encontrá-la e, se estiver desbloqueada, arrastá-la.",
    ["Reset bar position"] = "Redefinir posição da barra",
    ["Dig site progress"] = "Progresso do sítio de escavação",
    ["Dig site complete"] = "Sítio de escavação concluído",
    ["This client draws its own dig site progress bar."] = "Este cliente desenha a própria barra de progresso do sítio de escavação.",
    ["The dig site bar is switched off in /pq options."] = "A barra do sítio de escavação está desativada em /pq options.",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "Arraste a barra do sítio de escavação para onde quiser. Ela se oculta de novo em instantes.",
    ["The dig site bar is locked. Unlock it in /pq options to move it."] =
        "A barra do sítio de escavação está bloqueada. Desbloqueie-a em /pq options para movê-la.",

    -- Database/QuestieDB (the optional QuestieDB addon)
    ["Quest database source"] = "Fonte do banco de dados de missões",
    ["Uses the QuestieDB addon, if it is installed and enabled, to complete PandaQuest's own database. Takes effect after /reload."] =
        "Usa o addon QuestieDB, se estiver instalado e ativado, para completar o banco de dados do próprio PandaQuest. Tem efeito após /reload.",
    ["PandaQuest only"] = "Somente PandaQuest",
    ["Fill gaps from QuestieDB"] = "Preencher lacunas com o QuestieDB",
    ["QuestieDB values first"] = "Valores do QuestieDB primeiro",
    ["QuestieDB: %s"] = "QuestieDB: %s",
    ["QuestieDB: %s (%d entries added, %d refreshed)"] = "QuestieDB: %s (%d entradas adicionadas, %d atualizadas)",
    ["not used (off)"] = "não usado (desligado)",
    ["not installed"] = "não instalado",
    ["cannot be used (%s)"] = "não pode ser usado (%s)",
    ["not read yet"] = "ainda não lido",

    -- Quest browser, quest database source, language selection
    ["/pq quests [questID] - browse every quest in the database"] =
        "/pq quests [questID] - explorar todas as missões do banco de dados",
    ["Name"] = "Nome",
    ["Level"] = "Nível",
    ["to"] = "a",
    ["My level"] = "Meu nível",
    ["My side"] = "Minha facção",
    ["Alliance"] = "Aliança",
    ["Horde"] = "Horda",
    ["Both"] = "Ambas",
    ["both factions"] = "ambas as facções",
    ["Dungeon"] = "Masmorra",
    ["Raid"] = "Raide",
    ["Group"] = "Grupo",
    ["PvP"] = "JxJ",
    ["Daily"] = "Diária",
    ["Event"] = "Evento",
    ["Reset"] = "Limpar",
    ["All quests"] = "Todas as missões",
    ["%d quests"] = "%d missões",
    ["No quest matches these filters."] = "Nenhuma missão corresponde a estes filtros.",
    ["Reading the quest database..."] = "Lendo o banco de dados de missões...",
    ["Quest"] = "Missão",
    ["Zone"] = "Zona",
    ["Req."] = "Req.",
    ["XP"] = "XP",
    ["A level %d quest for %s, from level %d."] = "Missão de nível %d (%s), a partir do nível %d.",
    ["%d experience"] = "%d pontos de experiência",
    ["Not in the database."] = "Não consta no banco de dados.",
    ["requires level"] = "requer nível",
    ["Yes"] = "Sim",
    ["No"] = "Não",
    ["No location is known for this quest."] = "Nenhum local é conhecido para esta missão.",
    ["Navigating to: %s"] = "Navegando até: %s",
    ["Start"] = "Início",
    ["End"] = "Fim",
    ["Difficulty"] = "Dificuldade",
    ["Side"] = "Facção",
    ["Shareable"] = "Compartilh.",
    ["Quest ID"] = "ID missão",
    ["Rewards"] = "Recompensas",
    ["Navigate"] = "Navegar",
    ["Pick a quest from the list to see its page."] = "Escolha uma missão da lista para ver a página dela.",
    ["Quests"] = "Missões",
    ["Shift-click: browse all quests"] = "Shift+clique: explorar todas as missões",
    -- Beta notice and animation options
    ["This is a beta build: new features are not yet confirmed in the game."] =
        "Esta é uma versão beta: os novos recursos ainda não foram confirmados no jogo.",
    ["Animations"] =
        "Animações",
    ["Windows fade and settle, messages slide in, bars glide. Switch it off for a calmer interface."] =
        "As janelas surgem com esmaecimento e se acomodam, as mensagens deslizam e as barras avançam suavemente. Desative para uma interface mais calma.",
    ["Turn all interface motion on or off."] =
        "Ativa ou desativa todo o movimento da interface.",
    ["Animation speed"] =
        "Velocidade da animação",
    ["1 is normal; 2 is twice as fast, 0.5 half as fast."] =
        "1 é normal; 2 é o dobro da velocidade, 0,5 a metade.",
    -- Options: language, tools
    ["Categories"] =
        "Categorias",
    ["Loosen a filter, or press Reset."] =
        "Afrouxe um filtro ou clique em Limpar.",
    ["Open the quest browser"] =
        "Abrir o explorador de missões",
    ["Browse every quest in the database, with a page and a map for each."] =
        "Explore todas as missões do banco de dados, com uma página e um mapa para cada uma.",
    ["Choose the language of PandaQuest's texts. Automatic follows the game's language."] =
        "Escolha o idioma dos textos do PandaQuest. Automático usa o idioma do jogo.",
    ["Automatic (game language)"] =
        "Automático (idioma do jogo)",
    ["Reload the interface"] =
        "Recarregar a interface",
    ["Reloads the game's interface so a changed language applies everywhere."] =
        "Recarrega a interface do jogo para que a mudança de idioma seja aplicada em todos os lugares.",
    ["Tools"] =
        "Ferramentas",
    ["Everything the chat commands do, as buttons. Nothing here needs a command."] =
        "Tudo o que os comandos de chat fazem, em forma de botões. Nada aqui exige um comando.",
    ["Skip the current target"] =
        "Pular o destino atual",
    ["Moves the arrow on to the next target."] =
        "Move a seta para o próximo destino.",
    ["Stop following the pinned quest"] =
        "Parar de seguir a missão fixada",
    ["Clears the quest pinned with the focus setting or the map's right-click menu."] =
        "Limpa a missão fixada pela opção 'Missão em foco' ou pelo menu de clique direito do mapa.",
    ["Reset arrow position and map pins"] =
        "Redefinir posição da seta e marcadores",
    ["Wowhead link for the current target"] =
        "Link do Wowhead para o destino atual",
    ["%d quests are hidden from the navigator."] =
        "Missões ocultas do navegador: %d.",
    ["Show all hidden quests again"] =
        "Mostrar novamente as missões ocultas",
    ["Reading windows"] =
        "Leitura de janelas",
    ["Read my professions now"] =
        "Ler minhas profissões agora",
    ["Open the profession window first."] =
        "Abra primeiro a janela de profissão.",
    ["Read my archaeology now"] =
        "Ler minha Arqueologia agora",
    ["Open the archaeology window first."] =
        "Abra primeiro a janela de Arqueologia.",
    ["Show synchronisation status"] =
        "Mostrar status da sincronização",
    ["Ask the data sharing question"] =
        "Perguntar sobre compartilhar dados",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.ptBR = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "ptBR")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
