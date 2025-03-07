extends Node


func getRandomPosition(from:Vector2, to:Vector2)->Vector2:
	var randX = randi_range(from.x, to.x)
	var randY = randi_range(from.y, to.y)
	return Vector2(randX, randY)
