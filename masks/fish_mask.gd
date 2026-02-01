class_name FishMask
extends Mask


func _activate_ability():
	# deactivate collision with water
	player.set_collision_mask_value(Main.COLLISION_LAYER_WATER, false)


func _deactivate_ability():
	# activate collision with water
	player.set_collision_mask_value(Main.COLLISION_LAYER_WATER, true)

func _ready() -> void:
	var stream: AudioStream = load("res://assets/sounds/bubble-pop-406640.mp3")
	$SfxPlayer.stream = stream
