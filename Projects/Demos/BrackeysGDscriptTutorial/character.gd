class_name Character

extends Node

@export var profession: String
@export var health: int

func die():
	print(profession + " died.")
	queue_free()
