extends KinematicBody2D
onready var pl = get_parent().get_node("Player")
export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200
export var velocity = Vector2.ZERO


export (float) var max_health = 100
onready var health = max_health

func die():
	# Delete Zombie instance
	queue_free()
	pl.increase_diff()
	

func take_damage(amount):
	# Reduce health by given amount
	health = clamp(health - amount, 0, max_health)
	
	# Kill zombie if it's health is 0
	if health == 0:
		die()
