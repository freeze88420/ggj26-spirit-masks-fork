extends Area2D

@export_multiline var text: String = ""
	
func _ready() -> void:
	$Label.text = text
	snap_to_tiles(position)


func _on_body_entered(body: Node2D) -> void:
	$Label.show()
	

func _on_body_exited(body: Node2D) -> void:
	$Label.hide()
	
	
func snap_to_tiles(pos: Vector2) -> void:
	position = pos.snapped(Vector2.ONE * Main.TILE_SIZE) + Vector2.ONE * Main.TILE_SIZE / 2
