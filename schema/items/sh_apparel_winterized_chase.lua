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
	ITEM.name = "Warmed Cloak";
	ITEM.replacement = "models/humans/chase/chase.mdl";
	ITEM.weight = 5;
	ITEM.description = "Утеплённый плащ. Имеет бело-серую расцветку с перчатками и шлемом.";
	ITEM.baseArmor = 20;
	ITEM.isRareSpawn = true;
	ITEM.specialBoost = {
		S = 1,
		P = -1
	};
	ITEM:AddData("Rarity", 2, true);
ITEM:Register();