local COMMAND = Clockwork.command:New("PassTake");

COMMAND.tip = "Забирает Паспорт НКР.";
COMMAND.flags = CMD_DEFAULT;

function COMMAND:OnRun(player, arguments)
	local itemTable = player:FindItemByID("ncr_stamp");
	local target = player:GetEyeTraceNoCursor().Entity;

	if (target and target:IsPlayer()) then
		if (target:GetShootPos():Distance(player:GetShootPos()) <= 192) then	
			if (itemTable) then
				local playerName = player:Name();
				local targetName = target:Name();
				local itemTable2 = target:FindItemByID("ncr_pass");
					
				if (!Clockwork.player:DoesRecognise(player, target)) then
					targetName = Clockwork.player:GetUnrecognisedName(target, true);
				end;
					
				if (!Clockwork.player:DoesRecognise(target, player)) then
					playerName = Clockwork.player:GetUnrecognisedName(player, true);
				end;

				target:TakeItem(itemTable2)	
					
				Clockwork.player:Notify(player, "Вы забрали паспорт НКР у "..targetName..".");
				Clockwork.player:Notify(target, ""..playerName.." забрал у вас паспорт НКР.");
			else
				Clockwork.player:Notify(player, "Вам нужнен Штамп НКР, чтобы забрать паспорт!");
			end;
		else
			Clockwork.player:Notify(player, "Игрок слишком далеко!");
		end;
	else
		Clockwork.player:Notify(player, "Вы должны смотреть на игрока!");
	end;
end;

COMMAND:Register();