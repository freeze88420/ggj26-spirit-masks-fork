class_name Main
extends Node


const TILE_SIZE: float = 32

const COLLISION_LAYER_WALL: int = 1
const COLLISION_LAYER_MASK: int = 2
const COLLISION_LAYER_WATER: int = 3
const COLLISION_LAYER_BOULDER: int = 4
const COLLISION_LAYER_CHASM: int = 5
const COLLISION_LAYER_HEDGE: int = 6


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_game():
	$Player.snap_to_tiles($StartPosition.position)
	$Player.show()
