class_name PlayerEnemyStatsHud
extends Control

@export var boxer : Boxer
@export var enemy : Enemy

@onready var boxer_health_bar: ProgressBar = %BoxerHealthBar
@onready var boxer_stamina_bar: ProgressBar = %BoxerStaminaBar
@onready var enemy_health_bar: ProgressBar = %EnemyHealthBar
@onready var enemy_stamina_bar: ProgressBar = %EnemyStaminaBar

var preview_boxer_stats : BoxerStats


# Called when the node enters the scene tree for the first time.
func init_hud() -> void:
	boxer.boxer_stats.stats_changed.connect(update_hud_ui)
	enemy.enemy_stats.stats_changed.connect(update_hud_ui)
	reset_hud_stats()


func update_hud_ui() -> void:
	boxer_health_bar.value = boxer.boxer_stats.preview_health
	boxer_stamina_bar.value = boxer.boxer_stats.preview_stamina
	enemy_health_bar.value = enemy.enemy_stats.preview_health
	enemy_stamina_bar.value = enemy.enemy_stats.preview_stamina

# Resets the Stats HUD with the actual stat values of the Boxer/Enemy
func reset_hud_stats() -> void:
	boxer.boxer_stats.preview_health = boxer.boxer_stats.health
	boxer.boxer_stats.preview_stamina = boxer.boxer_stats.stamina
	enemy.enemy_stats.preview_health = enemy.enemy_stats.health
	enemy.enemy_stats.preview_stamina = enemy.enemy_stats.stamina
	
