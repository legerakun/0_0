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
	ITEM.name = "Armor of NCR Ranger";
	ITEM.group = "group71";
	ITEM.weight = 14;
	ITEM.description = "Представляет собой куртку из плотной ткани, штаны из такого же материала цвета хаки, дублёные кожаные наплечники, специальный воротник, которым в случае пылевой бури можно прикрыть лицо.";
	ITEM.baseArmor = 70;
	ITEM.isRareSpawn = true;
	ITEM.genderMale = true;
	ITEM:AddData("Rarity", 2, true);
ITEM:Register();