--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

local COMMAND = Clockwork.command:New("LvlSet");
COMMAND.tip = "Set Level.";
COMMAND.text = "<string Name> <number Amount>";
COMMAND.access = "s";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local value = tonumber(arguments[2]);

    if (!value) or (value == nil) then
        Clockwork.player:Notify(player, arguments[2].." is not a valid number!");

        return 
    end;

    if (!target) then 
        Clockwork.player:Notify(player, arguments[1].." is not a valid character!");

        return 
    end;

    if (target == nil) then
        Clockwork.player:Notify(player, arguments[1].." is not a valid character!");

        return 
    end;
    target:SetLevel(value, true)
    target:AddSkillPoints(-target:GetSkillPoints() + LevelPoints)
end;

COMMAND:Register();