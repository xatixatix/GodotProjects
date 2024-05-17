extends Node

@onready var label = $"../Label"

var health: int = 100

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

# Just a function
func shoot():
	print("Shoot")

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
