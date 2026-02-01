class_name AreaTrigger
extends Area2D


var collision_stack: int = 0


func _on_body_entered(body: Node2D) -> void:
	collision_stack += 1


func _on_body_exited(body: Node2D) -> void:
	collision_stack -= 1


func is_triggered() -> bool:
	return collision_stack > 0