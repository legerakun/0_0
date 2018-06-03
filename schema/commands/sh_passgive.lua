local COMMAND = Clockwork.command:New("PassGive");

COMMAND.tip = "Выдает Паспорт НКР.";
COMMAND.flags = CMD_DEFAULT;

function COMMAND:OnRun(player, arguments)
	local itemTable = player:FindItemByID("ncr_stamp");
	local target = player:GetEyeTraceNoCursor().Entity;

	if (target and target:IsPlayer()) then
		if (target:GetShootPos():Distance(player:GetShootPos()) <= 192) then		
			if (itemTable) then
				local playerName = player:Name();
				local targetName = target:Name();
					
				if (!Clockwork.player:DoesRecognise(player, target)) then
					targetName = Clockwork.player:GetUnrecognisedName(target, true);
				end;
					
				if (!Clockwork.player:DoesRecognise(target, player)) then
					playerName = Clockwork.player:GetUnrecognisedName(player, true);
				end;
					
				target:GiveItem("ncr_pass", true);	
					
				Clockwork.player:Notify(player, "Вы дали паспорт НКР "..targetName..".");
				Clockwork.player:Notify(target, ""..playerName.." дал вам паспорт НКР.");
			else
				Clockwork.player:Notify(player, "Вам нужнен Штамп НКР, чтобы выдать паспорт!");
			end;	
		else
			Clockwork.player:Notify(player, "Игрок слишком далеко!");
		end;
	else
		Clockwork.player:Notify(player, "Вы должны смотреть на игрока!");
	end;
end;

COMMAND:Register();