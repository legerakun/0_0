--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("base_heal");
	ITEM.name = "Stimpack";
	ITEM.uniqueID = "stimpack";
	ITEM.batch = 1;
	ITEM.model = "models/stimpak.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Применить";
	ITEM.description = "Медицинский стимулятор, на задней стороне написано 'Военный'"; 
	ITEM.baseHeal = 0;	

	function ITEM:OnUse(player, itemEntity)
		local maxhealth = player:GetMaxHealth();
		local atrmed = Clockwork.attributes:Get(player, "med");
		local healcount = 0;

		if (maxhealth) then
			healcount = maxhealth * (0.3 + (atrmed / 100));

			if (healcount) then
				player:SetHealth(math.Clamp(player:Health() + Atomic:GetHealAmount(player, healcount), 0, player:GetMaxHealth()));
				Clockwork.kernel:PrintLog(LOGTYPE_URGENT, player:Name().." вылечил сам себя на "..Atomic:GetHealAmount(player, self.baseHeal)..", сделав "..player:Health().." ОЗ!");
			end;	
		end;	
	end;
ITEM:Register();