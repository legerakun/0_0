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
	ITEM.name = "Spiked Knuckles";
	ITEM.uniqueID = "spikedknuckles";
	ITEM.model = "models/halokiller38/fallout/weapons/melee/spikedknuckles.mdl";
	ITEM.batch = 1;
	ITEM.weight = 1;
	ITEM.access = "T";
	ITEM.business = true;
	ITEM.category = "Melee";
	ITEM.weaponClass = "cw_spikedknuckles";
	ITEM.description = "These have the same design as the brass knuckles, but are made from a darker metal and have spikes attached to each knuckle, enabling the knuckles to puncture and slash open the skin of an opponent.";
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.weaponCopiesItem = true;
	ITEM.attachmentOffsetAngles = Angle(90, 180, 20);
	ITEM.attachmentOffsetVector = Vector(0, 6, 0);
ITEM:Register();