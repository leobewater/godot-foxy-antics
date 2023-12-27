extends Control

@onready var color_rect = $ColorRect
@onready var vb_level_complete = $ColorRect/VB_LevelComplete
@onready var vb_game_over = $ColorRect/VB_GameOver


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_level_complete.connect(on_level_complete)
	SignalManager.on_game_over.connect(on_game_over)


func _process(delta):
	pass


func show_hud() -> void:
	Engine.time_scale = 0
	color_rect.visible = true


func on_game_over() -> void:
	vb_game_over.visible = true
	show_hud()


func on_level_complete() -> void:
	vb_level_complete.visible = true	
	show_hud()
