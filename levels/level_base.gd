extends Node2D

var restart_timer: float
var exit_timer: float
var complete: bool = false

@export_tool_button("Snap elements to grid", "Callable") var snap_action = _snap_elements_to_grid
@onready var inventory: Control = $Inventory
@onready var player: Player = $Player

func _ready():
	_snap_elements_to_grid()
	player.current_mask_changed.connect(inventory.set_current_mask)
	player.inventory_mask_changed.connect(inventory.set_inventory_mask)
	player.inventory_swapped.connect(inventory.switch_slots)
	player.current_mask_dropped.connect(inventory.drop_current)
	player.inventory_mask_dropped.connect(inventory.drop_inventory)

func _process(delta: float) -> void:
	if Input.is_action_pressed("restart_level"):
		restart_timer += delta
	else:
		restart_timer = 0.0
		
	if restart_timer > Main.RESTART_DELAY:
		get_tree().reload_current_scene()

	if Input.is_action_pressed("back_action"):
		if complete: # instantly exit if level is already completed
			exit_to_level_selector()
		else:
			exit_timer += delta
	else:
		exit_timer = 0.0

	if exit_timer > Main.EXIT_DELAY:
		exit_to_level_selector()


func _on_goal_completed() -> void:
	complete = true
	$WorldPlacedObjects/Player.enabled = false
	$LevelCompleteOverlay.show()

func exit_to_level_selector() -> void:
	get_tree().change_scene_to_packed(load("res://level_selector/level_selector.tscn"))
