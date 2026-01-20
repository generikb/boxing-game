class_name DamageEffect
extends Effect

var amount : int = 0

func execute_effect(target, attacker) -> void:
	if target is Boxer or target is Enemy:
		print(target, " takes damage ", amount)
		target.take_health_damage(amount)
