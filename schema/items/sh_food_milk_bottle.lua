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
	ITEM.name = "Milk Bottle";
	ITEM.uniqueID = "milk_bottle";
	ITEM.model = "models/humans/milk.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.35;
	ITEM.access = "T";
	ITEM.useText = "Выпить";
	ITEM.business = true;
	ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav", "npc/barnacle/barnacle_gulp2.wav"};
	ITEM.category = "Consumables";
	ITEM.description = "Бутылка с молоком.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:SetHealth(math.Clamp(player:Health() + 5, 0, player:GetMaxHealth()));		
		player:SetCharacterData( "thirst", math.Clamp(player:GetCharacterData("thirst") + 45, 0, 100) )
		player:SetCharacterData( "rads", math.Clamp(player:GetCharacterData("hunger") + 5, 0, 1000) )
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();