extends "res://Throwables/Throwable.gd"

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
	self.deceleration = frag_grenade_speed / $Timer.wait_time

	# Apply velocity
	self.apply_impulse(Vector2(), Vector2(frag_grenade_speed, 0).rotated(direction))
	
	# Set physical behavior of the grenade
	self.bounce = 0.5
	self.friction = 1

func _ready():
	self.grenade_sprite = $GrenadeSprite

func _on_Timer_timeout():
	# Stop the grenades movement
	self.sleeping = true

	# Hide the sprite and play the explosion animation
	self.grenade_sprite.visible = false
	self.explosion = $Explosion
	
	# Deal damage to nearby entities
	self.explosion.deal_damage()
