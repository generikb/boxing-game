class_name Token
extends Resource

enum Type {BLOCK, CRIT, RIPOSTE, DODGE, STRENGTH, WEAK, VULNERABLE, BLIND}

@export var name : String
@export var type : Type
