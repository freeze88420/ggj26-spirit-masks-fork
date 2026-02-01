extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func burn_tile(tile_data: TileData, tile_pos: Vector2i) -> void:
	var new_alt = 1 if get_cell_alternative_tile(tile_pos) == 0 else 0
	var source_id = get_cell_source_id(tile_pos)
	var alias_cords = get_cell_atlas_coords(tile_pos)
	set_cell(tile_pos, source_id, alias_cords, new_alt)
	
