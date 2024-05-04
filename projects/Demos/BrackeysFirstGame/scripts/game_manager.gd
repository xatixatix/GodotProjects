extends Node

@onready var coin_label = %CoinLabel

var score = 0

func add_point():
	score += 1
	coin_label.text = "Coins: " + str(score)
