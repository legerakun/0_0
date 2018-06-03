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
	ITEM.name = "Legion-Recruit Armor";
	ITEM.weight = 3;
	ITEM.replacement = "models/humans/cl_pm/military/legionrecruit.mdl";
	ITEM.description = "Броня, которые носят легионеры новобранцы. Лицо закрыто маской с очками.";
	ITEM.overlay = "Gasmask";
	ITEM.baseArmor = 50;
	ITEM.isRareSpawn = true;
	ITEM:AddData("Rarity", 1, true);
ITEM:Register();