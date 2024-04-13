extends CharacterBody2D


const SPEED = 300.0
var JUMP_VELOCITY = -400

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var max_saltos = 2
var cantidad_saltos = 0
var saltando = false

func _physics_process(delta):
	
	
	if is_on_floor():
		saltando = false
		rotation_degrees = 0
		cantidad_saltos = 0
	
	if saltando == true:
		if velocity.y < -1:
			rotation_degrees = -10
		elif velocity.y > 1:
			rotation_degrees = 10
		pass
	
	if Input.is_action_just_pressed("ui_accept") and cantidad_saltos < max_saltos:
		cantidad_saltos += 1
		velocity.y = JUMP_VELOCITY
		saltando = true
		

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.y += gravity * delta
	move_and_slide()


