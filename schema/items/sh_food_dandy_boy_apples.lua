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
	ITEM.name = "Dandy Boy Apples";
	ITEM.uniqueID = "dandy_apples";
	ITEM.model = "models/fallout 3/dandy_apples.mdl";
	ITEM.batch = 1;
	ITEM.foodRads = 50;
	ITEM.weight = 0.5;
	ITEM.access = "T";
	ITEM.useText = "Съесть";
	ITEM.business = true;
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Consumables"
	ITEM.description = "Продукт довоенной компании «Dandy Boy». Продукт упакован в красный картонный коробок с надписью жёлтыми буквами: «dandy boy APPLES».";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:SetHealth(math.Clamp(player:Health() + 5, 0, player:GetMaxHealth()));
		player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") + 30, 0, 100) )
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();