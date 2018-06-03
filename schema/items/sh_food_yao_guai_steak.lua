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
	ITEM.name = "Yao Guai Steak";
	ITEM.model = "models/fallout 3/steak.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.3;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.useText = "Съесть";
	ITEM.business = true;
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Consumables"
	ITEM.description = "Жаренное мясо Яо-Гая.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:SetHealth(math.Clamp(player:Health() + 20, 0, player:GetMaxHealth()));
		player:SetCharacterData( "hunger", math.Clamp(player:GetCharacterData("hunger") + 50, 0, 100) )
	    player:BoostAttribute(self.name, ATB_MELWEP, 10, 120);
	    player:BoostAttribute(self.name, ATB_GUNS, 10, 120);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();