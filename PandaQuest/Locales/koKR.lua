-- Locales/koKR.lua: koKR translation. Keys are the English text from Locales/enUS.lua.
-- luacheck: max line length 220
local _, ns = ...

local T = {
    -- Core / Init
    ["PandaQuest %s loaded. Type /pq for options, /pq help for commands."] =
        "PandaQuest %s 로드됨. 옵션은 /pq, 명령어는 /pq help를 입력하세요.",
    ["Welcome to PandaQuest! The arrow points to your next quest objective. Type /pq help for commands."] =
        "PandaQuest에 오신 것을 환영합니다! 화살표가 다음 퀘스트 목표를 가리킵니다. 명령어는 /pq help를 입력하세요.",
    ["%s is not available yet."] = "아직 사용할 수 없습니다: %s",
    ["Unknown command: %s"] = "알 수 없는 명령어: %s",
    ["Available commands:"] = "사용 가능한 명령어:",
    ["/pq - open options"] = "/pq - 옵션 열기",
    ["/pq arrow - toggle the navigation arrow"] = "/pq arrow - 길 안내 화살표 켜기/끄기",
    ["/pq target [questID|clear] - pin a quest (or show the current target)"] =
        "/pq target [questID|clear] - 퀘스트 고정 (또는 현재 대상 표시)",
    ["/pq next - skip the current target"] = "/pq next - 현재 대상 건너뛰기",
    ["/pq units meters|yards - distance units"] = "/pq units meters|yards - 거리 단위",
    ["/pq wh [questID] - Wowhead link"] = "/pq wh [questID] - Wowhead 링크",
    ["/pq hide <questID> - hide a quest from the navigator"] = "/pq hide <questID> - 길 안내에서 퀘스트 숨기기",
    ["/pq unhide <questID> - show a hidden quest again"] = "/pq unhide <questID> - 숨긴 퀘스트 다시 표시",
    ["/pq reset - reset arrow position and map pins"] = "/pq reset - 화살표 위치와 지도 핀 초기화",
    ["/pq debug [0-4|arrow] - log level"] = "/pq debug [0-4|arrow] - 로그 수준",
    ["/pq dump quest|npc|object|item <id> - print database entry"] =
        "/pq dump quest|npc|object|item <id> - 데이터베이스 항목 출력",
    ["/pq status - addon status"] = "/pq status - 애드온 상태",
    ["/pq sync - telemetry and community data status"] = "/pq sync - 원격 분석 및 커뮤니티 데이터 상태",
    ["/pq lang auto|<locale> - interface language"] = "/pq lang auto|<locale> - 인터페이스 언어",
    ["Available languages: %s"] = "사용 가능한 언어: %s",
    ["Units: %s"] = "단위: %s",
    ["meters"] = "미터",
    ["yards"] = "야드",
    ["Usage: %s"] = "사용법: %s",
    ["Log level: %d (%s)"] = "로그 수준: %d (%s)",
    ["Arrow debug: %s"] = "화살표 디버그: %s",
    ["Language: %s (reload the UI to apply everywhere)"] = "언어: %s (모든 곳에 적용하려면 UI를 다시 불러오세요)",
    ["Enabled"] = "사용함",
    ["Disabled"] = "사용 안 함",
    ["Quest %d hidden."] = "퀘스트 %d 숨김.",
    ["Quest %d is visible again."] = "퀘스트 %d 다시 표시됨.",
    ["Current target: %s"] = "현재 대상: %s",
    ["No current target."] = "현재 대상이 없습니다.",
    ["No target found for quest %d."] = "퀘스트 %d의 대상을 찾을 수 없습니다.",
    ["Not found: %s %d"] = "찾을 수 없음: %s %d",
    ["Version %s"] = "버전 %s",
    ["Built %s from %s"] = "빌드 일시 %s, 소스 %s",
    ["This is a build from a modified working tree; it is not a release."] =
        "수정된 작업 폴더에서 만든 빌드이며 정식 릴리스가 아닙니다.",
    ["Database: %s"] = "데이터베이스: %s",
    ["ready"] = "준비됨",
    ["loading"] = "불러오는 중",
    ["Quests in log: %d"] = "일지의 퀘스트: %d",
    ["Targets: %d"] = "대상: %d",
    ["Background jobs: %d"] = "백그라운드 작업: %d",
    ["Telemetry: %s, sessions stored: %d"] = "원격 분석: %s, 저장된 세션: %d",
    ["Community data: %s"] = "커뮤니티 데이터: %s",
    ["none"] = "없음",
    ["Arrow position and pins reset."] = "화살표 위치와 핀이 초기화되었습니다.",
    ["Profile changed: %s"] = "프로필 변경됨: %s",

    -- Action texts, used by Objectives.DescribeTarget
    ["Kill %s (%d/%d)"] = "%s 처치 (%d/%d)",
    ["Talk to %s"] = "%s에게 말 걸기",
    ["Loot %s from %s (%d/%d)"] = "%s 획득 - %s에서 (%d/%d)",
    ["Collect %s from %s (%d/%d)"] = "%s 수집 - %s에서 (%d/%d)",
    ["Use %s (%d/%d)"] = "%s 사용 (%d/%d)",
    ["Use %s on %s"] = "%s 사용 (대상: %s)",
    ["Explore %s"] = "%s 탐험",
    ["Turn in to %s"] = "%s에게 반환",
    ["Pick up quest from %s"] = "%s에게서 퀘스트 수락",
    ["Kill %s"] = "%s 처치",
    ["Loot %s from %s"] = "%s 획득 - %s에서",

    -- Shared UI strings
    ["Click: next target"] = "클릭: 다음 대상",
    ["Next: %s"] = "다음: %s",
    ["%s complete - turn in to %s (%s)"] = "%s 완료 - %s에게 반환 (%s)",
    ["Community: avg %s"] = "커뮤니티: 평균 %s",

    -- Database
    ["Database ready: %d quests, %d NPCs, %d objects, %d items (%d ms)."] =
        "데이터베이스 준비 완료: 퀘스트 %d개, NPC %d명, 오브젝트 %d개, 아이템 %d개 (%d ms).",
    ["PandaQuest database not found. Reinstall the addon: the Database/Data files are missing."] =
        "PandaQuest 데이터베이스를 찾을 수 없습니다. 애드온을 다시 설치하세요: Database/Data 파일이 없습니다.",

    -- Nav (arrow, router, TomTom)
    ["Arrow locked."] = "화살표가 잠겼습니다.",
    ["Arrow unlocked - drag it to move."] = "화살표 잠금이 해제되었습니다 - 끌어서 이동하세요.",
    ["Close"] = "닫기",
    ["Custom target"] = "사용자 지정 대상",
    ["Distance"] = "거리",
    ["ETA"] = "도착 예정",
    ["Hide this quest"] = "이 퀘스트 숨기기",
    ["Lock arrow"] = "화살표 잠금",
    ["Next target"] = "다음 대상",
    ["Reset arrow position"] = "화살표 위치 초기화",
    ["Right-click: arrow menu"] = "오른쪽 클릭: 화살표 메뉴",
    ["Send to TomTom"] = "TomTom으로 보내기",
    ["Shift-click: send to TomTom"] = "Shift-클릭: TomTom으로 보내기",
    ["Show distance in metres"] = "거리를 미터로 표시",
    ["Show distance in yards"] = "거리를 야드로 표시",
    ["Show on map"] = "지도에 표시",
    ["TomTom is not loaded."] = "TomTom이 로드되지 않았습니다.",
    ["Unlock arrow"] = "화살표 잠금 해제",
    ["Wowhead link"] = "Wowhead 링크",

    -- Map (pins, tooltips)
    ["%d spawns here"] = "이곳에 %d개 출현",
    ["Left-click: navigate here"] = "왼쪽 클릭: 여기로 안내",
    ["Right-click: more options"] = "오른쪽 클릭: 옵션 더 보기",
    ["Set as target"] = "대상으로 지정",
    ["Hide quest: %s"] = "퀘스트 숨기기: %s",
    ["Wowhead: %s"] = "Wowhead: %s",
    ["Starts: %s"] = "시작: %s",
    ["Turn in: %s"] = "반환: %s",
    ["Ends: %s"] = "종료: %s",

    -- Map/NodeTooltip
    ["Level:"] = "레벨:",
    ["Type:"] = "유형:",
    ["Skill:"] = "숙련도:",
    ["Respawn:"] = "재생성:",
    ["Respawn in:"] = "재생성까지:",
    ["~%s (%d)"] = "~%s (%d)",
    ["Sightings:"] = "목격 횟수:",
    ["Found by you:"] = "직접 발견:",
    ["Also here:"] = "이곳에 함께 있음:",
    ["Unit"] = "유닛",
    ["Object"] = "오브젝트",
    ["Item"] = "아이템",
    ["Area"] = "지역",
    ["%d Sec"] = "%d초",
    ["%d Secs"] = "%d초",
    ["%d Min"] = "%d분",
    ["%d Mins"] = "%d분",
    ["%d Hour"] = "%d시간",
    ["%d Hours"] = "%d시간",

    -- UI/Options
    ["General"] = "일반",
    ["PandaQuest works out of the box. Everything below is optional."] =
        "PandaQuest는 설치 즉시 바로 사용할 수 있습니다. 아래 항목은 모두 선택 사항입니다.",
    ["Distance units"] = "거리 단위",
    ["Metres are shown as '123 m', yards as '135 yd'."] = "미터는 '123 m', 야드는 '135 yd'로 표시됩니다.",
    ["Show minimap button"] = "미니맵 버튼 표시",
    ["Left-click the minimap button to toggle the arrow, right-click for these options."] =
        "미니맵 버튼을 왼쪽 클릭하면 화살표를 켜고 끄며, 오른쪽 클릭하면 이 옵션이 열립니다.",
    ["Language"] = "언어",
    ["PandaQuest follows your game language; /pq lang overrides it."] =
        "PandaQuest는 게임 언어를 따릅니다. /pq lang 명령으로 바꿀 수 있습니다.",
    ["Arrow"] = "화살표",
    ["Show the arrow"] = "화살표 표시",
    ["Hide it to navigate by map pins only."] = "숨기면 지도 핀만으로 길을 안내합니다.",
    ["Lock the arrow in place"] = "화살표 위치 잠금",
    ["When unlocked, drag the arrow to move it."] = "잠금을 해제하면 화살표를 끌어서 이동할 수 있습니다.",
    ["Show quest text"] = "퀘스트 문구 표시",
    ["Quest name and the action to take under the arrow."] = "화살표 아래에 퀘스트 이름과 수행할 행동을 표시합니다.",
    ["Show travel time"] = "이동 시간 표시",
    ["Estimated time to the target at your current speed."] = "현재 속도로 대상까지 걸리는 예상 시간입니다.",
    ["Show community timings"] = "커뮤니티 소요 시간 표시",
    ["Average completion time collected from other players, when available."] =
        "다른 플레이어에게서 수집한 평균 완료 시간입니다(있는 경우).",
    ["Hide inside instances"] = "인스턴스 던전 안에서 숨기기",
    ["The arrow cannot guide you inside a dungeon or raid."] = "화살표는 던전이나 공격대 안에서는 길을 안내할 수 없습니다.",
    ["Flash on arrival"] = "도착 시 반짝임",
    ["A short glow when you reach the target."] = "대상에 도착하면 잠시 빛납니다.",
    ["Appearance"] = "외형",
    ["Size"] = "크기",
    ["Arrow size relative to the default."] = "기본 크기 대비 화살표 크기입니다.",
    ["Opacity"] = "투명도",
    ["Text size"] = "글자 크기",
    ["Reset position"] = "위치 초기화",
    ["Moves the arrow back to the middle of the screen."] = "화살표를 화면 가운데로 되돌립니다.",
    ["Navigation"] = "길 안내",
    ["Target selection"] = "대상 선택",
    ["Auto weighs priority and distance; Focused quest follows one quest."] =
        "자동은 우선순위와 거리를 따져 고르고, 집중 퀘스트는 한 퀘스트만 따라갑니다.",
    ["Auto"] = "자동",
    ["Focused quest"] = "집중 퀘스트",
    ["Nearest"] = "가장 가까운 곳",
    ["Focused quest ID"] = "집중 퀘스트 ID",
    ["Used by 'Focused quest'. Empty follows the quest you track in the log."] =
        "'집중 퀘스트'에서 사용합니다. 비워 두면 퀘스트 일지에서 추적 중인 퀘스트를 따릅니다.",
    ["Route to turn-ins"] = "반환 지점으로 경로 안내",
    ["Completed quests are routed back to their quest giver."] =
        "완료한 퀘스트는 퀘스트 제공자에게 돌아가는 경로로 안내합니다.",
    ["Route to new quests"] = "새 퀘스트로 경로 안내",
    ["Nearby quests you could pick up are added to the route."] = "근처에서 받을 수 있는 퀘스트가 경로에 추가됩니다.",
    ["New quest radius"] = "새 퀘스트 반경",
    ["How far away a pickup may be to be routed to (yards)."] =
        "경로에 포함될 수 있는 퀘스트 수락 지점의 최대 거리(야드)입니다.",
    ["Maximum new quests"] = "새 퀘스트 최대 수",
    ["How many pickups are routed at once."] = "한 번에 경로에 포함되는 퀘스트 수락 지점의 수입니다.",
    ["Arrival radius"] = "도착 반경",
    ["How close you must get before a target counts as reached (yards)."] =
        "대상에 도착한 것으로 처리되는 거리(야드)입니다.",
    ["TomTom"] = "TomTom",
    ["TomTom waypoints"] = "TomTom 웨이포인트",
    ["Mirror sends the current target to TomTom as a waypoint."] =
        "미러링은 현재 대상을 TomTom에 웨이포인트로 전송합니다.",
    ["Off"] = "끔",
    ["Mirror current target"] = "현재 대상 미러링",
    ["Map"] = "지도",
    ["Show objective pins"] = "목표 핀 표시",
    ["Where to go for the quests in your log."] = "퀘스트 일지에 있는 퀘스트를 진행할 장소입니다.",
    ["Show turn-in pins"] = "반환 핀 표시",
    ["Quest givers waiting for a completed quest."] = "완료한 퀘스트를 기다리는 퀘스트 제공자입니다.",
    ["Show available quest pins"] = "수락 가능한 퀘스트 핀 표시",
    ["Quests you could pick up."] = "받을 수 있는 퀘스트입니다.",
    ["Show pins on the minimap"] = "미니맵에 핀 표시",
    ["Keep distant pins on the minimap edge"] = "먼 핀을 미니맵 가장자리에 유지",
    ["Off hides a pin as soon as it leaves the minimap."] = "끄면 핀이 미니맵 밖으로 나가는 즉시 숨겨집니다.",
    ["Merge nearby spawns"] = "근처 출현 지점 합치기",
    ["One pin for a pack of mobs instead of a dozen."] = "몹 무리를 핀 열두 개 대신 하나로 표시합니다.",
    ["Pin size"] = "핀 크기",
    ["Map pin size"] = "지도 핀 크기",
    ["Minimap pin size"] = "미니맵 핀 크기",
    -- Map/Pins, Map/Icons
    ["Objective dot size"] = "목표 점 크기",
    ["Objectives and gathering nodes are small dots, coloured per quest or per kind; quest givers keep their icons."] =
        "목표와 채집 지점은 퀘스트별 또는 종류별로 색이 다른 작은 점으로 표시되며, 퀘스트 제공자는 기존 아이콘을 유지합니다.",
    ["Maximum minimap pins"] = "미니맵 핀 최대 수",
    ["When there are more, the ones nearest to you are kept."] = "더 많을 경우 가장 가까운 핀만 남깁니다.",
    ["Minimap edge fade"] = "미니맵 가장자리 흐림",
    ["Pins fade and shrink past this much of the way to the minimap edge. 0 turns it off."] =
        "핀은 미니맵 가장자리까지 가는 길에서 이 비율을 넘으면 흐려지고 작아집니다. 0이면 꺼집니다.",
    ["Which quests to show"] = "표시할 퀘스트",
    ["Show low level quests"] = "저레벨 퀘스트 표시",
    ["Quests that are grey for your level."] = "내 레벨 기준으로 회색인 퀘스트입니다.",
    ["Show repeatable and daily quests"] = "반복 퀘스트와 일일 퀘스트 표시",
    ["Show dungeon quests"] = "던전 퀘스트 표시",
    ["Show raid quests"] = "공격대 퀘스트 표시",
    ["Show PvP quests"] = "PvP 퀘스트 표시",
    ["Show pet battle quests"] = "애완동물 대전 퀘스트 표시",

    -- Nodes/Professions
    ["Gathering"] = "채집",
    ["Ore, herbs, fishing pools, chests and rare spawns, drawn only where you or the community really found one."] =
        "광석, 약초, 물고기 떼, 상자, 희귀 몹을 본인이나 커뮤니티가 실제로 발견한 곳에만 표시합니다.",
    ["Show gathering nodes"] = "채집 지점 표시",
    ["Turns the whole layer off, whatever the boxes below say."] =
        "끄면 아래 체크 상태와 관계없이 전체가 꺼집니다.",
    ["Which nodes"] = "표시할 지점",
    ["Mining veins"] = "광맥",
    ["Ore veins. Hidden when your Mining skill is too low, unless you show those too."] =
        "광맥입니다. 채광 숙련도가 너무 낮으면 숨겨지며, 해당 지점을 함께 표시하도록 설정한 경우는 예외입니다.",
    ["Herbs"] = "약초",
    ["Herb spawns. Hidden when your Herbalism skill is too low, unless you show those too."] =
        "약초 지점입니다. 약초 채집 숙련도가 너무 낮으면 숨겨지며, 해당 지점을 함께 표시하도록 설정한 경우는 예외입니다.",
    ["Fishing pools"] = "물고기 떼",
    ["Fishing pools on lakes, rivers and the coast."] = "호수, 강, 해안의 물고기 떼입니다.",
    ["Chests and treasures"] = "상자와 보물",
    ["Chests and lockboxes in the world; no gathering skill filters these."] =
        "월드에 있는 상자와 잠긴 상자입니다. 채집 숙련도 조건은 적용되지 않습니다.",
    ["Rare spawns"] = "희귀 몹",
    ["Rare creatures, at the places a rare was looted."] =
        "희귀 몹의 전리품을 획득한 장소에 표시되는 희귀 생물입니다.",
    ["Which of them you can gather"] = "채집할 수 있는 지점",
    ["Only my professions"] = "내 전문 기술만",
    ["A profession you have not learned contributes nothing at all."] =
        "배우지 않은 전문 기술의 지점은 전혀 표시되지 않습니다.",
    ["Show nodes above my skill"] = "내 숙련도보다 높은 지점 표시",
    ["Drawn faded. Useful for planning where to level a gathering skill next."] =
        "흐리게 표시됩니다. 다음에 채집 숙련도를 올릴 장소를 계획할 때 유용합니다.",
    ["Fade nodes and mobs until they respawn"] = "재생성될 때까지 지점과 몹을 흐리게 표시",
    ["A node you gathered or a mob you killed stays faint until its respawn timer says it is back."] =
        "채집한 지점이나 처치한 몹은 재생성 타이머가 돌아왔다고 알려 줄 때까지 흐리게 유지됩니다.",

    ["Tooltips"] = "툴팁",
    ["Add quest info to tooltips"] = "툴팁에 퀘스트 정보 추가",
    ["Shows which quests an NPC or item starts, ends or counts towards."] =
        "NPC나 아이템이 시작하거나 종료하는 퀘스트, 또는 진행에 포함되는 퀘스트를 표시합니다.",
    ["Show quest IDs"] = "퀘스트 ID 표시",
    ["Useful when reporting missing data."] = "누락된 데이터를 신고할 때 유용합니다.",
    ["Tracker"] = "추적기",
    ["PandaQuest does not replace the Blizzard quest tracker; it only adds to it."] =
        "PandaQuest는 Blizzard 퀘스트 추적기를 대체하지 않고 기능만 추가합니다.",
    ["Enhance the Blizzard tracker"] = "Blizzard 추적기 강화",
    ["Show distance on tracked quests"] = "추적 중인 퀘스트에 거리 표시",
    ["Notifications"] = "알림",
    ["Show notifications"] = "알림 표시",
    ["A short message in the middle of the screen."] = "화면 가운데에 짧은 메시지가 표시됩니다.",
    ["Quest complete and turned in"] = "퀘스트 완료 및 반환",
    ["Next objective"] = "다음 목표",
    ["Play a sound"] = "소리 재생",
    ["Preview"] = "미리 보기",
    ["PandaQuest is ready."] = "PandaQuest 준비 완료.",
    ["Synchronisation (optional)"] = "동기화 (선택)",
    ["Optional. PandaQuest works fully without it, and never uploads anything itself."] =
        "선택 사항입니다. PandaQuest는 이 기능 없이도 완전히 작동하며, 직접 아무것도 업로드하지 않습니다.",
    ["Record quest data"] = "퀘스트 데이터 기록",
    ["Record movement breadcrumbs"] = "이동 경로 기록 남기기",
    ["Occasional position samples that improve community routes."] = "커뮤니티 경로를 개선하기 위해 가끔 위치를 기록합니다.",
    ["Breadcrumb interval (seconds)"] = "이동 경로 기록 간격(초)",
    ["Sessions to keep"] = "보관할 세션 수",
    ["Events per session"] = "세션당 이벤트 수",
    ["Advanced"] = "고급",
    ["Log level"] = "로그 수준",
    ["How much PandaQuest prints to chat."] = "PandaQuest가 대화창에 출력하는 양입니다.",
    ["Errors"] = "오류",
    ["Warnings"] = "경고",
    ["Info"] = "정보",
    ["Debug"] = "디버그",
    ["Trace"] = "트레이스",
    ["Arrow debug output"] = "화살표 디버그 출력",
    ["Prints the bearing values used by the arrow."] = "화살표가 사용하는 방위 값을 출력합니다.",
    ["Redraw map pins"] = "지도 핀 다시 그리기",
    ["Print status to chat"] = "상태를 대화창에 출력",
    ["Profiles"] = "프로필",
    ["Options are not available; use /pq help for chat commands."] =
        "옵션을 사용할 수 없습니다. 대화창 명령어는 /pq help를 사용하세요.",

    -- UI (minimap button, tracker, notifications, Wowhead)
    ["Distance unknown"] = "거리 알 수 없음",
    ["Left-click: toggle the arrow"] = "왼쪽 클릭: 화살표 켜기/끄기",
    ["Right-click: open options"] = "오른쪽 클릭: 옵션 열기",
    ["Press Ctrl+C to copy the link:"] = "Ctrl+C를 눌러 링크를 복사하세요:",
    ["Navigate to this quest"] = "이 퀘스트로 안내",
    ["the quest giver"] = "퀘스트 제공자",
    ["unknown distance"] = "알 수 없는 거리",
    ["%s complete"] = "%s 완료",
    ["Turned in: %s"] = "반환 완료: %s",

    -- Sync (telemetry, community data)
    ["Telemetry: %s"] = "원격 분석: %s",
    ["Events recorded this session: %d (%d dropped)"] = "이번 세션에 기록된 이벤트: %d (%d개 누락)",
    ["Sessions stored: %d, waiting for upload: %d"] = "저장된 세션: %d, 업로드 대기: %d",
    ["Last upload confirmed: %s"] = "마지막 업로드 확인: %s",
    ["never"] = "없음",
    ["Nothing is recorded while telemetry is off. Re-enable it in /pq options."] =
        "원격 분석이 꺼져 있는 동안에는 아무것도 기록되지 않습니다. /pq options에서 다시 켜세요.",
    ["No community data yet."] = "커뮤니티 데이터가 아직 없습니다.",
    ["Community data from %s"] = "%s의 커뮤니티 데이터",
    ["Last gear snapshot: %s"] = "마지막 장비 스냅샷: %s",
    ["Gear snapshots: off."] = "장비 스냅샷: 꺼짐.",

    -- Sync / Consent
    ["/pq consent - ask the data sharing question again"] = "/pq consent - 데이터 공유 질문을 다시 표시",
    ["PandaQuest can send what you do while questing to the community hub."] =
        "PandaQuest는 퀘스트를 진행하는 동안의 활동을 커뮤니티 허브로 보낼 수 있습니다.",
    ["That means the quests you accept and finish, what you kill and loot, where you die, and your map position with the time."] =
        "수락하고 완료한 퀘스트, 처치하고 획득한 대상, 사망한 위치, 그리고 시간과 함께 기록된 지도상의 위치가 해당됩니다.",
    ["It builds the shared quest routes. It is off until you say yes, and you can stop and delete it whenever you like."] =
        "이 데이터는 공유 퀘스트 경로를 만드는 데 쓰입니다. 동의하기 전까지는 꺼져 있으며, 원할 때 언제든 중지하고 삭제할 수 있습니다.",
    ["PandaQuest can share your quest data to build the community routes."] =
        "PandaQuest는 커뮤니티 경로를 만들기 위해 퀘스트 데이터를 공유할 수 있습니다.",
    ["It is off. Turn it on in /pq options if you want to take part."] =
        "현재 꺼져 있습니다. 참여하려면 /pq options에서 켜세요.",
    ["Share my quest data"] = "내 퀘스트 데이터 공유",
    ["No thanks"] = "아니요, 괜찮습니다",
    ["Thank you. PandaQuest will share your quest data. Turn it off any time with /pq sync."] =
        "감사합니다. PandaQuest가 퀘스트 데이터를 공유합니다. /pq sync로 언제든 끌 수 있습니다.",
    ["Nothing will be collected. Turn it on any time in /pq options."] =
        "아무것도 수집되지 않습니다. /pq options에서 언제든 켤 수 있습니다.",

    -- Auction house: the scan, the invoices, the tooltip and the options section
    ["Scan prices"] = "가격 스캔",
    ["Stop scan (%d%%)"] = "스캔 중지 (%d%%)",
    ["Scanning the auction house. Keep the window open; closing it cancels the scan."] =
        "경매장을 스캔하는 중입니다. 창을 열어 두세요. 창을 닫으면 스캔이 취소됩니다.",
    ["Auction house scan finished: %d auctions of %d items in %s."] =
        "경매장 스캔 완료: 경매 %d건, 아이템 %d종, 소요 시간 %s.",
    ["The scan stopped at %d auctions to keep the saved file small."] =
        "저장 파일 크기를 줄이기 위해 경매 %d건에서 스캔을 중단했습니다.",
    ["A scan is already running."] = "이미 스캔이 진행 중입니다.",
    ["Open the auction house first, then press Scan prices or type /pq scan."] =
        "먼저 경매장을 연 다음 가격 스캔을 누르거나 /pq scan을 입력하세요.",
    ["This client offers no auction house listing PandaQuest can read."] =
        "이 클라이언트에서는 PandaQuest가 읽을 수 있는 경매장 목록을 제공하지 않습니다.",
    ["Scan cancelled: the auction house window was closed."] = "스캔 취소: 경매장 창이 닫혔습니다.",
    ["Scan stopped: the auction house did not answer."] = "스캔 중단: 경매장이 응답하지 않았습니다.",
    ["Scan stopped. Nothing was saved."] = "스캔이 중단되었습니다. 아무것도 저장되지 않았습니다.",
    ["The auction house sent an empty listing. Nothing was saved."] =
        "경매장에서 빈 목록을 보냈습니다. 아무것도 저장되지 않았습니다.",
    ["No scan is running."] = "진행 중인 스캔이 없습니다.",
    ["Scanning: %d%% (%d auctions read)."] = "스캔 중: %d%% (경매 %d건 읽음).",
    ["Last scan of %s (%s, %s): %d auctions of %d items, %s ago."] =
        "%s의 마지막 스캔 (%s, %s): 경매 %d건, 아이템 %d종, %s 전.",
    ["No auction house scan yet for this realm."] = "이 서버에서는 아직 경매장 스캔을 하지 않았습니다.",
    ["AH minimum buyout"] = "경매장 최저 즉시 구매가",
    ["AH market value"] = "경매장 시장 가치",
    ["bids only"] = "입찰만",
    ["%s, scanned %s ago"] = "%s, %s 전에 스캔",
    ["Auction house"] = "경매장",
    ["PandaQuest never scans on its own. Press Scan prices on the auction house window, or type /pq scan while it is open."] =
        "PandaQuest는 스스로 스캔하지 않습니다. 경매장 창에서 가격 스캔을 누르거나, 창이 열려 있는 동안 /pq scan을 입력하세요.",
    ["Show the scan button on the auction house window"] = "경매장 창에 스캔 버튼 표시",
    ["Show auction prices on item tooltips"] = "아이템 툴팁에 경매 가격 표시",
    ["The lowest buyout and the market value from your last scan on this realm, with how old it is."] =
        "이 서버에서 마지막으로 스캔한 최저 즉시 구매가와 시장 가치를, 얼마나 오래된 정보인지와 함께 표시합니다.",
    ["Record my auction sales and purchases"] = "내 경매 판매 및 구매 기록",
    ["Read from the auction invoices in your mailbox. The item, the amount and the price are kept, never the other player's name."] =
        "우편함의 경매 송장에서 읽어 옵니다. 아이템, 수량, 가격만 보관하며 상대 플레이어의 이름은 저장하지 않습니다.",
    -- Professions: the recipe scan, its refusals and the options section
    ["/pq scan professions - read the open profession window"] = "/pq scan professions - 열려 있는 전문 기술 창 읽기",
    ["/pq scan archaeology - read your archaeology window"] = "/pq scan archaeology - 고고학 창 읽기",
    ["/pq digsite - show the dig site bar so you can move it"] = "/pq digsite - 옮길 수 있도록 발굴 현장 바 표시",
    ["A profession scan is already running."] = "이미 전문 기술 스캔이 진행 중입니다.",
    ["Open a profession window first, then type /pq scan professions."] =
        "먼저 전문 기술 창을 연 다음 /pq scan professions를 입력하세요.",
    ["This client does not offer the recipe list PandaQuest reads."] =
        "이 클라이언트에서는 PandaQuest가 읽는 제작법 목록을 제공하지 않습니다.",
    ["That window is another player's recipe book, opened from a link. PandaQuest does not record it."] =
        "이 창은 링크로 연 다른 플레이어의 제작법 목록입니다. PandaQuest는 이를 기록하지 않습니다.",
    ["This profession window lists no recipes."] = "이 전문 기술 창에는 제작법이 없습니다.",
    ["The profession list has not arrived from the server yet. Try again in a moment."] =
        "전문 기술 목록을 아직 서버에서 받지 못했습니다. 잠시 후 다시 시도하세요.",
    ["Nothing was saved: not one recipe in this window could be read whole."] =
        "아무것도 저장되지 않았습니다. 이 창의 제작법 중 온전히 읽을 수 있는 것이 하나도 없었습니다.",
    ["The profession window changed while it was being read. Nothing was saved."] =
        "읽는 도중 전문 기술 창이 바뀌었습니다. 아무것도 저장되지 않았습니다.",
    ["The window was read short, so the recipe book you already have was kept."] =
        "창을 끝까지 읽지 못해 기존에 저장된 제작법 목록을 유지했습니다.",
    ["Profession scan cancelled: the window was closed."] = "전문 기술 스캔 취소: 창이 닫혔습니다.",
    ["Profession scan stopped. Nothing was saved."] = "전문 기술 스캔이 중단되었습니다. 아무것도 저장되지 않았습니다.",
    ["PandaQuest will not touch your profession window: it cannot put %s back the way you left it."] =
        "PandaQuest는 전문 기술 창을 건드리지 않습니다. 원래대로 되돌릴 수 없는 항목: %s",
    ["PandaQuest could not put your profession window back exactly as you left it."] =
        "PandaQuest가 전문 기술 창을 원래 상태 그대로 되돌리지 못했습니다.",
    ["Profession scan finished: %s %d/%d, %d recipes in %s."] =
        "전문 기술 스캔 완료: %s %d/%d, 제작법 %d개, 소요 시간 %s.",
    ["%d recipes were left out because the game had not finished loading them. Open the window again to finish them."] =
        "게임이 아직 불러오지 못해 제작법 %d개가 제외되었습니다. 창을 다시 열어 마저 읽으세요.",
    ["The scan stopped at %d recipes to keep the saved file small."] =
        "저장 파일 크기를 줄이기 위해 제작법 %d개에서 스캔을 중단했습니다.",
    ["Last scan of %s (%d/%d): %d recipes, %s ago."] = "%s의 마지막 스캔 (%d/%d): 제작법 %d개, %s 전.",
    ["No profession has been scanned on this character yet."] = "이 캐릭터에서는 아직 스캔한 전문 기술이 없습니다.",
    ["Professions"] = "전문 기술",
    ["PandaQuest reads an open profession window once and puts your filters and collapsed categories back."] =
        "PandaQuest는 열린 전문 기술 창을 한 번 읽고, 필터와 접어 둔 분류를 원래대로 되돌립니다.",
    ["Read my recipes when I open a profession"] = "전문 기술을 열 때 내 제작법 읽기",
    ["The recipes, their reagents and how hard each is for this character. Never a book opened from a link."] =
        "이 캐릭터의 제작법, 필요한 재료, 각 제작법의 난이도입니다. 링크로 연 다른 사람의 목록은 읽지 않습니다.",

    -- Flight master
    ["Flight time:"] = "비행 시간:",
    ["~%s (%d flight)"] = "~%s (비행 %d회)",
    ["~%s (%d flights)"] = "~%s (비행 %d회)",
    ["~%s left (%d flights)"] = "~%s 남음 (비행 %d회)",
    ["%s in the air"] = "공중에서 %s",
    ["Flight progress"] = "비행 진행률",
    ["The flight bar is switched off in /pq options."] = "비행 바가 /pq options에서 꺼져 있습니다.",
    ["The flight bar is locked. Unlock it in /pq options to move it."] =
        "비행 바가 잠겨 있습니다. 이동하려면 /pq options에서 잠금을 해제하세요.",
    ["Drag the flight bar where you want it. It hides itself again in a moment."] =
        "비행 바를 원하는 위치로 끌어 놓으세요. 잠시 후 자동으로 다시 숨겨집니다.",
    ["/pq flight - show the flight bar so you can drag it"] = "/pq flight - 끌어서 옮길 수 있도록 비행 바 표시",
    ["Flight master"] = "비행 조련사",
    ["PandaQuest times your own flights and shows what it measured. A route you have never flown shows nothing at all."] =
        "PandaQuest는 직접 탑승한 비행 시간을 측정해 표시합니다. 한 번도 비행하지 않은 경로는 아무것도 표시되지 않습니다.",
    ["Show the flight time at the flight master"] = "비행 조련사에서 비행 시간 표시",
    ["One line in the destination's tooltip, with how many of your own flights it rests on."] =
        "목적지 툴팁에 한 줄로 표시되며, 몇 번의 비행 기록을 바탕으로 한 것인지도 함께 나타납니다.",
    ["Show the progress bar while flying"] = "비행 중 진행 바 표시",
    ["Progress and remaining time once the route has been flown twice; before that, only the time in the air."] =
        "경로를 두 번 비행한 뒤에는 진행률과 남은 시간을, 그 전에는 비행한 시간만 표시합니다.",
    -- Archaeology
    ["This client does not offer the archaeology data PandaQuest reads."] =
        "이 클라이언트에서는 PandaQuest가 읽는 고고학 데이터를 제공하지 않습니다.",
    ["This character has no archaeology races to read yet."] = "이 캐릭터에게는 아직 읽을 수 있는 고고학 종족이 없습니다.",
    ["Your artifact history has not arrived yet, so the archaeology PandaQuest already had was kept."] =
        "유물 기록을 아직 받지 못해, PandaQuest가 이미 가지고 있던 고고학 정보를 유지했습니다.",
    ["No archaeology has been read on this character yet."] = "이 캐릭터에서는 아직 고고학 정보를 읽지 않았습니다.",
    ["Archaeology %d/%d: %d races, %d artifacts, read %s ago."] = "고고학 %d/%d: 종족 %d개, 유물 %d개, %s 전에 읽음.",
    ["Archaeology %d: %d races, %d artifacts, read %s ago."] = "고고학 %d: 종족 %d개, 유물 %d개, %s 전에 읽음.",
    ["Archaeology: %d races, %d artifacts, read %s ago."] = "고고학: 종족 %d개, 유물 %d개, %s 전에 읽음.",
    ["Archaeology read: %d races, %d artifacts."] = "고고학 정보 읽기 완료: 종족 %d개, 유물 %d개.",
    ["The server has not sent your artifact history, so completion counts were left out."] =
        "서버가 유물 기록을 보내지 않아 완성 횟수는 제외되었습니다.",
    ["Archaeology"] = "고고학",
    ["Mists never shipped a dig site progress bar. PandaQuest draws one from the events the game already sends."] =
        "판다리아의 안개에는 발굴 현장 진행 바가 없었습니다. PandaQuest는 게임이 이미 보내는 이벤트를 바탕으로 직접 그립니다.",
    ["Read my archaeology when I open the window"] = "창을 열 때 내 고고학 정보 읽기",
    ["Your races, their keystone, your fragments and the artifacts you have. Only this character's own."] =
        "종족, 종족별 열쇠돌, 보유한 파편, 보유한 유물입니다. 이 캐릭터의 정보만 해당됩니다.",
    ["Dig site progress bar"] = "발굴 현장 진행 바",
    ["Show the dig site progress bar"] = "발굴 현장 진행 바 표시",
    ["Appears when you survey and hides when you leave the dig site."] =
        "탐사하면 나타나고 발굴 현장을 벗어나면 숨겨집니다.",
    ["Lock the bar in place"] = "바 위치 잠금",
    ["Unlocked, it can be dragged with the left mouse button."] =
        "잠금을 해제하면 마우스 왼쪽 버튼으로 끌어서 옮길 수 있습니다.",
    ["Bar size"] = "바 크기",
    ["Show me where it is"] = "위치 보여 주기",
    ["Puts an empty bar on screen for a moment so you can find it, and drag it when it is unlocked."] =
        "찾을 수 있도록 빈 바를 잠시 화면에 표시하며, 잠금이 해제되어 있으면 끌어서 옮길 수 있습니다.",
    ["Reset bar position"] = "바 위치 초기화",
    ["Dig site progress"] = "발굴 현장 진행도",
    ["Dig site complete"] = "발굴 현장 완료",
    ["This client draws its own dig site progress bar."] = "이 클라이언트는 자체 발굴 현장 진행 바를 표시합니다.",
    ["The dig site bar is switched off in /pq options."] = "발굴 현장 바가 /pq options에서 꺼져 있습니다.",
    ["Drag the dig site bar where you want it. It hides itself again in a moment."] =
        "발굴 현장 바를 원하는 위치로 끌어 놓으세요. 잠시 후 자동으로 다시 숨겨집니다.",
    ["The dig site bar is locked. Unlock it in /pq options to move it."] =
        "발굴 현장 바가 잠겨 있습니다. 이동하려면 /pq options에서 잠금을 해제하세요.",

    -- Database/QuestieDB (the optional QuestieDB addon)
    ["Quest database source"] = "퀘스트 데이터베이스 출처",
    ["Uses the QuestieDB addon, if it is installed and enabled, to complete PandaQuest's own database. Takes effect after /reload."] =
        "QuestieDB 애드온이 설치되어 활성화되어 있으면 이를 사용해 PandaQuest 자체 데이터베이스의 빈틈을 채웁니다. /reload 후 적용됩니다.",
    ["PandaQuest only"] = "PandaQuest만",
    ["Fill gaps from QuestieDB"] = "QuestieDB로 빈틈 채우기",
    ["QuestieDB values first"] = "QuestieDB 값 우선",
    ["QuestieDB: %s"] = "QuestieDB: %s",
    ["QuestieDB: %s (%d entries added, %d refreshed)"] = "QuestieDB: %s (항목 %d개 추가, %d개 갱신)",
    ["not used (off)"] = "사용 안 함 (꺼짐)",
    ["not installed"] = "설치되지 않음",
    ["cannot be used (%s)"] = "사용할 수 없음 (%s)",
    ["not read yet"] = "아직 읽지 않음",

    -- Quest browser, quest database source, language selection
    ["/pq quests [questID] - browse every quest in the database"] =
        "/pq quests [questID] - 데이터베이스의 모든 퀘스트 둘러보기",
    ["Name"] = "이름",
    ["Level"] = "레벨",
    ["to"] = "~",
    ["My level"] = "내 레벨",
    ["My side"] = "내 진영",
    ["Alliance"] = "얼라이언스",
    ["Horde"] = "호드",
    ["Both"] = "양 진영",
    ["both factions"] = "양 진영",
    ["Dungeon"] = "던전",
    ["Raid"] = "공격대",
    ["Group"] = "파티",
    ["PvP"] = "PvP",
    ["Daily"] = "일일",
    ["Event"] = "이벤트",
    ["Reset"] = "초기화",
    ["All quests"] = "모든 퀘스트",
    ["%d quests"] = "퀘스트 %d개",
    ["No quest matches these filters."] = "이 필터에 맞는 퀘스트가 없습니다.",
    ["Reading the quest database..."] = "퀘스트 데이터베이스를 읽는 중...",
    ["Quest"] = "퀘스트",
    ["Zone"] = "지역",
    ["Req."] = "요구",
    ["XP"] = "경험",
    ["A level %d quest for %s, from level %d."] = "레벨 %d 퀘스트 (%s 대상), 레벨 %d부터 수락 가능.",
    ["%d experience"] = "경험치 %d",
    ["Not in the database."] = "데이터베이스에 없습니다.",
    ["requires level"] = "요구 레벨",
    ["Yes"] = "예",
    ["No"] = "아니요",
    ["No location is known for this quest."] = "이 퀘스트의 위치를 알 수 없습니다.",
    ["Navigating to: %s"] = "길 안내 중: %s",
    ["Start"] = "시작",
    ["End"] = "종료",
    ["Difficulty"] = "난이도",
    ["Side"] = "진영",
    ["Shareable"] = "공유 가능",
    ["Quest ID"] = "퀘스트 ID",
    ["Rewards"] = "보상",
    ["Navigate"] = "길 안내",
    ["Pick a quest from the list to see its page."] = "목록에서 퀘스트를 선택하면 상세 정보가 표시됩니다.",
    ["Quests"] = "퀘스트",
    ["Shift-click: browse all quests"] = "Shift-클릭: 모든 퀘스트 둘러보기",
    -- Beta notice and animation options
    ["This is a beta build: new features are not yet confirmed in the game."] =
        "이 빌드는 베타 버전입니다. 새 기능은 아직 게임에서 확인되지 않았습니다.",
    ["Animations"] =
        "애니메이션",
    ["Windows fade and settle, messages slide in, bars glide. Switch it off for a calmer interface."] =
        "창이 부드럽게 나타나 자리를 잡고, 메시지가 미끄러지듯 나오며, 막대가 매끄럽게 움직입니다. 끄면 더 차분한 인터페이스가 됩니다.",
    ["Turn all interface motion on or off."] =
        "모든 인터페이스 움직임을 켜거나 끕니다.",
    ["Animation speed"] =
        "애니메이션 속도",
    ["1 is normal; 2 is twice as fast, 0.5 half as fast."] =
        "1은 보통, 2는 두 배 빠르게, 0.5는 절반 속도입니다.",
    -- Options: language, tools
    ["Categories"] =
        "분류",
    ["Loosen a filter, or press Reset."] =
        "필터를 완화하거나 초기화를 누르세요.",
    ["Open the quest browser"] =
        "퀘스트 둘러보기 열기",
    ["Browse every quest in the database, with a page and a map for each."] =
        "데이터베이스의 모든 퀘스트를 둘러봅니다. 퀘스트마다 상세 정보 페이지와 지도가 있습니다.",
    ["Choose the language of PandaQuest's texts. Automatic follows the game's language."] =
        "PandaQuest 문구에 쓸 언어를 고릅니다. 자동을 선택하면 게임 언어를 따릅니다.",
    ["Automatic (game language)"] =
        "자동 (게임 언어)",
    ["Reload the interface"] =
        "인터페이스 다시 불러오기",
    ["Reloads the game's interface so a changed language applies everywhere."] =
        "게임 인터페이스를 다시 불러와 바꾼 언어가 모든 곳에 적용되게 합니다.",
    ["Tools"] =
        "도구",
    ["Everything the chat commands do, as buttons. Nothing here needs a command."] =
        "대화창 명령어가 하는 일을 버튼으로 모았습니다. 여기서는 명령어를 입력할 필요가 없습니다.",
    ["Skip the current target"] =
        "현재 대상 건너뛰기",
    ["Moves the arrow on to the next target."] =
        "화살표를 다음 대상으로 넘깁니다.",
    ["Stop following the pinned quest"] =
        "고정한 퀘스트 따라가기 중지",
    ["Clears the quest pinned with the focus setting or the map's right-click menu."] =
        "집중 퀘스트 설정이나 지도의 오른쪽 클릭 메뉴로 고정한 퀘스트를 해제합니다.",
    ["Reset arrow position and map pins"] =
        "화살표 위치와 지도 핀 초기화",
    ["Wowhead link for the current target"] =
        "현재 대상의 Wowhead 링크",
    ["%d quests are hidden from the navigator."] =
        "퀘스트 %d개가 길 안내에서 숨겨져 있습니다.",
    ["Show all hidden quests again"] =
        "숨긴 퀘스트 모두 다시 표시",
    ["Reading windows"] =
        "창 읽기",
    ["Read my professions now"] =
        "내 전문 기술 지금 읽기",
    ["Open the profession window first."] =
        "먼저 전문 기술 창을 여세요.",
    ["Read my archaeology now"] =
        "내 고고학 정보 지금 읽기",
    ["Open the archaeology window first."] =
        "먼저 고고학 창을 여세요.",
    ["Show synchronisation status"] =
        "동기화 상태 표시",
    ["Ask the data sharing question"] =
        "데이터 공유 질문 표시",
}

ns.LOCALE_TABLES = ns.LOCALE_TABLES or {}
ns.LOCALE_TABLES.koKR = T

local L = LibStub("AceLocale-3.0"):NewLocale("PandaQuest", "koKR")
if not L then return end
for key, value in pairs(T) do
    L[key] = value
end
