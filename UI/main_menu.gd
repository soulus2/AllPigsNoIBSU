extends Control

signal start_game
signal open_options

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	emit_signal("start_game")

func _on_options_pressed() -> void:
	emit_signal("open_options")


func _on_quit_pressed() -> void:
	get_tree().quit()
