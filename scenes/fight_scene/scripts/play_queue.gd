class_name PlayQueue
extends HBoxContainer

@export var boxer : Boxer

@onready var card_spacer: Panel = $CardSpacer


var nudge_card_mode : bool = false
var dragged_card : CardUI
var queue_rect = self.get_global_rect()
var dragged_card_rect

# The index of the best combo that matches the cards in the play queue
var active_combo = null
# The final card of the active combo that will trigger the combo's effect
var trigger_card : CardUI = null


func _ready() -> void:
	Events.card_drag_started.connect(nudge_card_mode_on)
	Events.card_drag_ended.connect(nudge_card_mode_off)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if nudge_card_mode:
		dragged_card_rect = dragged_card.get_global_rect()
		if dragged_card_rect.intersects(queue_rect):
			nudge_cards()


func nudge_card_mode_on(card: CardUI) -> void:
	nudge_card_mode = true
	dragged_card = card

func nudge_card_mode_off(_card: CardUI) -> void:
	card_spacer.visible = false
	nudge_card_mode = false
	dragged_card = null

# Make a card-sized gap in the Play Queue if dragging a card inbetween 2 cards
func nudge_cards() -> void:
	if get_child_count() > 0:
		for card in get_children():
			var card_rect = card.get_global_rect()
			if dragged_card_rect.intersects(card_rect):
				move_child.call_deferred(card_spacer, card.get_index())
				card_spacer.visible = true
				break

# Grabs all the CardUIs in the Play Queue, returns an Array of CardUIs
func get_cards_in_play() -> Array[CardUI]:
	var card_uis_in_play : Array[CardUI] = []
	var play_queue_children = get_children()
	play_queue_children.erase(card_spacer)
	for child in play_queue_children:
		card_uis_in_play.append(child)
	play_queue_children.erase(card_spacer)
	return card_uis_in_play


func check_for_valid_combo() -> void:
	active_combo = null
	var cards_in_play = get_cards_in_play()
	for index in range(boxer.boxer_stats.combos_learned.size()):
		var new_trigger_card : CardUI = boxer.boxer_stats.combos_learned[index].is_combo_valid(cards_in_play)
		if new_trigger_card != null:
			trigger_card = new_trigger_card
			active_combo = index
			print("active combo index and trigger card: ", active_combo, trigger_card)
	return

# Places card into Play Queue dragged over area and released
func add_card_to_play_queue(card_ui : CardUI) -> void:
	card_ui.reparent(self)
	move_child.call_deferred(card_ui, card_spacer.get_index())
