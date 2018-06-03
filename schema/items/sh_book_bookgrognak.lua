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
	ITEM.name = "Grognak";
	ITEM.model = "models/clutter/bookgrognak.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.4;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.useText = "Прочесть";
	ITEM.business = true;
	ITEM.useSound = "items/flashlight1.wav";
	ITEM.category = "Skill Book"
	ITEM.description = "Комикс, о приключениях вымышленного персонажа супергероя — Грогнака-варвара, созданный компанией «Хьюбрис Комикс».";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		Clockwork.attributes:Progress(player, ATB_MELWEP, 400, true)  
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();