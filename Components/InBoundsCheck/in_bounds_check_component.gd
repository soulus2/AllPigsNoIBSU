extends Node2D
class_name InBoundsCheckComponent

#signal out_of_bounds
@export var offset:Vector2
@onready var targetPosition:Vector2
@onready var viewport_rect = get_viewport_rect()
var isReturning = false
var RETURN_SPEED:int = 3
var epsilon = 5

func _process(delta: float) -> void:
	if isReturning:
		get_parent().position = lerp(get_parent().position, targetPosition, 2*delta)
	
	if get_parent().position.distance_to(targetPosition) <= epsilon or get_parent().isDragging:
		isReturning = false

func checkOutOfBounds() -> void:
	
	var parentPos = get_parent().position

	var isOutOfBoundsX = (parentPos.x + offset.x > viewport_rect.end.x or parentPos.x- offset.x < viewport_rect.position.x)
	var isOutOfBoundsY = (parentPos.y - offset.y < viewport_rect.position.y or parentPos.y + offset.y > viewport_rect.end.y)

	if isOutOfBoundsX or isOutOfBoundsY:
		isReturning = true
		targetPosition = GlobalFunctions.getRandomPosition(viewport_rect.position + offset, viewport_rect.end-offset)
		#print("is Out Of Bounds")
		#emit_signal("out_of_bounds")
