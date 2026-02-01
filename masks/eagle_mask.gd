class_name EagleMask
extends Mask


func _activate_ability():
	# deactivate collision with water
	player.set_collision_mask_value(Main.COLLISION_LAYER_CHASM, false)


func _deactivate_ability():
	# activate collision with water
	player.set_collision_mask_value(Main.COLLISION_LAYER_CHASM, true)
	
func _ready() -> void:
	var stream: AudioStream = load("res://assets/sounds/eagle-scream-112940.mp3")
	$SfxPlayer.stream = stream
