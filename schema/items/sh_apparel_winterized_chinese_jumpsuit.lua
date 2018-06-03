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
	ITEM.name = "Chinise Army Jacket";
	ITEM.replacement = "models/humans/chinesesoldier/chinesesoldier_npc.mdl";
	ITEM.weight = 3;
	ITEM.description = "Данный комбинезон — зимний вариант китайской униформы. Зимний серый камуфляж с перчатками и шапкой.";
	ITEM.baseArmor = 40;
	ITEM.isRareSpawn = true;
	ITEM.specialBoost = {
		S = 1,
		A = 1,
		P = -1
	};
	ITEM:AddData("Rarity", 2, true);
ITEM:Register();