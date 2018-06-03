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
	ITEM.name = "Human Meat";
	ITEM.model = "models/fallout 3/human_meat.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Human Meat";
	ITEM.useText = "Съесть";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Consumables"
	ITEM.isRareItem = true;
	ITEM.description = "Мясо, вырванное из тела человека, пахнет отвратительно.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:SetHealth(math.Clamp(player:Health() + 20, 0, player:GetMaxHealth()));
		player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") + 30, 0, 100) )
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	-- Called when the item entity has spawned.
	function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;
ITEM:Register();