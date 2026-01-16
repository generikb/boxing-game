class_name TurnManager
extends Node2D

@export var boxer : Boxer
@export var hand : Hand
@export var play_queue : PlayQueue
@export var player_enemy_stats_hud : PlayerEnemyStatsHud


func draw_card() -> void:
	reshuffle_deck_from_discard()
	hand.add_card_to_hand(boxer.boxer_stats.draw_pile.draw_card())
	reshuffle_deck_from_discard()


func draw_cards(amount : int) -> void:
	for i in range(amount):
		draw_card()

func discard_cards() -> void:
	player_enemy_stats_hud.reset_hud_stats()
	
	for card_ui : CardUI in hand.get_children():
		boxer.boxer_stats.discard_pile.add_card(card_ui.card)
		#hand.discard_card(card_ui)
		card_ui.queue_free()
	
	for card_ui in play_queue.get_children():
		if card_ui is Panel:
			continue
		boxer.boxer_stats.discard_pile.add_card(card_ui.card)
		card_ui.queue_free()


func reshuffle_deck_from_discard() -> void:
	if not boxer.boxer_stats.draw_pile.empty():
		return
		
	while not boxer.boxer_stats.discard_pile.empty():
		boxer.boxer_stats.draw_pile.add_card(boxer.boxer_stats.discard_pile.draw_card())
	
	boxer.boxer_stats.draw_pile.shuffle()
	
		
