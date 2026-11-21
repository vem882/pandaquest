-- PandaQuestDB is loaded by the client before this addon's TOC.
local _, ns = ...
local pack = PandaQuestDBData
if type(pack) == "table" and pack.api == 1 and pack.game == ns.Game.id and type(pack.Data) == "table" then
    ns.Data = pack.Data
    ns.Overrides = pack.Overrides or {}
else
    ns.Log.Error("DB", "PandaQuest Database is incompatible with this game or core version.")
end
