extends "res://Throwables/Throwable.gd"

var acid_sprite
var acid_floor

var pooled = false
var spit_damage = 20
export var AcidFloor = preload("res://HazardousAreas/AcidFloor.tscn")

func init(var start_position, var target_position, var direction):
	# Set position and direction
	self.position = start_position
	self.rotation_degrees = direction

	# Init speed and deceleration according to the start and target positions
	var proj_speed = max(250, (start_position - target_position).length() * 2)
	self.deceleration = proj_speed / $PoolTimer.wait_time

	# Set physical behavior - change from grenade?
	self.bounce = 0.5
	self.friction = 1
	
	# Velocity for enemies
	self.linear_velocity = Vector2(proj_speed, 0).rotated(direction)

func _physics_process(delta):
	# Pools acid if spit stops moving
	if self.linear_velocity.length() == 0.0 and not self.pooled:
		self.pool()

# Initializes sprite and sets color
func _ready():
	self.acid_sprite = $AcidSprite
	$AcidSprite.modulate = Color(0, 1, 0)

# Ensures despawn
func _on_DeleteTimer_timeout():
	self.queue_free()

# Spawn acid pool
func pool():
	self.pooled = true

	# Hide the sprite and play the explosion animation
	self.acid_sprite.visible = false
	
	# Spawn a burning floor where the molly exploded
	var acid_floor = AcidFloor.instance()
	acid_floor.position = self.position
	self.get_parent().add_child(acid_floor)
	self.queue_free()

func _on_Spit_body_entered(body):
	# Stop and explode if hits anything
	self.linear_velocity = Vector2(0.0, 0.0)
