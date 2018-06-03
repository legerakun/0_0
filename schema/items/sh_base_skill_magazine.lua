--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New();
	ITEM.name = "base_skill_magazine";
	ITEM.worth = 1;
	ITEM.uniqueID = "base_skill_magazine";
	ITEM.model = "models/props_junk/garbage_newspaper001a.mdl";
	ITEM.color = Color(225, 255, 25, 255);
	ITEM.weight = 0.1;
	ITEM.useSound = "items/flashlight1.wav";
	ITEM.category = "Skill Magazine";
	ITEM.isRareSpawn = true;
	ITEM.isBaseItem = true;
	ITEM.description = "Журнал, в котором написано как стать лучше в чем-то.";

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();