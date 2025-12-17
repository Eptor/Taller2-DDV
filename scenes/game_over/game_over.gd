extends CanvasLayer

var can_return_to_menu: bool = false

func _ready():
	SignalManager.on_player_defeated.connect(show_game_over)


func _process(delta):
	if(Input.is_action_just_pressed("continuar") and can_return_to_menu):
		SignalManager.on_restar_game.emit()

func show_game_over():
	get_tree().paused = true
	visible = true
	can_return_to_menu = true
