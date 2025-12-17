extends FallingObjectBase


func _ready() -> void:
	super._ready()
	is_enemy = true
	score_value = -10
	


func _process(delta: float) -> void:
	super._process(delta)
