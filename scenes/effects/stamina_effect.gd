class_name StaminaEffect
extends Effect

var amount : int = 0

func execute_effect(target_stats, attacker_stats) -> void:
	if target_stats is BoxerStats or target_stats is EnemyStats:
		print("A Stamina Hit to ", target_stats)
		target_stats.take_stamina_damage(amount)
