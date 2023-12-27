extends Area2D


# value is from the AnimationTree
const TRIGGER_CONDITION: String = "parameters/conditions/on_trigger"


@onready var animation_tree = $AnimationTree
@onready var sound = $Sound


func _ready():
	SignalManager.on_boss_killed.connect(on_boss_killed)


# checkpoint appears only after killing the boss
func on_boss_killed(_p: int) -> void:
	animation_tree[TRIGGER_CONDITION] = true
	monitoring = true
	SoundManager.play_clip(sound, SoundManager.SOUND_WIN)


func _on_area_entered(area):
	print("LEVEL COMPLETE")
