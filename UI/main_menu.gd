extends Control

signal start_game
signal open_options

func _on_start_pressed() -> void:
	emit_signal("start_game")

func _on_options_pressed() -> void:
	emit_signal("open_options")


func _on_quit_pressed() -> void:
	get_tree().quit()
