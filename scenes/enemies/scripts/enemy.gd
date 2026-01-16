class_name Enemy
extends Node2D

var enemy_stats : EnemyStats


func take_health_damage(damage : int) -> void:
	# add some code for animations etc
	enemy_stats.take_health_damage(damage)	


func take_stamina_damage(damage : int) -> void:
	# add some code for animations etc
	enemy_stats.take_stamina_damage(damage)	
