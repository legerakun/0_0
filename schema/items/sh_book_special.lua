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
	ITEM.name = "Book SPECIAL!";
	ITEM.uniqueID = "book_special"
	ITEM.cost = 0;
	ITEM.model = "models/clutter/book.mdl";
	ITEM.batch = 1;
	ITEM.weight = 0.1;
	ITEM.access = "T";
	ITEM.useText = "Прочесть";
	ITEM.business = false;
	ITEM.useSound = "items/flashlight1.wav";
	ITEM.category = "Skill Book"
	ITEM.isRareSpawn = true;
	ITEM.description = "Vault-Tec знает, что каждый его клиент особенный, и вы в том числе!";

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local St = Atomic.special:GetSpecial(player, "S");
		local Pe = Atomic.special:GetSpecial(player, "P");
		local En = Atomic.special:GetSpecial(player, "E");
		local Ch = Atomic.special:GetSpecial(player, "C");
		local In = Atomic.special:GetSpecial(player, "I");
		local Ag = Atomic.special:GetSpecial(player, "A");
		if (St > 1) then
			local aboost = 250
			aboost = aboost * St
			Clockwork.attributes:Progress(player, ATB_MELWEP, aboost, true)
		end	
		if (Pe > 1) then
			local aboost = 250
			aboost = aboost * Pe
			Clockwork.attributes:Progress(player, ATB_ENEGWEP, aboost, true)
			Clockwork.attributes:Progress(player, ATB_LOCK, aboost, true)
			Clockwork.attributes:Progress(player, ATB_EXP, aboost, true)
		end
		if (En > 1) then
			local aboost = 250
			aboost = aboost * En
			Clockwork.attributes:Progress(player, ATB_UNARM, aboost, true)
			Clockwork.attributes:Progress(player, ATB_SURV, aboost, true)
		end
		if (Ch > 1) then
			local aboost = 250	
			aboost = aboost * Ch
			Clockwork.attributes:Progress(player, ATB_SPEECH, aboost, true)
			Clockwork.attributes:Progress(player, ATB_BAR, aboost, true)
		end
		if (In > 1) then	
			local aboost = 250
			aboost = aboost * In
			Clockwork.attributes:Progress(player, ATB_SCI, aboost, true)
			Clockwork.attributes:Progress(player, ATB_REP, aboost, true)
			Clockwork.attributes:Progress(player, ATB_MED, aboost, true)
		end
		if (Ag > 1) then
			local aboost = 250
			aboost = aboost * Ag	
			Clockwork.attributes:Progress(player, ATB_SNEAK, aboost, true)
			Clockwork.attributes:Progress(player, ATB_GUNS, aboost, true)
		end
	end;
ITEM:Register();