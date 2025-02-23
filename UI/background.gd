@tool
extends Panel
@export_category("Foreground")
@export var foreground_node:Node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []
	
	if foreground_node == null:
		warnings.append("Foreground node must be set")

	return warnings


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if foreground_node==null:
		return
	size = foreground_node.size
	position = foreground_node.position
	
