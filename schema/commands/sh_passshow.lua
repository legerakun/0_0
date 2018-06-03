local COMMAND = Clockwork.command:New("PassShow");

COMMAND.tip = "Показывает Паспорт НКР.";
COMMAND.flags = CMD_DEFAULT;

function COMMAND:OnRun(player, arguments)
	local itemTable = player:FindItemByID("ncr_pass");
	
	if (itemTable) then
		Clockwork.chatBox:AddInRadius(player, "ncrpass", "показал свой паспорт НКР.", player:GetPos(), Clockwork.config:Get("talk_radius"):Get());
	else
		Clockwork.player:Notify(player, "У вас нету паспорта НКР!");	
	end;	
end;

COMMAND:Register();