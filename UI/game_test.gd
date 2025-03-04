extends Control

@export_category("Scenes")
@export var squirrel_scene:PackedScene = preload("res://Entities/squirrel.tscn")

@export_category("Spawning")
@export_group("Timer")
@export_range(0.1,100.0,0.001,"or_greater") var min_time:float = 1.0
@export_range(0.1,100.0,0.001,"or_greater") var max_time:float = 10.0

@onready var spawn_timer = $Spawn_timer
var squirrel_level = 0
func _ready() -> void:
	for i in range(len(GlobalStats.evolution_amounts)):
		squirrel_level = i
		for j in range(GlobalStats.evolution_amounts[i]):
			SceneManager.load_scene($Squirrels,squirrel_scene,squirrel_setup_no_head_count)
	squirrel_level = 0
	seed(Time.get_time_dict_from_system().second)
	spawn_timer.wait_time =randf_range(min_time,max_time)
	spawn_timer.start()
	

func squirrel_setup(squirrel:Node2D):
	squirrel.evolutionLevel = squirrel_level
	squirrel.position = Vector2(randi_range(100,get_viewport_rect().size.x-100), randi_range(100,get_viewport_rect().size.y-100))
func squirrel_setup_no_head_count(squirrel:Node2D):
	squirrel.evolutionLevel = squirrel_level
	squirrel.position = Vector2(randi_range(100,get_viewport_rect().size.x-100), randi_range(100,get_viewport_rect().size.y-100))
	squirrel.do_head_count = false
	
func _on_spawn_timer_timeout() -> void:
	SceneManager.load_scene($Squirrels,squirrel_scene,squirrel_setup)
	spawn_timer.wait_time =randf_range(min_time,max_time)
	spawn_timer.start()
