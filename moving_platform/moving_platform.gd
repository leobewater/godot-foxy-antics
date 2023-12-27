extends AnimatableBody2D


@export var p1: Marker2D
@export var p2: Marker2D
@export var speed: float = 50.0


var _time_to_move: float = 0.0
var _tween: Tween


func _ready():
	set_time_to_move()
	set_moving()


# when moving platform exit the tree to avoid crash and errors
func _exit_tree():
	_tween.kill()


# calculate the time to move the platform from p1 to p2
func set_time_to_move() -> void:
	var delta = p1.global_position.distance_to(p2.global_position)
	_time_to_move = delta / speed
	

func set_moving() -> void:
	_tween = get_tree().create_tween()
	_tween.set_loops(0)
	_tween.tween_property(self, "global_position", p1.global_position, _time_to_move)
	_tween.tween_property(self, "global_position", p2.global_position, _time_to_move)
