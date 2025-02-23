extends Control

@onready var total_label = $Screen_conteiner/MarginContainer/MarginContainer/VBoxContainer/Big_numbers/Total
@onready var max_label = $Screen_conteiner/MarginContainer/MarginContainer/VBoxContainer/Big_numbers/Max
@onready var evolutions_container = $Screen_conteiner/MarginContainer/MarginContainer/VBoxContainer/ScrollContainer/Evolutions
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	total_label.text = "Total:\n"+str(GlobalStats.total_squirrle_amout)
	max_label.text = "Max:\n"+str(GlobalStats.max_evolution_levels)
	for i in range(evolutions_container.get_child_count()):
		evolutions_container.get_child(i).text = "Evo "+str(i)+"\n"+str(GlobalStats.evolutions_amount[i])
		
		
func _on_background_pressed() -> void:
	queue_free()
