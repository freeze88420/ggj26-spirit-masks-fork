class_name Boulder
extends AnimatableBody2D


@export var move_duration: float = 0.15 # seconds
@export var tween_transition: Tween.TransitionType = Tween.TRANS_SINE
@export var tween_ease: Tween.EaseType = Tween.EASE_IN_OUT

var is_moving: bool = false
var tween: Tween


func _ready() -> void:
	snap_to_tiles(position)


# copied over from player script
func snap_to_tiles(pos: Vector2) -> void:
	position = pos.snapped(Vector2.ONE * Main.TILE_SIZE) + Vector2.ONE * Main.TILE_SIZE / 2


# copied over from player script
func can_move_to(movement: Vector2) -> bool:
	var pos: Vector2 = global_position + movement
	
	var tile_pos: Vector2 = $"../TileMapLayer".local_to_map(pos)
	var tile_data: TileData = $"../TileMapLayer".get_cell_tile_data(tile_pos)
	
	if tile_data == null:
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


func _finish_moving():
	is_moving = false
