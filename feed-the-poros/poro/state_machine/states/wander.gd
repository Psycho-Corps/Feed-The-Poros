extends Node

@export var entity : CharacterBody2D

func enter() -> void:
	print("Entering wander state.")
	
func process(delta : float) -> void:
	wander()

func wander() -> void:
	var cells = entity.grid.get_used_cells()
	var target : Vector2 = cells[entity.game.rng.randi() % cells.size()]
	
	print("Target chosen: " + str(target))
	
	entity.cooldown.start()
	
	#entity.move_and_slide()
	
func exit() -> void:
	print("Exiting wander state.")
