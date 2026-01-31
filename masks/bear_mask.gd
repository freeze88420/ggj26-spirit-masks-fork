class_name BearMask
extends Mask


func _activate_ability():
	player.can_push_boulders = true


func _deactivate_ability():
	player.can_push_boulders = false
