extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D


const FRUITS: Array = ["melon", "kiwi", "banana", "cherry"]
const GRAVITY: float = 160.0
const JUMP: float = -80.0
const POINTS: int = 2

var _start_y: float
var _speed_y: float = JUMP
var _stopped: bool = false


func _ready():
	# set initial y position
	_start_y = global_position.y
	# pick random fruit animation from array to play 
	animated_sprite_2d.play(FRUITS.pick_random())


func _process(delta):
	if _stopped:
		return
	
	# make fruit jumps up initially and falls back down
	position.y += _speed_y * delta
	_speed_y += GRAVITY * delta

	if global_position.y > _start_y:
		_stopped = true


func kill_me() -> void:
	set_process(false)
	hide()
	queue_free()


func _on_life_timer_timeout():
	kill_me()


# fruit collision collided
func _on_area_entered(area):
	print("Pickup collected")
	SignalManager.on_pickup_hit.emit(POINTS)
	kill_me()
