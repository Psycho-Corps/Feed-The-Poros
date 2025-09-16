class_name Poro
extends CharacterBody2D

@export var size_label : Label
@export var cooldown : Timer
@export var state_machine : State_Machine

@onready var game : Game = get_parent()

var grid : TileMapLayer
var size : int = 0

func _ready() -> void:
	grid = game.find_child("Grid")

func _process(delta: float) -> void:
	size_label.text = "Size: " + str(size)
	
func _physics_process(delta: float) -> void:
	match cooldown.is_stopped():
		true:
			state_machine.change_state("Wander")
		false:
			state_machine.change_state("Idle")
			

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("feed_poro"):
		pass
