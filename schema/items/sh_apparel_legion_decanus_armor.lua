--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("base_apparel");
	ITEM.name = "Decanus Armor";
	ITEM.weight = 4;
	ITEM.replacement = "models/humans/cl_pm/military/legiondecanus.mdl";
	ITEM.description = "Броня, которые носят деканы легиона. На голове шлем с перьями.";
	ITEM.overlay = "Gasmask";
	ITEM.baseArmor = 75;
	ITEM.isRareSpawn = true;
	ITEM.specialBoost = {
		S = 1,
		E = 1
	};
	ITEM:AddData("Rarity", 2, true);
ITEM:Register();