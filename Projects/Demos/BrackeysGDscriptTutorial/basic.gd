extends Node

@onready var label = $"../Label"
@onready var character_2 = $"../Character2"

@export var unit_aligment = Alignment.ALLY
@export var sprite: Sprite2D

signal ready_signal
var health: int = 100
var chest := Equipment.new(10, 5)
enum Alignment { ALLY, NEUTRAL, ENEMY }

func _ready():
	# This is a comment
	print("Hello world") # Printing in the console
	label.text = "Hello world!" # Changing the label text in the scene
	label.modulate = Color.GREEN # Changing the label text color in the scene
	print("Health is: " + str(health)) # Write health in the console
	
	# Positions
	var position2D = Vector2(1,5)
	var position3D = Vector3(1,2,3)
	position2D.x += 2 # (1,5) --> (3,5)
	print(position2D)
	
	# Function call
	print("What is 1 + 2: " + str(add(1, 2)))
	
	# Random
	var roll = randf()
	if roll <= 0.8:
		print("Common item")
	else:
		print("Rare item")
	
	var character_height = randi_range(140, 200)
	print("Your character is " + str(character_height) + " heigh.")
	
	# Arrays
	var items: Array[String] = ["Potion", "Feather", "Hide"]
	print(items[0])
	items[0] = "New Potion"
	print(items[0])
	items.remove_at(1)
	items.append("Sword")
	for item in items:
		print(item)
	var glass := 0.0
	while glass < 0.5:
		glass += randf_range(0.0, 0.5)
		print(glass)
	
	# Dictionary key-value
	var players = {
		"Crook":	{"Level": 1, "Health": 80}, 
		"Villain": 	{"Level": 35, "Health": 150}, 
		"Boss": 	{"Level": 100, "Health": 300}
	}
	players["Villain"] = 50
	players["Dwayne"] = 999
	for username in players:
		print(username + ": " + str(players[username]))
	
	# Enums
	if unit_aligment == Alignment.ALLY:
		print("Welcome")
	else:
		print("Not welcome")
	match unit_aligment:
		Alignment.ALLY: 
			print("HAHA")
		Alignment.NEUTRAL:
			print("HEHE")
		Alignment.ENEMY:
			print("HOHO")
		_:
			print("WHO ARE YOU?!")
	
	# Signals
	ready_signal.emit("READY")
	
	# Classes
	character_2.die()
	print(str(chest.get_armor()))
	print(str(chest.get_weight()))

# Just a function
func shoot():
	print("Shoot")

func add(num1: int, num2: int) -> int:
	return num1 + num2

func _on_timer_timeout():
	if label.text == "Hello":
		label.text = "World"
	else:
		label.text = "Hello"

func _input(event):
	if event.is_action_pressed("shoot"):
		# Calling the shoot function
		shoot()
	
	if event.is_action_pressed("makeTextRed"):
		label.modulate = Color.RED
	
	if event.is_action_released("makeTextRed"):
		label.modulate = Color.GREEN
	
	if event.is_action_pressed("damagePlayer"):
		if health <= 0:
			print("YOU DIED")
			health = 100
		else:
			health -= 10
			print("Health is: " + str(health)) 

func _on_button_pressed():
	print("Button was pressed!")

func _on_ready_signal(msg):
	print(msg)

class Equipment:
	var armor: int
	var weight: int
	
	func _init(armorIn, weightIn):
		armor = armorIn
		weight = weightIn
	
	func get_armor():
		return armor
		
	func get_weight():
		return weight
