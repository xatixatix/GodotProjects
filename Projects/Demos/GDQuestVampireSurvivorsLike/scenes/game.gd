extends Node2D

@onready var path_follow_2d = %PathFollow2D
@onready var player = $Player
@onready var game_over = %GameOver

var enemies: Array[CharacterBody2D]

func spawn_slime():
	const SLIME = preload("res://characters/spawnables/slime.tscn")
	var newSlime = SLIME.instantiate()
	path_follow_2d.progress_ratio = randf()
	newSlime.global_position = path_follow_2d.global_position
	add_child(newSlime)
	enemies.append(newSlime)

func _on_slime_spawn_timer_timeout():
	spawn_slime()

func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
	print("paused")

func _on_retry_button_pressed():
	print("pressed")
	player.health = 100
	%GameOver.visible = false
	
	for enemy in enemies:
		if enemy != null:
			enemy.queue_free()
	
	enemies.clear()
	get_tree().paused = false
