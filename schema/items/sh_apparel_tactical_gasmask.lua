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
	ITEM.name = "Tactical Gasmask";
	ITEM.uniqueID = "tactical_gasmask";
	ITEM.weight = 4;
	ITEM.replacement = "models/tactical_rebel.mdl";
	ITEM.description = "Черный костюм, с прибором для очищения воздуха.";
	ITEM.overlay = "Gasmask";
	ITEM.baseArmor = 50;
	ITEM.isRareSpawn = true;
	ITEM.specialBoost = {
		E = 2
	};
	ITEM.hasGasmask = true;
	ITEM:AddData("Rarity", 2, true);
ITEM:Register();