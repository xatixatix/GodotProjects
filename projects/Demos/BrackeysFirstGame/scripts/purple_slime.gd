extends Node2D

const SPEED = 30;
var direction = 1;

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite_2d = $AnimatedSprite2D

func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		animated_sprite_2d.flip_h = false
		direction = 1
	
	position.x += delta * SPEED * direction;
