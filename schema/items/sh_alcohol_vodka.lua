--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("alcohol_base");
	ITEM.name = "Vodka";
	ITEM.model = "models/fallout 3/vodka.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.25;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.description = "Алкогольный напиток, бесцветный водно-спиртовой раствор с характерным вкусом и запахом.";

	-- Called when a player drinks the item.
	function ITEM:OnDrink(player)
		local instance = Clockwork.item:CreateInstance("Bottle of Vodka");

		player:GiveItem(instance, true);
		player:BoostAttribute(self.name, ATB_MELWEP, 10, 340);
	end;
ITEM:Register();