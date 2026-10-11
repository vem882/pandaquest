-- Locales/ruRU.lua: ruRU translation. Keys are the English text from Locales/enUS.lua.
-- luacheck: max line length 220
local _, ns = ...

local T = {
    ["PandaQuest %s loaded. Type /pq for options, /pq help for commands."] =
        "PandaQuest %s загружен. Введите /pq для настроек, /pq help — список команд.",
    ["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."] =
        "Добро пожаловать в PandaQuest! Стрелка указывает на следующую цель задания. Введите /pq help, чтобы увидеть список команд.",
    ["%s is not available yet."] = "%s: пока недоступно.",
    ["Unknown command: %s"] = "Неизвестная команда: %s",
    ["Available commands:"] = "Доступные команды:",
    ["/pq - open options"] = "/pq - открыть настройки",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - показать или скрыть навигационную стрелку",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] =
        "/pq target [questID|clear] - выбрать задание целью (или показать текущую цель)",
    ["/pq next - skip the current target"] = "/pq next - пропустить текущую цель",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - единицы расстояния",
    ["/pq wh [questID] - Wowhead link"] = "/pq wh [questID] - ссылка Wowhead",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <questID> - скрыть задание из навигатора",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <questID> - снова показать скрытое задание",
    ["/pq reset - reset arrow position and map pins"] =
        "/pq reset - сбросить положение стрелки и метки на карте",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - уровень журнала",
    ["/pq dump quest|npc|object|item <id> - print database entry"] =
        "/pq dump quest|npc|object|item <id> - вывести запись базы данных",
    ["/pq status - addon status"] = "/pq status - состояние аддона",
    ["/pq sync - telemetry and community data status"] = "/pq sync - состояние телеметрии и данных сообщества",
    ["/pq lang auto|<locale> - interface language"] = "/pq lang auto|<locale> - язык интерфейса",
    ["Available languages: %s"] = "Доступные языки: %s",
    ["Units: %s"] = "Единицы: %s",
    ["meters"] = "метры",
    ["yards"] = "ярды",
    ["Usage: %s"] = "Использование: %s",
    ["Log level: %d (%s)"] = "Уровень журнала: %d (%s)",
    ["Arrow debug: %s"] = "Отладка стрелки: %s",
    ["Language: %s (reload the UI to apply everywhere)"] =
        "Язык: %s (перезагрузите интерфейс, чтобы изменения применились везде)",
    ["Enabled"] = "Включено",
    ["Disabled"] = "Отключено",
    ["Quest %d hidden."] = "Задание %d скрыто.",
    ["Quest %d is visible again."] = "Задание %d снова отображается.",
    ["Current target: %s"] = "Текущая цель: %s",
    ["No current target."] = "Текущей цели нет.",
    ["No target found for quest %d."] = "Для задания %d цель не найдена.",
    ["Not found: %s %d"] = "Не найдено: %s %d",
    ["Version %s"] = "Версия %s",
    ["Built %s from %s"] = "Сборка от %s, коммит %s",
    ["This is a build from a modified working tree; it is not a release."] =
        "Это сборка из изменённого рабочего дерева, а не релиз.",
    ["Database: %s"] = "База данных: %s",
    ["ready"] = "готова",
    ["loading"] = "загружается",
    ["Quests in log: %d"] = "Заданий в журнале: %d",
    ["Targets: %d"] = "Целей: %d",
    ["Background jobs: %d"] = "Фоновых задач: %d",
    ["Telemetry: %s, sessions stored: %d"] = "Телеметрия: %s, сохранено сессий: %d",
    ["Community data: %s"] = "Данные сообщества: %s",
    ["none"] = "нет",
    ["Arrow position and pins reset."] = "Положение стрелки и метки сброшены.",
    ["Profile changed: %s"] = "Профиль изменён: %s",

    -- Action texts, used by Objectives.DescribeTarget
    ["Kill %s (%d/%d)"] = "Убить: %s (%d/%d)",
    ["Talk to %s"] = "Поговорить: %s",
    ["Loot %s from %s (%d/%d)"] = "Добыть %s, источник: %s (%d/%d)",
    ["Collect %s from %s (%d/%d)"] = "Собрать %s, источник: %s (%d/%d)",
    ["Use %s (%d/%d)"] = "Использовать: %s (%d/%d)",
    ["Use %s on %s"] = "Использовать %s, цель: %s",
    ["Explore %s"] = "Исследовать: %s",
    ["Turn in to %s"] = "Сдать задание: %s",
    ["Pick up quest from %s"] = "Взять задание: %s",
    ["Kill %s"] = "Убить: %s",
    ["Loot %s from %s"] = "Добыть %s, источник: %s",

    -- Shared UI strings
    ["Click: next target"] = "Щелчок: следующая цель",
    ["Next: %s"] = "Далее: %s",
    ["%s complete - turn in to %s (%s)"] = "Выполнено: %s — сдать: %s (%s)",
    ["Community: avg %s"] = "Сообщество: в среднем %s",

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "База данных готова. Заданий: %d, NPC: %d, объектов: %d, предметов: %d (%d мс).",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "База данных PandaQuest не найдена. Переустановите аддон: отсутствуют файлы Database/Data.",

    -- Nav (arrow, router, TomTom)
    ["Arrow locked."] = "Стрелка закреплена.",
    ["Arrow unlocked - drag it to move."] = "Стрелка откреплена — перетащите её, чтобы переместить.",
    ["Close"] = "Закрыть",
    ["Custom target"] = "Своя цель",
    ["Distance"] = "Расстояние",
    ["ETA"] = "В пути",
    ["Hide this quest"] = "Скрыть это задание",
    ["Lock arrow"] = "Закрепить стрелку",
    ["Next target"] = "Следующая цель",
    ["Reset arrow position"] = "Сбросить положение стрелки",
    ["Right-click: arrow menu"] = "ПКМ: меню стрелки",
    ["Send to TomTom"] = "Отправить в TomTom",
    ["Shift-click: send to TomTom"] = "Shift+щелчок: отправить в TomTom",
    ["Show distance in metres"] = "Показывать расстояние в метрах",
    ["Show distance in yards"] = "Показывать расстояние в ярдах",
    ["Show on map"] = "Показать на карте",
    ["TomTom is not loaded."] = "TomTom не загружен.",
    ["Unlock arrow"] = "Открепить стрелку",
    ["Wowhead link"] = "Ссылка Wowhead",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "Точек появления здесь: %d",
    ["Left-click: navigate here"] = "ЛКМ: проложить путь сюда",
    ["Right-click: more options"] = "ПКМ: дополнительные действия",
    ["Set as target"] = "Назначить целью",
    ["Hide quest: %s"] = "Скрыть задание: %s",
    ["Wowhead: %s"] = "Wowhead: %s",
    ["Starts: %s"] = "Начинает: %s",
    ["Turn in: %s"] = "Сдать: %s",
    ["Ends: %s"] = "Завершает: %s",

    -- Map/NodeTooltip
    ["Level:"] = "Уровень:",
    ["Type:"] = "Тип:",
    ["Skill:"] = "Навык:",
    ["Respawn:"] = "Возрождение:",
    ["Respawn in:"] = "Возрождение через:",
    ["~%s (%d)"] = "~%s (%d)",
    ["Sightings:"] = "Наблюдений:",
    ["Found by you:"] = "Найдено вами:",
    ["Also here:"] = "Также здесь:",
    ["Unit"] = "NPC",
    ["Object"] = "Объект",
    ["Item"] = "Предмет",
    ["Area"] = "Область",
    ["%d Sec"] = "%d сек.",
    ["%d Secs"] = "%d сек.",
    ["%d Min"] = "%d мин.",
    ["%d Mins"] = "%d мин.",
    ["%d Hour"] = "%d ч.",
    ["%d Hours"] = "%d ч.",

    -- UI/Options
    ["General"] = "Общие",
    ["PandaQuest works out of the box. Everything below is optional."] =
        "PandaQuest работает сразу после установки. Всё ниже — по желанию.",
    ["Distance units"] = "Единицы расстояния",
    ["Metres are shown as '123 m', yards as '135 yd'."] = "Метры отображаются как «123 m», ярды — как «135 yd».",
    ["Show minimap button"] = "Показывать кнопку у миникарты",
    ["Left-click the minimap button to toggle the arrow, right-click for these options."] =
        "ЛКМ по кнопке у миникарты показывает или скрывает стрелку, ПКМ открывает эти настройки.",
    ["Language"] = "Язык",
    ["PandaQuest follows your game language; /pq lang overrides it."] =
        "PandaQuest использует язык вашей игры; /pq lang меняет его.",
    ["Arrow"] = "Стрелка",
    ["Show the arrow"] = "Показывать стрелку",
    ["Hide it to navigate by map pins only."] =
        "Скройте её, чтобы ориентироваться только по меткам на карте.",
    ["Lock the arrow in place"] = "Закрепить стрелку на месте",
    ["When unlocked, drag the arrow to move it."] = "Если стрелка откреплена, её можно перетащить.",
    ["Show quest text"] = "Показывать текст задания",
    ["Quest name and the action to take under the arrow."] =
        "Название задания и нужное действие под стрелкой.",
    ["Show travel time"] = "Показывать время в пути",
    ["Estimated time to the target at your current speed."] =
        "Расчётное время до цели при вашей текущей скорости.",
    ["Show community timings"] = "Показывать время от сообщества",
    ["Average completion time collected from other players, when available."] =
        "Среднее время выполнения, собранное у других игроков (если есть).",
    ["Hide inside instances"] = "Скрывать в подземельях и рейдах",
    ["The arrow cannot guide you inside a dungeon or raid."] =
        "Внутри подземелья или рейда стрелка не может вас вести.",
    ["Flash on arrival"] = "Вспышка по прибытии",
    ["A short glow when you reach the target."] = "Короткое свечение, когда вы достигаете цели.",
    ["Appearance"] = "Внешний вид",
    ["Size"] = "Размер",
    ["Arrow size relative to the default."] = "Размер стрелки относительно стандартного.",
    ["Opacity"] = "Непрозрачность",
    ["Text size"] = "Размер текста",
    ["Reset position"] = "Сбросить положение",
    ["Moves the arrow back to the middle of the screen."] = "Возвращает стрелку в центр экрана.",
    ["Navigation"] = "Навигация",
    ["Target selection"] = "Выбор цели",
    ["Auto weighs priority and distance; Focused quest follows one quest."] =
        "«Авто» учитывает приоритет и расстояние; «Выбранное задание» ведёт только к одному заданию.",
    ["Auto"] = "Авто",
    ["Focused quest"] = "Выбранное задание",
    ["Nearest"] = "Ближайшая",
    ["Focused quest ID"] = "ID выбранного задания",
    ["Used by 'Focused quest'. Empty follows the quest you track in the log."] =
        "Используется в режиме «Выбранное задание». Если поле пустое, берётся задание, отслеживаемое в журнале.",
    ["Route to turn-ins"] = "Маршрут к сдаче заданий",
    ["Completed quests are routed back to their quest giver."] =
        "Выполненные задания ведут обратно к заказчику.",
    ["Route to new quests"] = "Маршрут к новым заданиям",
    ["Nearby quests you could pick up are added to the route."] =
        "Ближайшие задания, которые вы можете взять, добавляются в маршрут.",
    ["New quest radius"] = "Радиус новых заданий",
    ["How far away a pickup may be to be routed to (yards)."] =
        "Максимальное расстояние до задания, чтобы оно попало в маршрут (в ярдах).",
    ["Maximum new quests"] = "Максимум новых заданий",
    ["How many pickups are routed at once."] =
        "Сколько новых заданий добавляется в маршрут одновременно.",
    ["Arrival radius"] = "Радиус прибытия",
    ["How close you must get before a target counts as reached (yards)."] =
        "Как близко нужно подойти, чтобы цель считалась достигнутой (в ярдах).",
    ["TomTom"] = "TomTom",
    ["TomTom waypoints"] = "Путевые точки TomTom",
    ["Mirror sends the current target to TomTom as a waypoint."] =
        "Дублирование отправляет текущую цель в TomTom как путевую точку.",
    ["Off"] = "Выкл.",
    ["Mirror current target"] = "Дублировать текущую цель",
    ["Map"] = "Карта",
    ["Show objective pins"] = "Показывать метки целей",
    ["Where to go for the quests in your log."] = "Куда идти для заданий из вашего журнала.",
    ["Show turn-in pins"] = "Показывать метки сдачи заданий",
    ["Quest givers waiting for a completed quest."] = "Заказчики, ожидающие выполненное задание.",
    ["Show available quest pins"] = "Показывать метки доступных заданий",
    ["Quests you could pick up."] = "Задания, которые вы можете взять.",
    ["Show pins on the minimap"] = "Показывать метки на миникарте",
    ["Keep distant pins on the minimap edge"] = "Удерживать далёкие метки на краю миникарты",
    ["Off hides a pin as soon as it leaves the minimap."] =
        "Если выключено, метка скрывается, как только выходит за пределы миникарты.",
    ["Merge nearby spawns"] = "Объединять близкие точки появления",
    ["One pin for a pack of mobs instead of a dozen."] = "Одна метка на группу существ вместо десятка.",
    ["Pin size"] = "Размер меток",
    ["Map pin size"] = "Размер меток на карте",
    ["Minimap pin size"] = "Размер меток на миникарте",
    -- Map/Pins, Map/Icons
    ["Objective dot size"] = "Размер точек целей",
    ["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."] =
        "Цели и места сбора отображаются маленькими точками, окрашенными по заданию или по типу; заказчики сохраняют свои значки.",
    ["Maximum minimap pins"] = "Максимум меток на миникарте",
    ["When there are more, the ones nearest to you are kept."] = "Если их больше, остаются ближайшие к вам.",
    ["Minimap edge fade"] = "Затухание у края миникарты",
    ["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] =
        "Метки блёкнут и уменьшаются после этой доли пути к краю миникарты. 0 отключает эффект.",
    ["Which quests to show"] = "Какие задания показывать",
    ["Show low level quests"] = "Показывать задания низкого уровня",
    ["Quests that are grey for your level."] = "Задания, которые для вашего уровня серые.",
    ["Show repeatable and daily quests"] = "Показывать повторяемые и ежедневные задания",
    ["Show dungeon quests"] = "Показывать задания подземелий",
    ["Show raid quests"] = "Показывать задания рейдов",
    ["Show PvP quests"] = "Показывать PvP-задания",
    ["Show pet battle quests"] = "Показывать задания битв питомцев",

    -- Nodes/Professions
    ["Gathering"] = "Сбор ресурсов",
    ["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] =
        "Руда, травы, рыбные косяки, сундуки и редкие существа: отображаются только там, где их действительно находили вы или сообщество.",
    ["Show gathering nodes"] = "Показывать места сбора",
    ["Turns the whole layer off, whatever the boxes below say."] =
        "Полностью отключает слой, независимо от флажков ниже.",
    ["Which nodes"] = "Какие места показывать",
    ["Mining veins"] = "Рудные жилы",
    ["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] =
        "Рудные жилы. Скрыты, если ваш навык Горного дела слишком низок, пока вы не включите показ таких мест.",
    ["Herbs"] = "Травы",
    ["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] =
        "Места появления трав. Скрыты, если ваш навык Травничества слишком низок, пока вы не включите показ таких мест.",
    ["Fishing pools"] = "Рыбные косяки",
    ["Fishing pools on lakes, rivers and the coast."] = "Рыбные косяки на озёрах, реках и побережье.",
    ["Chests and treasures"] = "Сундуки и сокровища",
    ["Chests and lockboxes in the world; no gathering skill filters these."] =
        "Сундуки и ларцы в мире; навык сбора на них не влияет.",
    ["Rare spawns"] = "Редкие существа",
    ["Rare creatures, at the places a rare was looted."] =
        "Редкие существа — в местах, где с них добывали добычу.",
    ["Which of them you can gather"] = "Какие из них вы можете собирать",
    ["Only my professions"] = "Только мои профессии",
    ["A profession you have not learned contributes nothing at all."] =
        "Неизученная профессия вообще не учитывается.",
    ["Show nodes above my skill"] = "Показывать места выше моего навыка",
    ["Drawn faded. Useful for planning where to level a gathering skill next."] =
        "Отображаются блёклыми. Полезно, чтобы спланировать, где прокачивать навык сбора дальше.",
    ["Fade nodes and mobs until they respawn"] = "Притемнять места и существ до возрождения",
    ["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] =
        "Место, где вы собрали ресурс, и убитое вами существо остаются блёклыми, пока таймер возрождения не покажет, что они вернулись.",

    ["Tooltips"] = "Подсказки",
    ["Add quest info to tooltips"] = "Добавлять сведения о заданиях в подсказки",
    ["Shows which quests an NPC or item starts, ends or counts towards."] =
        "Показывает, какие задания начинает или завершает NPC либо предмет и для каких заданий он нужен.",
    ["Show quest IDs"] = "Показывать ID заданий",
    ["Useful when reporting missing data."] = "Полезно при сообщении об отсутствующих данных.",
    ["Tracker"] = "Отслеживание",
    ["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] =
        "PandaQuest не заменяет панель отслеживания заданий Blizzard, а лишь дополняет её.",
    ["Enhance the Blizzard tracker"] = "Дополнять панель отслеживания Blizzard",
    ["Show distance on tracked quests"] = "Показывать расстояние у отслеживаемых заданий",
    ["Notifications"] = "Уведомления",
    ["Show notifications"] = "Показывать уведомления",
    ["A short message in the middle of the screen."] = "Короткое сообщение в центре экрана.",
    ["Quest complete and turned in"] = "Задание выполнено и сдано",
    ["Next objective"] = "Следующая цель",
    ["Play a sound"] = "Воспроизводить звук",
    ["Preview"] = "Предпросмотр",
    ["PandaQuest is ready."] = "PandaQuest готов к работе.",
    ["Synchronisation (optional)"] = "Синхронизация (необязательно)",
    ["Optional. PandaQuest works fully without it, and never uploads anything itself."] =
        "Необязательно. PandaQuest полностью работает и без этого и сам ничего не отправляет.",
    ["Record quest data"] = "Записывать данные о заданиях",
    ["Record movement breadcrumbs"] = "Записывать след перемещений",
    ["Occasional position samples that improve community routes."] =
        "Редкие замеры положения, которые улучшают маршруты сообщества.",
    ["Breadcrumb interval (seconds)"] = "Интервал записи следа (секунды)",
    ["Sessions to keep"] = "Хранить сессий",
    ["Events per session"] = "Событий на сессию",
    ["Advanced"] = "Дополнительно",
    ["Log level"] = "Уровень журнала",
    ["How much PandaQuest prints to chat."] = "Сколько сообщений PandaQuest выводит в чат.",
    ["Errors"] = "Ошибки",
    ["Warnings"] = "Предупреждения",
    ["Info"] = "Информация",
    ["Debug"] = "Отладка",
    ["Trace"] = "Трассировка",
    ["Arrow debug output"] = "Отладочный вывод стрелки",
    ["Prints the bearing values used by the arrow."] =
        "Выводит значения азимута, которые использует стрелка.",
    ["Redraw map pins"] = "Перерисовать метки на карте",
    ["Print status to chat"] = "Вывести состояние в чат",
    ["Profiles"] = "Профили",
    ["Options are not available; use /pq help for chat commands."] =
        "Настройки недоступны; список команд чата: /pq help.",

    -- UI (minimap button, tracker, notifications, Wowhead)
    ["Distance unknown"] = "Расстояние неизвестно",
    ["Left-click: toggle the arrow"] = "ЛКМ: показать или скрыть стрелку",
    ["Right-click: open options"] = "ПКМ: открыть настройки",
    ["Press Ctrl+C to copy the link:"] = "Нажмите Ctrl+C, чтобы скопировать ссылку:",
    ["Navigate to this quest"] = "Проложить путь к этому заданию",
    ["the quest giver"] = "заказчик",
    ["unknown distance"] = "расстояние неизвестно",
    ["%s complete"] = "Выполнено: %s",
    ["Turned in: %s"] = "Сдано: %s",

    -- Sync (telemetry, community data)
    ["Telemetry: %s"] = "Телеметрия: %s",
    ["Events recorded this session: %d (%d dropped)"] = "Событий записано за сессию: %d (отброшено: %d)",
    ["Sessions stored: %d, waiting for upload: %d"] = "Сессий сохранено: %d, ожидает отправки: %d",
    ["Last upload confirmed: %s"] = "Последняя отправка подтверждена: %s",
    ["never"] = "никогда",
    ["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] =
        "Пока телеметрия выключена, ничего не записывается. Включите её снова в /pq options.",
    ["No community data yet."] = "Данных сообщества пока нет.",
    ["Community data from %s"] = "Данные сообщества от %s",
    ["Last gear snapshot: %s"] = "Последний снимок экипировки: %s",
    ["Gear snapshots: off."] = "Снимки экипировки: выкл.",

    -- Sync / Consent
    ["/pq consent - ask the data sharing question again"] = "/pq consent - снова задать вопрос об обмене данными",
    ["PandaQuest can send what you do while questing to the community hub."] =
        "PandaQuest может отправлять в центр сообщества сведения о ваших действиях при выполнении заданий.",
    ["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] =
        "Это принятые и выполненные задания, убитые существа и добыча, места вашей гибели, а также положение на карте с указанием времени.",
    ["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] =
        "На этих данных строятся общие маршруты заданий. Пока вы не согласитесь, функция выключена; вы можете в любой момент остановить отправку и удалить данные.",
    ["PandaQuest can share your quest data to build the community routes."] =
        "PandaQuest может делиться данными о ваших заданиях для построения маршрутов сообщества.",
    ["It is off. Turn it on in /pq options if you want to take part."] =
        "Сейчас выключено. Включите это в /pq options, если хотите участвовать.",
    ["Share my quest data"] = "Делиться данными о заданиях",
    ["No thanks"] = "Нет, спасибо",
    ["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] =
        "Спасибо. PandaQuest будет делиться данными о ваших заданиях. Отключить это можно в любой момент: /pq sync.",
    ["Nothing will be collected. Turn it on any time in /pq options."] =
        "Ничего не будет собираться. Включить это можно в любой момент в /pq options.",

    -- Auction house: the scan, the invoices, the tooltip and the options section
    ["Scan prices"] = "Сканировать цены",
    ["Stop scan (%d%%)"] = "Остановить (%d%%)",
    ["Scanning the auction house. Keep the window open; closing it cancels the scan."] =
        "Идёт сканирование аукционного дома. Не закрывайте окно: при закрытии сканирование будет отменено.",
    ["Auction house scan finished: %d auctions of %d items in %s."] =
        "Сканирование аукционного дома завершено. Лотов: %d, предметов: %d, время: %s.",
    ["The scan stopped at %d auctions to keep the saved file small."] =
        "Сканирование остановлено, чтобы сохранённый файл не разрастался (лимит лотов: %d).",
    ["A scan is already running."] = "Сканирование уже выполняется.",
    ["Open the auction house first, then press Scan prices or type /pq scan."] =
        "Сначала откройте аукционный дом, затем нажмите «Сканировать цены» или введите /pq scan.",
    ["This client offers no auction house listing PandaQuest can read."] =
        "Этот клиент не предоставляет список аукционного дома, который может прочитать PandaQuest.",
    ["Scan cancelled: the auction house window was closed."] =
        "Сканирование отменено: окно аукционного дома было закрыто.",
    ["Scan stopped: the auction house did not answer."] =
        "Сканирование остановлено: аукционный дом не ответил.",
    ["Scan stopped. Nothing was saved."] = "Сканирование остановлено. Ничего не сохранено.",
    ["The auction house sent an empty listing. Nothing was saved."] =
        "Аукционный дом прислал пустой список. Ничего не сохранено.",
    ["No scan is running."] = "Сканирование не выполняется.",
    ["Scanning: %d%% (%d auctions read)."] = "Сканирование: %d%% (прочитано лотов: %d).",
    ["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."] =
        "Последнее сканирование: %s (%s, %s), лотов: %d, предметов: %d, %s назад.",
    ["No auction house scan yet for this realm."] =
        "Для этого игрового мира сканирования аукционного дома ещё не было.",
    ["AH minimum buyout"] = "Мин. выкуп на аукционе",
    ["AH market value"] = "Рыночная цена на аукционе",
    ["bids only"] = "только ставки",
    ["%s, scanned %s ago"] = "%s, просканировано %s назад",
    ["Auction house"] = "Аукционный дом",
    ["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] =
        "PandaQuest никогда не сканирует сам. Нажмите «Сканировать цены» в окне аукционного дома или введите /pq scan, пока оно открыто.",
    ["Show the scan button on the auction house window"] =
        "Показывать кнопку сканирования в окне аукционного дома",
    ["Show auction prices on item tooltips"] = "Показывать цены аукциона в подсказках предметов",
    ["The lowest buyout and the market value from your last scan on this realm, with how old it is."] =
        "Наименьшая цена выкупа и рыночная цена по вашему последнему сканированию в этом игровом мире, а также давность данных.",
    ["Record my auction sales and purchases"] = "Записывать мои продажи и покупки на аукционе",
    ["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."] =
        "Данные берутся из аукционных счетов в вашем почтовом ящике. Сохраняются предмет, количество и цена, но никогда не имя другого игрока.",
    -- Professions: the recipe scan, its refusals and the options section
    ["/pq scan professions - read the open profession window"] =
        "/pq scan professions - прочитать открытое окно профессии",
    ["/pq scan archaeology - read your archaeology window"] = "/pq scan archaeology - прочитать окно археологии",
    ["/pq digsite - show the dig site bar so you can move it"] =
        "/pq digsite - показать полосу раскопок, чтобы её можно было переместить",
    ["A profession scan is already running."] = "Сканирование профессии уже выполняется.",
    ["Open a profession window first, then type /pq scan professions."] =
        "Сначала откройте окно профессии, затем введите /pq scan professions.",
    ["This client does not offer the recipe list PandaQuest reads."] =
        "Этот клиент не предоставляет список рецептов, который читает PandaQuest.",
    ["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] =
        "Это окно с рецептами другого игрока, открытое по ссылке. PandaQuest его не записывает.",
    ["This profession window lists no recipes."] = "В этом окне профессии нет рецептов.",
    ["The profession list has not arrived from the server yet. Try again in a moment."] =
        "Список профессии ещё не получен от сервера. Повторите попытку через некоторое время.",
    ["Nothing was saved: not one recipe in this window could be read whole."] =
        "Ничего не сохранено: ни один рецепт в этом окне не удалось прочитать полностью.",
    ["The profession window changed while it was being read. Nothing was saved."] =
        "Окно профессии изменилось во время чтения. Ничего не сохранено.",
    ["The window was read short, so the recipe book you already have was kept."] =
        "Окно прочитано не полностью, поэтому ранее сохранённый список рецептов оставлен без изменений.",
    ["Profession scan cancelled: the window was closed."] =
        "Сканирование профессии отменено: окно было закрыто.",
    ["Profession scan stopped. Nothing was saved."] =
        "Сканирование профессии остановлено. Ничего не сохранено.",
    ["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."] =
        "PandaQuest не будет трогать окно профессии: не удаётся вернуть его в прежнее состояние (нет функции %s).",
    ["PandaQuest could not put your profession window back exactly as you left it."] =
        "PandaQuest не смог точно вернуть окно профессии в прежнее состояние.",
    ["Profession scan finished: %s %d/%d, %d recipes in %s."] =
        "Сканирование профессии завершено: %s %d/%d, рецептов: %d, время: %s.",
    ["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."] =
        "Пропущено рецептов: %d, так как игра ещё не закончила их загрузку. Откройте окно снова, чтобы дочитать их.",
    ["The scan stopped at %d recipes to keep the saved file small."] =
        "Сканирование остановлено, чтобы сохранённый файл не разрастался (лимит рецептов: %d).",
    ["Last scan of %s (%d/%d): %d recipes, %s ago."] =
        "Последнее сканирование: %s (%d/%d), рецептов: %d, %s назад.",
    ["No profession has been scanned on this character yet."] =
        "Ни одна профессия этого персонажа ещё не сканировалась.",
    ["Professions"] = "Профессии",
    ["PandaQuest reads an open profession window once and puts your filters and collapsed categories back."] =
        "PandaQuest однократно читает открытое окно профессии и возвращает на место ваши фильтры и свёрнутые категории.",
    ["Read my recipes when I open a profession"] = "Читать мои рецепты при открытии профессии",
    ["The recipes, their reagents and how hard each is for this character. Never a book opened from a link."] =
        "Рецепты, их реагенты и сложность каждого для этого персонажа. Книги, открытые по ссылке, не читаются никогда.",

    -- Flight master
    ["Flight time:"] = "Время полёта:",
    ["~%s (%d flight)"] = "~%s (полётов: %d)",
    ["~%s (%d flights)"] = "~%s (полётов: %d)",
    ["~%s left (%d flights)"] = "~%s осталось (полётов: %d)",
    ["%s in the air"] = "%s в воздухе",
    ["Flight progress"] = "Ход полёта",
    ["The flight bar is switched off in /pq options."] = "Полоса полёта отключена в /pq options.",
    ["The flight bar is locked. Unlock it in /pq options to move it."] =
        "Полоса полёта закреплена. Чтобы её переместить, открепите её в /pq options.",
    ["Drag the flight bar where you want it. It hides itself again in a moment."] =
        "Перетащите полосу полёта в нужное место. Через мгновение она снова скроется.",
    ["/pq flight - show the flight bar so you can drag it"] =
        "/pq flight - показать полосу полёта, чтобы её можно было перетащить",
    ["Flight master"] = "Распорядитель полётов",
    ["PandaQuest times your own flights and shows what it measured. A route you have never flown shows nothing at all."] =
        "PandaQuest засекает время ваших собственных полётов и показывает измеренное. Для маршрута, которым вы ни разу не летали, ничего не показывается.",
    ["Show the flight time at the flight master"] = "Показывать время полёта у распорядителя полётов",
    ["One line in the destination's tooltip, with how many of your own flights it rests on."] =
        "Одна строка в подсказке пункта назначения с указанием, на скольких ваших полётах она основана.",
    ["Show the progress bar while flying"] = "Показывать полосу прогресса во время полёта",
    ["Progress and remaining time once the route has been flown twice; before that, only the time in the air."] =
        "Прогресс и оставшееся время появляются после двух полётов по маршруту; до этого показывается только время в воздухе.",
    -- Archaeology
    ["This client does not offer the archaeology data PandaQuest reads."] =
        "Этот клиент не предоставляет данные археологии, которые читает PandaQuest.",
    ["This character has no archaeology races to read yet."] =
        "У этого персонажа пока нет рас археологии для чтения.",
    ["Your artifact history has not arrived yet, so the archaeology PandaQuest already had was kept."] =
        "История ваших артефактов ещё не получена, поэтому ранее сохранённые данные археологии оставлены без изменений.",
    ["No archaeology has been read on this character yet."] =
        "Данные археологии этого персонажа ещё не читались.",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] =
        "Археология %d/%d: рас - %d, артефактов - %d, прочитано %s назад.",
    ["Archaeology %d: %d races, %d artifacts, read %s ago."] =
        "Археология %d: рас - %d, артефактов - %d, прочитано %s назад.",
    ["Archaeology: %d races, %d artifacts, read %s ago."] =
        "Археология: рас - %d, артефактов - %d, прочитано %s назад.",
    ["Archaeology read: %d races, %d artifacts."] = "Археология прочитана: рас - %d, артефактов - %d.",
    ["The server has not sent your artifact history, so completion counts were left out."] =
        "Сервер не прислал историю ваших артефактов, поэтому число завершённых не указано.",
    ["Archaeology"] = "Археология",
    ["Mists never shipped a dig site progress bar. PandaQuest draws one from the events the game already sends."] =
        "В Mists of Pandaria не было полосы прогресса раскопок. PandaQuest рисует её по событиям, которые игра и так отправляет.",
    ["Read my archaeology when I open the window"] = "Читать мою археологию при открытии окна",
    ["Your races, their keystone, your fragments and the artifacts you have. Only this character's own."] =
        "Ваши расы, их ключевые камни, ваши фрагменты и имеющиеся артефакты. Только данные этого персонажа.",
    ["Dig site progress bar"] = "Полоса прогресса раскопок",
    ["Show the dig site progress bar"] = "Показывать полосу прогресса раскопок",
    ["Appears when you survey and hides when you leave the dig site."] =
        "Появляется, когда вы проводите поиск, и скрывается, когда вы покидаете место раскопок.",
    ["Lock the bar in place"] = "Закрепить полосу на месте",
    ["Unlocked, it can be dragged with the left mouse button."] =
        "Если полоса откреплена, её можно перетаскивать левой кнопкой мыши.",
    ["Bar size"] = "Размер полосы",
    ["Show me where it is"] = "Показать, где она",
    ["Puts an empty bar on screen for a moment so you can find it, and drag it when it is unlocked."] =
        "Ненадолго выводит на экран пустую полосу, чтобы вы нашли её и, если она откреплена, перетащили.",
    ["Reset bar position"] = "Сбросить положение полосы",
    ["Dig site progress"] = "Прогресс раскопок",
    ["Dig site complete"] = "Раскопки завершены",
    ["This client draws its own dig site progress bar."] =
        "Этот клиент рисует собственную полосу прогресса раскопок.",
    ["The dig site bar is switched off in /pq options."] = "Полоса раскопок отключена в /pq options.",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "Перетащите полосу раскопок в нужное место. Через мгновение она снова скроется.",
    ["The dig site bar is locked. Unlock it in /pq options to move it."] =
        "Полоса раскопок закреплена. Чтобы её переместить, открепите её в /pq options.",

    -- Database/QuestieDB (the optional QuestieDB addon)
    ["Quest database source"] = "Источник базы данных заданий",
    ["Uses the QuestieDB addon, if it is installed and enabled, to complete PandaQuest's own database. Takes effect after /reload."] =
        "Использует аддон QuestieDB (если он установлен и включён) для дополнения собственной базы данных PandaQuest. Вступает в силу после /reload.",
    ["PandaQuest only"] = "Только PandaQuest",
    ["Fill gaps from QuestieDB"] = "Заполнять пробелы из QuestieDB",
    ["QuestieDB values first"] = "Сначала значения QuestieDB",
    ["QuestieDB: %s"] = "QuestieDB: %s",
    ["QuestieDB: %s (%d entries added, %d refreshed)"] = "QuestieDB: %s (добавлено записей: %d, обновлено: %d)",
    ["not used (off)"] = "не используется (выкл.)",
    ["not installed"] = "не установлен",
    ["cannot be used (%s)"] = "использовать нельзя (%s)",
    ["not read yet"] = "ещё не прочитано",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.ruRU = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "ruRU")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
