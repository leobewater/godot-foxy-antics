extends Node

# save json score data to file
const HS_FILE: String = "user://SCORES.dat"
const HS_KEY: String = "highscore"

var _score: int = 0
var _high_score: int = 0


func _ready():
	load_highscore()


func _process(delta):
	pass


func save_highscore() -> void:
	var file = FileAccess.open(HS_FILE, FileAccess.WRITE)
	var data = {
		HS_KEY: _high_score
	}
	file.store_string(JSON.stringify(data))
	print("save_highscore:", data)


func load_highscore() -> void:
	if FileAccess.file_exists(HS_FILE) == false:
		return
	
	var file = FileAccess.open(HS_FILE, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	
	print("data:", data)
	
	if HS_KEY in data:
		_high_score = data[HS_KEY]
		print("loaded _high_score:", _high_score)


