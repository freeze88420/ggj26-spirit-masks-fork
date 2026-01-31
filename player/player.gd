class_name Player
extends CharacterBody2D

@export var tile_size: int = 32
@export var move_duration: float = 0.15 # seconds
@export var tween_transition: Tween.TransitionType = Tween.TRANS_SINE
@export var tween_ease: Tween.EaseType = Tween.EASE_IN_OUT


@onready var mask_slot: Node2D = $MaskSlot
var current_mask: Mask


var is_moving: bool = false
var tween: Tween


func _ready() -> void:
	snap_to_tiles(position)


func _process(delta: float) -> void:
	if not is_moving:
		var input_direction: Vector2 = get_input_direction()
		
		if input_direction != Vector2.ZERO:
			$Body.set_rotation(Vector2.RIGHT.angle_to(input_direction))
			var next_position: Vector2 = position + input_direction * tile_size
			
			if can_move_to(next_position):
				move_to(next_position)
	
	if Input.is_action_just_pressed("mask_interact"):
		if current_mask:
			if _can_drop_mask():
				_drop_current_mask()
		else:
			var mask = _can_pickup_mask()
			if mask:
				_pickup_mask(mask)


func _can_pickup_mask() -> Mask:
	# check if you are standing on a mask
	var bodies = $MaskPickupTest.get_overlapping_bodies()
	
	for body in bodies:
		if body is Mask:
			print('found mask')
			return body
	return null


func _pickup_mask(mask: Mask) -> void:
	mask.get_parent().remove_child(mask)
	mask.position = Vector2.ZERO
	mask.player = self
	mask.activate_ability()
	mask_slot.add_child(mask)
	current_mask = mask


func _can_drop_mask() -> bool:
	# can't drop your mask if you are standing on another mask
	var bodies = $MaskPickupTest.get_overlapping_bodies()
	for body in bodies:
		if body is Mask and body != current_mask:
			return false
	return true


# drop your mask onto the world
func _drop_current_mask() -> void:
	mask_slot.remove_child(current_mask)
	current_mask.snap_to_tiles(position)
	current_mask.deactivate_ability()
	get_parent().add_child(current_mask)
	
	# This is an ugly hack. 
	# after the mask is dropped the player needs to move away and 
	# then back onto it to be able to pick it up again.
	# Otherwise the player can get stuck if they drop the salmon mask while in the water.
	position.x += 100
	position.x -= 100
	
	current_mask = null


func get_input_direction() -> Vector2:
	var input_direction: Vector2 = Input.get_vector(
		"player_move_left",
		"player_move_right",
		"player_move_up",
		"player_move_down"
	)
	
	if input_direction != Vector2.ZERO:
		if abs(input_direction.x) > abs(input_direction.y):
			return Vector2(sign(input_direction.x), 0)
		else:
			return Vector2(0, sign(input_direction.y))
			
	return Vector2.ZERO


func can_move_to(pos: Vector2) -> bool:
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


func move_to(target_pos: Vector2) -> void:
	is_moving = true
	
	if tween:
		tween.kill()
		
	tween = create_tween()
	#tween.set_parallel(true);
	tween.tween_property(self, "position", target_pos, move_duration)
	tween.set_trans(tween_transition)
	tween.set_ease(tween_ease)
	tween.finished.connect(func(): is_moving = false)


func snap_to_tiles(pos: Vector2) -> void:
	position = pos.snapped(Vector2.ONE * tile_size) + Vector2.ONE * tile_size / 2
