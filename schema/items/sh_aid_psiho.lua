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
	ITEM.name = "Psiho";
    ITEM.uniqueID = "psiho";
	ITEM.model = "models/pyscho.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.2;
	ITEM.useText = "Вклоть";
	ITEM.useSound = "bot/pain10.wav";
	ITEM.description = "Шприц, обернутый в кожанный ремешок.";
	ITEM.baseHeal = 0;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local boost = 10
	local Интеллект = Atomic.special:GetSpecial(player, "I");
    local instance = Clockwork.item:CreateInstance("Пустой шприц");

        player:GiveItem(instance, true);

    if player:GetSpecial("I") > 1 then
    	boost = boost + (Интеллект * 1)
    end	

    player:GiveItem(instance, true);
    player:BoostAttribute(self.name, ATB_MELWEP, boost, 360);
    player:BoostAttribute(self.name, ATB_UNARM, boost, 360);
    player:BoostAttribute(self.name, ATB_GUNS, boost, 360);
    player:BoostAttribute(self.name, ATB_ENEGWEP, boost, 360);
end;

ITEM:Register();