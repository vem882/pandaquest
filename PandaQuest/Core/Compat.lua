-- Core/Compat.lua: guarded wrappers around APIs that moved to C_* namespaces in 5.5.4
-- (docs/02 section B8: the old globals IsAddOnLoaded/GetAddOnMetadata/GetItemInfo... are nil).
-- Every wrapper checks that the underlying function exists before calling it.
local _, ns = ...

local Compat = {}
ns.Compat = Compat

local _G = _G

-- IsAddOnLoaded(name) -> bool (first return value of C_AddOns.IsAddOnLoaded)
function Compat.IsAddOnLoaded(name)
    if C_AddOns and C_AddOns.IsAddOnLoaded then
        local loaded = C_AddOns.IsAddOnLoaded(name)
        return loaded and true or false
    elseif _G.IsAddOnLoaded then
        local loaded = _G.IsAddOnLoaded(name)
        return loaded and true or false
    end
    return false
end

function Compat.GetAddOnMetadata(name, field)
    if C_AddOns and C_AddOns.GetAddOnMetadata then
        return C_AddOns.GetAddOnMetadata(name, field)
    elseif _G.GetAddOnMetadata then
        return _G.GetAddOnMetadata(name, field)
    end
    return nil
end

-- GetItemInfo(itemIDOrLink) -> name, link, quality, itemLevel, requiredLevel, class, subClass, ... (C_Item order)
function Compat.GetItemInfo(item)
    if C_Item and C_Item.GetItemInfo then
        return C_Item.GetItemInfo(item)
    elseif _G.GetItemInfo then
        return _G.GetItemInfo(item)
    end
    return nil
end

function Compat.GetItemCount(item, includeBank, includeUses)
    if C_Item and C_Item.GetItemCount then
        return C_Item.GetItemCount(item, includeBank, includeUses) or 0
    elseif _G.GetItemCount then
        return _G.GetItemCount(item, includeBank, includeUses) or 0
    end
    return 0
end

function Compat.GetContainerNumSlots(bag)
    if C_Container and C_Container.GetContainerNumSlots then
        return C_Container.GetContainerNumSlots(bag) or 0
    elseif _G.GetContainerNumSlots then
        return _G.GetContainerNumSlots(bag) or 0
    end
    return 0
end

-- GetContainerItemInfo(bag, slot) -> info table { iconFileID, stackCount, isLocked, quality, itemID, hyperlink, ... }|nil
-- The legacy global returned positional values; they are normalised into the C_Container table shape.
function Compat.GetContainerItemInfo(bag, slot)
    if C_Container and C_Container.GetContainerItemInfo then
        return C_Container.GetContainerItemInfo(bag, slot)
    elseif _G.GetContainerItemInfo then
        local icon, count, locked, quality, readable, lootable, link, isFiltered, noValue, itemID = _G.GetContainerItemInfo(bag, slot)
        if not icon then return nil end
        return { iconFileID = icon, stackCount = count, isLocked = locked, quality = quality, isReadable = readable,
                 hasLoot = lootable, hyperlink = link, isFiltered = isFiltered, hasNoValue = noValue, itemID = itemID }
    end
    return nil
end

function Compat.IsSpellKnown(spellID, isPet)
    if C_SpellBook and C_SpellBook.IsSpellKnown then
        return C_SpellBook.IsSpellKnown(spellID, isPet) and true or false
    elseif _G.IsSpellKnown then
        return _G.IsSpellKnown(spellID, isPet) and true or false
    elseif _G.IsPlayerSpell then
        return _G.IsPlayerSpell(spellID) and true or false
    end
    return false
end

-- Addon convention (SexyMap and friends); Blizzard does not define it.
function Compat.GetMinimapShape()
    if _G.GetMinimapShape then
        local shape = _G.GetMinimapShape()
        if type(shape) == "string" then return shape end
    end
    return "ROUND"
end

-- Player facing in radians; nil when unavailable (e.g. while the camera is unavailable).
function Compat.GetPlayerFacing()
    if _G.GetPlayerFacing then
        local ok, facing = pcall(_G.GetPlayerFacing)
        if ok and type(facing) == "number" then return facing end
    end
    return nil
end

-- UnitSpeed() -> currentSpeed, runSpeed, flightSpeed, swimSpeed (yards/s); zeros when unavailable.
function Compat.UnitSpeed(unit)
    if _G.GetUnitSpeed then
        local current, run, flight, swim = _G.GetUnitSpeed(unit or "player")
        return current or 0, run or ns.Const.RUN_SPEED, flight or 0, swim or 0
    end
    return 0, ns.Const.RUN_SPEED, 0, 0
end

function Compat.IsMounted()
    if _G.IsMounted then
        return _G.IsMounted() and true or false
    end
    return false
end

function Compat.IsFlying()
    if _G.IsFlying then
        return _G.IsFlying() and true or false
    end
    return false
end

function Compat.InCombatLockdown()
    if _G.InCombatLockdown then
        return _G.InCombatLockdown() and true or false
    end
    return false
end

function Compat.IsInPetBattle()
    if C_PetBattles and C_PetBattles.IsInBattle then
        return C_PetBattles.IsInBattle() and true or false
    end
    return false
end

function Compat.UnitOnTaxi(unit)
    if _G.UnitOnTaxi then
        return _G.UnitOnTaxi(unit or "player") and true or false
    end
    return false
end

-- High resolution millisecond clock for time budgets (falls back to GetTime()).
function Compat.NowMs()
    if _G.debugprofilestop then
        return _G.debugprofilestop()
    end
    return (GetTime and GetTime() or 0) * 1000
end
