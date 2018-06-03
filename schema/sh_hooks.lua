--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

-- Called when the Clockwork shared variables are added.
function Atomic:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:String("customClass");

	for k, v in pairs(Clockwork.attribute:GetAll()) do
		v.category = Clockwork.option:GetKey("name_attributes");
	end;
end;

-- A function to display a weapon's condition.
local function WeaponGetClientSideInfo(itemTable)
	local durability = itemTable:GetData("Condition");
	local health = itemTable.health or 200;
	local clientSideInfo = "";
	local durabilityColor = Color(255 - ((durability / health) * 255), (durability / health) * 255, 0, 255);

	clientSideInfo = Clockwork.kernel:AddMarkupLine(
		clientSideInfo, "Состояние: "..math.floor((durability / health) * 100).."%", durabilityColor
	);

	return (clientSideInfo != "" and clientSideInfo);
end;

-- A function display an apparel's armor.
local function ArmorGetClientSideInfo(itemTable)
	local armor = itemTable:GetData("Armor");
	local baseArmor = itemTable.baseArmor;
	local clientSideInfo = "";
	local specialTable = itemTable.specialBoost;

	if (armor and baseArmor) then
		local armorColor = Color(0, 150, 255, 255);

		clientSideInfo = Clockwork.kernel:AddMarkupLine(
			clientSideInfo, "Броня: "..math.floor((armor / baseArmor) * 100).."%", armorColor
		);
	end;

	if (specialTable) then
		clientSideInfo = Clockwork.kernel:AddMarkupLine(
			clientSideInfo, "SPECIAL:", Color(255, 255, 255, 255)
		);

		for k, v in pairs(specialTable) do
			local value = v;

			if (value > 0) then
				value = "+"..value;
			end;

			clientSideInfo = Clockwork.kernel:AddMarkupLine(
				clientSideInfo, "   "..k..": "..value, Color(255, 255, 255, 255)
			);
		end;
	end;

	return (clientSideInfo != "" and clientSideInfo);
end;

-- Called when a perk is registered.
function Atomic:OnPerkRegistered(perk) end;

-- Called when a clockwork item initializes.
function Atomic:ClockworkItemInitialized(itemTable)
	itemTable.spawnValue = 1;
	itemTable.spawnType = "misc";

	if (itemTable.category == "Consumables") then
		itemTable.spawnValue = 2;
		itemTable.spawnType = "consumable";
	elseif (itemTable.category == "Junk") then
		itemTable.spawnValue = 1;
		itemTable.spawnType = "junk";
	elseif (itemTable.category == "Aid") then
		itemTable.spawnValue = 1;
		itemTable.spawnType = "medical";
	end;

	if (itemTable.baseItem == "alcohol_base") then
		itemTable.pickupSound = {
			"atomic/items/bottle/bottle_up_01.mp3",
			"atomic/items/bottle/bottle_up_02.mp3"
		};
		itemTable.dropSound = {
			"atomic/items/bottle/bottle_down_01.mp3",
			"atomic/items/bottle/bottle_down_02.mp3"
		};

		itemTable.spawnValue = 1;
		itemTable.spawnType = "consumable";

		return;
	elseif (Clockwork.item:IsWeapon(itemTable)) then
		itemTable.pickupSound = "atomic/items/weapons/gunssmall_up.mp3";
		itemTable.dropSound = "atomic/items/weapons/gunssmall_down.mp3";
		itemTable.useSound = {"atomic/items/weapons/gunssmall_up.mp3", "atomic/items/weapons/gunssmall_down.mp3"};

		if (itemTable.GetClientSideInfo) then
			itemTable.OldGetClientSideInfo = itemTable.GetClientSideInfo;
			itemTable.NewGetClientSideInfo = WeaponGetClientSideInfo;
			itemTable.GetClientSideInfo = function(itemTable)
				local existingText = itemTable:OldGetClientSideInfo();
				local additionText = itemTable:NewGetClientSideInfo() or "";
				local totalText = (existingText and existingText.."\n" or "")..additionText;
				
				return (totalText != "" and totalText);
			end;
		else
			itemTable.GetClientSideInfo = WeaponGetClientSideInfo;
		end;

		if (!itemTable.health) then
			itemTable.health = 500;
		end;

		if (!itemTable.minimum) then
			itemTable.minimum = 0.66;
		end;

		if (!itemTable.drainScale) then
			itemTable.drainScale = 0.2;
		end;

		itemTable.isRareSpawn = true;
		itemTable.spawnValue = 1;
		itemTable.spawnType = nil;
		
		itemTable:AddData("Condition", itemTable.health, true);

		return;
	elseif (itemTable.baseItem == "ammo_base") then
		itemTable.pickupSound = {};
		itemTable.dropSound = {"atomic/items/ammo/ammo_down.mp3"};
		itemTable.useSound = {"atomic/items/ammo/ammo_down.mp3"};

		for i = 1, 3 do
			table.insert(itemTable.pickupSound, "atomic/items/ammo/ammo_up_0"..i..".mp3");
			table.insert(itemTable.useSound, "atomic/items/ammo/ammo_up_0"..i..".mp3");
		end;

		itemTable.isRareSpawn = true;
		itemTable.spawnValue = 1;
		itemTable.spawnType = nil;

		return;
	elseif (itemTable.baseItem == "base_apparel") then
		itemTable.spawnType = "misc";
		itemTable.spawnValue = 1;
	end;

	local armor = itemTable.baseArmor;

	if (armor) then
		if (itemTable.GetClientSideInfo) then
			itemTable.OldGetClientSideInfo = itemTable.GetClientSideInfo;
			itemTable.NewGetClientSideInfo = ArmorGetClientSideInfo;
			itemTable.GetClientSideInfo = function(itemTable)
				local existingText = itemTable:OldGetClientSideInfo();
				local additionText = itemTable:NewGetClientSideInfo() or "";
				local totalText = (existingText and existingText.."\n" or "")..additionText;
				
				return (totalText != "" and totalText);
			end;
		else
			itemTable.GetClientSideInfo = ArmorGetClientSideInfo;
		end;
		
		itemTable:AddData("Armor", armor, true);
	end;

	if (!itemTable.dropSound) then
		itemTable.dropSound = "atomic/items/generic_drop.mp3";
	end;

	if (!itemTable.pickupSound) then
		itemTable.pickupSound = {};

		for i = 1, 4 do
			table.insert(itemTable.pickupSound, "atomic/items/generic_pickup_0"..i..".mp3");
		end;
	end;

	if (itemTable.isBaseItem or string.find(itemTable.name, "base_")) then
		itemTable.spawnType = nil;
		itemTable.isRareSpawn = nil;
		itemTable.spawnValue = nil;
	end;
end;