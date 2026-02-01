class_name AreaTrigger
extends Area2D


var collision_stack: int = 0


func _on_body_entered(body: Node2D) -> void:
	collision_stack += 1


func _on_body_exited(body: Node2D) -> void:
	# Hack to prevent negative stack values when a object already collides with the trigger at start
	# of the game. Might not work if there are multiple overlapping objects. A better solution would
	# be to count colliding objects at the start of the game
	collision_stack = max(0, collision_stack - 1)


func is_triggered() -> bool:
	return collision_stack > 0
