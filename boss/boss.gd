extends Node2D

# value is from the AnimationTree
const TRIGGER_CONDITION: String = "parameters/conditions/on_trigger"
const HIT_CONDITION: String = "parameters/conditions/on_hit"


@onready var animation_tree = $AnimationTree
@onready var visual = $Visual


@export var lives: int = 2
@export var points: int = 5


var _invincible: bool = false

func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


# when trigger is collided
func _on_trigger_area_entered(area):
	if animation_tree[TRIGGER_CONDITION] == false:
		animation_tree[TRIGGER_CONDITION] = true
