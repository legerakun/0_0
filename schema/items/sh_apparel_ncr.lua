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
	ITEM.name = "NCR Armor";
	ITEM.group = "group31";
	ITEM.weight = 8;
	ITEM.description = "Броня обычного солдата Новой Калифорнийской Республики.";
	ITEM.baseArmor = 50;
	ITEM.isRareSpawn = true;
	ITEM:AddData("Rarity", 1, true);
ITEM:Register();


