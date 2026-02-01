extends Triggerable


var enabled: bool = true


func _process(delta: float) -> void:
	if enabled && is_triggered():
		get_tree().current_scene._on_goal_completed()
		enabled = false
