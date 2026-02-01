class_name BearMask
extends Mask


func _activate_ability():
	player.can_push_boulders = true


func _deactivate_ability():
	player.can_push_boulders = false
	
func _ready() -> void:
	var stream: AudioStream = load("res://assets/sounds/Beast_SoftGrowl.wav")
	$SfxPlayer.stream = stream
