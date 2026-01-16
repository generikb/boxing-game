extends Card

# Name of Attack
func apply_effects(boxer : Boxer, enemy : Enemy) -> void:
	# Health Damage Dealt to Boxer
	if boxer_health_damage != 0:
		var boxer_damage_effect := DamageEffect.new()
		boxer_damage_effect.amount = boxer_health_damage
		boxer_damage_effect.execute_effect(boxer)
	
	# Health Damage Dealt to Enemy
	if enemy_health_damage != 0:
		var enemy_damage_effect := DamageEffect.new()
		enemy_damage_effect.amount = enemy_health_damage
		enemy_damage_effect.execute_effect(enemy)
	
	# Stamina Damage Dealt to Boxer
	if boxer_stamina_damage != 0:
		var boxer_stamina_effect := StaminaEffect.new()
		boxer_stamina_effect.amount = boxer_stamina_damage
		boxer_stamina_effect.execute_effect(boxer)
	
	# Stamina Damage Dealt to Enemy
	if enemy_stamina_damage != 0:
		var enemy_stamina_effect := StaminaEffect.new()
		enemy_stamina_effect.amount = enemy_stamina_damage
		enemy_stamina_effect.execute_effect(enemy)
	
	
	
	
