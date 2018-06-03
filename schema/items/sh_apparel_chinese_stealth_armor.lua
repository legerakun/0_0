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
	ITEM.name = "Chinese Stealth Armor";
	ITEM.replacement = "models/humans/ninja/chinese_m_npc.mdl";
	ITEM.weight = 20;
	ITEM.description = "Китайская стелс-броня (также известная, как маскировочная броня 'Черный Призрак'. Облегающий тело комбинезон, оборудованный уникальной камуфляжной системой";
	ITEM.baseArmor = 50;
	ITEM.isRareSpawn = true;
	ITEM.specialBoost = {
		A = 3,
	};
	ITEM:AddData("Rarity", 4, true);
ITEM:Register();