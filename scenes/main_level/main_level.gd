extends Node2D

@onready var music = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	music.stream = load("res://assets/music/Charlie's Here - Pizza Parlor  Club Penguin OST.mp3")
	music.stream.loop = true
	music.play()
	SignalManager.on_set_lives.connect(set_lives)
	set_lives()

func _exit_tree():
	music.stop()


func set_lives():
	SignalManager.on_set_lives.emit(GameManager.initial_lives)
	print("Me llamaste niga")
	
