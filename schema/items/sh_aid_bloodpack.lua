--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("base_heal");
	ITEM.name = "Blood Pack";
	ITEM.uniqueID = "bloodpack";
	ITEM.batch = 0.3;
	ITEM.model = "models/bloodbag.mdl";
	ITEM.weight = 0.2;
	ITEM.useText = "Принять";
	ITEM.description = "Медицинский пакет с кровью, предназначенной для переливания.";
	ITEM.baseHeal = 50;
ITEM:Register();