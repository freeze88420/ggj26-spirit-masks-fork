@tool
extends Node2D


@export_tool_button("Snap elements to grid", "Callable") var snap_action = _snap_elements_to_grid



func _snap_elements_to_grid():
	for child in get_children():
		child.position = child.position.snapped(Vector2.ONE * Main.TILE_SIZE)
