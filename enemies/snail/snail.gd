extends EnemyBase


@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var floor_detection = $FloorDetection


func _ready():
	super._ready()


func _physics_process(delta):
	# call parent class _physics_process()
	super._physics_process(delta)
	
	if is_on_floor() == false:
		velocity.y += _gravity * delta
	else:
		velocity.x = speed * _facing
		
	move_and_slide()
	
	# check if snail hits wall or ray cast hitting empty ground
	if is_on_floor():
		if is_on_wall()  or !floor_detection.is_colliding():
			flip_me()
		

func flip_me() -> void: 
	# flip the snail sprite and ray cast
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h 
	floor_detection.position.x = floor_detection.position.x * -1

	if _facing == FACING.LEFT:
		_facing = FACING.RIGHT
	else:
		_facing = FACING.LEFT
