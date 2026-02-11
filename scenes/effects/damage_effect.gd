class_name DamageEffect
extends Effect

var amount : int = 0

func execute_effect(target_stats, attacker_stats) -> void:
	for token : Token in attacker_stats.tokens:
		if token.type == Token.Type.CRIT:
			print("there is a crit token!")
	
	if target_stats is BoxerStats or target_stats is EnemyStats:
		print(target_stats, " takes damage ", amount)
		target_stats.take_health_damage(amount)
