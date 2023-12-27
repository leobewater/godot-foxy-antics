extends Camera2D


@onready var shake_timer = $ShakeTimer


@export var shake_amount: float = 5.0


func _ready():
	set_process(false)
	SignalManager.on_player_hit.connect(on_player_hit)


func _process(delta):
	offset = get_random_offset()


func get_random_offset() -> Vector2:
	return Vector2(
		randf_range(-shake_amount, shake_amount),
		randf_range(-shake_amount, shake_amount)
	)


# shake camera when player gets hit
func shake() -> void:
	set_process(true)
	shake_timer.start()
	set_process(false)


func on_player_hit(_lives:int) -> void:
	shake()


func _on_shake_timer_timeout():
	set_process(false)
	offset = Vector2.ZERO


