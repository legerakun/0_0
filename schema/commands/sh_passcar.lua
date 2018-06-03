local COMMAND = Clockwork.command:New("PassCar");

COMMAND.tip = "Показывает пропуск Каравана.";
COMMAND.flags = CMD_DEFAULT;

function COMMAND:OnRun(player, arguments)
	local itemTable = player:FindItemByID("caravan_pass");
	
	if (itemTable) then
		Clockwork.chatBox:AddInRadius(player, "ncrpass", "показал свой пропуск Красного Каравана.", player:GetPos(), Clockwork.config:Get("talk_radius"):Get());
	else
		Clockwork.player:Notify(player, "У вас нету пропуска Каравана!");	
	end;	
end;

COMMAND:Register();