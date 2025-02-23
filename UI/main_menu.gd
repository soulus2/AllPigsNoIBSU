extends Control

signal start_game

func _on_start_pressed() -> void:
	emit_signal("start_game")

func _on_quit_pressed() -> void:
	get_tree().quit()
