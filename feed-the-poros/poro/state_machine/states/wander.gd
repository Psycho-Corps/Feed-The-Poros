extends Node

@export var entity : CharacterBody2D

var target : Vector2 = Vector2.ZERO

func enter() -> void:
	print("Entering wander state.")
	
func process(delta : float) -> void:
	wander(delta)

func wander(delta : float) -> void:
	print("Filled cells: " + str(entity.grid.get_used_cells()))
	if target == Vector2.ZERO:
		var cells = entity.grid.get_used_cells()
		target = entity.grid.to_global(entity.grid.map_to_local(cells[entity.game.rng.randi() % cells.size()]))
	
	print("Wandering to " + str(target))
	entity.global_position = entity.global_position.move_toward(target, 250 * delta)
	print("Enemy position: " + str(entity.global_position) + " vs target: " + str(target))
	
	if entity.global_position.distance_to(target) < 0.5:
		entity.global_position = target
		target = Vector2.ZERO
		entity.cooldown.start()
	
	entity.move_and_slide()
	
func exit() -> void:
	print("Exiting wander state.")
