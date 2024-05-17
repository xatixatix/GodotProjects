extends Node2D

func _input(event):
	if event.is_action_pressed("start"):
		$CPUParticles2D.emitting = true
