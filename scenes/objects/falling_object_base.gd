extends Area2D
class_name FallingObjectBase

@export_group("Movimiento")
@export var min_speed: float = 300.0 : set = set_min_speed, get = get_min_speed
@export var max_speed: float = 600.0 : set = set_max_speed, get = get_max_speed
@export var rotation_speed: float = 5.0 : set = set_rotation_speed, get = get_rotation_speed

@export_group("Juego")
@export var score_value: int = 10 : set = set_score_value, get = get_score_value
@export var is_enemy: bool = false : set = set_is_enemy, get = get_is_enemy

var _velocity: Vector2 = Vector2.ZERO
var _current_rotation_speed: float = 0.0
var _screen_size: Vector2


func _init() -> void:
	_velocity = Vector2.ZERO
	_current_rotation_speed = 0.0


func initialize(start_position: Vector2, difficulty_multiplier: float = 1.0) -> void:
	position = start_position
	min_speed *= difficulty_multiplier
	max_speed *= difficulty_multiplier
	_setup_movement()

func _ready() -> void:
	_screen_size = get_viewport_rect().size
	
	if _velocity == Vector2.ZERO:
		_setup_movement()
		
	var notifier = $VisibleOnScreenNotifier2D
	if notifier:
		if not notifier.screen_exited.is_connected(_on_screen_exited):
			notifier.screen_exited.connect(_on_screen_exited)

func _process(delta: float) -> void:
	position += _velocity * delta
	rotation += _current_rotation_speed * delta

func _setup_movement() -> void:
	var random_speed = randf_range(get_min_speed(), get_max_speed())
	_velocity = Vector2(0, random_speed)
	_current_rotation_speed = randf_range(-get_rotation_speed(), get_rotation_speed())

func hit() -> void:
	queue_free()

func _on_screen_exited() -> void:
	queue_free()

# --- SETTERS & GETTERS ---

func set_min_speed(value: float) -> void:
	if value < 0:
		min_speed = 0.0
	else:
		min_speed = value

func get_min_speed() -> float:
	return min_speed

func set_max_speed(value: float) -> void:
	if value < min_speed:
		max_speed = min_speed
	else:
		max_speed = value

func get_max_speed() -> float:
	return max_speed

func set_rotation_speed(value: float) -> void:
	rotation_speed = value

func get_rotation_speed() -> float:
	return rotation_speed

func set_score_value(value: int) -> void:
	score_value = value

func get_score_value() -> int:
	return score_value

func set_is_enemy(value: bool) -> void:
	is_enemy = value
	if is_enemy and score_value > 0:
		score_value = -score_value

func get_is_enemy() -> bool:
	return is_enemy
