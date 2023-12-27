extends Node2D

# value is from the AnimationTree
const TRIGGER_CONDITION: String = "parameters/conditions/on_trigger"
const HIT_CONDITION: String = "parameters/conditions/on_hit"


@onready var animation_tree = $AnimationTree
@onready var visual = $Visual


@export var lives: int = 2
@export var points: int = 5


var _invincible: bool = false
var _has_triggered: bool = false


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func tween_hit() -> void:
	# when boss is hit, tween the position to 0
	var tween = get_tree().create_tween()
	tween.tween_property(visual, "position", Vector2.ZERO, 1.0)


func reduce_lives() -> void:
	lives -= 1
	print("Boss reduce_lives:", lives)
	if lives <= 0:
		SignalManager.on_boss_killed.emit(points)
		print("Boss dead")
		set_process(false)
		queue_free()


func set_invincible(v: bool) -> void:
	print("Boss set_invincible:", v)
	_invincible = v
	animation_tree[HIT_CONDITION] = v


func take_damage() -> void:
	if _has_triggered == false:
		return
	
	if _invincible == true:
		return
		
	set_invincible(true)
	tween_hit()
	reduce_lives()


# when trigger is collided
func _on_trigger_area_entered(area):
	if animation_tree[TRIGGER_CONDITION] == false:
		animation_tree[TRIGGER_CONDITION] = true
		_has_triggered = true

# when boss hitbox is collided
func _on_hit_box_area_entered(area):
	take_damage()
