@tool
extends Container 

@export var include_internal:bool = false
@export var custom_size:bool = false
@export var screen_size:Vector2 = Vector2(0,0)
func _process(delta: float) -> void:
	
# <><><><><><><><>MUST USE READY FOR REALESE<><>><><><><><><><><>
	var current_size:Vector2
	if custom_size:
		current_size = screen_size
	else:
		current_size = get_viewport_rect().size
	set_size(current_size)
	for c in get_children(include_internal):
		if c.has_method("set_size"):
			c.set_size(size)
# <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
