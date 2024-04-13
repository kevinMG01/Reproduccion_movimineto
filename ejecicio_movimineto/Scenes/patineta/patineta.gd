extends CharacterBody2D


const SPEED = 300.0
var JUMP_VELOCITY = -330

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var maxi_altura = -500
var altura_salto_acumulado = 0
var cantidad_saltos = 0

func _physics_process(delta):
	
	if altura_salto_acumulado == maxi_altura:
		JUMP_VELOCITY = altura_salto_acumulado
	else:
		JUMP_VELOCITY = -330
	
	if is_on_floor():
		cantidad_saltos = 0
	
	if Input.is_action_just_pressed("ui_accept") and cantidad_saltos < 2:
		cantidad_saltos += 1
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if altura_salto_acumulado > maxi_altura:
			altura_salto_acumulado -= 10
		velocity.x = direction * SPEED
	else:
		altura_salto_acumulado = 0
		velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.y += gravity * delta
	move_and_slide()


