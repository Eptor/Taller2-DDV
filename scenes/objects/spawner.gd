extends Node2D

@export var object_templates: Array[PackedScene] = []
@onready var _timer: Timer = $Timer
var _screen_size: Vector2

func _ready() -> void:
	_screen_size = get_viewport_rect().size
	_setup_timer()

func _setup_timer() -> void:
	_timer.timeout.connect(_on_spawn_timer_timeout)
	_timer.start()

func _on_spawn_timer_timeout() -> void:
	print("HOLA")
	spawn_object()

func spawn_object() -> void:
	if object_templates.is_empty():
		push_warning("No has asignado escenas al Spawner en el Inspector")
		return

	var random_scene = object_templates.pick_random()
	var instance = random_scene.instantiate()
	
	var margin = 50.0
	var random_x = randf_range(margin, _screen_size.x - margin)
	var spawn_pos = Vector2(random_x, -60) # -60 para que nazca fuera de cámara
	
	add_child(instance)
	
	if instance.has_method("initialize"):
		instance.initialize(spawn_pos, 1.0)
