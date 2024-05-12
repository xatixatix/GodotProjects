extends Node2D

@onready var path_follow_2d = %PathFollow2D
@onready var game_over = %GameOver

func spawn_slime():
	const SLIME = preload("res://characters/spawnables/slime.tscn")
	var newSlime = SLIME.instantiate()
	path_follow_2d.progress_ratio = randf()
	newSlime.global_position = path_follow_2d.global_position
	add_child(newSlime)

func _on_slime_spawn_timer_timeout():
	spawn_slime()

func _on_player_health_depleted():
	game_over.visible = true
	get_tree().paused = true
