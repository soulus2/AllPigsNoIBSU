extends Node

var default_total_squirrle_amout:int = 0
var default_evolution_amounts:PackedInt32Array = []
var default_max_evolution_levels:int = 0
var default_temp_evolution:int=0

var total_squirrle_amout:int = default_total_squirrle_amout
var evolution_amounts:PackedInt32Array = default_evolution_amounts
var max_evolution_levels:int = default_max_evolution_levels
var temp_evolution:int = default_temp_evolution

var default_data = {
	"total_squirrle_amout":default_total_squirrle_amout,
	"evolution_amounts":default_evolution_amounts,
	"max_evolution_levels":default_max_evolution_levels,
	"temp_evolution":default_temp_evolution,
}

func default():
	total_squirrle_amout = default_total_squirrle_amout
	evolution_amounts = default_evolution_amounts
	max_evolution_levels = default_max_evolution_levels
	temp_evolution = default_temp_evolution
	
func _ready() -> void:
	evolution_amounts.resize(100)
	var data=SaveLoad.load_("squirel_stats")
	if data:
		total_squirrle_amout = data.total_squirrle_amout
		evolution_amounts = data.evolution_amounts
		max_evolution_levels = data.max_evolution_levels
		temp_evolution = data.temp_evolution
		
func update_max_evolution_levels()->void:
	if temp_evolution > max_evolution_levels:
		max_evolution_levels=temp_evolution
		
func get_current_data()->Dictionary:
	return {
		"total_squirrle_amout":total_squirrle_amout,
		"evolution_amounts":evolution_amounts,
		"max_evolution_levels":max_evolution_levels,
		"temp_evolution":temp_evolution,
	}
func set_total_squirrle_amout(amount:int)->void:
	total_squirrle_amout=amount
	SaveLoad.save_(get_current_data(),"squirel_stats")
	
func dec_total_squirrle_amout(amount:int=1)->void:
	total_squirrle_amout-=amount
	SaveLoad.save_(get_current_data(),"squirel_stats")
func inc_total_squirrle_amout(amount:int=1)->void:
	total_squirrle_amout+=amount
	SaveLoad.save_(get_current_data(),"squirel_stats")
	
func set_max_evolution_levels(level:int)->void:
	max_evolution_levels=level
	SaveLoad.save_(get_current_data(),"squirel_stats")
	
func set_temp_evolution(evolution:int)->void:
	temp_evolution=evolution
	SaveLoad.save_(get_current_data(),"squirel_stats")
	
func set_evolution_amounts(index:int,amount:int)->void:
	evolution_amounts[index]=amount
	temp_evolution=index
	update_max_evolution_levels()
	SaveLoad.save_(get_current_data(),"squirel_stats")
	
func dec_evolution_amounts(index:int,amount:int=1)->void:
	evolution_amounts[index]-=amount
	SaveLoad.save_(get_current_data(),"squirel_stats")
	
func inc_evolution_amounts(index:int,amount:int=1)->void:
	evolution_amounts[index]+=amount
	temp_evolution=index
	update_max_evolution_levels()
	SaveLoad.save_(get_current_data(),"squirel_stats")
	
