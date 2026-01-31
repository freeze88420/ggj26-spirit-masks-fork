class_name Mask
extends Node2D
## Base class for masks you can pick up


@export var tile_size: int = 32

var player: Player


func activate_ability() -> void:
	_activate_ability()


func deactivate_ability() -> void:
	_deactivate_ability()


func _activate_ability():
	pass


func _deactivate_ability():
	pass


func _ready() -> void:
	snap_to_tiles(position)


func snap_to_tiles(pos: Vector2) -> void:
	position = pos.snapped(Vector2.ONE * tile_size) + Vector2.ONE * tile_size / 2
