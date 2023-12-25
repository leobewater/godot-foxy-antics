extends CharacterBody2D

class_name EnemyBase

enum FACING { LEFT = -1, RIGHT = 1}

# kill element based on this offset
const OFF_SCREEN_KILL_ME: float = 1000.0

@export var default_facing: FACING = FACING.LEFT
@export var points: int = 1

var _speed: float = 30.0
var _gravity: float = 800.0
var _facing: FACING = default_facing
var _player_ref: Player
var _dying: bool = false


func _ready():
	_player_ref = get_tree().get_nodes_in_group(GameManager.GROUP_PLAYER)[0]


func _physics_process(delta):
	fallen_off()


func fallen_off() -> void:
	# remove element after y position if greater than offset
	if global_position.y > OFF_SCREEN_KILL_ME:
		queue_free()
