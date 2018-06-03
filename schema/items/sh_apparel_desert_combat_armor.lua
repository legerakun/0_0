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
	ITEM.name = "Desert Ranger Armor";
	ITEM.replacement = "models/humans/group104/desertranger.mdl";
	ITEM.weight = 38;
	ITEM.description = "Модификация брони, что носят пустынные рейнджеры НКР, но с пустынной расскраской.";
	ITEM.baseArmor = 60;
	ITEM.overlay = "Gasmask";
	ITEM.isRareSpawn = true;
	ITEM.hasGasmask = true;
	ITEM:AddData("Rarity", 2, true);
ITEM:Register();