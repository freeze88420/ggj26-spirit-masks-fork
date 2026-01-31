extends Control

var current_mask: Mask
var inventory_mask: Mask

@onready var first_slot: TextureRect = $HBoxContainer/FirstSlot
@onready var second_slot: TextureRect = $HBoxContainer/SecondSlot


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#current_mask = $Player.get_current_mask()
	#inventory_mask = $Player.get_inventory_mask()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_current_mask(mask: Mask) -> void:
	var tex = mask.get_texture()
	print("Texture:", tex)
	first_slot.texture = mask.get_texture()

func set_inventory_mask(mask: Mask) -> void:
	var tex = mask.get_texture()
	print("Texture:", tex)
	second_slot.texture = mask.get_texture()

func switch_slots():
	var temp_tex = first_slot.texture
	first_slot.texture = second_slot.texture
	second_slot.texture = temp_tex

func drop_current():
	if second_slot.texture == null:
		first_slot.texture = null
	else :
		first_slot.texture = second_slot.texture
		second_slot.texture = null
	
func drop_inventory():
	second_slot.texture = null
