class_name Main
extends Node


const TILE_SIZE: float = 32

const COLLISION_LAYER_WALL: int = 1
const COLLISION_LAYER_MASK: int = 2
const COLLISION_LAYER_WATER: int = 3
const COLLISION_LAYER_BOULDER: int = 4
const COLLISION_LAYER_CHASM: int = 5
const COLLISION_LAYER_HEDGE: int = 6
const COLLISION_LAYER_TRIGGER: int = 9
const COLLISION_LAYER_FIRE: int = 10

const RESTART_DELAY: float = 0.4 # seconds
const EXIT_DELAY: float = 0.4 # seconds


static var current_level_index: int


static func snap_to_tiles(pos: Vector2) -> Vector2:
	pos += Vector2.ONE * Main.TILE_SIZE /2
	return pos.snapped(Vector2.ONE * Main.TILE_SIZE) - Vector2.ONE * Main.TILE_SIZE / 2

static func snap_to_tile_center(layer: TileMapLayer, pos: Vector2) -> Vector2:
	var cell := layer.local_to_map(pos)
	return layer.map_to_local(cell)
