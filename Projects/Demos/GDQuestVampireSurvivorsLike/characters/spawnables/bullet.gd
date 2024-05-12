extends Area2D

var travelledDistance = 0

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelledDistance += SPEED * delta
	if travelledDistance > RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("takeDamage"):
		body.takeDamage()
