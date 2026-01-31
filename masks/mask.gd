@abstract
class_name Mask
extends Node2D
## Base class for masks you can pick up


var player: Player


func activate_ability() -> void:
	_activate_ability()


func deactivate_ability() -> void:
	_deactivate_ability()


@abstract
func _activate_ability()


@abstract
func _deactivate_ability()
