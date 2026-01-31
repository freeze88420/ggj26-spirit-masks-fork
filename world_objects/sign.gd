extends Area2D


@export_multiline var text: String = ""


func _ready() -> void:
	$Label.text = text


func _on_body_entered(body: Node2D) -> void:
	$Label.show()
	

func _on_body_exited(body: Node2D) -> void:
	$Label.hide()
