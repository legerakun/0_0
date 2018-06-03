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
	ITEM.name = "Wasteland Guide";
	ITEM.model = "models/wastelandguide.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.1;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.useText = "Прочесть";
	ITEM.business = true;
	ITEM.useSound = "items/flashlight1.wav";
	ITEM.category = "Skill Magazine"
	ITEM.description = "Послевоенное рукописное издание, посвящённое различным вопросам выживания на пустошах.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local hasPerk = player:HasPerk("Retention");

		if hasPerk then
		    player:BoostAttribute(self.name, ATB_SURV, 10, 360);
		else
		    player:BoostAttribute(self.name, ATB_SURV, 10, 120);
		end      
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();