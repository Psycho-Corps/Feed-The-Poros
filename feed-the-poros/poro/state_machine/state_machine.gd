class_name State_Machine
extends Node

var states : Dictionary = {}
var curr_state : String = ""

func _ready() -> void:
	for child in get_children():
		states[child.name] = child
	curr_state = "Idle"
	states[curr_state].enter()
	
func _process(delta : float) -> void:
	states[curr_state].process(delta)
	
func change_state(new_state : String) -> void:
	if curr_state != new_state:
		states[curr_state].exit()
		curr_state = new_state
		states[curr_state].enter()
