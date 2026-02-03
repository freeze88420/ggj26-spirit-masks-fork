extends Area2D
class_name Flammable

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
		if burn_time > 3:
			_spread_fire()
	

func _burn() -> void:
	is_burning = true
	
func _extinguish() -> void:
	pass
	
func _spread_fire() -> void:
	var neighbours = get_overlapping_areas()
	for n in neighbours:
		if n is Flammable:
			var f: Flammable = n
			if not f.is_burning and not f.has_spread:
				f._burn()
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
