--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

Clockwork.config:Add("intro_text_small", "War... War never changes..", true);
Clockwork.config:Add("intro_text_big", "Wasteland, 2280.", true);

Clockwork.config:Add("can_anon", true, true);
Clockwork.config:Add("enable_special", true, true);
Clockwork.config:Add("show_boosts", false, true);
Clockwork.config:Add("show_menu_blur", true, true);
Clockwork.config:Add("enable_slow_death", true, true);
Clockwork.config:Add("medical_effect", 50, true);
Clockwork.config:Add("agility_effect", 0.75, true);
Clockwork.config:Add("condition_decrease_scale", 1);
Clockwork.config:Add("default_special_points", 21, true);

Clockwork.config:Get("enable_gravgun_punt"):Set(false);
Clockwork.config:Get("scale_prop_cost"):Set(0);
Clockwork.config:Get("default_cash"):Set(20);

Clockwork.hint:Add("VaultG", "Оставайтесь с нами!");
Clockwork.hint:Add("Staff", "Админы здесь, чтобы помочь вам, уважайте их.");
Clockwork.hint:Add("Grammar", "Старайтесь писать грамотно, и не используйте смайлики.");
Clockwork.hint:Add("Healing", "Вы можете лечить, используя комманду 'Give' в вашем инвентаре.");
Clockwork.hint:Add("Wasteland", "Скучно и одиноко на пустошах? Путешествуйте с другом.");
Clockwork.hint:Add("Metagaming", "Metagaming- это когда вы используете информацию, полученную не в ic.");
Clockwork.hint:Add("Development", "Развивайте вашего персонажа, придумайте ему историю.");
Clockwork.hint:Add("Powergaming", "Powergaming- это когда вы делаете то, что вам не под силу.");
Clockwork.hint:Add("F3 Hotkey", "Нажмите F3, когда смотрите на персонажа, чтобы связать его.");
Clockwork.hint:Add("F4 Hotkey", "Нажмите F4, когда смотрите на связанного персонажа, чтобы обыскать его.");
Clockwork.hint:Add("Intelligence", "Всем необходим интеллект, причем не только для медицины и электроники.");
Clockwork.hint:Add("Intelligence2", "Если у вас низкий интеллект, даже не думайте, что у вас получится говорить грамотно.");
Clockwork.hint:Add("Books Magazins", "На просторах пустоши вы можете найти множество книг и журналов.");

Clockwork.kernel:AddFile("resource/fonts/monofonto.ttf");

-- A function to load the radios.
function Atomic:LoadRadios()
	local radios = Clockwork.kernel:RestoreSchemaData("plugins/radios/"..game.GetMap());
	
	for k, v in pairs(radios) do
		local entity = ents.Create("cw_radio");
		
	--	if (v.frequency) then
			
	--	end;
		
	--	Clockwork.player:GivePropertyOffline(v.key, v.uniqueID, entity);
		
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		
		if ( IsValid(entity) ) then
			entity:SetOff(v.off);
			
			if (v.frequency) then
				entity:SetFrequency(v.frequency);
			end;
		end;
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if ( IsValid(physicsObject) ) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
end;

