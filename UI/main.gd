extends Control

@export_category("Scenes")
@export var main_menu_scene:PackedScene = preload("res://UI/main_menu.tscn") 
@export var game_scene:PackedScene = preload("res://UI/game_test.tscn")
@export var navbar_scene:PackedScene = preload("res://UI/navbar.tscn")
@export var Squirrles_starts_scene:PackedScene = preload("res://UI/squirrles_starts.tscn")
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
			if not c.is_connected("start_game",start_game):
				c.connect("start_game",start_game)
		if c.is_in_group("navbar"):
			if not c.is_connected("reset",reset):
				c.connect("reset",reset)
			if not c.is_connected("open_squirrles", open_squirrles):
				c.connect("open_squirrles", open_squirrles)
func start_game() -> void:
	SceneManager.clear_children(self)
	SceneManager.load_scene(self, game_scene)
	SceneManager.load_scene(self, navbar_scene)
	connect_non_global()
	
func reset()->void:
	SceneManager.clear_children(self)
	SceneManager.load_scene(self,main_menu_scene)
	connect_non_global()

func open_squirrles():
	SceneManager.load_scene(self, Squirrles_starts_scene)
