extends Node

func load_scene(root:Node, scene:PackedScene) -> void:
	if !scene.can_instantiate():
		print_debug(scene.resource_name + " can't instantiate")
		return
	var scene_instance = scene.instantiate()
	root.add_child(scene_instance)

func clear_children(root:Node):
	for c in root.get_children():
		remove_child(c)
