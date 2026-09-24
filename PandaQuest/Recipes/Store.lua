-- Recipes/Store.lua: the account-wide SavedVariable PandaQuestProf (docs/11 B2).
--
-- A recipe book is kept apart from PandaQuestSync for the reason the auction data is
-- (Auction/Store.lua): a scan is an order of magnitude bigger than a questing session, and losing
-- or resetting it must never take the quest log with it. WoW still writes every SavedVariable of
-- the addon into one PandaQuest.lua and the companion refuses that file past 32 MB
-- (companion-go/internal/luaparse/limits.go SyncLimits), so this table is bounded in both
-- directions: how many professions are kept at all, and how many recipes one of them may carry.
--
-- One recipe is one short string rather than a table, again for the auction store's reason: WoW's
-- serializer spends six lines and about a hundred bytes on a table per entry and about forty on
-- the string. Measured against the closest thing in the repository, ns.Data.professionNodes costs
-- 52.9 bytes per entry as a table (Database/Data/Seed.lua); a recipe carries more numbers than
-- that entry does, and the encoding keeps it in the same place.
--
-- One entry per profession per character, replaced rather than appended: a rescan of the same
-- book is the same book. What the hub wants from a second scan is not a second copy but a second
-- (rank, difficulty) sample, and that is carried by the entry's own rank -- so the newest scan
-- wins locally and the hub keeps the history (docs/11 C1.6).
local _, ns = ...

local M = {}
ns.RecipeStore = M

local type, pairs, tonumber, tostring, format = type, pairs, tonumber, tostring, string.format
local floor, gmatch, concat = math.floor, string.gmatch, table.concat

M.VERSION = 1

-- docs/11 B2.
--   maxProfessions  how many (character, profession) entries the file keeps at all. Six professions
--                   per character (two primaries and four secondaries) times four characters is
--                   the shape of an account that plays; past that the oldest scan goes.
--   maxRecipes      the ceiling on one book. A maxed MoP profession is a few hundred rows, so this
--                   is not a limit anyone reaches by playing -- it is the limit that stops a
--                   client answering nonsense from filling the file.
--   maxReagents     MAX_TRADE_SKILL_REAGENTS, Blizzard's own constant
--                   (Blizzard_TradeSkillUI/Mists/Blizzard_TradeSkillUI.lua:2). The window draws
--                   eight reagent buttons and no recipe has more.
M.LIMITS = {
    maxProfessions = 24,
    maxRecipes = 1500,
    maxReagents = 8,
}

--- The largest quantity docs/11 C1.1's grammar carries: minMade, maxMade and a reagent's count are
-- all 1...1000. Nothing craftable in the game comes near it, so this is not a cap anything real
-- meets -- it is the line past which the client is answering something the contract cannot hold,
-- and Recipes/Scanner.lua drops such a row rather than trimming it, because one row that breaks
-- the grammar is the whole book rejected at ingest.
M.MAX_AMOUNT = 1000

-- skillType as GetTradeSkillInfo returns it (Blizzard_TradeSkillUI/Mists/Blizzard_TradeSkillUI
-- .lua:19-25) -> the letter the encoding uses. This is the difficulty THIS character sees at THIS
-- rank, never the breakpoint: the orange/yellow/green/grey thresholds are the hub's to bracket
-- across ranks and players, the same way it takes a respawn median over raw samples rather than
-- over other people's medians (docs/10 C3, docs/11 A2).
M.DIFFICULTY = { optimal = "o", medium = "m", easy = "e", trivial = "t" }
M.DIFFICULTY_NAME = { o = "optimal", m = "medium", e = "easy", t = "trivial" }

-- The two row types that are categories rather than recipes.
M.HEADER_TYPE = { header = true, subheader = true }

-- docs/11 B3. The default lives with the module that owns it because Core/Const.lua is the core's
-- contract, and this file loads before Core/Init.lua builds AceDB, so the key is in place when the
-- profile is created.
ns.DEFAULTS.profile.recipes = {
    scanOnOpen = true,      -- read the window when the player opens a profession
}

---------------------------------------------------------------------------
-- The SavedVariable
---------------------------------------------------------------------------

--- GetDB() -> PandaQuestProf, created and shaped on demand. Core/Init.lua creates the raw table.
function M.GetDB()
    local db = _G.PandaQuestProf
    if type(db) ~= "table" then
        db = {}
        _G.PandaQuestProf = db
    end
    if type(db.version) ~= "number" then db.version = M.VERSION end
    if type(db.professions) ~= "table" then db.professions = {} end
    return db
end

--- CurrentCharacter() -> name, realm, faction. The realm is spelled the way Sync/Telemetry.lua's
-- character key spells it (no spaces, no dashes), so a profession entry and a character on the hub
-- can be talked about in the same words.
function M.CurrentCharacter()
    local name = (UnitName and UnitName("player")) or "Unknown"
    local realm = GetNormalizedRealmName and GetNormalizedRealmName()
    if not realm or realm == "" then
        realm = ((GetRealmName and GetRealmName()) or "Unknown"):gsub("[%s%-]", "")
    end
    local faction = (UnitFactionGroup and UnitFactionGroup("player")) or "Neutral"
    return name, realm, faction
end

--- EntryKey(name, realm, skillLine, profession) -> the key one book is stored under.
-- The character is part of the key because two characters of one account have two different books
-- of the same profession at two different ranks -- which is exactly the pair of samples the hub
-- needs. It is a local key only: the character never leaves this file (docs/11 C1.2).
function M.EntryKey(name, realm, skillLine, profession)
    return format("%s-%s-%s", tostring(name), tostring(realm), tostring(skillLine or profession))
