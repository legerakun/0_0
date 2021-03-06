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
	ITEM.name = "Chinese Army";
	ITEM.model = "models/clutter/bookchinesearmy.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.4;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.useText = "Прочесть";
	ITEM.business = true;
	ITEM.useSound = "items/flashlight1.wav";
	ITEM.category = "Skill Book"
	ITEM.description = "Это довоенное пособие по тактике проведения диверсионных операций, предназначавшееся для бойцов элитных подразделений НОАК.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		Clockwork.attributes:Progress(player, ATB_SNEAK, 400, true)  
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();