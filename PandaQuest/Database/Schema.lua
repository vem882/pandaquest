-- Database/Schema.lua: Questie-compatible key tables.
-- The generated Database/Data/*.lua rows are positional arrays; these tables name the positions.
-- Everything here is data only: the module has no lifecycle methods and never touches the game API.
-- Numbers are cross-checked against _reference/Questie/Database/{questDB,npcDB,objectDB,itemDB,QuestieDB}.lua.
local _, ns = ...

local Schema = {}
ns.Schema = Schema

local pairs = pairs

---------------------------------------------------------------------------
-- Positional key tables (Questie QuestieDB.*Keys, unchanged)
---------------------------------------------------------------------------

-- 36 fields.
Schema.questKeys = {
    name = 1,                       -- string
    startedBy = 2,                  -- {creatureStart, objectStart, itemStart}
    finishedBy = 3,                 -- {creatureEnd, objectEnd}
    requiredLevel = 4,              -- int
    questLevel = 5,                 -- int
    requiredRaces = 6,              -- bitmask, see Schema.raceKeys
    requiredClasses = 7,            -- bitmask, see Schema.classKeys
    objectivesText = 8,             -- {string,...}
    triggerEnd = 9,                 -- {text, {[areaID] = {coordPair,...}}}
    objectives = 10,                -- {creature, object, item, reputation, killCredit, spell}
    sourceItemId = 11,              -- int, item handed out by the quest giver
    preQuestGroup = 12,             -- {questID,...} all of them are required
    preQuestSingle = 13,            -- {questID,...} any one of them is enough
    childQuests = 14,               -- {questID,...}
    inGroupWith = 15,               -- {questID,...}
    exclusiveTo = 16,               -- {questID,...}
    zoneOrSort = 17,                -- int, >0 AreaTable.dbc id, <0 QuestSort.dbc id (Schema.sortKeys)
    requiredSkill = 18,             -- {skill, value}
    requiredMinRep = 19,            -- {faction, value}
    requiredMaxRep = 20,            -- {faction, value}
    requiredSourceItems = 21,       -- {itemID,...}
    nextQuestInChain = 22,          -- int
    questFlags = 23,                -- bitmask, see Schema.questFlags
    specialFlags = 24,              -- bitmask, see Schema.specialFlags
    parentQuest = 25,               -- int
    reputationReward = 26,          -- {{faction, value},...}
    breadcrumbForQuestId = 27,      -- int
    breadcrumbs = 28,               -- {questID,...}
    extraObjectives = 29,           -- {{spawnlist, icon, text, objectiveIndex, {{type, id},...}},...}
    requiredSpell = 30,             -- int
    requiredSpecialization = 31,    -- int
    requiredMaxLevel = 32,          -- int
    availableUntilCompleted = 33,   -- int
    availableStartingWith = 34,     -- int
    requiredRanks = 35,             -- {{skill, value},...}
    disabledByQuest = 36,           -- int
}

-- 15 fields.
Schema.npcKeys = {
    name = 1,                       -- string
    minLevelHealth = 2,             -- int
    maxLevelHealth = 3,             -- int
    minLevel = 4,                   -- int
    maxLevel = 5,                   -- int
    rank = 6,                       -- int, 0 normal, 1 elite, 2 rare elite, 3 boss, 4 rare
    spawns = 7,                     -- {[areaID] = {{x, y[, phase]},...}}
    waypoints = 8,                  -- {[areaID] = {{{x, y},...} polylines}}
    zoneID = 9,                     -- areaID the NPC is most common in
    questStarts = 10,               -- {questID,...}
    questEnds = 11,                 -- {questID,...}
    factionID = 12,                 -- int, FactionTemplate.dbc
    friendlyToFaction = 13,         -- "A" | "H" | "AH" | nil
    subName = 14,                   -- string
    npcFlags = 15,                  -- bitmask, see Schema.npcFlags
}

-- 7 fields.
Schema.objectKeys = {
    name = 1,                       -- string
    questStarts = 2,                -- {questID,...}
    questEnds = 3,                  -- {questID,...}
    spawns = 4,                     -- {[areaID] = {{x, y},...}}
    zoneID = 5,                     -- areaID
    factionID = 6,                  -- int
    waypoints = 7,                  -- {[areaID] = {{{x, y},...}}} for objects on ships/zeppelins
}

-- 16 fields.
Schema.itemKeys = {
    name = 1,                       -- string
    npcDrops = 2,                   -- {npcID,...}
    objectDrops = 3,                -- {objectID,...}
    itemDrops = 4,                  -- {itemID,...}
    startQuest = 5,                 -- int
    questRewards = 6,               -- {questID,...}
    flags = 7,                      -- int, Item_template flags
    foodType = 8,                   -- int
    itemLevel = 9,                  -- int
    requiredLevel = 10,             -- int
    ammoType = 11,                  -- int
    class = 12,                     -- int
    subClass = 13,                  -- int
    vendors = 14,                   -- {npcID,...}
    relatedQuests = 15,             -- {questID,...}
    teachesSpell = 16,              -- int
}

-- Sub-key tables for the nested positional tuples, so callers never hard-code indices either.
Schema.startedByKeys = { npcs = 1, objects = 2, items = 3 }
Schema.finishedByKeys = { npcs = 1, objects = 2 }
Schema.objectiveKeys = { creature = 1, object = 2, item = 3, reputation = 4, killCredit = 5, spell = 6 }
Schema.triggerEndKeys = { text = 1, coords = 2 }

---------------------------------------------------------------------------
-- Reversed maps: index -> key name, built programmatically.
---------------------------------------------------------------------------

local function reverse(keys)
    local out = {}
    for name, index in pairs(keys) do
        out[index] = name
    end
    return out
end

Schema.questKeysReversed = reverse(Schema.questKeys)
Schema.npcKeysReversed = reverse(Schema.npcKeys)
Schema.objectKeysReversed = reverse(Schema.objectKeys)
Schema.itemKeysReversed = reverse(Schema.itemKeys)

-- Field counts, handy for validation and for tests.
Schema.counts = { quest = 36, npc = 15, object = 7, item = 16 }

---------------------------------------------------------------------------
-- Bitmasks
---------------------------------------------------------------------------

-- 2^PlayableRaceBit (ChrRaces.dbc). MoP values: Pandaren and the two faction-locked Pandaren bits exist.
Schema.raceKeys = {
    NONE = 0,
    ALL_ALLIANCE = 18875469,        -- MoP: human+dwarf+nightelf+gnome+draenei+worgen+pandaren(alliance)
    ALL_HORDE = 33555378,           -- MoP: orc+undead+tauren+troll+bloodelf+goblin+pandaren(horde)
    HUMAN = 1,
    ORC = 2,
    DWARF = 4,
    NIGHT_ELF = 8,
    UNDEAD = 16,
    TAUREN = 32,
    GNOME = 64,
    TROLL = 128,
    GOBLIN = 256,
    BLOOD_ELF = 512,
    DRAENEI = 1024,
    WORGEN = 2097152,
    PANDAREN = 8388608,
    PANDAREN_ALLIANCE = 16777216,
    PANDAREN_HORDE = 33554432,
}

Schema.classKeys = {
    NONE = 0,
    ALL_CLASSES = 2047,             -- MoP: 11 classes, Monk included
    WARRIOR = 1,
    PALADIN = 2,
    HUNTER = 4,
    ROGUE = 8,
    PRIEST = 16,
    DEATH_KNIGHT = 32,
    SHAMAN = 64,
    MAGE = 128,
    WARLOCK = 256,
    MONK = 512,
    DRUID = 1024,
}

-- UnitClassBase()/UnitRace() second return -> bitmask, used when applying faction fixes and
-- when Availability checks requiredClasses/requiredRaces.
Schema.classFileToMask = {
    WARRIOR = 1, PALADIN = 2, HUNTER = 4, ROGUE = 8, PRIEST = 16, DEATHKNIGHT = 32,
    DEATH_KNIGHT = 32, SHAMAN = 64, MAGE = 128, WARLOCK = 256, MONK = 512, DRUID = 1024,
}
Schema.raceFileToMask = {
    Human = 1, Orc = 2, Dwarf = 4, NightElf = 8, Scourge = 16, Undead = 16, Tauren = 32,
    Gnome = 64, Troll = 128, Goblin = 256, BloodElf = 512, Draenei = 1024, Worgen = 2097152,
    Pandaren = 8388608,
}

-- quest_template.QuestFlags
Schema.questFlags = {
    NONE = 0,
    STAY_ALIVE = 1,
    PARTY_ACCEPT = 2,
    EXPLORATION = 4,
    SHARABLE = 8,
    UNUSED1 = 16,
    EPIC = 32,
    RAID = 64,
    UNUSED2 = 128,
    UNKNOWN = 256,
    HIDDEN_REWARDS = 512,
    AUTO_REWARDED = 1024,
    DAILY = 4096,
    WEEKLY = 32768,
    MONTHLY = 65536,
}

-- quest_template.SpecialFlags (1 = repeatable, 2 = needs event, 4 = monthly reset)
Schema.specialFlags = {
    NONE = 0,
    REPEATABLE = 1,
    NEEDS_EVENT = 2,
    MONTHLY_RESET = 4,
}

-- creature_template.NpcFlags. These are the NON-Classic (TBC and later, so also MoP) column values.
Schema.npcFlags = {
    NONE = 0,
    GOSSIP = 1,
    QUEST_GIVER = 2,
    VENDOR = 128,
    TRAINER = 16,
    FLIGHT_MASTER = 8192,
    SPIRIT_HEALER = 16384,
    SPIRIT_GUIDE = 32768,
    INNKEEPER = 65536,
    BANKER = 131072,
    PETITIONER = 262144,
    TABARD_DESIGNER = 524288,
    BATTLEMASTER = 1048576,
    AUCTIONEER = 2097152,
    STABLEMASTER = 4194304,
    REPAIR = 4096,
    BARBER = 33554432,
    ARCANE_REFORGER = 134217728,
    TRANSMOGRIFIER = 268435456,
}

-- QuestSort.dbc ids: quest.zoneOrSort < 0 means "this sort bucket" instead of an areaID.
Schema.sortKeys = {
    EPIC = -1,
    HALLOWS_END = -21,
    SEASONAL = -22,
    UNDERCITY = -23,
    HERBALISM = -24,
    BATTLEGROUNDS = -25,
    DAY_OF_THE_DEAD = -41,
    WARLOCK = -61,
    WARRIOR = -81,
    SHAMAN = -82,
    FISHING = -101,
    BLACKSMITHING = -121,
    PALADIN = -141,
    MAGE = -161,
    ROGUE = -162,
    ALCHEMY = -181,
    LEATHERWORKING = -182,
    ENGINEERING = -201,
    TREASURE_MAP = -221,
    TOURNAMENT = -241,
    HUNTER = -261,
    PRIEST = -262,
    DRUID = -263,
    TAILORING = -264,
    SPECIAL = -284,
    COOKING = -304,
    FIRST_AID = -324,
    LEGENDARY = -344,
    DARKMOON_FAIRE = -364,
    AHN_QIRAJ_WAR = -365,
    LUNAR_FESTIVAL = -366,
    REPUTATION = -367,
    INVASION = -368,
    MIDSUMMER = -369,
    BREWFEST = -370,
    INSCRIPTION = -371,
    DEATHKNIGHT = -372,
    JEWELCRAFTING = -373,
    NOBLEGARDEN = -374,
    PILGRIMS_BOUNTY = -375,
    LOVE_IS_IN_THE_AIR = -376,
    ARCHAEOLOGY = -377,
    CHILDRENS_WEEK = -378,
    FIRELANDS_INVASION = -379,
    THE_ZANDALARI = -380,
    ELEMENTAL_BONDS = -381,
    PANDAREN_BREWMASTERS = -391,
    SCENARIO = -392,
    PET_BATTLE = -394,
    MONK = -395,
    LANDFALL = -396,
    PANDAREN_CAMPAIGN = -397,
    RIDING = -398,
    BRAWLERS_GUILD = -399,
    PROVING_GROUNDS = -400,
    HARVEST_FESTIVAL = -402,
    WINTER_VEIL = -404,
    NIGHTMARE_INCURSIONS = -641,
    BLACKROCK_ERUPTION = -644,
    TITAN_REFORGED_REALM = -662,
    SPECIALTEMP = -1000,
}

Schema.sortKeysReversed = reverse(Schema.sortKeys)

---------------------------------------------------------------------------
-- Flag helpers. `bit` exists in the WoW client and in the test stub, but never assume it.
---------------------------------------------------------------------------

local band = bit and bit.band

-- HasFlag(value, mask) -> bool. Works for single-bit masks without the bit library.
function Schema.HasFlag(value, mask)
    if not value or not mask or mask == 0 then return false end
    if band then
        return band(value, mask) ~= 0
    end
    -- Arithmetic fallback for a single bit: (value / mask) mod 2 == 1.
    return (math.floor(value / mask) % 2) == 1
end
