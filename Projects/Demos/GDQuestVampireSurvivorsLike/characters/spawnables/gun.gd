extends Area2D

func _physics_process(delta):
	var enemiesInRange = get_overlapping_bodies()
	if enemiesInRange.size() > 0:
		var targetEnemy = enemiesInRange.front()
		look_at(targetEnemy.global_position)

func shoot():
	const BULLET = preload("res://characters/spawnables/bullet.tscn")
	var newBullet = BULLET.instantiate()
	newBullet.global_position = %ShootingPoint.global_position
	newBullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(newBullet)

func _on_timer_timeout():
	shoot()
