extends Control

@export var main_menu_scene:PackedScene = preload("res://UI/main_menu.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneManager.load_scene(self, main_menu_scene)
	for c in get_children():
		if c.is_in_group("main_menu"):
			c.connect("start_game",start_game)
			c.connect("open_options",open_options)
func _process(delta: float) -> void:
	pass
	
	
func start_game():
	print_debug("started")
func open_options():
	print_debug("options opened")
