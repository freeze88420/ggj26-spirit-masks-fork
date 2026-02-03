extends TileMapLayer

@onready var burning_tiles: Array[BurningTile] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for tile in burning_tiles:
		tile._process(delta)
		if tile.burn_time > 3 and not tile.has_spread:
			fire_spread(tile)
	pass

func burn_tile(tile_data: TileData, tile_pos: Vector2i) -> void:
	var burning_tile = BurningTile.new(tile_pos)

	var new_source_id: int = tile_data.get_custom_data("burning_source")
	var burning_atlas_cords: Vector2i = tile_data.get_custom_data("burning_cords")
	set_cell(tile_pos, new_source_id, burning_atlas_cords)
	burning_tiles.push_back(burning_tile)
	
func fire_spread(burning_tile: BurningTile) -> void:
	var tile_pos = burning_tile.tile_pos
	var dirs: Array[Vector2i] = [
		tile_pos + Vector2i.LEFT, 
		tile_pos + Vector2i.RIGHT, 
		tile_pos + Vector2i.UP, 
		tile_pos + Vector2i.DOWN
	]
	print(dirs)
	for n in dirs:
		print(n)
		var tile_data: TileData = get_cell_tile_data(n)
		if tile_data:
			var mat = tile_data.get_custom_data("material")
			var already_burning: bool = !burning_tiles.filter(func(t): return t.tile_pos == n).is_empty()
			print(already_burning)
			if mat == "wood" and not already_burning:
				burn_tile(tile_data, n)
				print("burning tile: ", tile_pos)
	burning_tile.has_spread = true
