extends CharacterBody2D

@export var projectile: PackedScene

var speed = 400  # move speed in pixels/sec


func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		var bullet = projectile.instantiate()
		get_parent().add_child(bullet)
		bullet.transform = $arm/muzzle.global_transform
		bullet.rotation = rotation
		bullet.set_speed(750)
	
	look_at(get_global_mouse_position())
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
