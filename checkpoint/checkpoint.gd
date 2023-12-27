extends Area2D


# value is from the AnimationTree
const TRIGGER_CONDITION: String = "parameters/conditions/on_trigger"


@onready var animation_tree = $AnimationTree


func _ready():
	SignalManager.on_boss_killed.connect(on_boss_killed)


func on_boss_killed(_p: int) -> void:
	animation_tree[TRIGGER_CONDITION] = true
	monitoring = true
