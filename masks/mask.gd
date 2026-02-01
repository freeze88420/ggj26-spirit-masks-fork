class_name Mask
extends Node2D
## Base class for masks you can pick up

# mask sounds
@onready var sfx: AudioStreamPlayer2D = $SfxPlayer
@export var pickup_sfx: AudioStream

@onready var treesNStuff: TileMapLayer = get_tree().current_scene.get_node("TreesAndStuff")

var player: Player


func activate_ability() -> void:
	_activate_ability()


func deactivate_ability() -> void:
	_deactivate_ability()


func _activate_ability():
	pass


func _deactivate_ability():
	pass

func _special_power():
	pass

func get_texture() -> Texture2D:
	return $Sprite2D.texture

func play_pickup_sound():
	# mask sounds
	if sfx.playing:
		sfx.stop()
	sfx.play()
