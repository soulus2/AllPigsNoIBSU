extends Node

@warning_ignore("unused_signal")
signal reset
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		emit_signal("reset")
