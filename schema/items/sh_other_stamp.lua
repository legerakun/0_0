--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "NCR Stamp";
ITEM.uniqueID = "ncr_stamp"
ITEM.model = "models/dvd_models/games/dvd_battlefield_2_special_forces.mdl";
ITEM.weight = 0.2;
ITEM.description = "Штамп для паспорта Новой Калифорнийской Республики. Он удостоверяет паспорта.";
ITEM.isRareSpawn = true;

-- Called when a player attempts to pick up the item.
function ITEM:CanPickup(player, quickUse, itemEntity)
	local faction = player:GetFaction()
	if (faction == FACTION_NCR) or (faction == FACTION_CARAVAN) then
		if (quickUse) then
			if (!player:CanHoldWeight(self.weight)) then
				Clockwork.player:Notify(player, "У вас недостаточно места в инвентаре!");
				
				return false;
			end;
		end;
	else
		Clockwork.player:Notify(player, "Вы не НКР/Красный Караван!");

		return false;	
	end;
end;

function ITEM:OnDrop(player, position) end;

ITEM:Register();