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
	ITEM.name = "Wastelander Clothing";
	ITEM.uniqueID = "apparel_clothes04"
	ITEM.group = "group40";
	ITEM.weight = 1,5;
	ITEM.description = "Одежда обычного поселенца пустоши. Красная кофта и темно-синие штаны.";
	ITEM.baseArmor = 10;
	ITEM.isRareSpawn = false;
	ITEM:AddData("Rarity", 1, true);
ITEM:Register();


