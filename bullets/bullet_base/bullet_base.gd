extends Area2D


var _direction: Vector2 = Vector2.RIGHT
var _life_span: float = 20.0 # 20s life span
var _life_time: float = 0.0


func _ready():
	pass # Replace with function body.


func _process(delta):
	check_expired(delta)
	position += _direction * delta
	
	
func setup(dir: Vector2, life_span: float, speed: float) -> void:
	_direction = dir.normalized() * speed
	_life_span = life_span
	
	
func check_expired(delta: float) -> void:
	_life_time += delta
	if _life_time > _life_span:
		queue_free()


# when bullet hits enemy/player hitbox based on the mask setting then remove itself
func _on_area_entered(_area):
	print("bullet are entered by ", _area)
	queue_free()
