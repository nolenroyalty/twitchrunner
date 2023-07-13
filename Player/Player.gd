extends KinematicBody2D

export(int)var SPEED = 100
export(int)var ACCELERATION = 40
export(int)var GRAVITY_MAX = SPEED
export(int)var GRAVITY_ACCEL = 20

var velocity = Vector2()

# ADD GRAVITY LOL
func _physics_process(_delta):
	var dx = Input.get_action_strength("player_right") - Input.get_action_strength("player_left")
	velocity.x = move_toward(velocity.x, dx * SPEED, ACCELERATION)
	if not is_on_floor():
		velocity.y = move_toward(velocity.y, GRAVITY_MAX, GRAVITY_ACCEL)
	else:
		velocity.y = 0
		# if Input.is_action_just_pressed("player_jump"):
		# 	velocity.y = -SPEED * 2
	velocity = move_and_slide(velocity)