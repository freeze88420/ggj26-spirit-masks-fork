extends Node
class_name BurningTile

var burn_time: float
var tile_pos: Vector2i
var has_spread: bool

func _init(pos: Vector2i) -> void:
	burn_time = 0.0
	tile_pos = pos
	has_spread = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	burn_time += delta
	pass
