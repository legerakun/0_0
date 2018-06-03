--[[
	© 2015 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

local Clockwork = Clockwork;
local pairs = pairs;
local table = table;

Clockwork.setting = Clockwork.kernel:NewLibrary("Setting");
Clockwork.setting.stored = Clockwork.setting.stored or {};

-- A function to add a number slider setting.
function Clockwork.setting:AddNumberSlider(category, text, conVar, minimum, maximum, decimals, toolTip, Condition)
	local index = #self.stored + 1;

	self.stored[index] = {
		Condition = Condition,
		category = category,
		decimals = decimals,
		toolTip = toolTip,
		maximum = maximum,
		minimum = minimum,
		conVar = conVar,
		class = "numberSlider",
		text = text
	};

	return index;
end;

-- A function to add a multi-choice setting.
function Clockwork.setting:AddMultiChoice(category, text, conVar, options, toolTip, Condition)
	local index = #self.stored + 1;

	if (options) then
		table.sort(options, function(a, b) return a < b; end);
	else
		options = {};
	end;

	self.stored[index] = {
		Condition = Condition,
		category = category,
		toolTip = toolTip,
		options = options,
		conVar = conVar,
		class = "multiChoice",
		text = text
	};

	return index;
end;

-- A function to add a number wang setting.
function Clockwork.setting:AddNumberWang(category, text, conVar, minimum, maximum, decimals, toolTip, Condition)
	local index = #self.stored + 1;

	self.stored[index] = {
		Condition = Condition,
		category = category,
		decimals = decimals,
		toolTip = toolTip,
		maximum = maximum,
		minimum = minimum,
		conVar = conVar,
		class = "numberWang",
		text = text
	};

	return index;
end;

-- A function to add a text entry setting.
function Clockwork.setting:AddTextEntry(category, text, conVar, toolTip, Condition)
	local index = #self.stored + 1;

	self.stored[index] = {
		Condition = Condition,
		category = category,
		toolTip = toolTip,
		conVar = conVar,
		class = "textEntry",
		text = text
	};

	return index;
end;

-- A function to add a check box setting.
function Clockwork.setting:AddCheckBox(category, text, conVar, toolTip, Condition)
	local index = #self.stored + 1;

	self.stored[index] = {
		Condition = Condition,
		category = category,
		toolTip = toolTip,
		conVar = conVar,
		class = "checkBox",
		text = text
	};

	return index;
end;

-- A function to add a color mixer setting.
function Clockwork.setting:AddColorMixer(category, text, conVar, toolTip, Condition)
	local index = #self.stored + 1;

	self.stored[index] = {
		Condition = Condition,
		category = category,
		toolTip = toolTip,
		conVar = conVar,
		class = "colorMixer",
		text = text
	};

	return index;
end;

-- A function to remove a setting by its index.
function Clockwork.setting:RemoveByIndex(index)
	self.stored[index] = nil;
end;

-- A function to remove a setting by its convar.
function Clockwork.setting:RemoveByConVar(conVar)
	for k, v in pairs(self.stored) do
		if (v.conVar == conVar) then
			self.stored[k] = nil;
		end;
	end;
end;

-- A function to remove a setting.
function Clockwork.setting:Remove(category, text, class, conVar)
	for k, v in pairs(self.stored) do
		if ((!category or v.category == category)
		and (!conVar or v.conVar == conVar)
		and (!class or v.class == class)
		and (!text or v.text == text)) then
			self.stored[k] = nil;
		end;
	end;
end;

function Clockwork.setting:AddSettings()
	if (!Clockwork.setting.SettingsAdded) then
		local langTable = {};

		for k, v in pairs(Clockwork.lang:GetAll()) do
			table.insert(langTable, k);
		end;

		local themeTable = {};

		for k, v in pairs(Clockwork.theme:GetAll()) do
			table.insert(themeTable, k);
		end;

		local frameworkStr = L("Framework");
		local chatBoxStr = L("ChatBox");
		local themeStr = L("Theme");

		Clockwork.setting:AddNumberSlider(chatBoxStr, "Линии чата:", "cwMaxChatLines", 1, 10, 0, "Количество линий чата, отображаемых за раз.");

		Clockwork.setting:AddCheckBox(frameworkStr, "Включить консольные логи администрации.", "cwShowLog", "Показывать консольные логи администрации или нет.", function()
			return Clockwork.player:IsAdmin(Clockwork.Client);
		end);

		Clockwork.setting:AddCheckBox(frameworkStr, "Включить двенадцатичасовые часы.", "cwTwelveHourClock", "Включать двенадцатичасовые часы или нет.");
		Clockwork.setting:AddCheckBox(frameworkStr, "Включить советы.", "cwShowHints", "Включить систему советов или нет.");
		Clockwork.setting:AddCheckBox(frameworkStr, "Включить койму.", "cwShowVignette", "Включить койму по краям экрана или нет.");
		Clockwork.setting:AddCheckBox(frameworkStr, "Отображать статус на верху экрана.", "cwTopBars", "Отображать хп, стамину, голод и жажду на верху экрана.");

		Clockwork.setting:AddCheckBox(chatBoxStr, "Показывать время сообщения.", "cwShowTimeStamps", "Показывать время сообщения или нет.");
		Clockwork.setting:AddCheckBox(chatBoxStr, "Показывать сообщения связанные с CW.", "cwShowClockwork", "Показывать сообщения связанные с Clockwork.");
		Clockwork.setting:AddCheckBox(chatBoxStr, "Показывать сообщения связанные с сервером.", "cwShowServer", "Показывать сообщения связанные с сервером или нет.");
		Clockwork.setting:AddCheckBox(chatBoxStr, "Показывать out-of-character сообщения.", "cwShowOOC", "Показывать out-of-character сообщения или нет.");
		Clockwork.setting:AddCheckBox(chatBoxStr, "Показывать in-character сообщения.", "cwShowIC", "Показывать in-character сообщения или нет.");

		Clockwork.setting:AddColorMixer(themeStr, "Цвет текста:", "cwTextColor", "Цвет текста", function()
			return (!Clockwork.theme:IsFixed());
		end);
		Clockwork.setting:AddColorMixer(themeStr, "Цвет фона:", "cwBackColor", "The Background Color");	

		Clockwork.setting:AddCheckBox("Admin ESP", "Включает ESP.", "cwAdminESP", "Включен ли ESP или нет.", function()
			return Clockwork.player:IsAdmin(Clockwork.Client);
		end);

		Clockwork.setting:AddCheckBox("Admin ESP", "Включает полосы ESP.", "cwESPBars", "Будут ли нарисованы полосы в ESP.", function()
			return Clockwork.player:IsAdmin(Clockwork.Client);
		end);

		Clockwork.setting:AddCheckBox("Admin ESP", "Показывать предметы.", "cwItemESP", "Показывать предметы в ESP.", function()
			return Clockwork.player:IsAdmin(Clockwork.Client);
		end);

		Clockwork.setting:AddCheckBox("Admin ESP", "Показывать салесманов.", "cwSaleESP", "Показывать салесманов в ESP.", function()
			return Clockwork.player:IsAdmin(Clockwork.Client);
		end);

		Clockwork.setting:AddNumberSlider("Admin ESP", "ESP Интервал:", "cwESPTime", 0, 2, 0, "Период обновления ESP.", function()
			return Clockwork.player:IsAdmin(Clockwork.Client);
		end);

		Clockwork.setting:AddCheckBox("Вид от 3-го лица", "Включить вид от третьего лица", "cwThirdPerson", "Включает вид от третьего лица.");


		Clockwork.setting.SettingsAdded = true;
	end;
end;
