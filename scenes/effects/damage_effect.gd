class_name DamageEffect
extends Effect

var amount : int = 0

func execute_effect(target) -> void:
	if target is Boxer or target is Enemy:
		#print("A Jab to the Head!")
		target.take_health_damage(amount)
