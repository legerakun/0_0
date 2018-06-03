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
	ITEM.name = "Boomers Armor";
	ITEM.group = "group70";
	ITEM.weight = 1;
	ITEM.description = "Выглядит как комбинезон Убежища 34 с одетой поверх кожаной курткой типа «авиатор». Костюм дополняют амулет и множество нашивок, символизирующих награды.";
	ITEM.baseArmor = 20;
	ITEM.isRareSpawn = true;
	ITEM.genderMale = true;
	ITEM:AddData("Rarity", 3, true);
ITEM:Register();