class_name Boulder
extends AnimatableBody2D


@export var move_duration: float = 0.15 # seconds
@export var tween_transition: Tween.TransitionType = Tween.TRANS_SINE
@export var tween_ease: Tween.EaseType = Tween.EASE_IN_OUT
@onready var tilemap: TileMapLayer = get_tree().current_scene.get_node("Ground")

var is_moving: bool = false
var tween: Tween

var water_pos: Vector2i;
var is_in_water: bool = false

# copied over from player script
func can_move_to(movement: Vector2) -> bool:
	var pos: Vector2 = global_position + movement

	# If we have a tilemap, check if we are standing on a tile.
	if tilemap != null:
		var tile_pos: Vector2i = tilemap.local_to_map(pos)
		if tilemap.get_cell_tile_data(tile_pos) == null:
			return false

	var motion: Vector2 = pos - global_position
	var params: PhysicsTestMotionParameters2D = PhysicsTestMotionParameters2D.new()
	params.from = global_transform
	params.motion = motion
	
	var result: PhysicsTestMotionResult2D = PhysicsTestMotionResult2D.new()
	var collided: bool = PhysicsServer2D.body_test_motion(get_rid(), params, result)

	return !collided


# copied over from player script
func move_to(movement: Vector2) -> void:
	var target_pos: Vector2 = position + movement
	
	is_moving = true
	
	if tween:
		tween.kill()
		
	tween = create_tween()
	#tween.set_parallel(true);
	tween.tween_property(self, "position", target_pos, move_duration)
	tween.set_trans(tween_transition)
	tween.set_ease(tween_ease)
	tween.finished.connect(_finish_moving)
	position = Main.snap_to_tile_center(tilemap, target_pos)

func start_drag() -> void:
	set_collision_layer_value(Main.COLLISION_LAYER_BOULDER, false)

func end_drag() -> void:
	if is_in_water == false:
		set_collision_layer_value(Main.COLLISION_LAYER_BOULDER, true)
		
func check_water_situation():
	print("Checking water situation")
	if tilemap != null:
		var tile_pos: Vector2i = tilemap.local_to_map(position)
		print(tile_pos)
		var source_id: int = tilemap.get_cell_source_id(tile_pos)
		var tiledata: TileData = tilemap.get_cell_tile_data(tile_pos)
		if tiledata:
			var type: String = tiledata.get_custom_data("type")
			if type == "water":
				tilemap.set_cell(tile_pos, source_id, Vector2i(5, 0))
				start_drag()
				water_pos = tile_pos
				is_in_water = true
				position = Main.snap_to_tiles(position)
			else:
				is_in_water = false
			print("This is the Type: ", tiledata.get_custom_data("type"))
		else:
			print("There's no tiledata")
	else:
		print("no tilemap")


func _finish_moving():
	is_moving = false
