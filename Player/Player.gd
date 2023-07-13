extends KinematicBody2D

export(int)var SPEED = 65
export(int)var ACCELERATION = 35
export(int)var GRAVITY_MAX = SPEED
export(int)var GRAVITY_ACCEL = 17

var velocity = Vector2()
var autorun = true

func _physics_process(_delta):
	var dx = Input.get_action_strength("player_right") - Input.get_action_strength("player_left")
	if dx == 0 and autorun:
		dx = 1
	velocity.x = move_toward(velocity.x, dx * SPEED, ACCELERATION)
	if not is_on_floor():
		velocity.y = move_toward(velocity.y, GRAVITY_MAX, GRAVITY_ACCEL)
	else:
		velocity.y = 0
		# if Input.is_action_just_pressed("player_jump"):
		# 	velocity.y = -SPEED * 2
	velocity = move_and_slide(velocity)

func _ready():
	$AnimatedSprite.play("run")
