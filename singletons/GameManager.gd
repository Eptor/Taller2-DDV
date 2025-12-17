extends Node

signal score_updated(new_score)
signal lives_updated(new_lives)
signal game_over

@export var initial_lives: int = 3

var score: int = 0
var lives: int = 3
var is_game_active: bool = true

func _ready() -> void:
	reset_game()

func reset_game() -> void:
	score = 0
	lives = initial_lives
	is_game_active = true
	
	score_updated.emit(score)
	lives_updated.emit(lives)

func add_score(points: int) -> void:
	if not is_game_active: return
	
	score += points
	print("Puntos:")
	print(score)
	score_updated.emit(score)

func lose_life() -> void:
	if not is_game_active: return
	
	lives -= 1
	lives_updated.emit(lives)
	
	print("Vidas:")
	print(lives)
	if lives <= 0:
		die()

func die() -> void:
	is_game_active = false
	game_over.emit()
