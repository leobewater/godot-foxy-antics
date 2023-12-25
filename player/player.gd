extends CharacterBody2D


class_name Player


@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer


const GRAVITY: float = 300.0


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# apply gravity to player when it's not on the floor
	if is_on_floor() == false:
		velocity.y += GRAVITY * delta

	move_and_slide()
