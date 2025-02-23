extends Node

var total_squirrle_amout:int = 0
var evolutions_amount:PackedInt32Array = []
var max_evolution_levels:int = 0
var temp_evolution:int=0

func _ready() -> void:
	evolutions_amount.resize(1000)
func _process(delta: float) -> void:
	if temp_evolution > max_evolution_levels:
		max_evolution_levels=temp_evolution
