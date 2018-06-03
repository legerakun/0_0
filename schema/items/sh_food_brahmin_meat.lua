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
	ITEM.name = "Brahmin Meat";
	ITEM.uniqueID = "brahmin_meat"
	ITEM.model = "models/fallout 3/meat.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.3;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.useText = "Съесть";
	ITEM.business = true;
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Consumables"
	ITEM.description = "Сырое мясо брамина, может быть взято с трупа брамина.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:SetHealth(math.Clamp(player:Health() + 5, 0, player:GetMaxHealth()));
		player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") + 18, 0, 100) )
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();