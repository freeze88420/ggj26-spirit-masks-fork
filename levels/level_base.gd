extends Node2D


var restart_timer: float

func _process(delta: float) -> void:
	if Input.is_action_pressed("restart_level"):
		restart_timer += delta
	else:
		restart_timer = 0.0
		
	if restart_timer > Main.RESTART_DELAY:
		get_tree().reload_current_scene()
