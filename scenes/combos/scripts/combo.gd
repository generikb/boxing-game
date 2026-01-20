class_name Combo
extends Resource

enum ComboCardType {ANY_HEAD_SHOT, ANY_BODY_SHOT, ANY_STRAIGHT, ANY_HOOK, ANY_UPPERCUT, ANY_DEFENSE, JAB, CROSS, LEAD_HOOK, REAR_HOOK, LEAD_UPPERCUT, REAR_UPPERCUT, ANY_STRAIGHT_TO_HEAD, ANY_STRAIGHT_TO_BODY, ANY_HOOK_TO_HEAD, ANY_HOOK_TO_BODY, ANY_UPPERCUT_TO_HEAD, ANY_UPPERCUT_TO_BODY, JAB_TO_HEAD, JAB_TO_BODY, CROSS_TO_HEAD, CROSS_TO_BODY, LEAD_HOOK_TO_HEAD, LEAD_HOOK_TO_BODY, REAR_HOOK_TO_HEAD, REAR_HOOK_TO_BODY, LEAD_UPPERCUT_TO_HEAD, LEAD_UPPERCUT_TO_BODY, REAR_UPPERCUT_TO_HEAD, REAR_UPPERCUT_TO_BODY}

@export_group("Card Attributes")
@export var combo_card_list : Array[ComboCardType]

@export_group("Combo Visuals")
@export var name : String

# checks the cards in the play area to see if any match this combo
func is_combo_valid(cards : Array[CardUI]) -> CardUI:
	var combo_check_index : int = 0 # keeping track of which combo card type we're checking
	for card_ui in cards:
		if is_card_valid(card_ui.card, combo_card_list[combo_check_index]):
			combo_check_index += 1
			if combo_check_index == combo_card_list.size():
				print("the cards match combo: ", name)
				return card_ui
		else:
			combo_check_index = 0
	return null


# checks if a specific card in the play area matches the card in the combo sequence
func is_card_valid(card : Card, combo_card_type : ComboCardType) -> bool:
	match combo_card_type:
		ComboCardType.ANY_HEAD_SHOT:
			return card.card_target == card.Target.HEAD and card.card_type != card.Type.DEFENSE
		ComboCardType.ANY_BODY_SHOT:
			return card.card_target == card.Target.BODY and card.card_type != card.Type.DEFENSE
		ComboCardType.ANY_STRAIGHT:
			return card.card_type == card.Type.JAB or card.card_type == card.Type.CROSS
		ComboCardType.ANY_HOOK:
			return card.card_type == card.Type.LEAD_HOOK or card.card_type == card.Type.REAR_HOOK
		ComboCardType.ANY_UPPERCUT:
			return card.card_type == card.Type.LEAD_UPPERCUT or card.card_type == card.Type.REAR_UPPERCUT
		ComboCardType.ANY_DEFENSE:
			return card.card_type == card.Type.DEFENSE
		ComboCardType.JAB:
			return card.card_type == card.Type.JAB
		ComboCardType.CROSS:
			return card.card_type == card.Type.CROSS
		ComboCardType.LEAD_HOOK:
			return card.card_type == card.Type.LEAD_HOOK
		ComboCardType.REAR_HOOK:
			return card.card_type == card.Type.REAR_HOOK
		ComboCardType.LEAD_UPPERCUT:
			return card.card_type == card.Type.LEAD_UPPERCUT
		ComboCardType.REAR_UPPERCUT:
			return card.card_type == card.Type.REAR_UPPERCUT
		ComboCardType.ANY_STRAIGHT_TO_HEAD:
			return card.card_type == card.Type.JAB or card.card_type == card.Type.CROSS and card.card_target == card.Target.HEAD
		ComboCardType.ANY_STRAIGHT_TO_BODY:
			return card.card_type == card.Type.JAB or card.card_type == card.Type.CROSS and card.card_target == card.Target.BODY
		ComboCardType.ANY_HOOK_TO_HEAD:
			return card.card_type == card.Type.LEAD_HOOK or card.card_type == card.Type.REAR_HOOK and card.card_target == card.Target.HEAD
		ComboCardType.ANY_HOOK_TO_BODY:
			return card.card_type == card.Type.LEAD_HOOK or card.card_type == card.Type.REAR_HOOK and card.card_target == card.Target.BODY
		ComboCardType.ANY_UPPERCUT_TO_HEAD:
			return card.card_type == card.Type.LEAD_UPPERCUT or card.card_type == card.Type.REAR_UPPERCUT and card.card_target == card.Target.HEAD
		ComboCardType.ANY_UPPERCUT_TO_BODY:
			return card.card_type == card.Type.LEAD_UPPERCUT or card.card_type == card.Type.REAR_UPPERCUT and card.card_target == card.Target.BODY
		ComboCardType.JAB_TO_HEAD:
			return card.card_type == card.Type.JAB and card.card_target == card.Target.HEAD
		ComboCardType.JAB_TO_BODY:
			return card.card_type == card.Type.JAB and card.card_target == card.Target.BODY
		ComboCardType.CROSS_TO_HEAD:
			return card.card_type == card.Type.CROSS and card.card_target == card.Target.HEAD
		ComboCardType.CROSS_TO_BODY:
			return card.card_type == card.Type.CROSS and card.card_target == card.Target.BODY
		ComboCardType.LEAD_HOOK_TO_HEAD:
			return card.card_type == card.Type.LEAD_HOOK and card.card_target == card.Target.HEAD
		ComboCardType.LEAD_HOOK_TO_BODY:
			return card.card_type == card.Type.LEAD_HOOK and card.card_target == card.Target.BODY
		ComboCardType.REAR_HOOK_TO_HEAD:
			return card.card_type == card.Type.REAR_HOOK and card.card_target == card.Target.HEAD
		ComboCardType.REAR_HOOK_TO_BODY:
			return card.card_type == card.Type.REAR_HOOK and card.card_target == card.Target.BODY
		ComboCardType.LEAD_UPPERCUT_TO_HEAD:
			return card.card_type == card.Type.LEAD_UPPERCUT and card.card_target == card.Target.HEAD
		ComboCardType.LEAD_UPPERCUT_TO_BODY:
			return card.card_type == card.Type.LEAD_UPPERCUT and card.card_target == card.Target.BODY
		ComboCardType.REAR_UPPERCUT_TO_HEAD:
			return card.card_type == card.Type.REAR_UPPERCUT and card.card_target == card.Target.HEAD
		ComboCardType.REAR_UPPERCUT_TO_BODY:
			return card.card_type == card.Type.REAR_UPPERCUT and card.card_target == card.Target.BODY
		_:
			print("combo card didn't match, but this shouldn't happen")
			return false
			
func apply_combo_effects(_boxer : Boxer, _enemy : Enemy) -> void:
	pass
