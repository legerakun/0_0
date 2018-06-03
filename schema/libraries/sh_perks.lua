local Clockwork = Clockwork;

Atomic.perks = Clockwork.kernel:NewLibrary("Perks");

local PLAYER_META = FindMetaTable("Player");
local stored = {};

KARMA_NEUTRAL = 0;
KARMA_GOOD = 1;
KARMA_EVIL = 2;

Clockwork.plugin:AddExtra("/perks/");
Clockwork.plugin:AddExtra("/traits/");

--[[ Set the __index meta function of the class. --]]
local CLASS_TABLE = {__index = CLASS_TABLE};

CLASS_TABLE.name = "Unknown";
CLASS_TABLE.karma = KARMA_NEUTRAL;
CLASS_TABLE.icon = "icon16/error.png";
CLASS_TABLE.description = "An unknown perk.";
CLASS_TABLE.isTrait = false;
CLASS_TABLE.special = {};
CLASS_TABLE.skill = {};
CLASS_TABLE.module = {}

-- A function to register a new attribute.
function CLASS_TABLE:Register()
	return Atomic.perks:Register(self);
end;

-- A function to get a player's perks as a table.
function Atomic.perks:GetPlayerPerks(player)
	local perkTable = string.Explode(",", self:GetPerkString(player));

	for k, v in pairs(perkTable) do
		if (v == "") then
			table.remove(perkTable, k);
		end;
	end;

	return perkTable;
end;

-- A function to get a player's perk string.
function Atomic.perks:GetPerkString(player)
	return player.atomicPerks;
end;

-- A function to check if a player has a certain perk or not.
function Atomic.perks:HasPerk(player, perkName)
	local perkTable = player:GetPerks();

	for k, v in pairs(perkTable) do
		if (v == perkName) then
			return true, k;
		end;
	end;

	return false;
end;

-- A function to return the stored table.
function Atomic.perks:GetStored()
	return stored;
end;

-- A function to find a perk by its id.
function Atomic.perks:FindByID(id)
	return stored[id];
end;

-- A less precise way to find a perk.
function Atomic.perks:FindPerk(perkName)
	for k, v in pairs(stored) do
		if (string.find(string.lower(v.name), string.lower(perkName))) then
			return v;
		end;
	end;
end;

-- A function to get a new perk.
function Atomic.perks:New(name)
	local object = Clockwork.kernel:NewMetaTable(CLASS_TABLE);

	return object;
end;

-- A function to register a new perk and any of its hooks.
function Atomic.perks:Register(perk)	
	Clockwork.plugin:Call("OnPerkRegistered", perk);

	self:MakePlugin(perk);

	stored[perk.name] = perk;
end;

function Atomic.perks:MakePlugin(perk)
	local perkModule = Clockwork.kernel:NewLibrary(perk.name.."_MODULE");

	table.Merge(perkModule, perk.module);

	Clockwork.plugin:Add(perk.name.."_PERK_MODULE", perkModule);
end;

function PLAYER_META:HasPerk(perkName)
	return Atomic.perks:HasPerk(self, perkName);
end;

function PLAYER_META:GetPerks()
	return Atomic.perks:GetPlayerPerks(self);
end;

if (CLIENT) then
	Clockwork.datastream:Hook("SetPerkString", function(data)
		if (IsValid(data[1]) and data[1]:IsValid()) then
			data[1].atomicPerks = data[2];
		end;
	end);
else
	-- !!!DECRYPTED EXTERNAL!!!:
	local PLAYER_META = FindMetaTable("Player");
	Atomic.perks.module = Clockwork.kernel:NewLibrary("PerksModule");

	function Atomic.perks.module:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
		if (!lightSpawn) then
			local perks = Atomic.perks:LoadPerks(player);
			local faction = Clockwork.faction:FindByID(player:GetFaction());
			for k, v in pairs(perks) do
				if (!Atomic.perks:FindByID(v)) then
					table.remove(perks, k);
				end;
			end;
			player:SetPerks(perks);
			if (faction.startingPerks) then
				for k, v in pairs(faction.startingPerks) do
					if (!player:HasPerk(v)) then
						player:AddPerk(v, true);
					end;
				end;
			end;
		end;
	end;

	function Atomic.perks.module:PlayerCharacterUnloaded(player)
		player:SetPerks({});
	end;

	Clockwork.plugin:Add("ATOMIC_PERKS", Atomic.perks.module);

	-- A function to load a players perks from their character data.
	function Atomic.perks:LoadPerks(player)
		local perkString = player:GetCharacterData("Perks");
		if (perkString) then
			local perkTable = string.Explode(",", player:GetCharacterData("Perks"));
			for k, v in pairs(perkTable) do
				if (v == "") then
					table.remove(perkTable, k);
				end;
			end;
			return perkTable;
		else
			return {};
		end;
	end;

	-- A function to save a players perks to their character data.
	function Atomic.perks:SavePerks(player, perkString)
		player:SetCharacterData("Perks", perkString);
	end;

	-- A function to set a player's perks from a table.
	function Atomic.perks:SetPlayerPerks(player, perkTable, bSave)
		local perkString = table.concat(perkTable, ",");
		self:SetPerkString(player, perkString);
		Clockwork.datastream:Start(player, "SetPerkString", {player, perkString});
		if (bSave) then
			self:SavePerks(player, perkString);
		end;
	end;

	function Atomic.perks:SetPerkString(player, perkString)
		player.atomicPerks = perkString;
	end;

	-- A function to remove a perk from a player's table.
	function Atomic.perks:RemovePerk(player, perkName, bSave)
		local perkTable = player:GetPerks();
		local bHas, key = player:HasPerk(perkName);

		if (bHas) then
			table.remove(perkTable, key);
		end;
		player:SetPerks(perkTable, bSave);
		Clockwork.plugin:Call("OnPerkRemoved", player, perkName);
	end;

	-- A function to add a perk to a player's table.
	function Atomic.perks:AddPerk(player, perkName, bSave)
		if (!player:HasPerk(perkName)) then
			local perkTable = player:GetPerks();
			table.insert(perkTable, perkName);
			player:SetPerks(perkTable, bSave);
			Clockwork.plugin:Call("OnPerkAdded", player, perkName);
		end;
	end;

	function PLAYER_META:AddPerk(perkName, bSave)
		return Atomic.perks:AddPerk(self, perkName, bSave);
	end;

	function PLAYER_META:RemovePerk(perkName, bSave)
		return Atomic.perks:RemovePerk(self, perkName, bSave);
	end;

	function PLAYER_META:SetPerks(perkTable, bSave)
		return Atomic.perks:SetPlayerPerks(self, perkTable, bSave);
	end;
end;