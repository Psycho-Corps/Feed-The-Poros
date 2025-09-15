extends Node

@export var entity : CharacterBody2D

func enter() -> void:
	print("Entering idle state.")
	
func process(delta : float) -> void:
	print("Processing idle state.")

func exit() -> void:
	print("Exiting idle state.")
