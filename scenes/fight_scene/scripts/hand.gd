class_name Hand
extends HBoxContainer

@onready var card_ui_scene := preload("res://scenes/cards/card_ui.tscn")


func add_card_to_hand(card : Card) -> void:
	var new_card_ui : CardUI = card_ui_scene.instantiate()
	new_card_ui.card = card
	add_child(new_card_ui)


func discard_card(card_ui : CardUI) -> void:
	remove_child(card_ui)
	card_ui.queue_free()
	#print(self.get_children())
