extends EnemyBase

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player_detector = $PlayerDetector
@onready var direction_timer = $DirectionTimer


func _physics_process(delta):
	super._physics_process(delta)


func _on_visible_on_screen_notifier_2d_screen_entered():
	animated_sprite_2d.play('fly')
