extends Combo



func apply_combo_effects(boxer : Boxer, enemy : Enemy) -> void:
		print("combo effect triggered!")
		var enemy_stamina_effect := StaminaEffect.new()
		enemy_stamina_effect.amount = 50
		enemy_stamina_effect.execute_effect(enemy.enemy_stats, boxer.boxer_stats)
