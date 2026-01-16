extends CardState

func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready
	#print(card_ui.original_index)
	#print("base state")


func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		card_ui.pivot_offset = card_ui.get_global_mouse_position() - card_ui.global_position
		change_card_state.emit(self, CardState.State.CLICKED)

func on_mouse_entered() -> void:
	if not card_ui.is_card_played:
		card_ui.position.y -= 60
	card_ui.scale = Vector2(1.2, 1.2)
	card_ui.z_index = 1


func on_mouse_exited() -> void:
	if not card_ui.is_card_played:
		card_ui.position.y += 60
	card_ui.scale = Vector2(1.0, 1.0)
	card_ui.z_index = 0
