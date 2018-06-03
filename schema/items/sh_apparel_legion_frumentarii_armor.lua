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
	ITEM.name = "Frumentarii Armor";
	ITEM.weight = 5;
	ITEM.replacement = "models/humans/cl_pm/military/frumentarii.mdl";
	ITEM.description = "Броня, которую носят фрументарии легиона. На голове шлем из шкуры волка.";
	ITEM.overlay = "Gasmask";
	ITEM.baseArmor = 100;
	ITEM.isRareSpawn = true;
	ITEM.specialBoost = {
		S = 2,
		E = 2,
		C = 2,
	};
	ITEM:AddData("Rarity", 3, true);
ITEM:Register();