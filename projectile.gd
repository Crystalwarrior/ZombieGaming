extends CharacterBody2D


func set_speed(speed):
	velocity = Vector2(speed, 0).rotated(rotation)


func _physics_process(delta):
	move_and_slide()
	
	var last_collision = get_last_slide_collision()
	if last_collision:
		queue_free()


func _on_lifespan_timer_timeout():
	queue_free()
