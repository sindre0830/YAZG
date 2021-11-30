extends Area2D

var explosion_animation
var explosion_radius

export var max_damage = 200
export var min_damage = 25

func _ready():
	self.explosion_animation = $ExplosionAnimation
	self.explosion_radius = $CollisionArea.shape.radius

func _on_Explosion_animation_finished():	
	# Remove the grenade
	queue_free()
	
func deal_damage():
	# Get all bodies hit by the explosion
	var bodies_hit = self.get_overlapping_bodies()

	for body in bodies_hit:
		# If the body can take damage
		if body.has_method("take_damage"):
			# Calculate damage according to the distance to the grenade
			var distance = (body.global_position - self.global_position).length()
			var damage_factor = (self.explosion_radius - distance) / self.explosion_radius 
			var damage = damage_factor * (max_damage - min_damage) + min_damage
			
			# Deal at least min_grenade_damage
			if damage < min_damage:
				damage = min_damage

			# Deal damage to the body
			body.take_damage(damage)

func _on_Timer_timeout():
	$ExplosionAnimation.play()
