local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("RollChar");
COMMAND.tip = "Генирует число от 0 до 100 и показывает вашу харизму.";
COMMAND.text = "";

function math.biRandom( min, max, bias, accuracy )
    local sum = 0
    for i = 1, accuracy do
        local rand = math.random()
        sum = sum + ( min + ((max - math.abs(min)) * (rand / ((((1/bias) - 2)*(1 - rand))+1))))
    end
    return math.Round(sum / accuracy)
end

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local max = 100
	local gain = 0
	local Харизма = Atomic.special:GetSpecial(player, "C");

	if player:GetSpecial("C") > 1 then
		max = max + (Харизма * 4)
	    gain = gain + (Харизма * 4) 
	end        

	local base = math.random(0, max)
	local roll = base + gain
	roll = math.Clamp( roll, -max, max )
	
	local number = math.Clamp(tonumber(arguments[1]) or 100, 0, 1000000000);
	
	Clockwork.chatBox:AddInRadius(player, "rollchar", "получил "..base.." из "..max..". Харизма: "..Харизма..", прибавка: "..gain.." из-за чего выпало "..roll..".",
		player:GetPos(), Clockwork.config:Get("talk_radius"):Get());
	Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().."получил "..base.." из "..max..". Харизма: "..Харизма..", прибавка: "..gain.." из-за чего выпало "..roll..".");
end;

COMMAND:Register();