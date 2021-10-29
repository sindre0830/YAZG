extends "res://Throwables/Throwable.gd"

var grenade_sprite
var explosion_area
var explosion_animation

var max_grenade_damage = 200
var min_grenade_damage = 25
var explosion_radius


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
	self.explosion_area = $ExplosionArea
	self.explosion_animation = $ExplosionArea/Explosion
	self.explosion_radius = $ExplosionArea/CollisionShape2D.shape.radius


func _on_Timer_timeout():
	# Stop the grenades movement
	self.sleeping = true
	
	# Hide the sprite and play the explosion animation
	self.grenade_sprite.visible = false
	self.explosion_animation.visible = true
	self.explosion_animation.play()


func _on_Explosion_animation_finished():
	# Get all bodies hit by the explosion
	var bodies_hit = self.explosion_area.get_overlapping_bodies()
	
	print(bodies_hit)
	for body in bodies_hit:
		# If the body can take damage
		if body.has_method("take_damage"):
			# Calculate damage according to the distance to the grenade
			var distance = (body.global_position - self.explosion_area.global_position).length()
			var damage_factor = (self.explosion_radius - distance) / self.explosion_radius 
			var damage = damage_factor * (max_grenade_damage - min_grenade_damage) + min_grenade_damage
			
			# Deal at least min_grenade_damage
			if damage < min_grenade_damage:
				damage = min_grenade_damage

			#print(damage)
			# Deal damage to the body
			body.take_damage(damage)
	
	# Remove the grenade
	queue_free()
