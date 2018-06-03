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
	ITEM.name = "Ghost Armor";
	ITEM.replacement = "models/humans/bloocobalt/fo/creatures/ghosts.mdl";
	ITEM.weight = 9;
	ITEM.description = "Странная броня, с противогазом. Пахнет не очень приятно, да и выглядит она подозрительно.";
	ITEM.baseArmor = 25;
	ITEM.overlay = "Gasmask";
	ITEM.isRareSpawn = true;
	ITEM.specialBoost = {
		S = 1,
		P = 2,
		C = -2,
	};
	ITEM.hasGasmask = true;
	ITEM:AddData("Rarity", 4, true);
ITEM:Register();