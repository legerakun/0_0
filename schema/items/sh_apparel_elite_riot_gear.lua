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
	ITEM.name = "Riot Soldier Armor";
	ITEM.replacement = "models/humans/fallout_nv/nikout/lonesomeroad/riotsoldier.mdl";
	ITEM.weight = 28;
	ITEM.description = "Броня, подозрительно похожая на ту, что носят пустынные рейнджеры НКР, но с более усовершенствованной броней.";
	ITEM.baseArmor = 60;
	ITEM.overlay = "Gasmask";
	ITEM.isRareSpawn = true;
	ITEM.specialBoost = {
		S = 2,
		A = 1,
		P = 1,
	};
	ITEM.hasGasmask = true;
	ITEM:AddData("Rarity", 3, true);
ITEM:Register();