extends CharacterBody2D


@export var target: Node2D


const SPEED: float = 2000


func _process(_delta: float) -> void:
	var diff = target.position - position
	velocity = diff.normalized() * SPEED if diff.length() > $Camera2D.position_smoothing_speed else Vector2.ZERO
	
	move_and_slide()
