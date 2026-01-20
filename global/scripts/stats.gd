class_name Stats
extends Resource

signal stats_changed

@export var name : String
#@export var image : texture

@export var max_health : int = 100
@export var max_stamina : int = 100

var health : int : set = set_health
var stamina : int : set = set_stamina
var preview_health : int : set = set_preview_health
var preview_stamina : int : set = set_preview_stamina

func _ready() -> void:
	pass

func set_health(value : int) -> void:
	health = clampi(value, 0, max_health)
	#stats_changed.emit()


func set_stamina(value : int) -> void:
	stamina = clampi(value, 0, max_stamina)
	#stats_changed.emit()


func set_preview_health(value : int) -> void:
	preview_health = clampi(value, 0, max_health)
	stats_changed.emit()


func set_preview_stamina(value : int) -> void:
	preview_stamina = clampi(value, 0, max_stamina)
	stats_changed.emit()


func take_health_damage(damage : int) -> void:
	if damage <= 0:
		return
	#TODO: Add some logic regarding blocks/dodges/etc tokens
	self.preview_health -= damage
	print("current health is: ", self.preview_health)

func take_stamina_damage(damage : int) -> void:
	if damage <= 0:
		return
	#TODO: Add some logic regarding blocks/dodges/etc tokens
	self.preview_stamina -= damage
