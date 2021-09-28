extends KinematicBody2D
# Source: https://www.youtube.com/watch?v=R0XvL3_t840

export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200

# get stats as its own thing
onready var stats = get_node("Stats")

enum {
	DAZE,
	CHASE	
}

var velocity = Vector2.ZERO
var state = CHASE

onready var TweenNode = get_node("Tween")
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
				turn(player)
				velocity = Vector2(1, 0).rotated(rotation)
				move_and_collide(velocity * MAX_SPEED * delta)

func seek_player():
	if zoneDetect.can_see_player():
		state = CHASE

# source: https://old.reddit.com/r/godot/comments/8tlwdt/2d_rotate_towards_point_with_specfic_speed/e1e182w/
func _set_rotation(new_trans):
	self.transform.x = new_trans
	self.transform = self.transform.orthonormalized()

func turn(player):
	var start = self.transform.x
	var dir = (player.global_position - global_position).normalized()
	TweenNode.interpolate_method(self, '_set_rotation', start, dir, 0.4, Tween.TRANS_LINEAR, Tween.EASE_IN)
	TweenNode.start()

func die():
	# Delete Zombie instance
	queue_free()

# previous func - who implemented?
func take_damage(amount):
	# Reduce health by given amount
	stats.health = clamp(stats.health - amount, 0, stats.max_health)
	
	# Kill zombie if it's health is 0
	if stats.health == 0:
		die()

