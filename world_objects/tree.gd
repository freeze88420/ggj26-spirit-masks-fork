extends Obstacle
class_name TreeObstacle

@onready var burning_texture: Texture2D = load("res://assets/trees/tree2_big_burning.png")
@onready var normal_texture: Texture2D = load("res://assets/trees/tree2_big.png")
@onready var sprite: Sprite2D = $Sprite2D
@onready var burnt_texture: Texture2D = load("res://assets/trees/burnt_tree.png")
