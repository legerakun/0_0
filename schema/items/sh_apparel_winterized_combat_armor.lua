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
	ITEM.name = "Winter Combat Armor";
	ITEM.replacement = "models/humans/group100/fallout/wintercombatarmormale.mdl";
	ITEM.weight = 28;
	ITEM.description = "Утеплённая боевая броня и шлем имеют бело-серую расцветку и большое сопротивление урону.";
	ITEM.baseArmor = 60;
	ITEM.isRareSpawn = true;
	ITEM.specialBoost = {
		S = 2,
		A = -1,
		P = -1
	};
	ITEM:AddData("Rarity", 3, true);
ITEM:Register();