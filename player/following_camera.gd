extends CharacterBody2D


@export var target: Node2D


const SPEED: float = 2000


func _process(_delta: float) -> void:
	var diff = target.position - position
	velocity = diff.normalized() * SPEED
	
	move_and_slide()
