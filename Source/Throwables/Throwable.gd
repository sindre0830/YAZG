extends RigidBody2D

# How fast should the object slow down
var deceleration = 0

func _physics_process(delta):
	# Current speed is the length of the velocity vector
	var speed = self.linear_velocity.length()
	
	# Decrease speed according to elapsed time
	speed -= deceleration * delta
	
	# Speed can't be smaller than 0
	if speed < 0.0:
		speed = 0.0
		
	# Slow down the throwable item
	self.linear_velocity = self.linear_velocity.normalized() * speed
