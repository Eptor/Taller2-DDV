extends Node2D

@onready var music = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	music.stream = load("res://assets/music/Charlie's Here - Pizza Parlor  Club Penguin OST.mp3")
	music.stream.loop = true
	music.play()

func _exit_tree():
	music.stop()
