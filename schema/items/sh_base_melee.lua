--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("weapon_base", true);

ITEM.name = "base_melee";
ITEM.uniqueID = "base_melee";
ITEM.useSound = "atomic/placeholder.mp3";

ITEM:AddQueryProxy("color", ITEM.GetRarityColor);
ITEM:AddQueryProxy("weight", "PerceivedWeight");
ITEM:AddQueryProxy("addInvSpace", "AddInvSpace");

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