--[[
	© 2015 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("PlySetHealth");
COMMAND.tip = "Set a player's health.";
COMMAND.text = "<string Target> <number HP>";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;
COMMAND.access = "a";
COMMAND.alias = {"PlyHealth"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (target) then
		if (target:Alive()) then
			local amount = tonumber(arguments[2]);		
			if (!amount) then
				amount = target:GetMaxHealth();
			else
				amount = math.Clamp(math.Round(amount), 1, target:GetMaxHealth());
			end;

			target:SetHealth(amount);

			if (target != player) then
				if (Clockwork.config:Get("global_echo"):Get()) then
					for k, v in pairs(_player.GetAll()) do
						if (v != player and v != target) then
							v:CPNotify(player:Name().." has set "..target:Name().."'s health to "..amount..".");
						end;
					end;
				end;
				Clockwork.player:Notify(player, target:GetName().." s health to "..health..".");
				Clockwork.player:Notify(target, "Your health was set to "..health.." by "..player:GetName()".");
			else
				if (Clockwork.config:Get("global_echo"):Get()) then
					for k, v in pairs(_player.GetAll()) do
						if (v != player) then
							Clockwork.player:Notify(player, target:GetName().." has set their health to "..amount..".");
						end;
					end;
				end;

				Clockwork.player:Notify(player, target:GetName().." have set your health to "..amount..".");
			end;
		else
			Clockwork.player:Notify(player, target:GetName().." is dead!");
			return
		end;
	else
		Clockwork.player:Notify(player, target:GetName().." is not a valid player!");
		return
	end;
end;

COMMAND:Register();