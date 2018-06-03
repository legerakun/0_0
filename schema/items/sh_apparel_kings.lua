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
	ITEM.name = "Kings Jacket";
	ITEM.group = "group88";
	ITEM.weight = 1;
	ITEM.description = "Одежда, свойственная для банды 'Королей' во Фрисайде.";
	ITEM.baseArmor = 20;
	ITEM.isRareSpawn = true;
	ITEM.genderMale = true;
	ITEM:AddData("Rarity", 3, true);
ITEM:Register();