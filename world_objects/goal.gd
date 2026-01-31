extends Area2D

func _ready() -> void:
	snap_to_tiles(position)


func _on_body_entered(body: Node2D) -> void:
	get_parent().emit_signal("level_completed")
	
	
func snap_to_tiles(pos: Vector2) -> void:
	position = pos.snapped(Vector2.ONE * Main.TILE_SIZE) + Vector2.ONE * Main.TILE_SIZE / 2
