extends AnimatedSprite2D


func _on_animation_finished():
	# remove this after the animation finished
	queue_free()
