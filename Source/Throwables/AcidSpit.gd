extends "res://Throwables/Throwable.gd"

# change sprite
var grenade_sprite
var explosion

var max_grenade_damage = 200
var min_grenade_damage = 25


func init(var start_position, var target_position, var direction):
	# Set position and direction
	self.position = start_position
	self.rotation_degrees = direction

	# Init speed and deceleration according to the start and target positions
	var frag_grenade_speed = (start_position - target_position).length()
	self.deceleration = frag_grenade_speed / $ExplodeTimer.wait_time

	# Set physical behavior - change from grenade?
	self.bounce = 0.5
	self.friction = 1
	
	# Velocity for enemies
	self.linear_velocity = Vector2(frag_grenade_speed, 0).rotated(direction)


func _ready():
	self.grenade_sprite = $GrenadeSprite

func _on_ExplodeTimer_timeout():
	# Stop the grenades movement
	self.sleeping = true
	# Hide the sprite and play the explosion animation
	self.grenade_sprite.visible = false
	self.explosion = $Explosion

	# Ensure we delete the spit once it's done working
func _on_DeleteTimer_timeout():
	self.queue_free()
