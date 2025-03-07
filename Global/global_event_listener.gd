extends Node

@warning_ignore("unused_signal")
signal reset
signal drop_acorn(acorns) #emits when squirrel evolves idk

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		emit_signal("reset")
