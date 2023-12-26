extends Node


enum BULLET_KEY { PLAYER, ENEMY }
enum SCENE_KEY { EXPLOSION, PICKUP }

const BULLETS = {
	BULLET_KEY.PLAYER: preload("res://bullets/bullet_player/bullet_player.tscn"),
	BULLET_KEY.ENEMY: preload("res://bullets/bullet_enemy/bullet_enemy.tscn")
}

const SIMPLE_SCENES = {
	SCENE_KEY.EXPLOSION: preload("res://enemy_explosion/enemy_explosion.tscn"),
	SCENE_KEY.PICKUP: preload("res://fruit_pick_up/fruit_pick_up.tscn")
}


func add_child_deferred(child_to_add) -> void:
	get_tree().root.add_child(child_to_add)


func call_add_child(child_to_add) -> void:
	# call a function in the main thread when it is not doing anything or when it's idling for better performance 
	call_deferred("add_child_deferred", child_to_add)


func create_bullet(speed: float, direction: Vector2, start_pos: Vector2, life_span: float, key: BULLET_KEY) -> void:
	var new_b = BULLETS[key].instantiate()
	new_b.setup(direction, life_span, speed)
	new_b.global_position = start_pos
	call_add_child(new_b)


func create_simple_scene(start_pos: Vector2, key: SCENE_KEY) -> void:
	var new_item = SIMPLE_SCENES[key].instantiate()
	new_item.global_position = start_pos
	call_add_child(new_item)

