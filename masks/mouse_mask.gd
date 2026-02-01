class_name MouseMask
extends Mask


func _activate_ability():
	# deactivate collision with water
	player.set_collision_mask_value(Main.COLLISION_LAYER_HEDGE, false)


func _deactivate_ability():
	# activate collision with water
	player.set_collision_mask_value(Main.COLLISION_LAYER_HEDGE, true)

func _ready() -> void:
	var stream: AudioStream = load("res://assets/sounds/cartoon-mouse-96437.mp3")
	$SfxPlayer.stream = stream
