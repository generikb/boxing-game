extends CardState


func enter() -> void:
	#print("clicked state")
	pass


func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		change_card_state.emit(self, CardState.State.DRAGGING)
