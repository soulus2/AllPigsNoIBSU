extends Control

@export var main_menu_scene:PackedScene = preload("res://UI/main_menu.tscn") 
@export var game_scene:PackedScene = preload("res://UI/game_test.tscn")
@export var navbar_scene:PackedScene = preload("res://UI/navbar.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneManager.load_scene(self,main_menu_scene)
	GlobalEventListener.connect("reset",reset)
	connect_non_global()
func _process(delta: float) -> void:
	pass

func connect_non_global() -> void:
	for c in get_children():
		if c.is_in_group("main_menu"):
			c.connect("start_game",start_game)
			c.connect("open_options",open_options)

func navbar_setup(navbar:Control) -> void:
	navbar.position = Vector2(0,get_viewport_rect().size.y)
	

func start_game() -> void:
	SceneManager.clear_children(self)
	SceneManager.load_scene(self, game_scene)
	SceneManager.load_scene(self, navbar_scene,navbar_setup)
	

	
func open_options() -> void:
	pass
	
func reset()->void:
	SceneManager.clear_children(self)
	SceneManager.load_scene(self,main_menu_scene)
	connect_non_global()
