--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Salary";
ITEM.uniqueID = "salary";
ITEM.model = "models/fallout_props_2/healingpowder.mdl";
ITEM.weight = 0.5;
ITEM.cost = 100;
ITEM.useText = "Открыть";
ITEM.description = "Мешочек с крышками, кто знает сколько вы сможете найти?";
ITEM.isRareSpawn = true;

-- Called when a player attempts to pick up the item.
function ITEM:CanPickup(player, quickUse, itemEntity)
	if (quickUse) then
		if (!player:CanHoldWeight(self.weight)) then
			Clockwork.player:Notify(player, "У вас недостаточно места в инвентаре!");
			
			return false;
		end;
	end;
end;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local cash = 50
	local gain = 0
	local Харизма = Atomic.special:GetSpecial(player, "C")

	if player:GetSpecial("C") > 1 then
		cash = cash + 0
		gain = gain + (Харизма * 5)
	end
		
	if (player:GetFaction() == FACTION_CARAVAN) then
		Clockwork.player:Notify(player, "Вы не можете открыть этот мешочек!");
		
		return false;
	else
		Clockwork.player:GiveCash(player, cash + gain, "Открыл мешочек");
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();