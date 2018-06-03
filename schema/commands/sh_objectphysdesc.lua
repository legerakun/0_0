--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local COMMAND = Clockwork.command:New("ObjectPhysDesc");
COMMAND.tip = "Set the physical description of an object.";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = player:GetEyeTraceNoCursor().Entity;
	
	if (IsValid(target)) then
		if (target:GetPos():Distance(player:GetShootPos()) <= 192) then
			if (Clockwork.entity:IsPhysicsEntity(target)) then
				if (player:QueryCharacter("key") == target:GetOwnerKey()) then
					player.objectPhysDesc = target;

					Clockwork.datastream:Start(player, "ObjectPhysDesc", target);
				else
					Clockwork.player:Notify(player, "You are not the owner of this entity!");
				end;
			else
				Clockwork.player:Notify(player, "This entity is not a physics entity!");
			end;
		else
			Clockwork.player:Notify(player, "This entity is too far away!");
		end;
	else
		Clockwork.player:Notify(player, "You must look at a valid entity!");
	end;
end;

COMMAND:Register();