extends Flammable

@onready var tree: TreeObstacle = get_parent()

func _process(delta: float) -> void:
	super._process(delta)

func _burn() -> void:
	super._burn()
	tree.sprite.texture = tree.burning_texture
