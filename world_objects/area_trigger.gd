extends Area2D


@export var target: Triggerable


func _on_body_entered(body: Node2D) -> void:
	if target != null:
		target.emit_signal("activated")


func _on_body_exited(body: Node2D) -> void:
	if target != null:
		target.emit_signal("deactivated")
