--[[ 
    © 2014 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html
--]]

local ATTRIBUTE = Clockwork.attribute:New();
	ATTRIBUTE.name = "Melee Weapons";
	ATTRIBUTE.maximum = 100;
	ATTRIBUTE.uniqueID = "melWep";
	ATTRIBUTE.description = "Affects your ability to use melee weapons.";
	ATTRIBUTE.isOnCharScreen = true;
ATTRIBUTE:Register();
ATB_MELWEP = Clockwork.attribute:Register(ATTRIBUTE);