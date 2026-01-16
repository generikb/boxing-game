class_name Boxer
extends Node2D


var boxer_stats : BoxerStats


func take_health_damage(damage : int) -> void:
	# add some code for animations etc
	boxer_stats.take_health_damage(damage)	


func take_stamina_damage(damage : int) -> void:
	# add some code for animations etc
	boxer_stats.take_stamina_damage(damage)	


	
