extends Node2D

class_name Squirrel
var isDragging:bool=false
@export var evolutionLevel:int=0

#<><><>Added by Soulus<><><>
@export var do_head_count:bool=true
#<><><><><><><><><><><><><><

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
		evolutionLevel+=1
		
		#<><><>Added by Soulus<><><>
		GlobalStats.dec_evolution_amounts(evolutionLevel-1,2)
		GlobalStats.inc_evolution_amounts(evolutionLevel)
		GlobalStats.dec_total_squirrle_amout()
		#<><><><><><><><><><><><><><
		changeLabelText(evolutionLevel)
		nearestArea.area.get_parent().queue_free()

func _ready() -> void:
	changeLabelText(evolutionLevel)
	#<><><>Added by Soulus<><><>
	play_idle_animation()
	if do_head_count:
		GlobalStats.inc_evolution_amounts(evolutionLevel)
		GlobalStats.inc_total_squirrle_amout()
	#<><><><><><><><><><><><><><

#<><><>Added By Soulus<><><>
func play_idle_animation():
	$AnimationPlayer.play("Idle")
#<><><><><><><><><><><><><><

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
