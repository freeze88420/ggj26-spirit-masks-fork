class_name Triggerable
extends Node2D


@export var sources: Array[AreaTrigger] = []
@export var require_all_sources_triggered: bool = true


func is_triggered() -> bool:
	return all_triggered() if require_all_sources_triggered else any_triggered()
	
	
func all_triggered() -> bool:
	for trigger in sources:
		if !trigger.is_triggered():
			return false
	return true
	
	
func any_triggered() -> bool:
	for trigger in sources:
		if trigger.is_triggered():
			return true
	return false