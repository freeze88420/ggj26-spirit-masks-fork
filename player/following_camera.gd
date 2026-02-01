extends Node2D


@export var target: Node2D
@export var bounds_object: Node2D


const CAMERA_WIDTH: float = 796
const CAMERA_HEIGHT: float = 448

var min_x: float
var max_x: float
var min_y: float
var max_y: float


func _ready() -> void:
	min_x = bounds_object.get_node("LeftBound").position.x + CAMERA_WIDTH/2 * scale.x
	max_x = bounds_object.get_node("RightBound").position.x - CAMERA_WIDTH/2 * scale.x
	min_y = bounds_object.get_node("UpBound").position.y + CAMERA_HEIGHT/2 * scale.y
	max_y = bounds_object.get_node("DownBound").position.y - CAMERA_HEIGHT/2 * scale.y


func _process(_delta: float) -> void:
	position.x = clampf(target.position.x, min_x, max_x)
	position.y = clampf(target.position.y, min_y, max_y)
