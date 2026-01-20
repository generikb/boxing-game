class_name CombatManager
extends Node2D

@export var stats_hud : PlayerEnemyStatsHud
@export var play_queue : PlayQueue
@export var boxer : Boxer
@export var enemy : Enemy



# Processes all cards in play area (preview mode doesn't affect actual stats)  
func play_cards(cards_in_play : Array[CardUI], preview_mode : bool) -> void:
	stats_hud.reset_hud_stats()
	for card_ui : CardUI in cards_in_play:
		if preview_mode:
			card_ui.card.play_card(boxer, enemy, preview_mode)
		else:
			await get_tree().create_timer(2.0).timeout
			card_ui.card.play_card(boxer, enemy, preview_mode)
			boxer.boxer_stats.discard_pile.add_card(card_ui.card)
			card_ui.queue_free()
			update_stats()
		if play_queue.trigger_card == card_ui:
			print("trigger card played: ", card_ui)
			boxer.boxer_stats.combos_learned[play_queue.active_combo].apply_combo_effects(boxer, enemy)
			if not preview_mode:
				update_stats()


func update_stats() -> void:
	boxer.boxer_stats.health = boxer.boxer_stats.preview_health
	boxer.boxer_stats.stamina = boxer.boxer_stats.preview_stamina
	enemy.enemy_stats.health = enemy.enemy_stats.preview_health
	enemy.enemy_stats.stamina = enemy.enemy_stats.preview_stamina
