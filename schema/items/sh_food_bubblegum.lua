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
	ITEM.name = "Bubble Gum";
	ITEM.model = "models/fallout 3/gum.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.5;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.useText = "Жевать";
	ITEM.business = true;
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Consumables"
	ITEM.description = "Жёлтая упаковка с жевательной резинкой с надписью Bubble Gum with real Pirate Tattoo!.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:SetHealth(math.Clamp(player:Health() + 1, 0, player:GetMaxHealth()));
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();