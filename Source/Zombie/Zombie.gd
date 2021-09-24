extends KinematicBody2D
# Source: https://www.youtube.com/watch?v=R0XvL3_t840

export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200

export (float) var max_health = 100
onready var health = max_health

enum {
	DAZE,
	CHASE	
}

var velocity = Vector2.ZERO
var state = CHASE

onready var sprite = $Sprite
onready var zoneDetect = $ZoneDetect

func _physics_process(delta):
	match state:
		# Currently just standing still - probably want to make them wander back and forth eventually
		DAZE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
		CHASE:
			var player = zoneDetect.player
			if player != null:
				var dir = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(dir * MAX_SPEED, ACCELERATION * delta)
			else:
				state = DAZE
			# How to make it smoothly turn to player?
			sprite.rotation = lerp(rotation,velocity.angle(),1)
	velocity = move_and_slide(velocity)

func seek_player():
	if zoneDetect.can_see_player():
		state = CHASE

func die():
	# Delete Zombie instance
	queue_free()

func take_damage(amount):
	# Reduce health by given amount
	health = clamp(health - amount, 0, max_health)
	
	# Kill zombie if it's health is 0
	if health == 0:
		die()
	
