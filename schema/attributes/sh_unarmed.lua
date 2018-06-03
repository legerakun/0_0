--[[ 
    © 2014 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html
--]]

local ATTRIBUTE = Clockwork.attribute:New();
	ATTRIBUTE.name = "Unarmed";
	ATTRIBUTE.maximum = 100;
	ATTRIBUTE.uniqueID = "unarm";
	ATTRIBUTE.description = "How proficient you are at hand to hand combat.";
	ATTRIBUTE.isOnCharScreen = true;
ATTRIBUTE:Register();
ATB_UNARM = Clockwork.attribute:Register(ATTRIBUTE);