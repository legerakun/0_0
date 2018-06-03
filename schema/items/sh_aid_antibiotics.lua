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
	ITEM.name = "Antibiotics";
	ITEM.uniqueID = "antibiotics";
	ITEM.batch = 1;
	ITEM.model = "models/daytripper.mdl";
	ITEM.weight = 0.2;
	ITEM.useText = "Принять";
	ITEM.description = "Странная баночка с препаратами, на которой написано: Используйте два раза в день";
	ITEM.baseHeal = 40;
ITEM:Register();