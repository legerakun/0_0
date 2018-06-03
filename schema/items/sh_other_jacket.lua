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
	ITEM.name = "Packet";
	ITEM.model = "models/props_junk/garbage_bag001a.mdl";
	ITEM.weight = 0.1;
	ITEM.category = "Storage";
	ITEM.isRareItem = true;
	ITEM.description = "Пакет, кажется в нем можно что-то нести.";
	ITEM.addInvSpace = 1;

	-- Called when the item's drop entity should be created.
	function ITEM:OnCreateDropEntity(player, position)
		return Clockwork.entity:CreateItem(player, "boxed_jacket", position);
	end;

	-- Called when a player attempts to take the item from storage.
	function ITEM:CanTakeStorage(player, storageTable)
		local target = Clockwork.entity:GetPlayer(storageTable.entity);
		
		if (target) then
			if (target:GetInventoryWeight() > (target:GetMaxWeight() - self("addInvSpace"))) then
				return false;
			end;
		end;
		
		if (player:HasItem(self.uniqueID) and player:HasItem(self.uniqueID) >= 1) then
			return false;
		end;
	end;

	-- Called when a player attempts to pick up the item.
	function ITEM:CanPickup(player, quickUse, itemEntity)
		return "boxed_jacket";
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position)
		if (player:GetInventoryWeight() > (player:GetMaxWeight() - self("addInvSpace"))) then
			Clockwork.player:Notify(player, "Вы не можете это выбросить, пока вы носите это!");
			
			return false;
		end;
	end;
ITEM:Register();