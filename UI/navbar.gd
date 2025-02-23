extends Control

signal reset
signal open_shop
signal open_squirrles
signal open_options


func _on_home_pressed() -> void:
	emit_signal("reset")

func _on_shop_pressed() -> void:
	emit_signal("open_shop")

func _on_squirrles_pressed() -> void:
	emit_signal("open_squirrles")


func _on_menu_pressed() -> void:
	emit_signal("open_options")
