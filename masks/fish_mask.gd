class_name FishMask
extends Mask


const WATER_COLLISION_LAYER: int = 3


func _activate_ability():
	# deactivate collision with water
	player.set_collision_mask_value(WATER_COLLISION_LAYER, false)


func _deactivate_ability():
	# activate collision with water
	player.set_collision_mask_value(WATER_COLLISION_LAYER, true)