-- A function to save the radios.
function Atomic:SaveRadios()
	local radios = {};
	
	for k, v in pairs( ents.FindByClass("cw_radio") ) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if ( IsValid(physicsObject) ) then
			moveable = physicsObject:IsMoveable();
		end;
		
		radios[#radios + 1] = {
			off = v:IsOff(),
		--	key = Clockwork.entity:QueryProperty(v, "key"),
			angles = v:GetAngles(),
			moveable = moveable,
		--	uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID"),
			position = v:GetPos(),
			frequency = v:GetFrequency()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/radios/"..game.GetMap(), radios);
end;

-- A function to load the radios.
function Atomic:LoadMusicRadios()
	local radios = Clockwork.kernel:RestoreSchemaData("plugins/musicradios/"..game.GetMap());
	
	for k, v in pairs(radios) do
		local entity = ents.Create("cw_music_radio");

		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		
		if ( IsValid(entity) ) then
			entity:SetNWBool("Off", v.off);
		end;
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if ( IsValid(physicsObject) ) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
end;

-- A function to save the radios.
function Atomic:SaveMusicRadios()
	local radios = {};
	
	for k, v in pairs(ents.FindByClass("cw_music_radio")) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if ( IsValid(physicsObject) ) then
			moveable = physicsObject:IsMoveable();
		end;
		
		radios[#radios + 1] = {
			off = v:GetNWBool("Off"),
			angles = v:GetAngles(),
			moveable = moveable,
			position = v:GetPos(),
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/musicradios/"..game.GetMap(), radios);
end;

-- A function to make an explosion.
function Atomic:MakeExplosion(position, scale)
	local explosionEffect = EffectData();
	local smokeEffect = EffectData();
	
	explosionEffect:SetOrigin(position);
	explosionEffect:SetScale(scale);
	smokeEffect:SetOrigin(position);
	smokeEffect:SetScale(scale);
	
	util.Effect("explosion", explosionEffect, true, true);
	util.Effect("cw_effect_smoke", smokeEffect, true, true);
end;

-- A function to get a player's heal amount.
function Atomic:GetHealAmount(player, base)
	return base * (1 + (Clockwork.attributes:Get(player, "med") / (Clockwork.config:Get("medical_effect"):Get() or 50)));
end;

-- A function to get a player's dexterity time.
function Atomic:GetDexterityTime(player, base)
	if (!base) then base = 10; end;

	return base - (player:GetSpecial("A") * (Clockwork.config:Get("agility_effect"):Get() or 0.75));
end;

Clockwork.datastream:Hook("ObjectPhysDesc", function(player, data)
	if (type(data) == "table" and type( data[1] ) == "string") then
		if ( player.objectPhysDesc == data[2] ) then
			local physDesc = data[1];
			
			if (string.len(physDesc) > 80) then
				physDesc = string.sub(physDesc, 1, 80).."...";
			end;
			
			data[2]:SetNetworkedString("physDesc", physDesc);
		end;
	end;
end);

Clockwork.datastream:Listen("GetEntityRelationship", function(player, data)
	local entity = ents.FindByClass(data[1])[1];
			
	return true, entity:Disposition(player);
end);

-- !!!DECRYPTED EXTERNAL!!!:
-- Called when the character info needs to be adjusted.
function Atomic:PlayerAdjustCharacterCreationInfo(player, info, data)
	for k, v in pairs(data.special) do
		info.data["s_"..k] = v;
	end;
end;

function Atomic:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!lightSpawn) then
		player:SetNWInt("Sneak", Clockwork.attributes:Get(player, "Sneak"));
	end;
end;

-- Called at an interval while a player is connected.
function Atomic:PlayerThink(player, curTime, infoTable)
	infoTable.inventoryWeight = Clockwork.plugin:Call("AdjustInvWeight", player, infoTable.inventoryWeight) or infoTable.inventoryWeight;
	infoTable.walkSpeed = Clockwork.plugin:Call("AdjustWalkSpeed", player, infoTable.walkSpeed) or infoTable.walkSpeed;
	infoTable.runSpeed = Clockwork.plugin:Call("AdjustRunSpeed", player, infoTable.runSpeed) or infoTable.runSpeed;
	infoTable.jumpPower = Clockwork.plugin:Call("AdjustJumpPower", player, infoTable.jumpPower) or infoTable.jumpPower;
	if (player:Crouching() and player:GetVelocity() != Vector(0, 0, 0) and player:IsOnGround()) then
		player:ProgressAttribute("sneak", 0.080, true);
	end;
end;

function Atomic:AdjustJumpPower(player, jumpPower)
	local Agility = Atomic.special:GetSpecial(player, "A");
	return jumpPower + (jumpPower * (Agility * 0.05));
end;

function Atomic:AdjustMaxHealth(player, maxHealth)
	local Endurance = Atomic.special:GetSpecial(player, "E");
	if (Endurance) then
		return maxHealth + (Endurance * 10);
	end;
end;

function Atomic:AdjustInvWeight(player, invWeight)
	local Strength = Atomic.special:GetSpecial(player, "S");
	local hasPerk = player:HasPerk("Strong Back");
	local number = 0

	if (Strength) then
		if hasPerk then
	        number = number + 25;
	    end;

	    invWeight = invWeight + ((Strength * 10) + number);   
	end 

	return invWeight
end;

-- Called to adjust a player's walk speed each think.
function Atomic:AdjustWalkSpeed(player, speed)
	local itemTable = player:GetClothesItem();

	if (itemTable and itemTable.isPowerArmor) then
		return speed - (speed * 0.10);
	end;
end;

-- Called to adjust a player's run speed each think.
function Atomic:AdjustRunSpeed(player, speed)
	local Agility = Atomic.special:GetSpecial(player, "A");
	return speed + (speed * (Agility * 0.05));
end;

-- A function that adjust the player's max health based on perks and endurance, and then sets their health to the same percentage.
function Atomic:AdjustPlayerHealth(player)
	local percent = player:Health() / player:GetMaxHealth();
	local newMaxHealth = Clockwork.plugin:Call("AdjustMaxHealth", player, 100);

	player:SetMaxHealth(newMaxHealth);
	player:SetHealth(math.Clamp(newMaxHealth * percent, 0, newMaxHealth));
end;

function Atomic:DoFireBullets(entity, bulletInfo)
	local player;
	if (entity:IsPlayer()) then
		player = entity;
		entity = entity:GetActiveWeapon();
	end;

	if (entity and entity:IsWeapon()) then
		local itemTable = Clockwork.item:GetByWeapon(entity);

		if (itemTable) then
			local originalDamage = bulletInfo.Damage;
			local durability = itemTable:GetData("Condition");
			local drainScale = itemTable.drainScale * Clockwork.config:Get("condition_decrease_scale"):Get();
			local health = itemTable.health;
			if (durability and health) then
				local percent = durability / health;
				bulletInfo.Damage = originalDamage * (itemTable.minimum + percent * (1 - itemTable.minimum));
				bulletInfo.Spread = bulletInfo.Spread * (itemTable.minimum + percent * (1 - itemTable.minimum));

				itemTable:SetData("Condition", math.max(durability - drainScale, 0));
			end;
			if (player) then
				if (itemTable.category == "Melee") then
					player:ProgressAttribute("melWep", 0.03, true);
				elseif (itemTable.category == "Energy Weapons") then
					player:ProgressAttribute("enegWep", 0.03, true);
				else
					player:ProgressAttribute("guns", 0.01, true);
				end;
			end;
		end;
	end;
end;

function Atomic:DoTakeDamage(player, inflictor, attacker, hitGroup, damageInfo)
	local itemTable = player:GetClothesItem();
	if (itemTable) then
		local armor = itemTable:GetData("Armor");
		if (armor) then
			itemTable:SetData("Armor", player:Armor());
		end;
	end;
	if (Clockwork.config:Get("enable_slow_death"):GetBoolean()) then 
		if (player:Health() <= 10 and math.random() <= 0.75) then
			if (Clockwork.player:GetAction(player) != "die") then
				Clockwork.player:SetRagdollState(player, RAGDOLL_FALLENOVER, nil, nil, Clockwork.kernel:ConvertForce(damageInfo:GetDamageForce() * 32));

				Clockwork.player:SetAction(player, "die", 120, 1, function()
					if (IsValid(player) and player:Alive()) then
						player:TakeDamage(player:Health() * 2, attacker, inflictor);
					end;
				end);
			end;
		end;
	end;
end;