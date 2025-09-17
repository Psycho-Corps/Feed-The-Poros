class_name Player
extends Node2D

@export var snack_counter : Label

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("spawn_snack"):
		snack_counter.snacks += 1
