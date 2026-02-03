class_name Obstacle
extends AnimatableBody2D


@export var move_duration: float = 0.15 # seconds
@export var tween_transition: Tween.TransitionType = Tween.TRANS_SINE
@export var tween_ease: Tween.EaseType = Tween.EASE_IN_OUT

var is_moving: bool = false
var tween: Tween

# copied over from player script
func _can_move_to(movement: Vector2) -> bool:
	return false


# copied over from player script
func _move_to(movement: Vector2) -> void:
	pass


func _finish_moving():
	pass
