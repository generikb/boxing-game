class_name CardUI
extends Control

@export var card : Card

@onready var panel: Panel = $Panel
@onready var card_name_label: Label = %CardNameLabel
@onready var card_type_label: Label = %CardTypeLabel
@onready var card_target_label: Label = %CardTargetLabel
@onready var card_state_machine: CardStateMachine = $CardStateMachine



var following_mouse: bool = false
var original_index : int = 0
var is_card_played : bool = false


func _ready() -> void:
	setup_card(card)
	card_state_machine.init(self)
	original_index = get_index()


func setup_card(value : Card) -> void:
	if not is_node_ready():
		await ready
	
	card = value
	card_name_label.text = card.name
	card_type_label.text = str(card.Type.keys()[card.card_type])
	card_target_label.text = str(card.Target.keys()[card.card_target])


func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)


func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)


func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()


func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()
