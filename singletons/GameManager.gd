extends Node
@export var initial_lives: int = 2

var score: int = 0
var lives: int = 0
var is_game_active: bool = true
var main_menu_scene: PackedScene = load("res://scenes/menu/menu.tscn")

@onready var dashboard: PackedScene = load("res://scenes/HUD/hud.tscn")

func _ready() -> void:
	score = 0
	lives = initial_lives
	SignalManager.on_restar_game.connect(reset_game)

func reset_game() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_packed(main_menu_scene)

func add_score(points: int) -> void:
	if not is_game_active: return
	
	score += points
	print("Puntos:")
	print(score)
	SignalManager.on_score_update.emit(score)

func lose_life() -> void:
	if not is_game_active: return
	
	lives -= 1
	SignalManager.on_life_update.emit(lives)
	
	print("Vidas:")
	print(lives)
	if lives <= 0:
		print("Muertod")
		die()

func die() -> void:
	#is_game_active = false
	SignalManager.on_player_defeated.emit()
