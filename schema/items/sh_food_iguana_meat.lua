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
	ITEM.name = "Iguana Meat";
	ITEM.model = "models/fallout 3/animal_bits.mdl";
	ITEM.batch = 1;
	ITEM.uniqueID = "iguana_meat";
	ITEM.weight = 0.35;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.useText = "Съесть";
	ITEM.business = true;
	ITEM.useSound = {"ambient/animal/rodent_scratch_short_1.wav", "ambient/animal/rodent_scratch_short_2.wav"};
	ITEM.category = "Consumables"
	ITEM.description = "Кусочки мясо игуаны.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:SetHealth(math.Clamp(player:Health() + 5, 0, player:GetMaxHealth()));
		player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") + 10, 0, 100) )
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();