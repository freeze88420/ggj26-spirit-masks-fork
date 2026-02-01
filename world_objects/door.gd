extends Triggerable


@export var locked_texture: Texture2D
@export var unlocked_texture: Texture2D
@export var initial_unlocked: bool = false


func _ready() -> void:
	set_unlocked(initial_unlocked)


func set_unlocked(state: bool) -> void:
	$StaticBody2D.set_collision_layer_value(Main.COLLISION_LAYER_WALL, !state)
	$Sprite2D.texture = unlocked_texture if state else locked_texture


func _process(delta: float) -> void:
	set_unlocked(is_triggered())
