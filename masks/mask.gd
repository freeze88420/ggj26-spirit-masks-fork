class_name Mask
extends Node2D
## Base class for masks you can pick up


var player: Player


func _ready() -> void:
	snap_to_tiles(position)


func activate_ability() -> void:
	_activate_ability()


func deactivate_ability() -> void:
	_deactivate_ability()


func _activate_ability():
	pass


func _deactivate_ability():
	pass


func snap_to_tiles(pos: Vector2) -> void:
	position = pos.snapped(Vector2.ONE * Main.TILE_SIZE) + Vector2.ONE * Main.TILE_SIZE / 2
