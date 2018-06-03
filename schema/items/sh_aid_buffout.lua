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
	ITEM.name = "Buffout";
	ITEM.model = "models/buffout.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.2;
	ITEM.useText = "Принять";
	ITEM.useSound = "player/footsteps/snow5.wav";
	ITEM.description = "Выглядит как таблетки зелёного цвета с крестообразной насечкой, что позволяет разделить таблетку на две или четыре части и таким образом варьировать дозировку препарата. Предположительно, актопротектор и мощный стимулятор центральной нервной системы.";
	ITEM.baseHeal = 60;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity, invWeight, maxHealth)
	local boost = 10
	local Интеллект = Atomic.special:GetSpecial(player, "I");

    if player:GetSpecial("I") > 1 then
    	boost = boost + (Интеллект * 1)
    end	

    player:BoostAttribute(self.name, ATB_REP, boost, 360)
    player:BoostAttribute(self.name, ATB_BAR, boost, 360)
    player:BoostAttribute(self.name, ATB_LOCK, boost, 360)
end;

ITEM:Register();