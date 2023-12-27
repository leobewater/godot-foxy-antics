extends CanvasLayer


@onready var label_high_score = $VBoxContainer/LabelHighScore


func _ready():
	Engine.time_scale = 1
	label_high_score.text = "Highscore: " + str(ScoreManager.get_high_score())


# load level 1
func _process(delta):
	if Input.is_action_just_pressed('jump'):
		GameManager.load_next_level_scene()
