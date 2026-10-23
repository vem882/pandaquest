-- Locales/zhCN.lua: zhCN translation. Keys are the English text from Locales/enUS.lua.
-- luacheck: max line length 220
local _, ns = ...

local T = {
    -- Core / Init
    ["PandaQuest %s loaded. Type /pq for options, /pq help for commands."] =
        "PandaQuest %s已加载。输入 /pq 打开选项，输入 /pq help 查看命令。",
    ["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."] =
        "欢迎使用PandaQuest！箭头会指向你的下一个任务目标。输入 /pq help 查看命令。",
    ["%s is not available yet."] = "%s暂不可用。",
    ["Unknown command: %s"] = "未知命令：%s",
    ["Available commands:"] = "可用命令：",
    ["/pq - open options"] = "/pq - 打开选项",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - 显示或隐藏导航箭头",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] =
        "/pq target [questID|clear] - 固定一个任务（或显示当前目标）",
    ["/pq next - skip the current target"] = "/pq next - 跳过当前目标",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - 距离单位",
    ["/pq wh [questID] - Wowhead link"] = "/pq wh [questID] - Wowhead链接",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <questID> - 在导航中隐藏任务",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <questID> - 重新显示已隐藏的任务",
    ["/pq reset - reset arrow position and map pins"] = "/pq reset - 重置箭头位置和地图标记",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - 日志级别",
    ["/pq dump quest|npc|object|item <id> - print database entry"] = "/pq dump quest|npc|object|item <id> - 输出数据库条目",
    ["/pq status - addon status"] = "/pq status - 插件状态",
    ["/pq sync - telemetry and community data status"] = "/pq sync - 遥测和社区数据状态",
    ["/pq lang auto|<locale> - interface language"] = "/pq lang auto|<locale> - 界面语言",
    ["Available languages: %s"] = "可用语言：%s",
    ["Units: %s"] = "单位：%s",
    ["meters"] = "米",
    ["yards"] = "码",
    ["Usage: %s"] = "用法：%s",
    ["Log level: %d (%s)"] = "日志级别：%d（%s）",
    ["Arrow debug: %s"] = "箭头调试：%s",
    ["Language: %s (reload the UI to apply everywhere)"] = "语言：%s（重新加载界面后全部生效）",
    ["Enabled"] = "已启用",
    ["Disabled"] = "已禁用",
    ["Quest %d hidden."] = "任务%d已隐藏。",
    ["Quest %d is visible again."] = "任务%d已重新显示。",
    ["Current target: %s"] = "当前目标：%s",
    ["No current target."] = "当前没有目标。",
    ["No target found for quest %d."] = "未找到任务%d的目标。",
    ["Not found: %s %d"] = "未找到：%s %d",
    ["Version %s"] = "版本%s",
    ["Built %s from %s"] = "构建于%s，提交%s",
    ["This is a build from a modified working tree; it is not a release."] = "此版本构建自已修改的工作目录，不是正式发布版。",
    ["Database: %s"] = "数据库：%s",
    ["ready"] = "就绪",
    ["loading"] = "加载中",
    ["Quests in log: %d"] = "日志中的任务：%d",
    ["Targets: %d"] = "目标：%d",
    ["Background jobs: %d"] = "后台作业：%d",
    ["Telemetry: %s, sessions stored: %d"] = "遥测：%s，已存储会话：%d",
    ["Community data: %s"] = "社区数据：%s",
    ["none"] = "无",
    ["Arrow position and pins reset."] = "箭头位置和标记已重置。",
    ["Profile changed: %s"] = "配置文件已更改：%s",

    -- Action texts, used by Objectives.DescribeTarget
    ["Kill %s (%d/%d)"] = "击杀%s（%d/%d）",
    ["Talk to %s"] = "与%s交谈",
    ["Loot %s from %s (%d/%d)"] = "拾取%s，来自%s（%d/%d）",
    ["Collect %s from %s (%d/%d)"] = "收集%s，来自%s（%d/%d）",
    ["Use %s (%d/%d)"] = "使用%s（%d/%d）",
    ["Use %s on %s"] = "使用%s，对象：%s",
    ["Explore %s"] = "探索%s",
    ["Turn in to %s"] = "向%s交任务",
    ["Pick up quest from %s"] = "从%s处接取任务",
    ["Kill %s"] = "击杀%s",
    ["Loot %s from %s"] = "拾取%s，来自%s",

    -- Shared UI strings
    ["Click: next target"] = "点击：下一个目标",
    ["Next: %s"] = "下一个：%s",
    ["%s complete - turn in to %s (%s)"] = "%s已完成 - 向%s交任务（%s）",
    ["Community: avg %s"] = "社区平均：%s",

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "数据库就绪：%d个任务，%d个NPC，%d个物体，%d件物品（%d毫秒）。",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "未找到PandaQuest数据库。请重新安装插件：缺少Database/Data文件。",

    -- Nav (arrow, router, TomTom)
    ["Arrow locked."] = "箭头已锁定。",
    ["Arrow unlocked - drag it to move."] = "箭头已解锁 - 拖动即可移动。",
    ["Close"] = "关闭",
    ["Custom target"] = "自定义目标",
    ["Distance"] = "距离",
    ["ETA"] = "预计到达",
    ["Hide this quest"] = "隐藏此任务",
    ["Lock arrow"] = "锁定箭头",
    ["Next target"] = "下一个目标",
    ["Reset arrow position"] = "重置箭头位置",
    ["Right-click: arrow menu"] = "右键点击：箭头菜单",
    ["Send to TomTom"] = "发送到TomTom",
    ["Shift-click: send to TomTom"] = "Shift+点击：发送到TomTom",
    ["Show distance in metres"] = "以米显示距离",
    ["Show distance in yards"] = "以码显示距离",
    ["Show on map"] = "在地图上显示",
    ["TomTom is not loaded."] = "TomTom未加载。",
    ["Unlock arrow"] = "解锁箭头",
    ["Wowhead link"] = "Wowhead链接",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "此处有%d个刷新点",
    ["Left-click: navigate here"] = "左键点击：导航到此处",
    ["Right-click: more options"] = "右键点击：更多选项",
    ["Set as target"] = "设为目标",
    ["Hide quest: %s"] = "隐藏任务：%s",
    ["Wowhead: %s"] = "Wowhead：%s",
    ["Starts: %s"] = "起始：%s",
    ["Turn in: %s"] = "交任务：%s",
    ["Ends: %s"] = "结束：%s",

    -- Map/NodeTooltip
    ["Level:"] = "等级：",
    ["Type:"] = "类型：",
    ["Skill:"] = "技能：",
    ["Respawn:"] = "刷新时间：",
    ["Respawn in:"] = "刷新倒计时：",
    ["~%s (%d)"] = "约%s（%d）",
    ["Sightings:"] = "目击次数：",
    ["Found by you:"] = "你发现过：",
    ["Also here:"] = "此处还有：",
    ["Unit"] = "单位",
    ["Object"] = "物体",
    ["Item"] = "物品",
    ["Area"] = "区域",
    ["%d Sec"] = "%d秒",
    ["%d Secs"] = "%d秒",
    ["%d Min"] = "%d分钟",
    ["%d Mins"] = "%d分钟",
    ["%d Hour"] = "%d小时",
    ["%d Hours"] = "%d小时",

    -- UI/Options
    ["General"] = "常规",
    ["PandaQuest works out of the box. Everything below is optional."] = "PandaQuest开箱即用，下面的选项都是可选的。",
    ["Distance units"] = "距离单位",
    ["Metres are shown as '123 m', yards as '135 yd'."] = "米显示为“123 m”，码显示为“135 yd”。",
    ["Show minimap button"] = "显示小地图按钮",
    ["Language"] = "语言",
    ["PandaQuest follows your game language; /pq lang overrides it."] = "PandaQuest默认使用你的游戏语言；可用 /pq lang 覆盖。",
    ["Arrow"] = "箭头",
    ["Show the arrow"] = "显示箭头",
    ["Hide it to navigate by map pins only."] = "隐藏后只通过地图标记导航。",
    ["Lock the arrow in place"] = "锁定箭头位置",
    ["When unlocked, drag the arrow to move it."] = "解锁后可拖动箭头来移动它。",
    ["Show quest text"] = "显示任务文字",
    ["Quest name and the action to take under the arrow."] = "在箭头下方显示任务名称和要执行的操作。",
    ["Show travel time"] = "显示行程时间",
    ["Estimated time to the target at your current speed."] = "按你当前的速度估算到达目标所需的时间。",
    ["Show community timings"] = "显示社区耗时",
    ["Average completion time collected from other players, when available."] = "来自其他玩家的平均完成时间（如有）。",
    ["Hide inside instances"] = "在副本中隐藏",
    ["The arrow cannot guide you inside a dungeon or raid."] = "箭头无法在地下城或团队副本内为你指路。",
    ["Flash on arrival"] = "到达时闪烁",
    ["A short glow when you reach the target."] = "到达目标时短暂发光。",
    ["Appearance"] = "外观",
    ["Size"] = "大小",
    ["Arrow size relative to the default."] = "箭头相对于默认大小的缩放。",
    ["Opacity"] = "不透明度",
    ["Text size"] = "文字大小",
    ["Reset position"] = "重置位置",
    ["Moves the arrow back to the middle of the screen."] = "将箭头移回屏幕中央。",
    ["Navigation"] = "导航",
    ["Target selection"] = "目标选择",
    ["Auto weighs priority and distance; Focused quest follows one quest."] =
        "“自动”会综合优先级和距离；“指定任务”只跟随一个任务。",
    ["Auto"] = "自动",
    ["Focused quest"] = "指定任务",
    ["Nearest"] = "最近",
    ["Focused quest ID"] = "指定任务ID",
    ["Used by 'Focused quest'. Empty follows the quest you track in the log."] =
        "供“指定任务”使用。留空则跟随你在任务日志中追踪的任务。",
    ["Route to turn-ins"] = "导航至交任务处",
    ["Completed quests are routed back to their quest giver."] = "已完成的任务会引导你回到任务发布者处。",
    ["Route to new quests"] = "导航至新任务",
    ["Nearby quests you could pick up are added to the route."] = "附近你可以接取的任务会加入路线。",
    ["New quest radius"] = "新任务范围",
    ["How far away a pickup may be to be routed to (yards)."] = "可接任务离你多远时会被加入路线（码）。",
    ["Maximum new quests"] = "新任务数量上限",
    ["How many pickups are routed at once."] = "同时加入路线的可接任务数量。",
    ["Arrival radius"] = "到达范围",
    ["How close you must get before a target counts as reached (yards)."] = "距离目标多近才算到达（码）。",
    ["TomTom"] = "TomTom",
    ["TomTom waypoints"] = "TomTom路径点",
    ["Mirror sends the current target to TomTom as a waypoint."] = "“镜像”会把当前目标作为路径点发送给TomTom。",
    ["Off"] = "关闭",
    ["Mirror current target"] = "镜像当前目标",
    ["Map"] = "地图",
    ["Show objective pins"] = "显示任务目标标记",
    ["Where to go for the quests in your log."] = "任务日志中各任务的目标位置。",
    ["Show turn-in pins"] = "显示交任务标记",
    ["Quest givers waiting for a completed quest."] = "等待你交付已完成任务的任务发布者。",
    ["Show available quest pins"] = "显示可接任务标记",
    ["Quests you could pick up."] = "你可以接取的任务。",
    ["Show pins on the minimap"] = "在小地图上显示标记",
    ["Keep distant pins on the minimap edge"] = "将远处的标记保留在小地图边缘",
    ["Off hides a pin as soon as it leaves the minimap."] = "关闭后，标记一离开小地图范围就会隐藏。",
    ["Merge nearby spawns"] = "合并附近的刷新点",
    ["One pin for a pack of mobs instead of a dozen."] = "一群怪物只显示一个标记，而不是十几个。",
    ["Pin size"] = "标记大小",
    ["Map pin size"] = "地图标记大小",
    ["Minimap pin size"] = "小地图标记大小",
    -- Map/Pins, Map/Icons
    ["Objective dot size"] = "目标圆点大小",
    ["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."] =
        "任务目标和采集点以小圆点显示，按任务或类型着色；任务发布者保留其图标。",
    ["Maximum minimap pins"] = "小地图标记数量上限",
    ["When there are more, the ones nearest to you are kept."] = "超出时保留离你最近的标记。",
    ["Minimap edge fade"] = "小地图边缘淡出",
    ["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] =
        "标记越过到小地图边缘路程的这一比例后会淡出并缩小。0为关闭。",
    ["Which quests to show"] = "显示哪些任务",
    ["Show low level quests"] = "显示低等级任务",
    ["Quests that are grey for your level."] = "按你的等级为灰色的任务。",
    ["Show repeatable and daily quests"] = "显示可重复任务和日常任务",
    ["Show dungeon quests"] = "显示地下城任务",
    ["Show raid quests"] = "显示团队任务",
    ["Show PvP quests"] = "显示PvP任务",
    ["Show pet battle quests"] = "显示宠物对战任务",

    -- Nodes/Professions
    ["Gathering"] = "采集",
    ["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] =
        "矿脉、草药、鱼群、宝箱和稀有怪物，只标示你或社区确实发现过的位置。",
    ["Show gathering nodes"] = "显示采集点",
    ["Turns the whole layer off, whatever the boxes below say."] = "关闭后整个图层都会隐藏，无论下方如何勾选。",
    ["Which nodes"] = "显示哪些采集点",
    ["Mining veins"] = "矿脉",
    ["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] =
        "矿脉。采矿技能过低时会隐藏，除非你选择一并显示。",
    ["Herbs"] = "草药",
    ["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] =
        "草药刷新点。草药学技能过低时会隐藏，除非你选择一并显示。",
    ["Fishing pools"] = "鱼群",
    ["Fishing pools on lakes, rivers and the coast."] = "湖泊、河流和海岸的鱼群。",
    ["Chests and treasures"] = "宝箱和宝藏",
    ["Chests and lockboxes in the world; no gathering skill filters these."] = "世界中的宝箱和锁箱；不受采集技能过滤。",
    ["Rare spawns"] = "稀有怪物",
    ["Rare creatures, at the places a rare was looted."] = "稀有生物，标示在曾拾取过稀有怪物战利品的位置。",
    ["Which of them you can gather"] = "你能采集哪些",
    ["Only my professions"] = "仅限我的专业技能",
    ["A profession you have not learned contributes nothing at all."] = "未学习的专业技能不会显示任何内容。",
    ["Show nodes above my skill"] = "显示超出我技能的采集点",
    ["Drawn faded. Useful for planning where to level a gathering skill next."] =
        "以淡色显示，便于规划下一步去哪里提升采集技能。",
    ["Fade nodes and mobs until they respawn"] = "刷新前淡化显示采集点和怪物",
    ["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] =
        "你采集过的采集点或击杀过的怪物会保持淡色，直到刷新计时显示它已刷新。",

    ["Tooltips"] = "鼠标提示",
    ["Add quest info to tooltips"] = "在鼠标提示中添加任务信息",
    ["Shows which quests an NPC or item starts, ends or counts towards."] =
        "显示NPC或物品会开始、结束哪些任务，或计入哪些任务。",
    ["Show quest IDs"] = "显示任务ID",
    ["Useful when reporting missing data."] = "报告缺失数据时很有用。",
    ["Tracker"] = "追踪器",
    ["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] =
        "PandaQuest不会替换Blizzard任务追踪器，只是对其进行补充。",
    ["Enhance the Blizzard tracker"] = "增强Blizzard任务追踪器",
    ["Show distance on tracked quests"] = "在追踪的任务上显示距离",
    ["Notifications"] = "通知",
    ["Show notifications"] = "显示通知",
    ["A short message in the middle of the screen."] = "在屏幕中央显示一条简短消息。",
    ["Quest complete and turned in"] = "任务完成与交付",
    ["Next objective"] = "下一个目标",
    ["Play a sound"] = "播放声音",
    ["Preview"] = "预览",
    ["PandaQuest is ready."] = "PandaQuest已就绪。",
    ["Synchronisation (optional)"] = "同步（可选）",
    ["Optional. PandaQuest works fully without it, and never uploads anything itself."] =
        "可选。不启用也不影响PandaQuest的全部功能，且PandaQuest本身绝不会上传任何内容。",
    ["Record quest data"] = "记录任务数据",
    ["Record movement breadcrumbs"] = "记录移动轨迹",
    ["Occasional position samples that improve community routes."] = "偶尔采样位置，用于改进社区路线。",
    ["Breadcrumb interval (seconds)"] = "轨迹间隔（秒）",
    ["Sessions to keep"] = "保留会话数",
    ["Events per session"] = "每个会话的事件数",
    ["Advanced"] = "高级",
    ["Log level"] = "日志级别",
    ["How much PandaQuest prints to chat."] = "PandaQuest向聊天窗口输出多少信息。",
    ["Errors"] = "错误",
    ["Warnings"] = "警告",
    ["Info"] = "信息",
    ["Debug"] = "调试",
    ["Trace"] = "跟踪",
    ["Arrow debug output"] = "箭头调试输出",
    ["Prints the bearing values used by the arrow."] = "输出箭头使用的方位值。",
    ["Redraw map pins"] = "重绘地图标记",
    ["Print status to chat"] = "在聊天窗口输出状态",
    ["Profiles"] = "配置文件",
    ["Options are not available; use /pq help for chat commands."] = "选项不可用；请使用 /pq help 查看聊天命令。",

    -- UI (minimap button, tracker, notifications, Wowhead)
    ["Distance unknown"] = "距离未知",
    ["Left-click: browse all quests"] = "左键点击：浏览所有任务",
    ["Right-click: open options"] = "右键点击：打开选项",
    ["Press Ctrl+C to copy the link:"] = "按Ctrl+C复制链接：",
    ["Navigate to this quest"] = "导航到此任务",
    ["the quest giver"] = "任务发布者",
    ["unknown distance"] = "未知距离",
    ["%s complete"] = "%s已完成",
    ["Turned in: %s"] = "已交付：%s",

    -- Sync (telemetry, community data)
    ["Telemetry: %s"] = "遥测：%s",
    ["Events recorded this session: %d (%d dropped)"] = "本次会话已记录事件：%d（丢弃%d）",
    ["Sessions stored: %d, waiting for upload: %d"] = "已存储会话：%d，等待上传：%d",
    ["Last upload confirmed: %s"] = "上次确认上传：%s",
    ["never"] = "从未",
    ["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] =
        "遥测关闭期间不会记录任何内容。可在 /pq options 中重新启用。",
    ["No community data yet."] = "暂无社区数据。",
    ["Community data from %s"] = "社区数据来自%s",
    ["Last gear snapshot: %s"] = "上次装备快照：%s",
    ["Gear snapshots: off."] = "装备快照：已关闭。",

    -- Sync / Consent
    ["/pq consent - ask the data sharing question again"] = "/pq consent - 再次询问是否共享数据",
    ["PandaQuest can send what you do while questing to the community hub."] = "PandaQuest可以将你做任务时的行为发送到社区中心。",
    ["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] =
        "包括你接取和完成的任务、击杀和拾取的内容、死亡地点，以及带有时间的地图位置。",
    ["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] =
        "这些数据用于构建共享的任务路线。在你同意之前它保持关闭，你可以随时停止并删除。",
    ["PandaQuest can share your quest data to build the community routes."] =
        "PandaQuest可以共享你的任务数据，用于构建社区路线。",
    ["It is off. Turn it on in /pq options if you want to take part."] = "目前已关闭。如想参与，请在 /pq options 中开启。",
    ["Share my quest data"] = "共享我的任务数据",
    ["No thanks"] = "不用了",
    ["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] =
        "谢谢。PandaQuest将共享你的任务数据。可随时通过 /pq sync 关闭。",
    ["Nothing will be collected. Turn it on any time in /pq options."] = "不会收集任何内容。可随时在 /pq options 中开启。",

    -- Auction house: the scan, the invoices, the tooltip and the options section
    ["Scan prices"] = "扫描价格",
    ["Stop scan (%d%%)"] = "停止扫描（%d%%）",
    ["Scanning the auction house. Keep the window open; closing it cancels the scan."] =
        "正在扫描拍卖行。请保持窗口打开；关闭窗口会取消扫描。",
    ["Auction house scan finished: %d auctions of %d items in %s."] = "拍卖行扫描完成：%d条拍卖，%d种物品，用时%s。",
    ["The scan stopped at %d auctions to keep the saved file small."] = "为控制保存文件的大小，扫描在%d条拍卖处停止。",
    ["A scan is already running."] = "扫描已在进行中。",
    ["Open the auction house first, then press Scan prices or type /pq scan."] =
        "请先打开拍卖行，然后点击“扫描价格”或输入 /pq scan。",
    ["This client offers no auction house listing PandaQuest can read."] = "此客户端未提供PandaQuest可读取的拍卖行列表。",
    ["Scan cancelled: the auction house window was closed."] = "扫描已取消：拍卖行窗口已关闭。",
    ["Scan stopped: the auction house did not answer."] = "扫描已停止：拍卖行没有响应。",
    ["Scan stopped. Nothing was saved."] = "扫描已停止，未保存任何内容。",
    ["The auction house sent an empty listing. Nothing was saved."] = "拍卖行返回了空列表，未保存任何内容。",
    ["No scan is running."] = "当前没有正在进行的扫描。",
    ["Scanning: %d%% (%d auctions read)."] = "正在扫描：%d%%（已读取%d条拍卖）。",
    ["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."] = "上次扫描%s（%s，%s）：%d条拍卖，%d种物品，%s前。",
    ["No auction house scan yet for this realm."] = "此服务器尚未进行过拍卖行扫描。",
    ["AH minimum buyout"] = "拍卖行最低一口价",
    ["AH market value"] = "拍卖行市场价值",
    ["bids only"] = "仅竞标",
    ["%s, scanned %s ago"] = "%s，%s前扫描",
    ["Auction house"] = "拍卖行",
    ["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] =
        "PandaQuest绝不会自行扫描。请在拍卖行窗口中点击“扫描价格”，或在窗口打开时输入 /pq scan。",
    ["Show the scan button on the auction house window"] = "在拍卖行窗口显示扫描按钮",
    ["Show auction prices on item tooltips"] = "在物品鼠标提示中显示拍卖价格",
    ["The lowest buyout and the market value from your last scan on this realm, with how old it is."] =
        "显示你在此服务器上次扫描得到的最低一口价和市场价值，以及数据已过去多久。",
    ["Record my auction sales and purchases"] = "记录我的拍卖出售和购买",
    ["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."] =
        "从邮箱中的拍卖发票读取。只保存物品、数量和价格，绝不保存对方玩家的名字。",
    -- Professions: the recipe scan, its refusals and the options section
    ["/pq scan professions - read the open profession window"] = "/pq scan professions - 读取已打开的专业技能窗口",
    ["/pq scan archaeology - read your archaeology window"] = "/pq scan archaeology - 读取你的考古学窗口",
    ["/pq digsite - show the dig site bar so you can move it"] = "/pq digsite - 显示挖掘场进度条以便移动",
    ["A profession scan is already running."] = "专业技能扫描已在进行中。",
    ["Open a profession window first, then type /pq scan professions."] = "请先打开专业技能窗口，然后输入 /pq scan professions。",
    ["This client does not offer the recipe list PandaQuest reads."] = "此客户端未提供PandaQuest读取的配方列表。",
    ["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] =
        "该窗口是通过链接打开的其他玩家的配方书，PandaQuest不会记录。",
    ["This profession window lists no recipes."] = "此专业技能窗口中没有配方。",
    ["The profession list has not arrived from the server yet. Try again in a moment."] =
        "专业技能列表尚未从服务器送达，请稍后再试。",
    ["Nothing was saved: not one recipe in this window could be read whole."] =
        "未保存任何内容：此窗口中没有一个配方能被完整读取。",
    ["The profession window changed while it was being read. Nothing was saved."] =
        "读取过程中专业技能窗口发生了变化，未保存任何内容。",
    ["The window was read short, so the recipe book you already have was kept."] = "此次读取不完整，因此保留了你已有的配方书。",
    ["Profession scan cancelled: the window was closed."] = "专业技能扫描已取消：窗口已关闭。",
    ["Profession scan stopped. Nothing was saved."] = "专业技能扫描已停止，未保存任何内容。",
    ["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."] =
        "PandaQuest不会操作你的专业技能窗口：它无法把%s恢复成你离开时的样子。",
    ["PandaQuest could not put your profession window back exactly as you left it."] =
        "PandaQuest无法把你的专业技能窗口完全恢复成原来的样子。",
    ["Profession scan finished: %s %d/%d, %d recipes in %s."] = "专业技能扫描完成：%s %d/%d，%d个配方，用时%s。",
    ["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."] =
        "有%d个配方因游戏尚未加载完毕而被略过。请重新打开窗口以补全。",
    ["The scan stopped at %d recipes to keep the saved file small."] = "为控制保存文件的大小，扫描在%d个配方处停止。",
    ["Last scan of %s (%d/%d): %d recipes, %s ago."] = "上次扫描%s（%d/%d）：%d个配方，%s前。",
    ["No profession has been scanned on this character yet."] = "此角色尚未扫描过任何专业技能。",
    ["Professions"] = "专业技能",
    ["PandaQuest reads an open profession window once and puts your filters and collapsed categories back."] =
        "PandaQuest会读取一次已打开的专业技能窗口，并恢复你的筛选条件和已折叠的分类。",
    ["Read my recipes when I open a profession"] = "打开专业技能时读取我的配方",
    ["The recipes, their reagents and how hard each is for this character. Never a book opened from a link."] =
        "配方、所需材料以及每个配方对此角色的难度。绝不读取通过链接打开的配方书。",

    -- Flight master
    ["Flight time:"] = "飞行时间：",
    ["~%s (%d flight)"] = "约%s（%d次飞行）",
    ["~%s (%d flights)"] = "约%s（%d次飞行）",
    ["~%s left (%d flights)"] = "约剩余%s（%d次飞行）",
    ["%s in the air"] = "已飞行%s",
    ["Flight progress"] = "飞行进度",
    ["The flight bar is switched off in /pq options."] = "飞行进度条已在 /pq options 中关闭。",
    ["The flight bar is locked. Unlock it in /pq options to move it."] = "飞行进度条已锁定。请在 /pq options 中解锁后再移动。",
    ["Drag the flight bar where you want it. It hides itself again in a moment."] =
        "将飞行进度条拖到你想要的位置。它稍后会自动隐藏。",
    ["/pq flight - show the flight bar so you can drag it"] = "/pq flight - 显示飞行进度条以便拖动",
    ["Flight master"] = "飞行管理员",
    ["PandaQuest times your own flights and shows what it measured. A route you have never flown shows nothing at all."] =
        "PandaQuest会为你自己的飞行计时并显示测得的结果。你从未飞过的路线不会显示任何内容。",
    ["Show the flight time at the flight master"] = "在飞行管理员处显示飞行时间",
    ["One line in the destination's tooltip, with how many of your own flights it rests on."] =
        "在目的地的鼠标提示中显示一行，并注明依据你自己多少次飞行得出。",
    ["Show the progress bar while flying"] = "飞行时显示进度条",
    ["Progress and remaining time once the route has been flown twice; before that, only the time in the air."] =
        "路线飞过两次后显示进度和剩余时间；在此之前只显示已飞行的时间。",
    -- Archaeology
    ["This client does not offer the archaeology data PandaQuest reads."] = "此客户端未提供PandaQuest读取的考古学数据。",
    ["This character has no archaeology races to read yet."] = "此角色还没有可读取的考古学种族。",
    ["Your artifact history has not arrived yet, so the archaeology PandaQuest already had was kept."] =
        "你的文物历史记录尚未送达，因此保留了PandaQuest已有的考古学数据。",
    ["No archaeology has been read on this character yet."] = "尚未读取过此角色的考古学数据。",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] = "考古学%d/%d：%d个种族，%d件文物，%s前读取。",
    ["Archaeology %d: %d races, %d artifacts, read %s ago."] = "考古学%d：%d个种族，%d件文物，%s前读取。",
    ["Archaeology: %d races, %d artifacts, read %s ago."] = "考古学：%d个种族，%d件文物，%s前读取。",
    ["Archaeology read: %d races, %d artifacts."] = "已读取考古学：%d个种族，%d件文物。",
    ["The server has not sent your artifact history, so completion counts were left out."] =
        "服务器尚未发送你的文物历史记录，因此未包含完成次数。",
    ["Archaeology"] = "考古学",
    ["Mists never shipped a dig site progress bar. PandaQuest draws one from the events the game already sends."] =
        "熊猫人之谜从未提供挖掘场进度条。PandaQuest根据游戏已发送的事件自行绘制了一个。",
    ["Read my archaeology when I open the window"] = "打开窗口时读取我的考古学数据",
    ["Your races, their keystone, your fragments and the artifacts you have. Only this character's own."] =
        "你的种族、对应的钥石、碎片以及已有的文物。仅限此角色自己的数据。",
    ["Dig site progress bar"] = "挖掘场进度条",
    ["Show the dig site progress bar"] = "显示挖掘场进度条",
    ["Appears when you survey and hides when you leave the dig site."] = "勘测时出现，离开挖掘场时隐藏。",
    ["Lock the bar in place"] = "锁定进度条位置",
    ["Unlocked, it can be dragged with the left mouse button."] = "解锁后可用鼠标左键拖动。",
    ["Bar size"] = "进度条大小",
    ["Show me where it is"] = "显示进度条位置",
    ["Puts an empty bar on screen for a moment so you can find it, and drag it when it is unlocked."] =
        "在屏幕上短暂显示一个空进度条，方便你找到它；解锁时可拖动。",
    ["Reset bar position"] = "重置进度条位置",
    ["Dig site progress"] = "挖掘场进度",
    ["Dig site complete"] = "挖掘场已完成",
    ["This client draws its own dig site progress bar."] = "此客户端自带挖掘场进度条。",
    ["The dig site bar is switched off in /pq options."] = "挖掘场进度条已在 /pq options 中关闭。",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "将挖掘场进度条拖到你想要的位置。它稍后会自动隐藏。",
    ["The dig site bar is locked. Unlock it in /pq options to move it."] =
        "挖掘场进度条已锁定。请在 /pq options 中解锁后再移动。",

    -- Database/QuestieDB (the optional QuestieDB addon)
    ["Quest database source"] = "任务数据库来源",
    ["Uses the QuestieDB addon, if it is installed and enabled, to complete PandaQuest's own database. Takes effect after /reload."] =
        "如果已安装并启用QuestieDB插件，就用它来补全PandaQuest自己的数据库。/reload 后生效。",
    ["PandaQuest only"] = "仅PandaQuest",
    ["Fill gaps from QuestieDB"] = "用QuestieDB补全缺失数据",
    ["QuestieDB values first"] = "优先使用QuestieDB的数据",
    ["QuestieDB: %s"] = "QuestieDB：%s",
    ["QuestieDB: %s (%d entries added, %d refreshed)"] = "QuestieDB：%s（新增%d条，刷新%d条）",
    ["not used (off)"] = "未使用（已关闭）",
    ["not installed"] = "未安装",
    ["cannot be used (%s)"] = "无法使用（%s）",
    ["not read yet"] = "尚未读取",

    -- Quest browser, quest database source, language selection
    ["/pq quests [questID] - browse every quest in the database"] = "/pq quests [questID] - 浏览数据库中的所有任务",
    ["Name"] = "名称",
    ["Level"] = "等级",
    ["to"] = "至",
    ["My level"] = "我的等级",
    ["My side"] = "我的阵营",
    ["Alliance"] = "联盟",
    ["Horde"] = "部落",
    ["Both"] = "双方",
    ["both factions"] = "双方阵营",
    ["Dungeon"] = "地下城",
    ["Raid"] = "团队",
    ["Group"] = "队伍",
    ["PvP"] = "PvP",
    ["Daily"] = "日常",
    ["Event"] = "活动",
    ["Reset"] = "重置",
    ["All quests"] = "全部任务",
    ["%d quests"] = "%d个任务",
    ["No quest matches these filters."] = "没有任务符合这些筛选条件。",
    ["Reading the quest database..."] = "正在读取任务数据库……",
    ["Quest"] = "任务",
    ["Zone"] = "区域",
    ["Req."] = "要求",
    ["XP"] = "经验",
    ["A level %d quest for %s, from level %d."] = "%d级任务，适用于%s，%d级起可接取。",
    ["%d experience"] = "%d点经验值",
    ["Not in the database."] = "数据库中没有记录。",
    ["requires level"] = "需要等级",
    ["Yes"] = "是",
    ["No"] = "否",
    ["No location is known for this quest."] = "此任务的位置未知。",
    ["Navigating to: %s"] = "正在导航到：%s",
    ["Start"] = "起始",
    ["End"] = "结束",
    ["Difficulty"] = "难度",
    ["Side"] = "阵营",
    ["Shareable"] = "可共享",
    ["Quest ID"] = "任务ID",
    ["Rewards"] = "奖励",
    ["Navigate"] = "导航",
    ["Pick a quest from the list to see its page."] = "从列表中选择一个任务以查看其页面。",
    ["Quests"] = "任务",
    ["Shift-click: toggle the arrow"] = "Shift+点击：显示或隐藏箭头",
    -- Beta notice and animation options
    ["This is a beta build: new features are not yet confirmed in the game."] =
        "这是测试版：新功能尚未在游戏中得到确认。",
    ["Animations"] =
        "动画",
    ["Windows fade and settle, messages slide in, bars glide. Switch it off for a calmer interface."] =
        "窗口淡入并落定，消息滑入，进度条平滑移动。关闭后界面更安静。",
    ["Turn all interface motion on or off."] =
        "开启或关闭所有界面动效。",
    ["Animation speed"] =
        "动画速度",
    ["1 is normal; 2 is twice as fast, 0.5 half as fast."] =
        "1 为正常；2 为两倍速，0.5 为半速。",
    -- Options: language, tools
    ["Categories"] =
        "分类",
    ["Loosen a filter, or press Reset."] =
        "放宽筛选条件，或点击“重置”。",
    ["Open the quest browser"] =
        "打开任务浏览器",
    ["Browse every quest in the database, with a page and a map for each."] =
        "浏览数据库中的所有任务，每个任务都有独立页面和地图。",
    ["Choose the language of PandaQuest's texts. Automatic follows the game's language."] =
        "选择PandaQuest文字使用的语言。选择“自动”则跟随游戏语言。",
    ["Automatic (game language)"] =
        "自动（游戏语言）",
    ["Reload the interface"] =
        "重新加载界面",
    ["Reloads the game's interface so a changed language applies everywhere."] =
        "重新加载游戏界面，使更改后的语言在各处生效。",
    ["Tools"] =
        "工具",
    ["Everything the chat commands do, as buttons. Nothing here needs a command."] =
        "聊天命令的所有功能都以按钮提供，无需输入任何命令。",
    ["Skip the current target"] =
        "跳过当前目标",
    ["Moves the arrow on to the next target."] =
        "让箭头指向下一个目标。",
    ["Stop following the pinned quest"] =
        "停止跟随固定的任务",
    ["Clears the quest pinned with the focus setting or the map's right-click menu."] =
        "清除通过“指定任务”设置或地图右键菜单固定的任务。",
    ["Reset arrow position and map pins"] =
        "重置箭头位置和地图标记",
    ["Wowhead link for the current target"] =
        "当前目标的Wowhead链接",
    ["%d quests are hidden from the navigator."] =
        "有%d个任务已从导航中隐藏。",
    ["Show all hidden quests again"] =
        "重新显示所有已隐藏的任务",
    ["Reading windows"] =
        "读取窗口",
    ["Read my professions now"] =
        "立即读取我的专业技能",
    ["Open the profession window first."] =
        "请先打开专业技能窗口。",
    ["Read my archaeology now"] =
        "立即读取我的考古学数据",
    ["Open the archaeology window first."] =
        "请先打开考古学窗口。",
    ["Show synchronisation status"] =
        "显示同步状态",
    ["Ask the data sharing question"] =
        "询问是否共享数据",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.zhCN = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "zhCN")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
