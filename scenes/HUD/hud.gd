extends CanvasLayer

@onready var score_label: Label = $Score/ScoreLabel
@onready var life_label: Label = $Life/LifeLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_life_update.connect(update_life)
	SignalManager.on_score_update.connect(update_score)

func _process(delta):
	pass

func update_score(new_score: int):
	score_label.text = "Score: " + str(new_score)

func update_life(new_life: int):
	life_label.text = "❤️ x " + str(new_life)
