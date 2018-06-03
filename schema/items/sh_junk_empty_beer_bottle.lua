--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("base_junk");
	ITEM.name = "Bottle of Beer";
	ITEM.worth = 1;
	ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl";
	ITEM.weight = 0.1
	ITEM.description = "Пустая стеклянная бутылка, пахнет пивом.";
ITEM:Register();