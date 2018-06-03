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
	ITEM.name = "Metal Armor";
	ITEM.replacement = "models/met_armor_02.mdl";
	ITEM.weight = 33;
	ITEM.description = "Эта кустарно изготовленная металлическая броня является металлической лишь отчасти. Основу этой брони составляет кожаный «поддоспешник» — штаны и куртка из плотной кожи. На штанах закреплены слегка покрытые ржавчиной металлические наголенники и набедренники, чуть выше — проклёпанный кожаный пояс, к которому прикреплены пластины, закрывающие внешнюю часть бедра, и «чашечка» для защиты паха.";
	ITEM.baseArmor = 100;
	ITEM.isRareSpawn = true;
	ITEM.hasGasmask = true;
	ITEM:AddData("Rarity", 1, true);
ITEM:Register();