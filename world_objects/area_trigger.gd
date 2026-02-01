class_name AreaTrigger
extends Area2D


var is_triggered: bool = false


func _on_body_entered(body: Node2D) -> void:
	is_triggered = true


func _on_body_exited(body: Node2D) -> void:
	is_triggered = false
