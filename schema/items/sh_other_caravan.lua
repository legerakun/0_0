--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Caravan Pass";
ITEM.uniqueID = "caravan_pass"
ITEM.model = "models/dvd_models/games/dvd_battlefield_2142.mdl";
ITEM.weight = 0.2;
ITEM.description = "Пропуск Красного Каравана.";
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

function ITEM:OnDrop(player, position) end;

ITEM:Register();