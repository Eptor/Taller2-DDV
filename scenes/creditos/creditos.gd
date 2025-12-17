extends MarginContainer

var main_menu = load("res://scenes/menu/menu.tscn")


func _on_regresar_menu_pressed():
	get_tree().change_scene_to_packed(main_menu)
