--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("base_melee");
	ITEM.name = "Lock Pick";
    ITEM.uniqueID = "lock_pick";
    ITEM:AddData("Rarity", 1, true);
    ITEM.model = "models/clutter/eatingknife.mdl";
    ITEM.batch = 1;
    ITEM.weight = 0.1;
    ITEM.business = false;
    ITEM.category = "Item";
	ITEM.description = "Металлический инструмент, приспособленный для взлома замков.";
    ITEM.weaponClass = "cw_lockpick";
ITEM:Register();

-- Called when a player drops the item.
function ITEM:OnDrop(player, position)
    local isNotUnlocking = (action != "unlock");
    
    if (player.isUnlocking) then
        Clockwork.player:Notify(player, "Вы что-то взламываете!");
        
        return false;
    end;
end;