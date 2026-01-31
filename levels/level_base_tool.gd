@tool
extends Node2D


@export_tool_button("Snap elements to grid", "Callable") var snap_action = _snap_elements_to_grid




func _ready():
	_snap_elements_to_grid()




func _snap_elements_to_grid():
	for child in get_children():
		if child is TileMapLayer:
			continue
		child.position = Main.snap_to_tiles(child.position)
