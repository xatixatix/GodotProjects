extends CharacterBody2D

signal health_depleted

@onready var hurt_box = %HurtBox
@onready var health_bar = %HealthBar

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	const DAMAGE_RATE = 5.0
	var overlappingMobs = hurt_box.get_overlapping_bodies()
	health -= DAMAGE_RATE * overlappingMobs.size() * delta
	health_bar.value = health
	if (health <= 0.0):
		health_depleted.emit()
