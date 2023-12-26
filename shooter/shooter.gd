extends Node2D


@onready var sound = $Sound
@onready var shoot_timer = $ShootTimer

@export var speed: float = 50.0
@export var life_span: float = 10.0
@export var bullet_key: ObjectMaker.BULLET_KEY


var _can_shoot: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shoot_timer_timeout():
	_can_shoot = true
