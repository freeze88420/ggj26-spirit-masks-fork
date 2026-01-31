extends Area2D

signal completed


func _on_body_entered(body: Node2D) -> void:
	emit_signal("completed")
