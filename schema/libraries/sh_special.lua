local Clockwork = Clockwork;

Atomic.special = Clockwork.kernel:NewLibrary("Special");

local PLAYER_META = FindMetaTable("Player");

function Atomic.special:GetNameTable()
	return {
		S = "Сила",
		P = "Восприятие",
		E = "Выносливость",
		C = "Харизма",
		I = "Интеллект",
		A = "Ловкость",
		L = "Удача"
	};
end;

function Atomic.special:GetSpecial(player, stat, boostless)
	if (!Clockwork.config:Get("enable_special"):GetBoolean()) then return 0; end;

	local statName = self:GetNameTable()[stat] or stat;

	local origStat = self:GetSpecialValue(player, statName);
	local boost = nil;

	if (!boostless) then
		boost = player:GetBoost(statName);
	end;

	if (origStat) then
		if (boost) then
			origStat = origStat + boost;
		end;

		return origStat;
	else
		return 1;
	end;
end;

function Atomic.special:GetSpecialValue(player, stat)
	if (!player.atomicSpecial) then player.atomicSpecial = {}; return 0; end;

	return player.atomicSpecial[stat] or 0;
end;

function Atomic.special:GetBoost(player, stat)
	local statName = self:GetNameTable()[stat] or stat;
	local boosts = self:GetBoostValue(player, stat);
	local armor = self:GetBoostValue(player, stat, true);

	return boosts + armor;
end;

function Atomic.special:GetBoostValue(player, stat, bArmor)
	if (bArmor) then
		if (!player.armorBoost) then player.armorBoost = {}; return 0; end;

		return player.armorBoost[stat] or 0;
	else
		if (!player.specialBoost) then player.specialBoost = {}; return 0; end;

		return player.specialBoost[stat] or 0;
	end;
end;

function PLAYER_META:GetSpecial(stat, boostless)
	return Atomic.special:GetSpecial(self, stat, boostless);
end;

function PLAYER_META:GetBoost(stat)
	return Atomic.special:GetBoost(self, stat);
end;

if (CLIENT) then
	Clockwork.datastream:Hook("SetSpecialTable", function(data)
		if (IsValid(data[1]) and data[1]:IsValid()) then
			data[1].atomicSpecial = data[2];
		end;
	end);

	Clockwork.datastream:Hook("SetBoostTable", function(data)
		if (IsValid(data[1]) and data[1]:IsValid()) then
			if (data[3]) then
				data[1].armorBoost = data[2];
			else
				data[1].specialBoost = data[2];
			end;
		end;
	end);
else
	-- !!!DECRYPTED EXTERNAL!!!:
	local PLAYER_META = FindMetaTable("Player");
	Atomic.special.module = Clockwork.kernel:NewLibrary("SpecialModule");

	function Atomic.special.module:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
		if (!lightSpawn) then
			for k, v in pairs(Atomic.special:GetNameTable()) do
				local value = Atomic.special:LoadSpecial(player, v);
				player:SetSpecial(k, value);
			end;
		end;
	end;

	function Atomic.special.module:PlayerCharacterUnloaded(player)
		for k, v in pairs(Atomic.special:GetNameTable()) do
			Atomic.special:SetBoost(player, k, 0);
			Atomic.special:SetBoost(player, k, 0, true);
		end;
	end;

	function Atomic.special.module:OnSpecialChanged(player, statName, oldValue)
		if (statName == "Endurance") then
			Atomic:AdjustPlayerHealth(player);
		end;
	end;
	
	function Atomic.special.module:OnAttributeProgress(player, attribute, amount)
		local intel = player:GetSpecial("Intelligence");
		amount = amount * (1 + (intel * 0.1));
	end;

	Clockwork.plugin:Add("ATOMIC_SPECIAL", Atomic.special.module);

	function Atomic.special:SaveSpecial(player, stat, value)
		if (Clockwork.config:Get("enable_special"):Get()) then
			local newStat = self:GetNameTable()[stat] or stat;
			player:SetCharacterData("s_"..newStat, value);
		end;
	end;

	function Atomic.special:LoadSpecial(player, stat)
		if (Clockwork.config:Get("enable_special"):Get()) then
			local newStat = self:GetNameTable()[stat] or stat;
			return player:GetCharacterData("s_"..newStat) or 1;
		else
			return 0;
		end;
	end;

	function Atomic.special:SetSpecial(player, stat, value, bSave)
		local nameTable = self:GetNameTable();
		local statName = nameTable[stat] or stat;
		local oldValue = player:GetSpecial(statName);

		self:SetSpecialValue(player, statName, value);
		local newValue = player:GetSpecial(statName);
		if (bSave) then
			self:SaveSpecial(player, statName, value);
		end;
		local specialTable = {};
		for k, v in pairs(nameTable) do
			specialTable[v] = player:GetSpecial(v);
		end;
		Clockwork.datastream:Start(player, "SetSpecialTable", {player, specialTable});
		Clockwork.plugin:Call("OnSpecialChanged", player, statName, oldValue);
	end;

	function Atomic.special:SetSpecialValue(player, stat, value)
		player.atomicSpecial = player.atomicSpecial or {};
		player.atomicSpecial[stat] = value;
	end;

	function Atomic.special:SetBoost(player, stat, value, bArmor)
		local nameTable = self:GetNameTable();
		local statName = nameTable[stat] or stat;
		local newValue = player:GetSpecial(statName, true) + value;
		local oldValue = player:GetSpecial(statName);

		self:SetBoostValue(player, statName, value, bArmor);
		local boostTable = {};
		for k, v in pairs(nameTable) do
			boostTable[v] = self:GetBoostValue(player, v, bArmor);
		end;
		Clockwork.datastream:Start(player, "SetBoostTable", {player, boostTable, bArmor});
		Clockwork.plugin:Call("OnSpecialChanged", player, statName, oldValue);
	end;

	function Atomic.special:SetBoostValue(player, stat, value, bArmor)
		if (bArmor) then
			player.armorBoost = player.armorBoost or {};
			player.armorBoost[stat] = value;
		else
			player.specialBoost = player.specialBoost or {};
			player.specialBoost[stat] = value;
		end;
	end;

	function Atomic.special:AddBoost(player, stat, value, bArmor)
		local statName = self:GetNameTable()[stat] or stat;
		local oldBoost = player:GetBoost(statName);
		if (bArmor) then
			self:SetBoost(player, statName, value, bArmor);
		else
			self:SetBoost(player, statName, oldBoost + value);
		end;
	end;

	function PLAYER_META:AddBoost(stat, value, bArmor)
		return Atomic.special:AddBoost(self, stat, value, bArmor);
	end;

	function PLAYER_META:SetSpecial(stat, value)
		return Atomic.special:SetSpecial(self, stat, value);
	end;
end;