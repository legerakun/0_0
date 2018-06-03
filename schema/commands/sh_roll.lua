local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("Roll");
COMMAND.tip = "Генирует число от 0 до 100.";
COMMAND.text = "";

local config = {}
config.weapons = {
	["cw_woodaxe"] = 5,
	["cw_sledgehammer"] = 5,
	["cw_shovel"] = 5,
	["cw_katana"] = 5,
	["cw_crowbar"] = 5,
    ["weapon_9mmpistol"] = 7,
	["weapon_10mmpistol"] = 7,
    ["weapon_policepistol"] = 7,
    ["weapon_huntingrevolver"] = 7,
    ["weapon_chinesepistol"] = 7,
    ["weapon_44revolver"] = 7,
    ["weapon_32pistol"] = 7,
    ["weapon_45autopistol"] = 9,
    ["weapon_rangersequoia"] = 10,
    ["weapon_357revolverlonghdcyl"] = 10,
    ["weapon_9mmpistolmaria"] = 10,
    ["weapon_45smg"] = 10,
    ["weapon_9mmsmgdrum"] = 10,
    ["weapon_127mmpistolsil"] = 10,
    ["weapon_22mmpistolsil"] = 10,
    ["weapon_battlerifle"] = 10,
    ["weapon_chineseassaultrifle"] = 10,
    ["weapon_huntingrifleext"] = 10,
    ["weapon_r91assaultrifle"] = 10,
    ["weapon_railwayrifle"] = 10,
    ["weapon_127mmsmgsil"] = 11,
    ["weapon_huntingshotgun"] = 13,
    ["weapon_combatshotgun"] = 13,
    ["weapon_laserpistol"] = 13,
    ["weapon_plasmapistol"] = 13,
    ["weapon_serviceriflereflex"] = 14,
    ["weapon_assaultcarbinesil"] = 14,
    ["weapon_laserpdw"] = 14,
    ["weapon_laserrifle"] = 15,
    ["weapon_plasmarifle"] = 15,
    ["weapon_antimaterielrifle"] = 15,
    ["weapon_gatlinglaser"] = 18,
    ["weapon_sniperriflesil"] = 18,
}

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
	local Удача = Atomic.special:GetSpecial(player, "L");

	if player:GetFaction() == FACTION_LEGION then
		max = max + 18
		gain = gain + 18
	elseif player:GetFaction() == FACTION_RAIDER then
	    max = max + 10
	    gain = gain + 10	
	elseif player:GetFaction() == FACTION_NCR then
	    max = max + 15
	    gain = gain + 15	    
	elseif player:GetFaction() == FACTION_BROTHERHOOD or player:GetFaction() == FACTION_ENCLAVE then
		max = max + 20
		gain = gain + 20
	end

	if IsValid(player:GetActiveWeapon()) then
		for weapon, amount in pairs(config.weapons) do
			if player:GetActiveWeapon():GetClass() == weapon then
				gain = gain + math.random(1,amount)
		
				break
		  	end	
		end
	end 


	if player:SteamID() == "STEAM_0:0:70897779" then
		gain = gain + 20
		max = max + 20
	end

	if player:GetSpecial("L") > 1 then
		max = max + (Удача * 2)
	    gain = gain + (Удача * 2)  
	end        

	local base = math.random(0, max)
	local roll = base + gain
	roll = math.Clamp( roll, -max, max )
	
	local number = math.Clamp(tonumber(arguments[1]) or 100, 0, 1000000000);
	
	Clockwork.chatBox:AddInRadius(player, "roll", "получил "..base.." из "..max.." с усилением "..gain.." из-за чего выпало "..roll..".",
		player:GetPos(), Clockwork.config:Get("talk_radius"):Get());
	Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().."получил "..base.." из "..max.." с усилением "..gain.." из-за чего выпало "..roll..".");
end;

COMMAND:Register();