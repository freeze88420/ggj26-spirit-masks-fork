extends Node


@export var levels: Dictionary[String, PackedScene]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level in levels:
		var button: Button = Button.new()
		button.text = level
		button.connect(
			"pressed",
			func():
				get_tree().change_scene_to_packed(levels[level]),
			0
		)
		$MarginContainer/GridContainer.add_child(button)
