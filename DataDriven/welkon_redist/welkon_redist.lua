function welkon_redist(keys)
	local caster = keys.caster
	local attacker = keys.attacker
	local ability = keys.ability
	local killed = keys.unit
	local rate = ability:GetLevelSpecialValueFor("conv_rate", (ability:GetLevel() - 1))
	local amount = killed:GetMaxHealth() * (rate/100)
	local damage_table = {
		attacker = caster,
		victim = attacker,
		damage_type = DAMAGE_TYPE_PURE,
		damage = amount,
		ability = ability
	}
	ApplyDamage(damage_table)
	ParticleManager:CreateParticle("particles/econ/items/sven/sven_warcry_ti5/sven_warcry_cast_arc_lightning.vpcf", PATTACH_ABSORIGIN, attacker)
	attacker:EmitSound("Hero_Zuus.LightningBolt") 
end
