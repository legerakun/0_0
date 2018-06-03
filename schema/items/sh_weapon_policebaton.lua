--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Police Baton";
	ITEM.uniqueID = "policebaton";
	ITEM.model = "models/halokiller38/fallout/weapons/melee/baton.mdl";
	ITEM.batch = 1;
	ITEM.weight = 2;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.category = "Melee";
	ITEM.weaponClass = "cw_policebaton";
	ITEM.description = "A weapon meant to keep order, used by long-gone police. Now used by peacekeepers and trouble-makers alike.";
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.weaponCopiesItem = true;
	ITEM.attachmentOffsetAngles = Angle(90, 180, 20);
	ITEM.attachmentOffsetVector = Vector(0, 6, 0);
ITEM:Register();