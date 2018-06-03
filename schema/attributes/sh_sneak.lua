--[[ 
    © 2014 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html
--]]

local ATTRIBUTE = Clockwork.attribute:New();
	ATTRIBUTE.name = "Sneak";
	ATTRIBUTE.maximum = 100;
	ATTRIBUTE.uniqueID = "sneak";
	ATTRIBUTE.description = "How effective you are at remaining undetected and stealing.";
	ATTRIBUTE.isOnCharScreen = true;
ATTRIBUTE:Register();
ATB_SNEAK = Clockwork.attribute:Register(ATTRIBUTE);