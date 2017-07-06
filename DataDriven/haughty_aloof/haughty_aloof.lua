function haughty_aloof (keys)
	local caster = keys.caster
	local ability = keys.ability
	local radius = ability:GetSpecialValueFor("radius")
	local enemyhs = FindUnitsInRadius( caster:GetTeamNumber(), caster:GetOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false )
	if #enemyhs > 0 then
		if #(caster:FindAllModifiersByName("modifier_haughty_aloof_effect"))<= 0 then
			ability:ApplyDataDrivenModifier(caster,caster,"modifier_haughty_aloof_effect",nil)
		end
		caster:SetModifierStackCount("modifier_haughty_aloof_effect",caster,#enemyhs)
		if #enemyhs >= 3 then
			if #(caster:FindAllModifiersByName("modifier_haughty_aloof_immune"))<= 0 then
				ability:ApplyDataDrivenModifier(caster,caster,"modifier_haughty_aloof_immune",nil)
			end
		else
			caster:RemoveModifierByName("modifier_haughty_aloof_immune")
		end
	else
		caster:RemoveModifierByName("modifier_haughty_aloof_effect")
	end
end
