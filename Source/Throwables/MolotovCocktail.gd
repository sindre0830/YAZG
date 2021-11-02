extends "res://Throwables/Throwable.gd"

var grenade_sprite
var explosion_area
var explosion_animation
var explosion_radius

var exploded = false

export var BurningFloor = preload("res://HazardousAreas/BurningFloor.tscn")

func init(var start_position, var target_position, var direction):
	# Set position and direction
	self.position = start_position
	self.rotation_degrees = direction
	
	# Init speed and deceleration according to the start and target positions
	var frag_grenade_speed = (start_position - target_position).length()
	self.deceleration = frag_grenade_speed / 3
	
	# Apply velocity
	self.apply_impulse(Vector2(), Vector2(frag_grenade_speed, 0).rotated(direction))
	
	# Set physical behavior of the grenade
	self.bounce = 0.5
	self.friction = 1
	

func _ready():
	self.grenade_sprite = $MolotovSprite
	self.explosion_area = $ExplosionArea
	self.explosion_animation = $ExplosionArea/Explosion
	self.explosion_radius = $ExplosionArea/CollisionShape2D.shape.radius
	

func explode():
	self.exploded = true

	# Hide the sprite and play the explosion animation
	self.grenade_sprite.visible = false
	self.explosion_animation.visible = true
	self.explosion_animation.play()
	
	# Spawn a burning floor where the molly exploded
	var burning_floor = BurningFloor.instance()
	burning_floor.position = self.position
	self.get_parent().add_child(burning_floor)


func _on_MolotovCocktail_body_entered(body):
	# Stop molly and explode if it hits a body
	self.linear_velocity = Vector2(0.0, 0.0)

func _physics_process(delta):
	# Explode molly if it stops moving
	if self.linear_velocity.length() == 0.0 and not self.exploded:
		self.explode()


func _on_Explosion_animation_finished():	
	# remove the molly
	queue_free()
