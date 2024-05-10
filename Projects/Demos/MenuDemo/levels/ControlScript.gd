extends Control

var coins_value = 0
@onready var coin_label = %CoinLabel
@onready var progress_bar = %ProgressBar

func _ready():
	coin_label.text = str(coins_value)
	progress_bar.set_value_no_signal(coins_value)

func _on_button_button_down():
	coins_value += 1
	coin_label.text = str(coins_value)
	progress_bar.set_value_no_signal(coins_value)
