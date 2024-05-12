extends Node2D

@onready var path_follow_2d = %PathFollow2D
@onready var player = $Player
@onready var game_over = %GameOver
@onready var menu = %Menu

var enemies: Array[CharacterBody2D]

func _on_ready():
	self.visible = false
	game_over.visible = false
	get_tree().paused = true

func _on_menu_start_game():
	get_tree().paused = false
	self.visible = true
	game_over.visible = false

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
	game_over.visible = true
	get_tree().paused = true
	print("paused")

func _on_retry_button_pressed():
	print("pressed")
	player.health = 100
	game_over.visible = false
	clear_enemies()
	get_tree().paused = false

func _on_menu_button_pressed():
	player.health = 100
	game_over.visible = false
	menu.start_menu.visible = true
	clear_enemies()

func clear_enemies():
	for enemy in enemies:
		if enemy != null:
			enemy.queue_free()
	enemies.clear()
