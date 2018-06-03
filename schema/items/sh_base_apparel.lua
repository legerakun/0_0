--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("clothes_base", true);

ITEM.name = "base_apparel";
ITEM.uniqueID = "base_apparel";
ITEM.useSound = "atomic/placeholder.mp3";
ITEM.isRareSpawn = true;
ITEM.isBaseItem = true;

ITEM:AddData("armor", -1, true);
ITEM:AddData("Rarity", 1, true);
ITEM:AddData("PerceivedWeight", -1, true);
ITEM:AddData("AddInvSpace", 0, true);

ITEM:AddQueryProxy("color", ITEM.GetRarityColor);
ITEM:AddQueryProxy("weight", "PerceivedWeight");
ITEM:AddQueryProxy("addInvSpace", "AddInvSpace");

-- Called when a player changes clothes.
function ITEM:OnChangeClothes(player, bIsWearing)
	if (bIsWearing) then
		local replacement = nil;
		
		if (self.GetReplacement) then
			replacement = self:GetReplacement(player);
		end;	
		
		if (type(replacement) == "string") then
			player:SetModel(replacement);
		elseif (self("replacement")) then
			player:SetModel(self("replacement"));
		elseif (self("group")) then
			player:SetModel("models/humans/"..self("group").."/"..self:GetModelName(player));
		end;

		if (self.specialBoost) then
			for k, v in pairs(self.specialBoost) do
				player:AddBoost(k, v, true);
			end;
		end;

		local armor = self:GetData("Armor");

		if (armor) then
			player:SetArmor(math.Clamp(armor, 0, player:GetMaxArmor()));
		end;

		player:EmitSound("atomic/items/clothing/clothing_equip_0"..math.random(1, 3)..".mp3");
	else
		if (self.specialBoost) then
			for k, v in pairs(self.specialBoost) do
				player:AddBoost(k, 0, true);
			end;
		end;

		Clockwork.player:SetDefaultModel(player);
		Clockwork.player:SetDefaultSkin(player);

		local armor = self:GetData("Armor");

		if (armor) then
			player:SetArmor(math.Clamp(player:Armor() - armor, 0, player:GetMaxArmor()));
		end;

		player:EmitSound("atomic/items/clothing/clothing_remove_0"..math.random(1, 3)..".mp3");
	end;
	
	if (self.overlay) then
		Atomic.overlay:SetEnabled(self.overlay, bIsWearing, player);
	end;

	if (self.OnChangedClothes) then
		self:OnChangedClothes(player, bIsWearing);
	end;

	Clockwork.plugin:Call("OnChangedClothes", player, self, bIsWearing);
end;

-- Called when a player has unequipped the item.
function ITEM:OnPlayerUnequipped(player, extraData)
	if (self("hasGasmask")) then
		local items = player:GetInventory();
		for k, itemList in pairs(items) do
			for k, item in pairs(itemList) do
				if (!item:IsBasedFrom("filter_base")) then
					break;
				elseif (item:GetData("equipped")) then
					hasEquipped = true;
					Clockwork.player:Notify(player, "Вы должны открутить фильтр!");
					return false;
				end;
			end;
		end;
	end;
	
	player:RemoveClothes();
end;

-- A function to get the item's rarity color.
function ITEM:GetRarityColor()
	local rarity = self:GetData("Rarity");
	if (rarity == 1) then
		return Color(248, 248, 255, 255);
	elseif (rarity == 2) then
		return Color(61, 210, 11, 255);
	elseif (rarity == 3) then
		return Color(47, 120, 255, 255);
	elseif (rarity == 4) then
		return Color(145, 50, 200, 255);
	elseif (rarity == 5) then
		return Color(255, 150, 0, 255);
	end;
end;

function ITEM:GetClientSideInfo()
	if (!self:IsInstance()) then return; end;

	local clientSideInfo = "";

	local itemRarity = self:GetData("Rarity");
	if (itemRarity == 1) then
		clientSideInfo = Clockwork.kernel:AddMarkupLine(clientSideInfo, "Обычное качество", self:GetRarityColor());
	elseif (itemRarity == 2) then
		clientSideInfo = Clockwork.kernel:AddMarkupLine(clientSideInfo, "Необычное качество", self:GetRarityColor());
	elseif (itemRarity == 3) then
		clientSideInfo = Clockwork.kernel:AddMarkupLine(clientSideInfo, "Редкое качество", self:GetRarityColor());
	elseif (itemRarity == 4) then
		clientSideInfo = Clockwork.kernel:AddMarkupLine(clientSideInfo, "Уникальное качество", self:GetRarityColor());
	elseif (itemRarity == 5) then
		clientSideInfo = Clockwork.kernel:AddMarkupLine(clientSideInfo, "Легендарное качество", self:GetRarityColor());
	end;

	return (clientSideInfo != "" and clientSideInfo);
end;	

ITEM:Register();