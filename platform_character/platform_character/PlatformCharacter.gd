#Controllers Settings
extends KinematicBody2D

export (int) var speed = 1200 # Speed
export (int) var jump_speed = -1800
# Jump upwards by 1800, positive y means down
export (int) var gravity = 4000
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25

var velocity = Vector2.ZERO
#Same just as Vector(0,0)
func get_input():
# Get input
	var dir = 0
	if Input.is_action_pressed("walk_right"):
		dir += 1
	if Input.is_action_pressed("walk_left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
# While moving at x, at 1200*1 , accelerate by 0.25
	else:
		velocity.x = lerp(velocity.x, 0, friction)
# Else when stopped moving at x, no speed i.e 0, and friction is 0.1

func _physics_process(delta):
	get_input()
# Called get_input function that we defined before, to get inputs
	velocity.y += gravity * delta
# velocity.y stores the gravity * elapsed time
	velocity = move_and_slide(velocity, Vector2.UP)
# Velocity stores move and slide(by velocity and jumps up using Vector2d)
	if Input.is_action_just_pressed("jump"):
# And when jump is pressed if it is on floor then it jumps
		if is_on_floor():
			velocity.y = jump_speed
# Jumps by y
