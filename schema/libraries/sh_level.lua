--[[local Clockwork = Clockwork;

Atomic.level = Clockwork.kernel:NewLibrary("Level");

if SERVER then
	util.AddNetworkString("CW_SetAtt");
	util.AddNetworkString("CW_LockPoints");
	util.AddNetworkString("CW_LevelUp");
	util.AddNetworkString("CW_SendHook_XPAdded");
	amt = tonumber(amt);
	amt = math.Round(amt);
	amt = math.Clamp(amt,0,100);
	Point = 0;
    Lock = 0;
    self.Attributes = amt;
    MaxLevel = 30;
    LevelPoints = 16;

	function Clockwork.level:AddSkillPoints(amt)
		if tonumber(amt) == nil then
			Clockwork.player:Notify(player, amt.." is not a valid number!");

			return
		end;

		amt = math.Round(amt);
		self:SetCharVar("SkillPoints",self:GetSkillPoints() + amt,true);
	end;

	function Clockwork.level:LockPoints()
		if self:IsCreationProcessActive() then

			return 
		end;

	   	for k,v in pairs(self.Attributes) do
			v.Lock = v.Point;
	    end;
	end;

	function Clockwork.level:SetLevel(lvl)
		if tonumber(lvl) == nil then
			Clockwork.player:Notify(player, lvl.." is not a valid number!");

			return 
		end;

		lvl = math.Round(lvl);

		if (lvl > MaxLevel) then 
			lvl = MaxLevel; 
		end;

		local ex_level = self:GetLevel();

		if (self:GetLevel() >= MaxLevel) then 
			if (self:GetRequiredXP() <= 0) then 
				self:SetXP(self:GetRequiredXP() + self:GetXP() ); 
			end;

			return 
		end;

		local new_lvl = hook.Call("clockwork_SetLevel",GAMEMODE,self,self:GetLevel(),lvl);
		if new_lvl != nil then
			lvl = new_lvl;
		end;

		self:SetCharVar("Level",lvl,true);
		self:SetNWFloat("Level",lvl);

		if self:GetRequiredXP() <= 0 and lvl > ex_level then
			self:SetLevel(lvl + 1);
			self:AddSkillPoints(LevelPoints);
		elseif (self:GetRequiredXP() <= 0) and (lvl < ex_level) then
			local diff = ex_level - lvl;

			diff = LevelPoints * diff;
			self:SetXP(0);
			if (self:GetSkillPoints() - diff < 0) then
				self:AddSkillPoints(-self:GetSkillPoints());
			else
				self:AddSkillPoints(self:GetSkillPoints() - diff);
			end;
		end;
	end;

	function Clockwork.level:SetXP(xp,added)
		if self:IsMaxLevelXP() then 

			return 
		end;

		if tonumber(xp) == nil then
			Clockwork.player:Notify(player, xp.." is not a valid number!");

			return 
		end;

		if xp > self:GetMaxLevelXP() then 
			xp = self:GetMaxLevelXP();
		end;

		if (added != nil) and (added > self:GetMaxLevelXP()) then
			added = self:GetMaxLevelXP();
			added = math.Round(added);
		end;

		xp = math.Round(xp);

		hook.Call("clockwork_XPSet",GAMEMODE,self,self:GetXP(),xp);

		local req = self:GetRequiredXP();

		self:SetCharVar("XP",xp,true)
			if self:GetRequiredXP() <= 0 then
		    	if self:GetLevel() >= Schema.MaxLevel then 

		    		return 
		    	end;

		    	hook.Call("clockwork_LevelUp",GAMEMODE,self,self:GetLevel(),self:GetLevel() + 1);
		    	if !Schema.CarryOverXP then
		        local toAdd = nil;

		        	if added != nil then
		           		toAdd = added - req;
		            else
		          		toAdd = 0;
		       		end;

		        self:SetCharVar("XP",toAdd,true);
		    end;

		    self:SetLevel(self:GetLevel() + 1);
		end;
	end;

	function GM:clockwork_LevelUp(player,pre_level,new_level)
		player:AddSkillPoints(Schema.LevelPoints)
		if Schema.LevelPoints <= 0 then return end
		net.Start("CW_LevelUp")
		net.WriteFloat(pre_level)
		net.WriteFloat(new_level)
		net.Send(player)
	end

	function GM:clockwork_HookXPAdded(player,before,after,added)
		net.Start("CW_SendHook_XPAdded")
		net.WriteFloat(before)
		net.WriteFloat(after)
		net.WriteFloat(added)
		net.Send(player)
	end

	function Clockwork.level:AddXP(amt)
		if self:IsMaxLevelXP() then 

			return 
		end;

		if self:GetLevel() >= Schema.MaxLevel then

			return
		end;

		if tonumber(amt) == nil then
			Clockwork.player:Notify(player, amt.." is not a valid number!");

			return 
		end;

		amt = math.Round(amt);
		local new_amt = hook.Call("clockwork_XPAdded",GAMEMODE,self,self:GetXP(),self:GetXP() + amt,amt);

		if new_amt != nil then
			amt = new_amt;
		end;

		hook.Call("clockwork_HookXPAdded",GAMEMODE,self,self:GetXP(),self:GetXP() + amt,amt);
		self:SetXP(self:GetXP() + amt,amt);
	end;

	net.Receive("CW_SetAtt",function(_,player)
		local tbl = net.ReadTable();
		local total = 0;

		for k,v in pairs(tbl) do
		    if !player:GetAttribute(k) then 

		    	return 
		    end;

			total = total + v;
		end;

		local points = player:GetSkillPoints();
		if total > points then 

			return 
		end;

		for k,v in pairs(tbl) do
		    local added = player:AddToAttribute(k,v)
			if added == false then 
				continue 
			end

		    player:AddSkillPoints(-v);
		end;

		player:LockPoints();
		player:SaveAllStats();
		end)

		net.Receive("CW_LockPoints",function(_,player)
			player:LockPoints();
		end)
	end;

	function Clockwork.level:GetRequiredXP()
		local upper = self:GetLevel() + 1

		if upper > MaxLevel then 
			upper = MaxLevel;
		end;

		local fXP = 25*(3*upper+2)*(upper-1);

		fXP = math.Round(fXP / 2);

		return (fXP - self:GetXP())
	end;

	function Clockwork.level:GetMaxLevelXP()
		local upper = MaxLevel;
		local fXP = 25*(3*upper+2)*(upper-1);

		fXP = math.Round(fXP / 2);

		return (fXP)
	end;

	function Clockwork.level:IsMaxLevelXP()
		if (self:GetRequiredXP() <= 0) and (self:GetLevel() >= MaxLevel) then

			return true
		end;
	end;

	function Clockwork.level:GetXP()
		return tonumber(self:GetCharVar("XP"));
	end;

	function Clockwork.level:GetLevel()
		if CLIENT then
		    if self != LocalPlayer() then
			    return self:GetNWFloat("Level",0);
			end;
		end;

		return tonumber(self:GetCharVar("Level"))
	end;

	function Clockwork.level:GetSkillPoints()
		return tonumber(self:GetCharVar("SkillPoints"))
	end;

if CLIENT then

	net.Receive("CW_SendHook_XPAdded",function()
		local before = net.ReadFloat();
		local after = net.ReadFloat();
		local added = net.ReadFloat();
		hook.Call("clockwork_XPAdded",GAMEMODE,before,after,added);
	end)

	function GM:clockwork_Cl_XPAdded(before,after,added)
		if IsValid(clockwork.vgui.XPBar) then
	    	clockwork.vgui.XPBar:Remove();
	    end;

		clockwork.vgui.XPBar = vgui.Create("clockwork_XPBar");

		local bar = clockwork.vgui.XPBar;
		bar:AddBarXP(before,added);
	end;

	net.Receive("CW_LevelUp",function()
		local pre_level = net.ReadFloat();
		local new_level = net.ReadFloat();
		hook.Call("clockwork_LevelUp",GAMEMODE,pre_level,new_level);
	end)

end;]]