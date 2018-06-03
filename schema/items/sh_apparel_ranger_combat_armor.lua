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
	ITEM.name = "Ranger Combat Armor";
	ITEM.replacement = "models/humans/group104/rangercombatarmor.mdl";
	ITEM.weight = 38;
	ITEM.description = "Пуленепробиваемый жилет, специальный воротник, патронный пояс, нарукавники для защиты предплечий и прекрасный плащ - это и есть Боевая Броня Рейнджера НКР.";
	ITEM.baseArmor = 60;
	ITEM.overlay = "Gasmask";
	ITEM.isRareSpawn = true;
	ITEM.hasGasmask = true;
	ITEM:AddData("Rarity", 1, true);
ITEM:Register();