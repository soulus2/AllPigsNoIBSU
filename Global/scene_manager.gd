extends Node


func load_scene(root:Node, scene:PackedScene, setup_function:Callable=Callable()) -> void:
	if !scene.can_instantiate():
		print_debug(scene.resource_name + " can't instantiate")
		return
	var scene_instance = scene.instantiate()
	if setup_function.is_valid():
		setup_function.callv([scene_instance])
	root.add_child(scene_instance)

func clear_children(root:Node):
	for c in root.get_children():
		c.queue_free()
