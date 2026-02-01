extends Node


@export var levels: Array[LevelData]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level in levels:
		var button: Button = Button.new()
		button.text = level.name
		button.connect(
			"pressed",
			func():
				get_tree().change_scene_to_packed(level.scene),
			0
		)
		$MarginContainer/GridContainer.add_child(button)
	
	var first_btn: Control = $MarginContainer/GridContainer.get_child(0)
	first_btn.grab_focus()
