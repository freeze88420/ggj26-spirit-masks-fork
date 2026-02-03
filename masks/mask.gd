class_name Mask
extends Node2D
## Base class for masks you can pick up

# mask sounds
@onready var sfx: AudioStreamPlayer2D = $SfxPlayer
@export var pickup_sfx: AudioStream

@onready var power_distance: int = 25
@onready var power_area = $PowerArea
@onready var power_sprite = $PowerArea/Sprite2D
@onready var power_duration: float = 1.5
@onready var is_using_power:bool = false

@onready var treesNStuff: TileMapLayer = get_tree().current_scene.get_node("TreesAndStuff")

var player: Player

func _process(delta: float) -> void:
	if player:
		var input_direction: Vector2 = player.get_input_direction()
		if input_direction != Vector2.ZERO:
			power_area.position = input_direction * power_distance
	if is_using_power:
		power_duration -= delta
		if power_duration <= 0:
			is_using_power = false
			power_sprite.hide()
		else:
			_use_power()
			
	elif power_duration < 1.5:
		power_duration = 1.5

func activate_ability() -> void:
	_activate_ability()


func deactivate_ability() -> void:
	_deactivate_ability()


func _activate_ability():
	pass

func _deactivate_ability():
	pass

func _special_power():
	is_using_power = true
	power_sprite.show()

func get_texture() -> Texture2D:
	return $Sprite2D.texture

func _use_power():
	pass

func play_pickup_sound():
	# mask sounds
	if sfx.playing:
		sfx.stop()
	sfx.play()
