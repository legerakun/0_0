--[[ 
    © 2015 CloudSixteen.com do not share, re-distribute or modify
    without permission of its author (kurozael@gmail.com).

    Clockwork was created by Conna Wiles (also known as kurozael.)
    http://cloudsixteen.com/license/clockwork.html

    Atomic was developed by NightAngel, if you have any questions or
    wish to give any feedback whatsoever, please send a message to
    http://steamcommunity.com/id/NA1455.
--]]

--[[function Clockwork.level:clockwork_Cl_XPAdded(before,after,added)
	surface.PlaySound("ui/ui_xp_up.mp3");
end;

function Fallout_LevelMenu(new_level)
	surface.PlaySound("ui/leveltheme.mp3");

	if IsValid(pig.vgui.LevelUp) then 
		pig.vgui.LevelUp:Remove();
	end;

	clockwork.vgui.LevelUp = vgui.Create("pig_Attributes");

	local att = pig.vgui.LevelUp;
	local text = att.Title;
	local blur = att.Blur;

	text:SetText("WELCOME TO LEVEL "..new_level);
	blur:SetText("WELCOME TO LEVEL "..new_level);
	att:Center();
	att:MakePopup();
end;

function Fallout_LevelText(new_level)
	local GameColor = Clockwork.option:GetColor("information");
	surface.PlaySound("ui/ui_level.mp3");

	if IsValid(pig.vgui.LevelText) then
    	clockwork.vgui.LevelText:Remove();
		clockwork.vgui.LevelText.Blur:Remove();
    end;

    local w,h,x,y = FalloutHUDSize()
    text,blur = Fallout_DLabel(nil,x,y,"LEVEL UP","FO3FontBig",GameColor);
    pig.vgui.LevelText = text;
    text.Blur = blur;

    y = y - ScrH()*.05;
    text:SetPos((ScrW()-x)-text:GetWide(),y-text:GetTall());
    blur:SetPos((ScrW()-x)-text:GetWide(),y-blur:GetTall());
 
    timer.Simple(2.5,function();
    Fallout_LevelMenu(new_level);
	  	if IsValid(text) then
        	text:Remove();
      	end;
  	end)
end;

function Clockwork.level:clockwork_Cl_LevelUp(pre_level,new_level)
  	timer.Simple(2.5,function();
    	Fallout_LevelText(new_level);

	  	if IsValid(clockwork.vgui.XPBar) then
	    	clockwork.vgui.XPBar:Remove();
	  	end;
  	end)
end;]]