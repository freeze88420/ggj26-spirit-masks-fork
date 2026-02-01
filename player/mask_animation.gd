class_name MaskAnimator
extends Node2D


@onready var drop_sprite: Sprite2D = $DropSprite

@onready var pickup_animator: AnimationPlayer = $PickupAnimation
@onready var drop_animator: AnimationPlayer = $DropAnimation


func pickup_mask(mask: Mask) -> void:
	pickup_animator.play("PickupMask")


func drop_mask(mask: Mask) -> void:
	drop_animator.stop()
	drop_sprite.texture = mask.get_texture()
	drop_animator.play("DropMask")


func wear_mask(mask: Mask) -> void:
	pickup_animator.play("WearMask")


func stash_mask(mask: Mask) -> void:
	drop_animator.stop()
	drop_sprite.texture = mask.get_texture()
	drop_animator.play("StashMask")
