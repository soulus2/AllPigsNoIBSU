extends Node2D

class_name Squirrel
var isDragging:bool=false
@export var evolutionLevel:int=0


func checkEvolutionCompatability(node:Node2D) -> bool: 
	if node == null: 
		return false
	return (node is Squirrel and node.evolutionLevel == evolutionLevel)
func setGlobalVars()->void:
	#<><><>Added By Soulus<><><>
	GlobalStats.evolutions_amount[evolutionLevel]-=2
	GlobalStats.evolutions_amount[evolutionLevel+1]+=1
	GlobalStats.total_squirrle_amout-=1
	#<><><><><><><><><><><><><><>

func evolve()->void: 
	evolutionLevel+=1
	changeLabelText(evolutionLevel)

func checkSquirrelCollision()->void:
	var overlappingAreas:Array[Area2D] = $Area2D.get_overlapping_areas();
	if len(overlappingAreas) == 0:
		return
	
	var nearestArea = {area = null, distance = Vector2.INF}
	for area:Area2D in overlappingAreas:
		var currentDistance = abs(position - area.position)
		if nearestArea.distance > currentDistance and checkEvolutionCompatability(area.get_parent()):
			nearestArea = {area = area, distance = currentDistance}
	
	if nearestArea.area != null:
		var otherSquirrel:Squirrel = nearestArea.area.get_parent()
		otherSquirrel.queue_free()
		setGlobalVars()
		evolve()


func _ready() -> void:
	#<><><>Added By Soulus<><><>
	changeLabelText(evolutionLevel)
	#<><><><><><><><><><><><><><
	GlobalStats.total_squirrle_amout+=1
	GlobalStats.evolutions_amount[evolutionLevel]+=1

func changeLabelText(text:int)->void:
	$Label.text = "Evolution Level %d" % text
func _process(delta: float) -> void:
	if isDragging: 
		position = get_global_mouse_position()

func checkDragging(event:InputEvent)-> void: 
	if event is InputEventScreenDrag and Input.is_action_pressed("click"):
		isDragging = true


func _on_button_button_down() -> void:
	isDragging=true;


func _on_button_button_up() -> void:
	checkSquirrelCollision()
	isDragging=false
