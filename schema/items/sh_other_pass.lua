--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "NCR Passport";
ITEM.uniqueID = "ncr_pass"
ITEM.model = "models/dvd_models/games/dvd_battlefield_2_euro_force.mdl";
ITEM.weight = 0.2;
ITEM.description = "Паспорт гражданина НКР. Паспорт, который указывает на ваше гражданство в Новой Калифорнийской Республике.";
ITEM.isRareSpawn = true;

-- Called when a player attempts to pick up the item.
function ITEM:CanPickup(player, quickUse, itemEntity)
	if player:Alive() then
		return false;
	end;
end;

ITEM:Register();