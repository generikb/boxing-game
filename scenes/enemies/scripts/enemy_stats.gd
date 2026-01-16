class_name EnemyStats
extends Stats


func create_enemy() -> Resource:
	var enemy : EnemyStats = self.duplicate()
	enemy.health = max_health
	enemy.stamina = max_stamina
	return enemy
