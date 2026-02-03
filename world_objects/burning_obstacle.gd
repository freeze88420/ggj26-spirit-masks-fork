extends Obstacle
class_name BurningObstacle

@onready var surrounding_shape: Area2D = $Area2D

var burn_time: float
var has_spread: bool
var is_burning: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	burn_time = 0.0
	has_spread = false
	is_burning = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_burning:
		burn_time += delta
		_spread_fire()
	

func _burn() -> void:
	is_burning = true
	
func _extinguish() -> void:
	pass
	
func _spread_fire() -> void:
	var neighbours = surrounding_shape.get_overlapping_areas()
	for n in neighbours:
		var b: BurningObstacle = find_owner_of_type(n)
		if b:
			if !b.is_burning:
				b._burn()
		else:
			print("Not a burnable obstacle")
	has_spread = true
	
func _finish_burn() -> void:
	pass
	
func find_owner_of_type(node: Node) -> BurningObstacle:
	var current := node
	while current:
		if current is BurningObstacle:
			return current
		current = current.get_parent()
	return null
