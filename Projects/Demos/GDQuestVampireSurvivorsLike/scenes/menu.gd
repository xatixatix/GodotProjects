extends Control

signal start_game
@onready var start_menu = %StartMenu

func _on_play_button_pressed():
	start_game.emit()
	start_menu.visible = false

func _on_quit_button_pressed():
	get_tree().quit()

func _on_ready():
	start_menu.visible = true
