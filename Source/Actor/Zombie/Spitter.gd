# Spitter - should spit globs of acid at player

extends "res://Actor/Enemy.gd"

var collided
var target_position = Vector2.ZERO
const WANDER_TOLERANCE = 8.0
const WANDER_RADIUS = 16
const CHASE_TOLERANCE = 50.0

var spitTimer
var inRange = false
var Spit = preload("res://Throwables/AcidSpit.tscn")

func _init():
	state = IDLE
	pass
	
func _ready():
	# Hurtbox timer in enemy...naming?
	timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	add_child(timer)	
	timer.connect("timeout", self, "_on_timer_timeout")
	velocity = Vector2.ZERO
	#Timer for attacking
	spitTimer = Timer.new()
	spitTimer.set_wait_time(1.5)
	spitTimer.set_one_shot(false)
	add_child(spitTimer)	
	spitTimer.connect("timeout", self, "_on_spitTimer_timeout")
	velocity = Vector2.ZERO
	
	$VisionBuffer/ChaseCollision.set_deferred("disabled", true)

func _physics_process(delta):
	match state:
		IDLE:
			MAX_SPEED = 5
			state = WANDER
			var target_vector = Vector2(rand_range(-WANDER_RADIUS, WANDER_RADIUS), rand_range(-WANDER_RADIUS, WANDER_RADIUS))
			target_position = global_position + target_vector
		WANDER:
			var path = getNextPosition(global_position, target_position)
			collided = move(delta, path, 0.8)
			if collided || (target_position - global_position).length() < WANDER_TOLERANCE:
				state = IDLE
		CHASE:
			MAX_SPEED = 80
			var path = player.global_position
			var distance = path - self.global_position
			if (collided && collided.collider != null) && !("Zombie" in collided.collider.name || "Boss" in collided.collider.name) && ((path - global_position).length() > CHASE_TOLERANCE):
				path = getNextPosition(global_position, path)
			if distance.length() > 280:
				inRange = false
				collided = move(delta, path, 0.2)
			else:
				turn(path, 0.2)
				inRange = true
	# Handles attacking when in range
	if inRange && (spitTimer.time_left == 0):
		spitTimer.start()
	elif !inRange:
		spitTimer.stop()
	# Zombie death animation
	if health < max_health/3 && max_health/5 > health:
		modulate = Color(0.4, 0, 0)
	if health < max_health/5:
		modulate = Color(0.2, 0, 0)
	
# Chases player when enters vision
func _on_Vision_body_entered(body):
	if body.name == "Player":
		state = CHASE
		$VisionBuffer/ChaseCollision.set_deferred("disabled", false)
		$Vision/WanderCollision.set_deferred("disabled", true)

# Returns to idle when player leaves detection area
func _on_VisionBuffer_body_exited(body):
	if body.name == "Player":
		state = WANDER
		$VisionBuffer/ChaseCollision.set_deferred("disabled", true)
		$Vision/WanderCollision.set_deferred("disabled", false)

# Initializes chase when taking damage
func take_damage(amount):
	.take_damage(amount)
	if state != CHASE:
		state = CHASE
		$VisionBuffer/ChaseCollision.set_deferred("disabled", true)
		$Vision/WanderCollision.set_deferred("disabled", true)

# Attacks on a timer
func _on_spitTimer_timeout():
	spit(player)

# Attack
func spit(target):
	var spit = Spit.instance()
	spit.init(self.position, target.global_position, self.rotation)
	spit.transform = self.global_transform
	self.get_parent().add_child(spit)
