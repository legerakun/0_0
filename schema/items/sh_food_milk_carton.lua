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
	ITEM.name = "Milk Carton";
	ITEM.uniqueID = "milk_carton";
	ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.25;
	ITEM.access = "T";
	ITEM.useText = "Выпить";
	ITEM.business = true;
	ITEM.category = "Consumables";
	ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav", "npc/barnacle/barnacle_gulp2.wav"};
	ITEM.description = "Коробка с молоком.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:SetHealth(math.Clamp(player:Health() + 5, 0, player:GetMaxHealth()));
		player:SetCharacterData( "thirst", math.Clamp(player:GetCharacterData("thirst") + 50, 0, 100) )
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();