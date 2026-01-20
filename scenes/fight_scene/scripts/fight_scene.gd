extends Node2D

@export var cards_per_hand : int = 6
@export var boxer_stats : BoxerStats
@export var enemy_stats : EnemyStats

@onready var boxer: Boxer = $Boxer
@onready var enemy: Enemy = $Enemy
@onready var hand: HBoxContainer = %Hand

@onready var debug_draw_cards: Button = %DebugDrawCards
@onready var debug_redraw_cards: Button = %DebugRedrawCards
@onready var end_turn_button: Button = %EndTurnButton


@onready var turn_manager: TurnManager = $TurnManager
@onready var combat_manager: CombatManager = $CombatManager
@onready var play_queue: PlayQueue = %PlayQueue
@onready var player_enemy_stats_hud: PlayerEnemyStatsHud = %PlayerEnemyStatsHud


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_boxer_stats : BoxerStats = boxer_stats.create_boxer()
	boxer.boxer_stats = new_boxer_stats
	
	var new_enemy_stats : EnemyStats = enemy_stats.create_enemy()
	enemy.enemy_stats = new_enemy_stats
	
	boxer.boxer_stats.draw_pile = boxer.boxer_stats.deck.duplicate(true)
	boxer.boxer_stats.draw_pile.shuffle()
	
	Events.card_drag_ended.connect(place_card)
	player_enemy_stats_hud.init_hud()

# Temp function to place cards into Hand
func _on_debug_draw_cards_pressed() -> void:
	turn_manager.draw_cards(cards_per_hand)
	

# Temp function to remove cards in hand and draw a new set of cards
func _on_debug_redraw_cards_pressed() -> void:
	turn_manager.discard_cards()
	turn_manager.reshuffle_deck_from_discard()
	turn_manager.draw_cards(cards_per_hand)
	
	

# When card is released, place in Play Queue Area or back into Hand, then
# "preview play" all cards in Play Queue Area
func place_card(card_ui : CardUI) -> void:
	var card_rect = card_ui.get_global_rect()
	var queue_rect = play_queue.get_global_rect()
	if card_rect.intersects(queue_rect):
		#print("it's touching the area")
		play_queue.add_card_to_play_queue(card_ui)
		card_ui.is_card_played = true
	else:
		#print("it's not touching the area")
		card_ui.is_card_played = false
		card_ui.reparent(hand)
		hand.move_child.call_deferred(card_ui, card_ui.original_index)
	
	# "Preview Play" all cards in Play Queue Area (needs polish)
	play_queue.check_for_valid_combo()
	var cards_in_play = play_queue.get_cards_in_play()
	combat_manager.play_cards(cards_in_play, true)


func _on_end_turn_button_pressed() -> void:
	# "Actual Play" all cards in Play Queue Area (needs polish)
	play_queue.check_for_valid_combo()
	var cards_in_play = play_queue.get_cards_in_play()
	await combat_manager.play_cards(cards_in_play, false)
	turn_manager.discard_cards()
