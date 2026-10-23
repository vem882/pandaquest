-- Locales/zhTW.lua: zhTW translation. Keys are the English text from Locales/enUS.lua.
-- luacheck: max line length 220
local _, ns = ...

local T = {
    -- Core / Init
    ["%s is not available yet."] = "%s 目前尚無法使用。",
    ["Unknown command: %s"] = "未知的指令：%s",
    ["Available commands:"] = "可用的指令：",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - 切換導航箭頭",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] =
        "/pq target [questID|clear] - 固定一個任務（或顯示目前目標）",
    ["/pq next - skip the current target"] = "/pq next - 略過目前的目標",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - 距離單位",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <questID> - 從導航中隱藏任務",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <questID> - 重新顯示已隱藏的任務",
    ["/pq reset - reset arrow position and map pins"] = "/pq reset - 重設箭頭位置與地圖標記",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - 記錄等級",
    ["/pq dump quest|npc|object|item <id> - print database entry"] = "/pq dump quest|npc|object|item <id> - 輸出資料庫項目",
    ["/pq status - addon status"] = "/pq status - 插件狀態",
    ["/pq sync - telemetry and community data status"] = "/pq sync - 遙測與社群資料狀態",
    ["/pq lang auto|<locale> - interface language"] = "/pq lang auto|<locale> - 介面語言",
    ["Available languages: %s"] = "可用的語言：%s",
    ["Units: %s"] = "單位：%s",
    ["meters"] = "公尺",
    ["yards"] = "碼",
    ["Usage: %s"] = "用法：%s",
    ["Log level: %d (%s)"] = "記錄等級：%d（%s）",
    ["Arrow debug: %s"] = "箭頭除錯：%s",
    ["Language: %s (reload the UI to apply everywhere)"] = "語言：%s（重新載入介面後才會全面套用）",
    ["Enabled"] = "已啟用",
    ["Disabled"] = "已停用",
    ["Quest %d hidden."] = "任務 %d 已隱藏。",
    ["Quest %d is visible again."] = "任務 %d 已重新顯示。",
    ["Current target: %s"] = "目前目標：%s",
    ["No current target."] = "目前沒有目標。",
    ["No target found for quest %d."] = "找不到任務 %d 的目標。",
    ["Not found: %s %d"] = "找不到：%s %d",
    ["Version %s"] = "版本 %s",
    ["Built %s from %s"] = "建置於 %s，來源提交 %s",
    ["This is a build from a modified working tree; it is not a release."] =
        "這是從已修改的工作目錄建置的版本，並非正式發行版。",
    ["Database: %s"] = "資料庫：%s",
    ["ready"] = "就緒",
    ["loading"] = "載入中",
    ["Quests in log: %d"] = "任務日誌中的任務：%d",
    ["Targets: %d"] = "目標：%d",
    ["Background jobs: %d"] = "背景工作：%d",
    ["Telemetry: %s, sessions stored: %d"] = "遙測：%s，已儲存的工作階段：%d",
    ["Community data: %s"] = "社群資料：%s",
    ["none"] = "無",
    ["Arrow position and pins reset."] = "箭頭位置與標記已重設。",
    ["Profile changed: %s"] = "設定檔已變更：%s",

    -- Action texts, used by Objectives.DescribeTarget
    ["Kill %s (%d/%d)"] = "擊殺%s (%d/%d)",
    ["Talk to %s"] = "與%s交談",
    ["Loot %s from %s (%d/%d)"] = "拾取%s，來自%s (%d/%d)",
    ["Collect %s from %s (%d/%d)"] = "收集%s，來自%s (%d/%d)",
    ["Use %s (%d/%d)"] = "使用%s (%d/%d)",
    ["Use %s on %s"] = "使用%s，目標：%s",
    ["Explore %s"] = "探索%s",
    ["Turn in to %s"] = "向%s交付任務",
    ["Pick up quest from %s"] = "從%s接取任務",
    ["Kill %s"] = "擊殺%s",
    ["Loot %s from %s"] = "拾取%s，來自%s",

    -- Shared UI strings
    ["Click: next target"] = "點擊：下一個目標",
    ["Next: %s"] = "下一個：%s",
    ["%s complete - turn in to %s (%s)"] = "%s已完成 - 向%s交付任務 (%s)",
    ["Community: avg %s"] = "社群平均：%s",

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "資料庫已就緒：%d 個任務、%d 個 NPC、%d 個物件、%d 個物品 (%d 毫秒)。",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "找不到 PandaQuest 資料庫。請重新安裝插件：缺少 Database/Data 檔案。",

    -- Nav (arrow, router, TomTom)
    ["Arrow locked."] = "箭頭已鎖定。",
    ["Arrow unlocked - drag it to move."] = "箭頭已解除鎖定 - 拖曳即可移動。",
    ["Close"] = "關閉",
    ["Custom target"] = "自訂目標",
    ["Distance"] = "距離",
    ["ETA"] = "預計抵達",
    ["Hide this quest"] = "隱藏此任務",
    ["Lock arrow"] = "鎖定箭頭",
    ["Next target"] = "下一個目標",
    ["Reset arrow position"] = "重設箭頭位置",
    ["Right-click: arrow menu"] = "右鍵點擊：箭頭選單",
    ["Send to TomTom"] = "傳送至 TomTom",
    ["Shift-click: send to TomTom"] = "Shift+點擊：傳送至 TomTom",
    ["Show distance in metres"] = "以公尺顯示距離",
    ["Show distance in yards"] = "以碼顯示距離",
    ["Show on map"] = "在地圖上顯示",
    ["TomTom is not loaded."] = "TomTom 尚未載入。",
    ["Unlock arrow"] = "解除鎖定箭頭",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "此處有 %d 個重生點",
    ["Left-click: navigate here"] = "左鍵點擊：導航至此",
    ["Right-click: more options"] = "右鍵點擊：更多選項",
    ["Set as target"] = "設為目標",
    ["Hide quest: %s"] = "隱藏任務：%s",
    ["Starts: %s"] = "起始：%s",
    ["Turn in: %s"] = "交付任務：%s",
    ["Ends: %s"] = "結束：%s",

    -- Map/NodeTooltip
    ["Level:"] = "等級：",
    ["Type:"] = "類型：",
    ["Skill:"] = "技能：",
    ["Respawn:"] = "重生時間：",
    ["Respawn in:"] = "重生倒數：",
    ["~%s (%d)"] = "~%s (%d)",
    ["Sightings:"] = "目擊次數：",
    ["Found by you:"] = "你發現的次數：",
    ["Also here:"] = "此處還有：",
    ["Unit"] = "生物",
    ["Object"] = "物件",
    ["Item"] = "物品",
    ["Area"] = "區域",
    ["%d Sec"] = "%d 秒",
    ["%d Secs"] = "%d 秒",
    ["%d Min"] = "%d 分鐘",
    ["%d Mins"] = "%d 分鐘",
    ["%d Hour"] = "%d 小時",
    ["%d Hours"] = "%d 小時",

    -- UI/Options
    ["General"] = "一般",
    ["PandaQuest works out of the box. Everything below is optional."] = "PandaQuest 安裝後即可使用，以下設定皆為選用。",
    ["Distance units"] = "距離單位",
    ["Metres are shown as '123 m', yards as '135 yd'."] = "公尺顯示為「123 m」，碼顯示為「135 yd」。",
    ["Show minimap button"] = "顯示小地圖按鈕",
    ["Language"] = "語言",
    ["PandaQuest follows your game language; /pq lang overrides it."] = "PandaQuest 會跟隨遊戲語言；可用 /pq lang 改成其他語言。",
    ["Arrow"] = "箭頭",
    ["Show the arrow"] = "顯示箭頭",
    ["Hide it to navigate by map pins only."] = "隱藏後只以地圖標記導航。",
    ["Lock the arrow in place"] = "鎖定箭頭位置",
    ["When unlocked, drag the arrow to move it."] = "解除鎖定時，可拖曳箭頭來移動。",
    ["Show quest text"] = "顯示任務文字",
    ["Quest name and the action to take under the arrow."] = "在箭頭下方顯示任務名稱與要執行的動作。",
    ["Show travel time"] = "顯示行程時間",
    ["Estimated time to the target at your current speed."] = "依你目前的速度估算抵達目標所需的時間。",
    ["Show community timings"] = "顯示社群完成時間",
    ["Average completion time collected from other players, when available."] =
        "有資料時，顯示從其他玩家收集到的平均完成時間。",
    ["Hide inside instances"] = "在副本內隱藏",
    ["The arrow cannot guide you inside a dungeon or raid."] = "箭頭無法在地城或團隊副本內為你引路。",
    ["Flash on arrival"] = "抵達時閃爍",
    ["A short glow when you reach the target."] = "抵達目標時短暫發光。",
    ["Appearance"] = "外觀",
    ["Size"] = "大小",
    ["Arrow size relative to the default."] = "箭頭相對於預設值的大小。",
    ["Opacity"] = "不透明度",
    ["Text size"] = "文字大小",
    ["Reset position"] = "重設位置",
    ["Moves the arrow back to the middle of the screen."] = "將箭頭移回螢幕中央。",
    ["Navigation"] = "導航",
    ["Target selection"] = "目標選擇",
    ["Auto weighs priority and distance; Focused quest follows one quest."] =
        "「自動」會綜合考量優先順序與距離；「專注任務」只追隨單一任務。",
    ["Auto"] = "自動",
    ["Focused quest"] = "專注任務",
    ["Nearest"] = "最近",
    ["Focused quest ID"] = "專注任務 ID",
    ["Used by 'Focused quest'. Empty follows the quest you track in the log."] =
        "供「專注任務」使用。留空則追隨你在任務日誌中追蹤的任務。",
    ["Route to turn-ins"] = "導向交付地點",
    ["Completed quests are routed back to their quest giver."] = "已完成的任務會導向其任務發布者。",
    ["Route to new quests"] = "導向新任務",
    ["Nearby quests you could pick up are added to the route."] = "附近可接取的任務會加入路線。",
    ["New quest radius"] = "新任務範圍",
    ["How far away a pickup may be to be routed to (yards)."] = "接取地點最遠離你多遠仍會被導向（碼）。",
    ["Maximum new quests"] = "新任務數量上限",
    ["How many pickups are routed at once."] = "同時導向的接取地點數量。",
    ["Arrival radius"] = "抵達範圍",
    ["How close you must get before a target counts as reached (yards)."] = "與目標的距離要多近才算抵達（碼）。",
    ["TomTom"] = "TomTom",
    ["TomTom waypoints"] = "TomTom 路徑點",
    ["Mirror sends the current target to TomTom as a waypoint."] = "「同步目前目標」會將目前的目標作為路徑點傳送給 TomTom。",
    ["Off"] = "關閉",
    ["Mirror current target"] = "同步目前目標",
    ["Map"] = "地圖",
    ["Show objective pins"] = "顯示目標標記",
    ["Where to go for the quests in your log."] = "你任務日誌中任務的前往地點。",
    ["Show turn-in pins"] = "顯示交付標記",
    ["Quest givers waiting for a completed quest."] = "等著你交付已完成任務的任務發布者。",
    ["Show available quest pins"] = "顯示可接任務標記",
    ["Quests you could pick up."] = "你可以接取的任務。",
    ["Show pins on the minimap"] = "在小地圖上顯示標記",
    ["Keep distant pins on the minimap edge"] = "將遠處的標記保留在小地圖邊緣",
    ["Off hides a pin as soon as it leaves the minimap."] = "關閉時，標記一離開小地圖範圍就會隱藏。",
    ["Merge nearby spawns"] = "合併鄰近的重生點",
    ["One pin for a pack of mobs instead of a dozen."] = "一群怪物只顯示一個標記，而不是十幾個。",
    ["Pin size"] = "標記大小",
    ["Map pin size"] = "地圖標記大小",
    ["Minimap pin size"] = "小地圖標記大小",

    -- Map/Pins, Map/Icons
    ["Objective dot size"] = "目標圓點大小",
    ["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."] =
        "目標與採集點以小圓點顯示，依任務或種類著色；任務發布者則保留原本的圖示。",
    ["Maximum minimap pins"] = "小地圖標記數量上限",
    ["When there are more, the ones nearest to you are kept."] = "超過上限時，會保留離你最近的標記。",
    ["Minimap edge fade"] = "小地圖邊緣淡出",
    ["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] =
        "標記在朝小地圖邊緣超過這個比例後會淡出並縮小。設為 0 即關閉。",
    ["Which quests to show"] = "要顯示哪些任務",
    ["Show low level quests"] = "顯示低等級任務",
    ["Quests that are grey for your level."] = "對你的等級來說已是灰色的任務。",
    ["Show repeatable and daily quests"] = "顯示可重複與每日任務",
    ["Show dungeon quests"] = "顯示地城任務",
    ["Show raid quests"] = "顯示團隊任務",
    ["Show PvP quests"] = "顯示 PvP 任務",
    ["Show pet battle quests"] = "顯示寵物對戰任務",

    -- Nodes/Professions
    ["Gathering"] = "採集",
    ["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] =
        "礦石、草藥、魚群、寶箱與稀有怪物，只會標示在你或社群實際發現過的地點。",
    ["Show gathering nodes"] = "顯示採集點",
    ["Turns the whole layer off, whatever the boxes below say."] = "無論下方的選項如何勾選，都會關閉整個圖層。",
    ["Which nodes"] = "要顯示哪些採集點",
    ["Mining veins"] = "礦脈",
    ["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] =
        "礦脈。你的採礦技能過低時會隱藏，除非你也選擇顯示這些。",
    ["Herbs"] = "草藥",
    ["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] =
        "草藥採集點。你的草藥學技能過低時會隱藏，除非你也選擇顯示這些。",
    ["Fishing pools"] = "魚群",
    ["Fishing pools on lakes, rivers and the coast."] = "湖泊、河流與海岸的魚群。",
    ["Chests and treasures"] = "寶箱與寶藏",
    ["Chests and lockboxes in the world; no gathering skill filters these."] =
        "世界中的寶箱與上鎖的箱子；不受任何採集技能篩選。",
    ["Rare spawns"] = "稀有怪物",
    ["Rare creatures, at the places a rare was looted."] = "稀有怪物，標示在曾被拾取過戰利品的地點。",
    ["Which of them you can gather"] = "你能採集哪些",
    ["Only my professions"] = "只顯示我的專業技能",
    ["A profession you have not learned contributes nothing at all."] = "你尚未學習的專業技能完全不會顯示任何採集點。",
    ["Show nodes above my skill"] = "顯示高於我技能等級的採集點",
    ["Drawn faded. Useful for planning where to level a gathering skill next."] =
        "以淡化方式顯示。適合用來規劃下一步去哪裡提升採集技能。",
    ["Fade nodes and mobs until they respawn"] = "重生前淡化採集點與怪物",
    ["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] =
        "你採集過的採集點或擊殺過的怪物會保持淡化，直到重生計時顯示它已回來。",
    ["Tooltips"] = "提示",
    ["Add quest info to tooltips"] = "在提示中加入任務資訊",
    ["Shows which quests an NPC or item starts, ends or counts towards."] =
        "顯示 NPC 或物品會開始、結束哪些任務，或計入哪些任務目標。",
    ["Show quest IDs"] = "顯示任務 ID",
    ["Useful when reporting missing data."] = "回報缺少的資料時很有用。",
    ["Tracker"] = "任務追蹤",
    ["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] =
        "PandaQuest 不會取代 Blizzard 的任務追蹤，只會在上面增添功能。",
    ["Enhance the Blizzard tracker"] = "強化 Blizzard 任務追蹤",
    ["Show distance on tracked quests"] = "在追蹤中的任務上顯示距離",
    ["Notifications"] = "通知",
    ["Show notifications"] = "顯示通知",
    ["A short message in the middle of the screen."] = "在螢幕中央顯示一則簡短訊息。",
    ["Quest complete and turned in"] = "任務完成與交付",
    ["Next objective"] = "下一個目標",
    ["Play a sound"] = "播放音效",
    ["Preview"] = "預覽",
    ["PandaQuest is ready."] = "PandaQuest 已就緒。",
    ["Synchronisation (optional)"] = "同步（選用）",
    ["Optional. PandaQuest works fully without it, and never uploads anything itself."] =
        "選用。沒有它 PandaQuest 也能完整運作，而且絕不會自行上傳任何內容。",
    ["Record quest data"] = "記錄任務資料",
    ["Record movement breadcrumbs"] = "記錄移動軌跡",
    ["Occasional position samples that improve community routes."] = "偶爾取樣的位置資料，用來改善社群路線。",
    ["Breadcrumb interval (seconds)"] = "軌跡間隔（秒）",
    ["Sessions to keep"] = "保留的工作階段數",
    ["Events per session"] = "每個工作階段的事件數",
    ["Advanced"] = "進階",
    ["Log level"] = "記錄等級",
    ["How much PandaQuest prints to chat."] = "PandaQuest 在聊天視窗中輸出多少內容。",
    ["Errors"] = "錯誤",
    ["Warnings"] = "警告",
    ["Info"] = "資訊",
    ["Debug"] = "除錯",
    ["Trace"] = "追蹤",
    ["Arrow debug output"] = "箭頭除錯輸出",
    ["Prints the bearing values used by the arrow."] = "輸出箭頭所使用的方位值。",
    ["Redraw map pins"] = "重新繪製地圖標記",
    ["Print status to chat"] = "將狀態輸出到聊天視窗",
    ["Profiles"] = "設定檔",
    ["Options are not available; use /pq help for chat commands."] = "無法使用選項；請使用 /pq help 查看聊天指令。",

    -- UI (minimap button, tracker, notifications, Wowhead)
    ["Distance unknown"] = "距離未知",
    ["Left-click: browse all quests"] = "左鍵點擊：瀏覽所有任務",
    ["Right-click: open options"] = "右鍵點擊：開啟選項",
    ["Press Ctrl+C to copy the link:"] = "按 Ctrl+C 複製連結：",
    ["Navigate to this quest"] = "導航至此任務",
    ["the quest giver"] = "任務發布者",
    ["unknown distance"] = "距離未知",
    ["%s complete"] = "%s已完成",
    ["Turned in: %s"] = "已交付：%s",

    -- Sync (telemetry, community data)
    ["Telemetry: %s"] = "遙測：%s",
    ["Events recorded this session: %d (%d dropped)"] = "本次工作階段已記錄的事件：%d（已捨棄 %d）",
    ["Sessions stored: %d, waiting for upload: %d"] = "已儲存的工作階段：%d，等待上傳：%d",
    ["Last upload confirmed: %s"] = "最近一次確認上傳：%s",
    ["never"] = "從未",
    ["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] =
        "遙測關閉時不會記錄任何內容。請在 /pq options 中重新啟用。",
    ["No community data yet."] = "目前尚無社群資料。",
    ["Community data from %s"] = "社群資料來自 %s",
    ["Last gear snapshot: %s"] = "最近一次裝備快照：%s",
    ["Gear snapshots: off."] = "裝備快照：關閉。",

    -- Sync / Consent
    ["/pq consent - ask the data sharing question again"] = "/pq consent - 再次詢問是否分享資料",
    ["PandaQuest can send what you do while questing to the community hub."] =
        "PandaQuest 可以把你執行任務時的行動傳送到社群中心。",
    ["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] =
        "也就是你接取與完成的任務、你擊殺與拾取的東西、你死亡的地點，以及你的地圖位置與時間。",
    ["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] =
        "這些資料用來建立共用的任務路線。在你同意之前不會啟用，你也可以隨時停止並刪除。",
    ["PandaQuest can share your quest data to build the community routes."] =
        "PandaQuest 可以分享你的任務資料，用來建立社群路線。",
    ["It is off. Turn it on in /pq options if you want to take part."] = "目前為關閉狀態。若想參與，請在 /pq options 中開啟。",
    ["Share my quest data"] = "分享我的任務資料",
    ["No thanks"] = "不用了，謝謝",
    ["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] =
        "謝謝你。PandaQuest 將會分享你的任務資料，你隨時可以用 /pq sync 關閉。",
    ["Nothing will be collected. Turn it on any time in /pq options."] = "不會收集任何資料。你隨時可以在 /pq options 中開啟。",

    -- Auction house: the scan, the invoices, the tooltip and the options section
    ["Scan prices"] = "掃描價格",
    ["Stop scan (%d%%)"] = "停止掃描 (%d%%)",
    ["Scanning the auction house. Keep the window open; closing it cancels the scan."] =
        "正在掃描拍賣場。請保持視窗開啟；關閉視窗會取消掃描。",
    ["Auction house scan finished: %d auctions of %d items in %s."] = "拍賣場掃描完成：%d 筆拍賣、%d 種物品，耗時 %s。",
    ["The scan stopped at %d auctions to keep the saved file small."] =
        "為了讓儲存的檔案不致過大，掃描已在 %d 筆拍賣時停止。",
    ["A scan is already running."] = "已有掃描正在進行中。",
    ["Open the auction house first, then press Scan prices or type /pq scan."] =
        "請先開啟拍賣場，再按下「掃描價格」或輸入 /pq scan。",
    ["This client offers no auction house listing PandaQuest can read."] = "此遊戲用戶端沒有提供 PandaQuest 可讀取的拍賣場列表。",
    ["Scan cancelled: the auction house window was closed."] = "掃描已取消：拍賣場視窗已關閉。",
    ["Scan stopped: the auction house did not answer."] = "掃描已停止：拍賣場沒有回應。",
    ["Scan stopped. Nothing was saved."] = "掃描已停止。沒有儲存任何資料。",
    ["The auction house sent an empty listing. Nothing was saved."] = "拍賣場傳回了空白的列表。沒有儲存任何資料。",
    ["No scan is running."] = "目前沒有進行中的掃描。",
    ["Scanning: %d%% (%d auctions read)."] = "掃描中：%d%%（已讀取 %d 筆拍賣）。",
    ["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."] = "%s 的最近一次掃描 (%s, %s)：%d 筆拍賣、%d 種物品，%s前。",
    ["No auction house scan yet for this realm."] = "此伺服器尚未進行過拍賣場掃描。",
    ["AH minimum buyout"] = "拍賣場最低一口價",
    ["AH market value"] = "拍賣場市價",
    ["bids only"] = "僅限競標",
    ["%s, scanned %s ago"] = "%s，%s前掃描",
    ["Auction house"] = "拍賣場",
    ["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] =
        "PandaQuest 絕不會自行掃描。請在拍賣場視窗中按下「掃描價格」，或在視窗開啟時輸入 /pq scan。",
    ["Show the scan button on the auction house window"] = "在拍賣場視窗顯示掃描按鈕",
    ["Show auction prices on item tooltips"] = "在物品提示中顯示拍賣價格",
    ["The lowest buyout and the market value from your last scan on this realm, with how old it is."] =
        "顯示你在此伺服器上最近一次掃描得到的最低一口價與市價，以及資料已過了多久。",
    ["Record my auction sales and purchases"] = "記錄我的拍賣出售與購買",
    ["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."] =
        "從信箱中的拍賣發票讀取。只會保留物品、數量與價格，絕不保留對方玩家的名稱。",

    -- Professions: the recipe scan, its refusals and the options section
    ["/pq scan professions - read the open profession window"] = "/pq scan professions - 讀取已開啟的專業技能視窗",
    ["/pq scan archaeology - read your archaeology window"] = "/pq scan archaeology - 讀取你的考古學視窗",
    ["/pq digsite - show the dig site bar so you can move it"] = "/pq digsite - 顯示挖掘場進度條，讓你可以移動它",
    ["A profession scan is already running."] = "已有專業技能掃描正在進行中。",
    ["Open a profession window first, then type /pq scan professions."] = "請先開啟專業技能視窗，再輸入 /pq scan professions。",
    ["This client does not offer the recipe list PandaQuest reads."] = "此遊戲用戶端沒有提供 PandaQuest 所讀取的配方列表。",
    ["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] =
        "那個視窗是透過連結開啟的其他玩家配方列表。PandaQuest 不會記錄它。",
    ["This profession window lists no recipes."] = "此專業技能視窗沒有列出任何配方。",
    ["The profession list has not arrived from the server yet. Try again in a moment."] =
        "專業技能列表尚未從伺服器傳來。請稍候再試一次。",
    ["Nothing was saved: not one recipe in this window could be read whole."] =
        "沒有儲存任何資料：此視窗中沒有任何一個配方能被完整讀取。",
    ["The profession window changed while it was being read. Nothing was saved."] =
        "專業技能視窗在讀取期間發生了變化。沒有儲存任何資料。",
    ["The window was read short, so the recipe book you already have was kept."] =
        "此視窗的讀取不完整，因此保留了你原有的配方列表。",
    ["Profession scan cancelled: the window was closed."] = "專業技能掃描已取消：視窗已關閉。",
    ["Profession scan stopped. Nothing was saved."] = "專業技能掃描已停止。沒有儲存任何資料。",
    ["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."] =
        "PandaQuest 不會更動你的專業技能視窗：它無法把 %s 還原成你離開時的樣子。",
    ["PandaQuest could not put your profession window back exactly as you left it."] =
        "PandaQuest 無法把你的專業技能視窗完全還原成你離開時的樣子。",
    ["Profession scan finished: %s %d/%d, %d recipes in %s."] = "專業技能掃描完成：%s %d/%d，%d 個配方，耗時 %s。",
    ["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."] =
        "有 %d 個配方因為遊戲尚未載入完成而被略過。請重新開啟視窗以完成讀取。",
    ["The scan stopped at %d recipes to keep the saved file small."] = "為了讓儲存的檔案不致過大，掃描已在 %d 個配方時停止。",
    ["Last scan of %s (%d/%d): %d recipes, %s ago."] = "%s 的最近一次掃描 (%d/%d)：%d 個配方，%s前。",
    ["No profession has been scanned on this character yet."] = "此角色尚未掃描過任何專業技能。",
    ["Professions"] = "專業技能",
    ["PandaQuest reads an open profession window once and puts your filters and collapsed categories back."] =
        "PandaQuest 只會讀取已開啟的專業技能視窗一次，並把你的篩選條件與已收合的分類還原。",
    ["Read my recipes when I open a profession"] = "開啟專業技能時讀取我的配方",
    ["The recipes, their reagents and how hard each is for this character. Never a book opened from a link."] =
        "配方、所需材料，以及每個配方對此角色的難度。絕不包含從連結開啟的配方列表。",

    -- Flight master
    ["Flight time:"] = "飛行時間：",
    ["~%s (%d flight)"] = "~%s (%d 次飛行)",
    ["~%s (%d flights)"] = "~%s (%d 次飛行)",
    ["~%s left (%d flights)"] = "剩餘 ~%s (%d 次飛行)",
    ["%s in the air"] = "已飛行 %s",
    ["Flight progress"] = "飛行進度",
    ["The flight bar is switched off in /pq options."] = "飛行進度條已在 /pq options 中關閉。",
    ["The flight bar is locked. Unlock it in /pq options to move it."] =
        "飛行進度條已鎖定。請在 /pq options 中解除鎖定才能移動它。",
    ["Drag the flight bar where you want it. It hides itself again in a moment."] =
        "把飛行進度條拖曳到你想要的位置。它稍後會自動再次隱藏。",
    ["/pq flight - show the flight bar so you can drag it"] = "/pq flight - 顯示飛行進度條，讓你可以拖曳它",
    ["Flight master"] = "飛行管理員",
    ["PandaQuest times your own flights and shows what it measured. A route you have never flown shows nothing at all."] =
        "PandaQuest 會計時你自己的飛行，並顯示測得的結果。你從未飛過的路線不會顯示任何資料。",
    ["Show the flight time at the flight master"] = "在飛行管理員處顯示飛行時間",
    ["One line in the destination's tooltip, with how many of your own flights it rests on."] =
        "在目的地的提示中加上一行，並註明它是依據你自己的幾次飛行得出。",
    ["Show the progress bar while flying"] = "飛行時顯示進度條",
    ["Progress and remaining time once the route has been flown twice; before that, only the time in the air."] =
        "路線飛過兩次後會顯示進度與剩餘時間；在那之前只顯示已飛行的時間。",

    -- Archaeology
    ["This client does not offer the archaeology data PandaQuest reads."] =
        "此遊戲用戶端沒有提供 PandaQuest 所讀取的考古學資料。",
    ["This character has no archaeology races to read yet."] = "此角色目前沒有可讀取的考古學種族。",
    ["Your artifact history has not arrived yet, so the archaeology PandaQuest already had was kept."] =
        "你的文物歷史記錄尚未傳來，因此保留了 PandaQuest 原有的考古學資料。",
    ["No archaeology has been read on this character yet."] = "此角色尚未讀取過考古學資料。",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] = "考古學 %d/%d：%d 個種族、%d 件文物，%s前讀取。",
    ["Archaeology %d: %d races, %d artifacts, read %s ago."] = "考古學 %d：%d 個種族、%d 件文物，%s前讀取。",
    ["Archaeology: %d races, %d artifacts, read %s ago."] = "考古學：%d 個種族、%d 件文物，%s前讀取。",
    ["Archaeology read: %d races, %d artifacts."] = "已讀取考古學資料：%d 個種族、%d 件文物。",
    ["The server has not sent your artifact history, so completion counts were left out."] =
        "伺服器尚未傳來你的文物歷史記錄，因此省略了完成次數。",
    ["Archaeology"] = "考古學",
    ["Mists never shipped a dig site progress bar. PandaQuest draws one from the events the game already sends."] =
        "潘達利亞之謎從未內建挖掘場進度條。PandaQuest 會根據遊戲本來就會送出的事件自行繪製一個。",
    ["Read my archaeology when I open the window"] = "開啟視窗時讀取我的考古學資料",
    ["Your races, their keystone, your fragments and the artifacts you have. Only this character's own."] =
        "你的種族、其鑰石、你的碎片，以及你擁有的文物。僅限此角色自己的資料。",
    ["Dig site progress bar"] = "挖掘場進度條",
    ["Show the dig site progress bar"] = "顯示挖掘場進度條",
    ["Appears when you survey and hides when you leave the dig site."] = "勘察時出現，離開挖掘場時隱藏。",
    ["Lock the bar in place"] = "鎖定進度條位置",
    ["Unlocked, it can be dragged with the left mouse button."] = "解除鎖定後，可用滑鼠左鍵拖曳。",
    ["Bar size"] = "進度條大小",
    ["Show me where it is"] = "顯示它的位置",
    ["Puts an empty bar on screen for a moment so you can find it, and drag it when it is unlocked."] =
        "在畫面上短暫顯示一個空白的進度條讓你找到它；解除鎖定後即可拖曳。",
    ["Reset bar position"] = "重設進度條位置",
    ["Dig site progress"] = "挖掘場進度",
    ["Dig site complete"] = "挖掘場已完成",
    ["This client draws its own dig site progress bar."] = "此遊戲用戶端會自行繪製挖掘場進度條。",
    ["The dig site bar is switched off in /pq options."] = "挖掘場進度條已在 /pq options 中關閉。",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "把挖掘場進度條拖曳到你想要的位置。它稍後會自動再次隱藏。",
    ["The dig site bar is locked. Unlock it in /pq options to move it."] =
        "挖掘場進度條已鎖定。請在 /pq options 中解除鎖定才能移動它。",

    -- Database/QuestieDB (the optional QuestieDB addon)
    ["Quest database source"] = "任務資料庫來源",
    ["Uses the QuestieDB addon, if it is installed and enabled, to complete PandaQuest's own database. Takes effect after /reload."] =
        "若已安裝並啟用 QuestieDB 插件，就用它來補足 PandaQuest 自己的資料庫。/reload 後生效。",
    ["PandaQuest only"] = "僅使用 PandaQuest",
    ["Fill gaps from QuestieDB"] = "以 QuestieDB 補足缺漏",
    ["QuestieDB values first"] = "優先採用 QuestieDB 的值",
    ["QuestieDB: %s"] = "QuestieDB：%s",
    ["QuestieDB: %s (%d entries added, %d refreshed)"] = "QuestieDB：%s（新增 %d 筆，更新 %d 筆）",
    ["not used (off)"] = "未使用（已關閉）",
    ["not installed"] = "未安裝",
    ["cannot be used (%s)"] = "無法使用（%s）",
    ["not read yet"] = "尚未讀取",

    -- Quest browser, quest database source, language selection
    ["/pq quests [questID] - browse every quest in the database"] = "/pq quests [questID] - 瀏覽資料庫中的所有任務",
    ["Name"] = "名稱",
    ["Level"] = "等級",
    ["to"] = "至",
    ["My level"] = "我的等級",
    ["My side"] = "我的陣營",
    ["Alliance"] = "聯盟",
    ["Horde"] = "部落",
    ["Both"] = "雙方",
    ["both factions"] = "雙方陣營",
    ["Dungeon"] = "地城",
    ["Raid"] = "團隊",
    ["Group"] = "隊伍",
    ["PvP"] = "PvP",
    ["Daily"] = "每日",
    ["Event"] = "活動",
    ["Reset"] = "重設",
    ["All quests"] = "所有任務",
    ["%d quests"] = "%d 個任務",
    ["No quest matches these filters."] = "沒有符合這些篩選條件的任務。",
    ["Reading the quest database..."] = "正在讀取任務資料庫...",
    ["Quest"] = "任務",
    ["Zone"] = "區域",
    ["Req."] = "需求",
    ["XP"] = "經驗",
    ["A level %d quest for %s, from level %d."] = "%d 級任務，適用於%s，%d 級起可接取。",
    ["%d experience"] = "%d 點經驗值",
    ["Not in the database."] = "資料庫中沒有資料。",
    ["requires level"] = "需要等級",
    ["Yes"] = "是",
    ["No"] = "否",
    ["No location is known for this quest."] = "此任務沒有已知的地點。",
    ["Navigating to: %s"] = "導航至：%s",
    ["Start"] = "起始",
    ["End"] = "結束",
    ["Difficulty"] = "難度",
    ["Side"] = "陣營",
    ["Shareable"] = "可共享",
    ["Quest ID"] = "任務 ID",
    ["Rewards"] = "獎勵",
    ["Navigate"] = "導航",
    ["Pick a quest from the list to see its page."] = "從列表中選擇一個任務，即可查看它的頁面。",
    ["Quests"] = "任務",
    ["Shift-click: toggle the arrow"] = "Shift+點擊：切換箭頭",
    -- Beta notice and animation options
    ["This is a beta build: new features are not yet confirmed in the game."] =
        "這是測試版：新功能尚未在遊戲中確認。",
    ["Animations"] =
        "動畫",
    ["Windows fade and settle, messages slide in, bars glide. Switch it off for a calmer interface."] =
        "視窗淡入並定位，訊息滑入，進度條平滑移動。關閉後介面更安靜。",
    ["Turn all interface motion on or off."] =
        "開啟或關閉所有介面動態效果。",
    ["Animation speed"] =
        "動畫速度",
    ["1 is normal; 2 is twice as fast, 0.5 half as fast."] =
        "1 為正常；2 為兩倍速，0.5 為半速。",
    -- Options: language, tools
    ["Categories"] =
        "分類",
    ["Loosen a filter, or press Reset."] =
        "請放寬篩選條件，或按下「重設」。",
    ["Open the quest browser"] =
        "開啟任務瀏覽器",
    ["Browse every quest in the database, with a page and a map for each."] =
        "瀏覽資料庫中的所有任務，每個任務都有專屬頁面與地圖。",
    ["Choose the language of PandaQuest's texts. Automatic follows the game's language."] =
        "選擇 PandaQuest 文字使用的語言。選擇「自動」則跟隨遊戲語言。",
    ["Automatic (game language)"] =
        "自動（遊戲語言）",
    ["Reload the interface"] =
        "重新載入介面",
    ["Reloads the game's interface so a changed language applies everywhere."] =
        "重新載入遊戲介面，讓更改後的語言全面套用。",
    ["Tools"] =
        "工具",
    ["Everything the chat commands do, as buttons. Nothing here needs a command."] =
        "聊天指令能做的事，這裡都以按鈕提供，不需要輸入任何指令。",
    ["Skip the current target"] =
        "略過目前的目標",
    ["Moves the arrow on to the next target."] =
        "讓箭頭指向下一個目標。",
    ["Stop following the pinned quest"] =
        "停止追隨已固定的任務",
    ["Clears the quest pinned with the focus setting or the map's right-click menu."] =
        "清除透過「專注任務」設定或地圖右鍵選單所固定的任務。",
    ["Reset arrow position and map pins"] =
        "重設箭頭位置與地圖標記",
    ["%d quests are hidden from the navigator."] =
        "有 %d 個任務已從導航中隱藏。",
    ["Show all hidden quests again"] =
        "重新顯示所有已隱藏的任務",
    ["Reading windows"] =
        "讀取視窗",
    ["Read my professions now"] =
        "立即讀取我的專業技能",
    ["Open the profession window first."] =
        "請先開啟專業技能視窗。",
    ["Read my archaeology now"] =
        "立即讀取我的考古學資料",
    ["Open the archaeology window first."] =
        "請先開啟考古學視窗。",
    ["Show synchronisation status"] =
        "顯示同步狀態",
    ["Ask the data sharing question"] =
        "詢問是否分享資料",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.zhTW = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "zhTW")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
