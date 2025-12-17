extends MarginContainer

var main_level_scene = preload("res://scenes/main_level/main_level.tscn")
var credit_scene = preload("res://scenes/creditos/creditos.tscn")


func _on_start_pressed():
	get_tree().change_scene_to_packed(main_level_scene)


func _on_credits_pressed():
	get_tree().change_scene_to_packed(credit_scene)


func _on_exit_pressed():
	get_tree().quit()
