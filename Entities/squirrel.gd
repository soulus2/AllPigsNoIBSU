extends Node2D

var isDragging:bool=false
@export var evolutionLevel:int=0
#this function does not work for now
func checkEvolutionCompatability(node:Node2D) -> bool: 
	return node.evolutionLevel == evolutionLevel 
func checkCollision()->void:
	var overlappingAreas:Array[Area2D] = $Area2D.get_overlapping_areas();
	if len(overlappingAreas) == 0:
		return
	
	var nearestArea = {area = null, distance = Vector2.INF}
	for area:Area2D in overlappingAreas:
		var currentDistance = abs(position - area.position)
		if nearestArea.distance > currentDistance and checkEvolutionCompatability(area.get_parent()):
			nearestArea = {area = area, distance = currentDistance}
	
	if nearestArea.area != null:
		evolutionLevel+=1
		changeLabelText(evolutionLevel)
		nearestArea.area.get_parent().queue_free()

func _ready() -> void:
	changeLabelText(evolutionLevel)

func changeLabelText(text:int)->void:
	$Label.text = "Evolution Level %d" % text
func _process(delta: float) -> void:
	if isDragging: 
		position = get_global_mouse_position()

#func _on_touch_screen_button_pressed() -> void:
#	isDragging=true;

#func _on_touch_screen_button_released() -> void:
#	checkCollision()
#	isDragging=false

func checkDragging(event:InputEvent)-> void: 
	if event is InputEventScreenDrag and Input.is_action_pressed("click"):
		isDragging = true


func _on_button_button_down() -> void:
	isDragging=true;


func _on_button_button_up() -> void:
	checkCollision()
	isDragging=false
