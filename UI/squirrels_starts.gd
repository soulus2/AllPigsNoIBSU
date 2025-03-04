extends Control

@onready var total_label = $Screen_container/MarginContainer/MarginContainer/VBoxContainer/Big_numbers/Total
@onready var max_label = $Screen_container/MarginContainer/MarginContainer/VBoxContainer/Big_numbers/Max
@onready var evolutions_container = $Screen_container/MarginContainer/MarginContainer/VBoxContainer/ScrollContainer/Evolutions
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#<><><>Here till save-load gets added<><><>
	for i in range(evolutions_container.get_child_count()):
		evolutions_container.get_child(i).text = "Evo "+str(i)+"\n0"
	#<><><><><><><><><><><><><><><><><><><><><>

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	total_label.text = "Total:\n"+str(GlobalStats.total_squirrle_amout)
	max_label.text = "Max:\n"+str(GlobalStats.max_evolution_levels)
	for i in range(evolutions_container.get_child_count()):
		evolutions_container.get_child(i).text = "Evo "+str(i)+"\n"+str(GlobalStats.evolution_amounts[i])
		
		
func _on_background_pressed() -> void:
	queue_free()
