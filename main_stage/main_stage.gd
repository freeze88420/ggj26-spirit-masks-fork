class_name Main
extends Node


const TILE_SIZE: float = 32

const COLLISION_LAYER_WALL: int = 1
const COLLISION_LAYER_MASK: int = 2
const COLLISION_LAYER_WATER: int = 3
const COLLISION_LAYER_BOULDER: int = 4
const COLLISION_LAYER_CHASM: int = 5
const COLLISION_LAYER_HEDGE: int = 6
const RESTART_DELAY: float = 0.4 # seconds

var restart_timer: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("restart_level"):
		restart_timer += delta
	else:
		restart_timer = 0.0
		
	if restart_timer > RESTART_DELAY:
		get_tree().reload_current_scene()


func new_game():
	$Player.snap_to_tiles($StartPosition.position)
	$Player.show()
