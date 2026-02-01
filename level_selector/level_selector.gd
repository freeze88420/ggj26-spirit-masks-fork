class_name LevelSelector
extends Node


@export var levels: Array[LevelData]
static var static_levels: Array[LevelData]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var index: int = 0
	for level in levels:
		var button: Button = Button.new()
		button.text = level.name
		button.connect(
			"pressed",
			func():
				get_tree().change_scene_to_packed(level.scene)
				Main.current_level_index = index
				,
			0
		)
		$MarginContainer/MarginContainer2/CenterContainer/GridContainer.add_child(button)
		index += 1
	
	var first_btn: Control = $MarginContainer/MarginContainer2/CenterContainer/GridContainer.get_child(0)
	first_btn.grab_focus()
	static_levels = levels
