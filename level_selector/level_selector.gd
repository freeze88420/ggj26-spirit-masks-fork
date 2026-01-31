extends Node

#const LEVELS: Dictionary[String, String] = {
#	"Level 1": "res://level_1.tscn",
#	"Prototype Level": "res://main_stage/main_stage.tscn"
#}

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://main_stage/main_stage.tscn"))
