extends CharacterBody2D

@export var tile_size: int = 16
@export var move_duration: float = 0.15 # seconds
@export var tween_transition: Tween.TransitionType = Tween.TRANS_SINE
@export var tween_ease: Tween.EaseType = Tween.EASE_IN_OUT
#@onready var tilemap: TileMap = get_node


@onready var mask_slot: Node2D = $MaskSlot
var current_mask: Mask


var is_moving: bool = false
var tween: Tween


func _ready() -> void:
	pass


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
	var bodies = $MaskPickupTest.get_overlapping_bodies()
	for body in bodies:
		if body is Mask:
			return body
	return null


func _pickup_mask(mask: Mask) -> void:
	mask.get_parent().remove_child(mask)
	mask.position = Vector2.ZERO
	mask_slot.add_child(mask)
	current_mask = mask


func _can_drop_mask() -> bool:
	var bodies = $MaskPickupTest.get_overlapping_bodies()
	for body in bodies:
		if body is Mask and body != current_mask:
			return false
	return true


func _drop_current_mask() -> void:
	mask_slot.remove_child(current_mask)
	current_mask.position = position
	get_parent().add_child(current_mask)
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
	
	return !tile_data.get_collision_polygons_count(0) > 0


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
