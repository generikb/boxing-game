class_name Card
extends Resource

enum Type {JAB, CROSS, LEAD_HOOK, REAR_HOOK, LEAD_UPPERCUT, REAR_UPPERCUT, DEFENSE}
enum Target {HEAD, BODY}

@export_group("Card Attributes")
@export var card_type : Type
@export var card_target : Target

@export_group("Card Visuals")
@export var name : String
@export var icon : Texture

@export_group("Card Base Stats")
@export var boxer_health_damage : int = 0
@export var boxer_stamina_damage : int = 0
@export var enemy_health_damage : int = 0
@export var enemy_stamina_damage : int = 0

# processes the card (do health/stamina damage, add/remove tokens, etc)
func play_card(boxer : Boxer, enemy : Enemy, preview_mode : bool) -> void:
	#print("a card was processed!")
	apply_effects(boxer, enemy)

func apply_effects(boxer : Boxer, enemy : Enemy) -> void:
	# Health Damage Dealt to Boxer
	if boxer_health_damage != 0:
		var boxer_damage_effect := DamageEffect.new()
		boxer_damage_effect.amount = boxer_health_damage
		boxer_damage_effect.execute_effect(boxer)
	
	# Health Damage Dealt to Enemy
	if enemy_health_damage != 0:
		var enemy_damage_effect := DamageEffect.new()
		enemy_damage_effect.amount = enemy_health_damage
		enemy_damage_effect.execute_effect(enemy)
	
	# Stamina Damage Dealt to Boxer
	if boxer_stamina_damage != 0:
		var boxer_stamina_effect := StaminaEffect.new()
		boxer_stamina_effect.amount = boxer_stamina_damage
		boxer_stamina_effect.execute_effect(boxer)
	
	# Stamina Damage Dealt to Enemy
	if enemy_stamina_damage != 0:
		var enemy_stamina_effect := StaminaEffect.new()
		enemy_stamina_effect.amount = enemy_stamina_damage
		enemy_stamina_effect.execute_effect(enemy)
