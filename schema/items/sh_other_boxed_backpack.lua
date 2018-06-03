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
	ITEM.name = "Bag";
	ITEM.model = "models/props_junk/cardboard_box004a.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.2;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.useText = "Open";
	ITEM.business = true;
	ITEM.category = "Storage"
	ITEM.description = "Сумочка, откройте ее, чтобы показать ее содержимое.";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		if (player:HasItemByID("backpack") and table.Count(player:GetItemsByID("backpack")) >= 1) then
			Clockwork.player:Notify(player, "Вы можете носить только одну сумку!");
			
			return false;
		end;

		local instance = Clockwork.item:CreateInstance("backpack");
		
		player:GiveItem(instance, true);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();