class_name Poro
extends CharacterBody2D

@export var cooldown : Timer
@export var state_machine : State_Machine

@onready var game : Game = get_parent()

var grid : TileMapLayer

func _ready() -> void:
	grid = game.find_child("Grid")
	
func _physics_process(delta: float) -> void:
	match cooldown.is_stopped():
		true:
			state_machine.change_state("Wander")
		false:
			state_machine.change_state("Idle")
