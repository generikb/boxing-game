extends Combo



func apply_combo_effects(boxer : Boxer, enemy : Enemy) -> void:
		print("combo effect triggered!")
		var enemy_damage_effect := DamageEffect.new()
		enemy_damage_effect.amount = 50
		enemy_damage_effect.execute_effect(enemy, boxer)
