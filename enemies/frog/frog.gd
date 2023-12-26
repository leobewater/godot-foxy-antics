extends EnemyBase


@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var jump_timer = $JumpTimer


const JUMP_VELOCITY: Vector2 = Vector2(100, -150)
const JUMP_WAIT_RANGE: Vector2 = Vector2(2.5, 5.0) # wait time range for jump timer

# frog can only jump after seeing the player
var _jump: bool = false
var _seen_player: bool = false


func _ready():
	jump_timer.wait_time = randf_range(JUMP_WAIT_RANGE.x, JUMP_WAIT_RANGE.y)
	jump_timer.start()


func _physics_process(delta):
	super._physics_process(delta)
	
	if is_on_floor() == false:
		velocity.y += _gravity * delta
	else:
		velocity.x = 0
		animated_sprite_2d.play('idle')
		
	move_and_slide()
	
		
func _on_jump_timer_timeout():
	_jump = true
	

func _on_visible_on_screen_notifier_2d_screen_entered():
	print("_seen_player")
	_seen_player = true
