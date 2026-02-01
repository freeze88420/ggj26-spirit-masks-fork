class_name Mask
extends Node2D
## Base class for masks you can pick up


var player: Player


func activate_ability() -> void:
	_activate_ability()


func deactivate_ability() -> void:
	_deactivate_ability()


func _activate_ability():
	pass


func _deactivate_ability():
	pass


func get_texture() -> Texture2D:
	return $Sprite2D.texture