end

--- ScanId(realm, skillLine, profession, scannedAt) -> the id the hub checks against the fields it
-- was derived from (docs/11 C1.4), and which carries no character name.
function M.ScanId(realm, skillLine, profession, scannedAt)
    return format("%s-%s-%d", tostring(realm), tostring(skillLine or profession), scannedAt or 0)
end

---------------------------------------------------------------------------
-- One recipe as one string
---------------------------------------------------------------------------

--- EncodeRecipe({ spellID, itemID, minMade, maxMade, difficulty, reagents }) -> string.
-- "spellID,itemID,minMade,maxMade,difficulty[,reagentID:count]..." -- itemID is empty for an
-- enchant, which produces no item at all (GetTradeSkillItemLink is nil there and altVerb is the
-- flag, Blizzard_TradeSkillUI/Mists/Blizzard_TradeSkillUI.lua:586-596).
function M.EncodeRecipe(recipe)
    local parts = {
        format("%d", recipe.spellID),
        recipe.itemID and format("%d", recipe.itemID) or "",
        format("%d", recipe.minMade or 1),
        format("%d", recipe.maxMade or recipe.minMade or 1),
        tostring(recipe.difficulty or ""),
    }
    local reagents = recipe.reagents or {}
    for i = 1, #reagents do
        parts[#parts + 1] = format("%d:%d", reagents[i][1], reagents[i][2])
    end
    return concat(parts, ",")
end

--- DecodeRecipe(text) -> { spellID, itemID, minMade, maxMade, difficulty, reagents } or nil.
function M.DecodeRecipe(text)
    if type(text) ~= "string" then return nil end
    local fields, count = {}, 0
    for value in gmatch(text .. ",", "([^,]*),") do
        count = count + 1
        fields[count] = value
    end
    local spellID = tonumber(fields[1])
    if not spellID or count < 5 then return nil end
    local difficulty = fields[5]
    if difficulty == "" or not M.DIFFICULTY_NAME[difficulty] then return nil end
    local reagents = {}
    for i = 6, count do
        local id, amount = fields[i]:match("^(%d+):(%d+)$")
        if not id then return nil end
        reagents[#reagents + 1] = { tonumber(id), tonumber(amount) }
    end
    return { spellID = spellID, itemID = tonumber(fields[2]),
             minMade = tonumber(fields[3]) or 1, maxMade = tonumber(fields[4]) or 1,
             difficulty = difficulty, reagents = reagents }
end

---------------------------------------------------------------------------
-- Entries
---------------------------------------------------------------------------

local function entryCount(professions)
    local count = 0
    for _ in pairs(professions) do count = count + 1 end
    return count
end

-- The oldest scan goes when the file is full. Age is the scan's own time rather than the wall
-- clock, so a character nobody has played for a month is dropped before one scanned yesterday.
local function pruneOldest(professions, keep)
    while entryCount(professions) > M.LIMITS.maxProfessions do
        local oldestKey, oldestAt
        for key, entry in pairs(professions) do
            local at = type(entry) == "table" and tonumber(entry.scannedAt) or 0
            if key ~= keep and (not oldestAt or at < oldestAt) then oldestKey, oldestAt = key, at end
        end
        if not oldestKey then return end
        professions[oldestKey] = nil
    end
end

--- SetProfession(entry) -> entry, key. Replaces this character's entry for this profession.
-- Nothing is merged: a book read a minute ago and the same book read now are the same book, and a
-- merge would keep a recipe the player has since unlearned forever.
function M.SetProfession(entry)
    local db = M.GetDB()
    local key = M.EntryKey(entry.character, entry.realm, entry.skillLine, entry.profession)
    db.professions[key] = entry
    pruneOldest(db.professions, key)
    return entry, key
end

--- GetProfession(name, realm, skillLine, profession) -> the stored entry or nil.
function M.GetProfession(name, realm, skillLine, profession)
    return M.GetDB().professions[M.EntryKey(name, realm, skillLine, profession)]
end

--- GetProfessions() -> the whole table, key -> entry.
function M.GetProfessions()
    return M.GetDB().professions
end

--- Count() -> how many books are stored.
function M.Count()
    return entryCount(M.GetDB().professions)
end

--- NewestFor(name, realm) -> the newest entry of that character, or nil.
function M.NewestFor(name, realm)
    local best, bestAt
    for _, entry in pairs(M.GetDB().professions) do
        if type(entry) == "table" and entry.character == name and entry.realm == realm then
            local at = tonumber(entry.scannedAt) or 0
            if not bestAt or at > bestAt then best, bestAt = entry, at end
        end
    end
    return best
end

--- ReagentTotals(entry) -> itemID -> how many recipes in this book use it. Nothing needs it in the
-- addon today; it is what the tooltip and the hub both ask of a book, and it is the one question
-- the encoding has to stay cheap to answer, so it is tested here rather than discovered later.
function M.ReagentTotals(entry)
    local totals = {}
    local rows = (type(entry) == "table" and entry.r) or {}
    for i = 1, #rows do
        local recipe = M.DecodeRecipe(rows[i])
        if recipe then
            for n = 1, #recipe.reagents do
                local id = recipe.reagents[n][1]
                totals[id] = (totals[id] or 0) + 1
            end
        end
    end
    return totals
end

--- Round a count to a whole number the encoding can write.
function M.Amount(value, fallback)
    local number = tonumber(value)
    if not number or number ~= number then return fallback end
    number = floor(number + 0.5)
    if number < 1 then return fallback end
    return number
end
