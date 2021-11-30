extends KinematicBody2D
onready var pl = get_parent().get_node("Player")
onready var XP = preload("res://Collectables/XP.tscn")
export var ACCELERATION = 300
export var MAX_SPEED = 50
export var ORIG_SPEED = 50
export var FRICTION = 200
export var velocity = Vector2.ZERO
var XP_instance = []
var rng = RandomNumberGenerator.new()


export (float) var max_health = 100
onready var health = max_health

func die():
	# Delete Zombie instance
	rng.randomize()

	var x_rand = rng.randi_range(1, 5)
	
	for i in x_rand:
		XP_instance.append(XP.instance())
		XP_instance[i].position = position
		get_parent().add_child(XP_instance[i])

	queue_free()
	pl.increase_diff()

func take_damage(amount):
	# Reduce health by given amount
	health = clamp(health - amount, 0, max_health)
	
	# Kill zombie if it's health is 0
	if health == 0:
		die()
