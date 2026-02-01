class_name EagleMask
extends Mask


func _activate_ability():
	# deactivate collision with water
	player.set_collision_mask_value(Main.COLLISION_LAYER_CHASM, false)


func _deactivate_ability():
	# activate collision with water
	player.set_collision_mask_value(Main.COLLISION_LAYER_CHASM, true)

func _special_power():
	var input_direction: Vector2 = player.get_input_direction()
	if input_direction == Vector2.ZERO:
		return
	print("input dir ", input_direction)
	var movement = input_direction * Main.TILE_SIZE
	var neighbour_pos: Vector2i = player.position + movement
	var neighbour_tile_pos: Vector2i = treesNStuff.local_to_map(neighbour_pos)
	var tile_data: TileData = treesNStuff.get_cell_tile_data(neighbour_tile_pos)
	if tile_data:
		var mat = tile_data.get_custom_data("material")
		if mat == "wood":
			treesNStuff.burn_tile(tile_data, neighbour_tile_pos)
	else:
		print("No Tile data at:", neighbour_pos)
	
	
func _ready() -> void:
	var stream: AudioStream = load("res://assets/sounds/eagle-scream-112940.mp3")
	$SfxPlayer.stream = stream
