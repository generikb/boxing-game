extends CardState

var played : bool


func enter() -> void:
	played = false
	#print("released state")


func on_input(_event : InputEvent) -> void:
	if played:
		return
	
	change_card_state.emit(self, CardState.State.BASE)
