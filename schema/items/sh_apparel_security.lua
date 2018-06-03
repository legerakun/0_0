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
	ITEM.name = "Security Armor";
	ITEM.group = "group39";
	ITEM.weight = 18;
	ITEM.description = "Броня представляет собой стандартный комбинезон Убежища 101, поверх которого надет бронежилет. Справа в верхней части бронежилета ясно видно маленькое оконечное устройство радиостанции, предназначенной для связи охранников между собой. Кроме того, к броне прилагаются чёрные перчатки с металлизироваными крагами для блокирования ударов. Шлем брони стандартный, с защитным стеклом.";
	ITEM.baseArmor = 50;
	ITEM.isRareSpawn = true;
	ITEM.genderMale = true;
	ITEM.specialBoost = {
		A = 2,
	};
	ITEM:AddData("Rarity", 1, true);
ITEM:Register();