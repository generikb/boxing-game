class_name StaminaEffect
extends Effect

var amount : int = 0

func execute_effect(target) -> void:
	if target is Boxer or target is Enemy:
		print("A Stamina Hit to ", target)
		target.take_stamina_damage(amount)
