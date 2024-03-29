extends Node2D


@onready var player_cam = $PlayerCam
@onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	# use Engine.time_scale better and can also use tree paused
	#Engine.time_scale = 1
	get_tree().paused = false


func _process(_delta):
	# make camera follows player
	player_cam.position = player.position
	
	# test loading scenes
	'''
	if Input.is_action_just_pressed("left"):
		GameManager.load_main_scene()
	if Input.is_action_just_pressed("right"):
		GameManager.load_next_level_scene()
	'''
