--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("base_apparel");
	ITEM.name = "Kevlar";
	ITEM.uniqueID = "kevlar"
	ITEM.weight = 5;
	ITEM.description = "Кевларовый бронижилет, который одевается под одежду.";
	ITEM.baseArmor = 50;
	ITEM:AddData("Rarity", 1, true);

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	if (SERVER) then
		return player:GetDefaultModel();
	else
		return player:GetModel();
	end;
end;
	
ITEM:Register();


