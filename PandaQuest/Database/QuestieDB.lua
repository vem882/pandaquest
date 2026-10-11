-- Database/QuestieDB.lua: optional use of the QuestieDB addon's public API.
--
-- QuestieDB (https://github.com/Questie/QuestieDB) is the database Questie itself reads: quests,
-- NPCs, objects and items, with corrections applied. It publishes the global `LibQuestieDB` and the
-- entity shorthands `QuestDB`, `NpcDB`, `ObjectDB` and `ItemDB`. PandaQuest ships its own database,
-- built from Questie's data at one moment in time, so when QuestieDB is installed and enabled it can
-- complete that database from the provider's:
--
--   "off"     PandaQuest's own data only. QuestieDB is not read.
--   "gaps"    (default) an entity PandaQuest does not know is built from QuestieDB.
--   "prefer"  as "gaps", and for entities both know, a field QuestieDB has a value for replaces
--             PandaQuest's. A field QuestieDB leaves empty never erases one PandaQuest has.
--
-- It runs inside DB.Load, before PandaQuest's own faction fixes and wowhead/community overrides, so
-- those still have the last word. It reads by field NAME through the provider's `Get`, and only the
-- names both schemas know, so a field one side renamed is skipped instead of misread. Nothing here is
-- written back: QuestieDB's tables are never modified, and every table a read returns is a copy the
-- provider hands over to the caller.
--
-- Failure never stops PandaQuest's own load: a missing provider, an unsupported contract or an error
-- inside a read leaves the database as it was and says so in /pq status.
local _, ns = ...

local M = {}
ns.QuestieDB = M

local L = ns.L
local Schema = ns.Schema

local type, pairs, ipairs, pcall, tostring, next = type, pairs, ipairs, pcall, tostring, next
local format = string.format
local _G = _G

-- Contract 1 is the floor of the provider's documented range, and the read API used here has not
-- changed since. `RequireContract` accepts any provider whose supported range includes it.
local REQUIRED_CONTRACT = 1
local DEFAULT_MODE = "gaps"
local MAX_ENTITIES_PER_KIND = 200000        -- a bound on the loop, not a number anybody measured

-- PandaQuest table name, provider entity, provider schema module, provider key table, PandaQuest keys.
local KINDS = {
    { table = "quests",  entity = "Quest",  meta = "QuestMeta",  metaKeys = "questKeys",  keys = Schema.questKeys },
    { table = "npcs",    entity = "Npc",    meta = "NpcMeta",    metaKeys = "npcKeys",    keys = Schema.npcKeys },
    { table = "objects", entity = "Object", meta = "ObjectMeta", metaKeys = "objectKeys", keys = Schema.objectKeys },
    { table = "items",   entity = "Item",   meta = "ItemMeta",   metaKeys = "itemKeys",   keys = Schema.itemKeys },
}

local status = { state = "idle", mode = DEFAULT_MODE, detail = nil, added = {}, refreshed = {} }

---------------------------------------------------------------------------
-- The provider
---------------------------------------------------------------------------

--- provider() -> LibQuestieDB | nil, reason ("missing" | "contract" | "shape"), detail
local function provider()
    local lib = _G.LibQuestieDB
    if type(lib) ~= "table" then return nil, "missing" end

    if type(lib.RequireContract) == "function" then
        local called, ok, message = pcall(lib.RequireContract, REQUIRED_CONTRACT)
        if not called then return nil, "contract", tostring(ok) end
        if not ok then return nil, "contract", tostring(message) end
    end

    local meta = lib.Meta
    if type(meta) ~= "table" then return nil, "shape", "Meta" end
    for _, kind in ipairs(KINDS) do
        local entity = lib[kind.entity]
        if type(entity) ~= "table" or type(entity.Get) ~= "function" or type(entity.GetAllIds) ~= "function" then
            return nil, "shape", kind.entity
        end
        local schema = meta[kind.meta]
        if type(schema) ~= "table" or type(schema[kind.metaKeys]) ~= "table" then
            return nil, "shape", kind.meta
        end
    end
    return lib
end

--- IsAvailable() -> bool: QuestieDB is installed, enabled and speaks a contract this reader supports.
function M.IsAvailable()
    return provider() ~= nil
end

--- GetMode() -> "off" | "gaps" | "prefer"
function M.GetMode()
    local PQ = ns.PQ
    local global = PQ and PQ.db and PQ.db.global
    local mode = global and global.questieDB and global.questieDB.mode
    if mode == "off" or mode == "gaps" or mode == "prefer" then return mode end
    return DEFAULT_MODE
end

---------------------------------------------------------------------------
-- Reading
---------------------------------------------------------------------------

-- The provider's conventions are "a number with no value reads as 0" and "an empty table reads as
-- nil, except three quest fields that read {}". PandaQuest rows use nil for "nothing here", so 0 and
-- {} are stored as nil: the same fact, in this database's spelling. `""` is kept: the provider
-- documents it as distinct from nil.
local function clean(value)
    local kind = type(value)
    if kind == "number" then
        if value == 0 then return nil end
        return value
    elseif kind == "table" then
        if next(value) == nil then return nil end
        return value
    elseif kind == "string" or kind == "boolean" then
        return value
    end
    return nil
end

-- Reads every shared field of one entity into `row`. One pcall per entity, not per field: a read that
-- raises abandons that entity and the loop goes on.
local function readInto(entity, id, fields, row)
    local touched = false
    for i = 1, #fields do
        local field = fields[i]
        local value = clean(entity.Get(id, field.name))
        if value ~= nil then
            row[field.index] = value
            touched = true
        end
    end
    return touched
end

local function sharedFields(kind, provided)
    local fields = {}
    for name, index in pairs(kind.keys) do
        if provided[name] ~= nil then fields[#fields + 1] = { name = name, index = index } end
    end
    return fields
end

--- Merge(tables, step) -> nil
-- `tables` is DB.lua's { quests=, npcs=, objects=, items= } of positional rows, `step` the loader's
-- cheap "yield every so often" call. Never raises.
function M.Merge(tables, step)
    status.mode = M.GetMode()
    status.added, status.refreshed, status.detail = {}, {}, nil
    if status.mode == "off" then
        status.state = "off"
        return
    end

    local lib, reason, detail = provider()
    if not lib then
        status.state, status.detail = reason, detail
        return
    end
    status.state = "active"

    for _, kind in ipairs(KINDS) do
        local target = tables and tables[kind.table]
        local entity = lib[kind.entity]
        if type(target) == "table" then
            local fields = sharedFields(kind, lib.Meta[kind.meta][kind.metaKeys])
            local nameIndex = kind.keys.name
            local called, ids = pcall(entity.GetAllIds)
            local added, refreshed = 0, 0
            if called and type(ids) == "table" then
                local count = #ids
                if count > MAX_ENTITIES_PER_KIND then count = MAX_ENTITIES_PER_KIND end
                for i = 1, count do
                    local id = ids[i]
                    if type(id) == "number" then
                        local row = target[id]
                        if row == nil then
                            local fresh = {}
                            local ok, touched = pcall(readInto, entity, id, fields, fresh)
                            -- A row needs a name to be a thing the addon can show; a bare id is not one.
                            if ok and touched and fresh[nameIndex] ~= nil then
                                target[id] = fresh
                                added = added + 1
                            end
                        elseif status.mode == "prefer" then
                            local ok, touched = pcall(readInto, entity, id, fields, row)
                            if ok and touched then refreshed = refreshed + 1 end
                        end
                        if step then step() end
                    end
                end
            end
            status.added[kind.table], status.refreshed[kind.table] = added, refreshed
        end
    end
end

---------------------------------------------------------------------------
-- Reporting
---------------------------------------------------------------------------

local MODE_LABELS = {
    off = "PandaQuest only",
    gaps = "Fill gaps from QuestieDB",
    prefer = "QuestieDB values first",
}

--- GetModeLabel(mode) -> localized text for a mode
function M.GetModeLabel(mode)
    return L[MODE_LABELS[mode] or MODE_LABELS[DEFAULT_MODE]]
end

--- GetStatus() -> { state, mode, detail, added = {quests=..}, refreshed = {..} }
function M.GetStatus()
    return status
end

--- GetStatusLines() -> { string, ... } for /pq status
function M.GetStatusLines()
    local state = status.state
    if state == "active" then
        local added, refreshed = 0, 0
        for _, n in pairs(status.added) do added = added + n end
        for _, n in pairs(status.refreshed) do refreshed = refreshed + n end
        return { format(L["QuestieDB: %s (%d entries added, %d refreshed)"],
            M.GetModeLabel(status.mode), added, refreshed) }
    elseif state == "off" then
        return { format(L["QuestieDB: %s"], L["not used (off)"]) }
    elseif state == "missing" then
        return { format(L["QuestieDB: %s"], L["not installed"]) }
    elseif state == "contract" or state == "shape" then
        return { format(L["QuestieDB: %s"], format(L["cannot be used (%s)"], tostring(status.detail or state))) }
    end
    return { format(L["QuestieDB: %s"], L["not read yet"]) }
end

return M
