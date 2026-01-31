class_name FishMask
extends Mask


func _activate_ability():
	# deactivate collision with water
	player.set_collision_mask_value(Main.COLLISION_LAYER_WATER, false)


func _deactivate_ability():
	# activate collision with water
	player.set_collision_mask_value(Main.COLLISION_LAYER_WATER, true)
