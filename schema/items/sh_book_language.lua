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
	ITEM.name = "Know your Language!";
	ITEM.uniqueID = "book_language"
	ITEM.model = "models/clutter/book.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.2;
	ITEM.access = "T";
	ITEM.useText = "Прочесть";
	ITEM.business = false;
	ITEM.useSound = "items/flashlight1.wav";
	ITEM.category = "Skill Book"
	ITEM.isRareSpawn = true;
	ITEM.description = "Не всех научили разговаривать в нашем замечательном бункере от Vault-Tec, но если у вас есть хотя бы капля интеллекта, то эта книга научит вас говорить!";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:AddPerk("Well Read", true);	
	end;
ITEM:Register();