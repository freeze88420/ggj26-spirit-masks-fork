extends Flammable

@onready var tree: TreeObstacle = get_parent()

func _process(delta: float) -> void:
	super._process(delta)
	if burn_time > 5 and is_burning:
		_finish_burn()

func _burn() -> void:
	super._burn()
	tree.sprite.texture = tree.burning_texture

func _finish_burn() -> void:
	is_burning = false
	tree.sprite.texture = tree.burnt_texture
