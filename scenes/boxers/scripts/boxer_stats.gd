class_name BoxerStats
extends Stats


@export var starting_deck : CardDeck
@export var combos_learned : Array[Combo]
@export var tokens : Array[Token]


var deck : CardDeck
var discard_pile : CardDeck
var draw_pile : CardDeck


func create_boxer() -> Resource:
	var boxer : BoxerStats = self.duplicate()
	boxer.health = max_health
	boxer.stamina = max_stamina
	boxer.deck = boxer.starting_deck.duplicate(true)
	boxer.draw_pile = CardDeck.new()
	boxer.discard_pile = CardDeck.new()
	return boxer
