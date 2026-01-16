extends CardState


func enter() -> void:
	#print("dragging state")
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		card_ui.reparent(ui_layer)
	
	Events.card_drag_started.emit(card_ui)
	


func exit() -> void:
	Events.card_drag_ended.emit(card_ui)


func on_input(event : InputEvent) -> void:
	var mouse_motion := event is InputEventMouseMotion
	#var cancel = event.is_action_pressed("right_mouse")
	var confirm = event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse")

	if mouse_motion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
	
	#if cancel:
		#change_card_state.emit(self, CardState.State.BASE)
	
	if confirm:
		get_viewport().set_input_as_handled()
		change_card_state.emit(self, CardState.State.RELEASED)
