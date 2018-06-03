--[[ 
    © 2014 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html
--]]

local ATTRIBUTE = Clockwork.attribute:New();
	ATTRIBUTE.name = "Speech";
	ATTRIBUTE.maximum = 100;
	ATTRIBUTE.uniqueID = "speech";
	ATTRIBUTE.description = "How effective you are at persuading others, and negotiating.";
	ATTRIBUTE.isOnCharScreen = true;
ATTRIBUTE:Register();
ATB_SPEECH = Clockwork.attribute:Register(ATTRIBUTE);