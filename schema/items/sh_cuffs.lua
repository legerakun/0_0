local ITEM = Clockwork.item:New();

ITEM.name = "Cuffs";
ITEM.uniqueID = "cuffs";
ITEM.cost = 100;
ITEM.model = "models/Items/CrossbowRounds.mdl";
ITEM.weight = 0.2;
ITEM.access = "v";
ITEM.useText = "Использовать";
ITEM.business = true;
ITEM.description = "Стяжки, сделанные из достаточно прочного материала, чтобы связать кого-нибудь.";

function ITEM:OnUse(player, itemEntity)
	if (player.isCuffing) then
		Clockwork.player:Notify(player, {"Вы уже связываете кого-то!"});

		return false;
	else
		local trace = player:GetEyeTraceNoCursor();
		local target = Clockwork.entity:GetPlayer(trace.Entity);
		local cuffTime = Atomic:GetCuffTime(player);

		if (target) then
			if (!target:GetSharedVar("IsCuffed")) then
				if (target:GetShootPos():Distance( player:GetShootPos() ) <= 192) then
					if (target:GetAimVector():DotProduct(player:GetAimVector()) > 0 or target:IsRagdolled()) then
						Clockwork.player:SetAction(player, "cuff", cuffTime);

						Clockwork.player:EntityConditionTimer(player, target, trace.Entity, cuffTime, 192, function()
							if (player:Alive() and !player:IsRagdolled() and !target:GetSharedVar("IsCuffed") and target:GetAimVector():DotProduct(player:GetAimVector()) > 0) then
								return true;
							end;
						end, function(success)
							if (success) then
								player.isCuffing = nil;

								ITEM:CuffPlayer(target, true, nil);

								player:TakeItem(self);
								player:ProgressAttribute(ATB_AGILITY, 15, true);
							else
								player.isCuffing = nil;
							end;

							Clockwork.player:SetAction(player, "cuff", false);
						end);
					else
						Clockwork.player:Notify(player, {"Вы не можете связывать, смотря в лицо!"});

						return false;
					end;

					player.isCuffing = true;

					Clockwork.player:SetMenuOpen(player, false);

					return false;
				else
					Clockwork.player:Notify(player, {"Игрок слишком далеко!"});

					return false;
				end;
			else
				Clockwork.player:Notify(player, {"Игрок уже связан!"});

				return false;
			end;
		else
			Clockwork.player:Notify(player, {"Вы должны смотреть на подходящую цель!"});

			return false;
		end;
	end;
	return false;
end;

function ITEM:OnDrop(player, position)
	if (player.isCuffing) then
		Clockwork.player:Notify(player, {"Вы еще связываете кого-то!"});

		return false;
	end;
end;

ITEM:Register();