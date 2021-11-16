# Should run at enemy and explode when it reaches the enemy!
# Blink during chase mode - faster the closer it is
# Not sure if acid or grenade explosion
# Not sure if want to remove hurtbox or do something else to stop melee attack?
# Maybe also reduce max health?
# Currently it only explodes on LEAVING the 10 distance area...
extends "res://Actor/Enemy.gd"

var collided
var target_position = Vector2.ZERO
const WANDER_TOLERANCE = 8.0
const WANDER_RADIUS = 16
const CHASE_TOLERANCE = 50.0

var bombTimer
var Bomb = preload("res://Throwables/MolotovCocktail.tscn")

func _init():
	state = IDLE
	pass
	
func _ready():
	timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	add_child(timer)	
	timer.connect("timeout", self, "_on_timer_timeout")
	velocity = Vector2.ZERO
	
	bombTimer = Timer.new()
	bombTimer.set_wait_time(0.05)
	bombTimer.set_one_shot(true)
	add_child(bombTimer)	
	bombTimer.connect("timeout", self, "_on_bombTimer_timeout")
	velocity = Vector2.ZERO
	
	
	$VisionBuffer/ChaseCollision.set_deferred("disabled", true)

func _physics_process(delta):
	match state:
		IDLE:
			modulate = Color(1,1,1)
			MAX_SPEED = 15
			state = WANDER
			var target_vector = Vector2(rand_range(-WANDER_RADIUS, WANDER_RADIUS), rand_range(-WANDER_RADIUS, WANDER_RADIUS))
			target_position = global_position + target_vector
		WANDER:
			MAX_SPEED = 15
			modulate = Color(1,1,1)
			var path = getNextPosition(global_position, target_position)
			collided = move(delta, path, 0.8)
			if collided || (target_position - global_position).length() < WANDER_TOLERANCE:
				state = IDLE
		CHASE:
			modulation(player)
			MAX_SPEED = 120
			var path = player.global_position
			var distance = path - self.global_position
			if (collided && collided.collider != null) && !("Zombie" in collided.collider.name || "Boss" in collided.collider.name) && ((path - global_position).length() > CHASE_TOLERANCE):
				path = getNextPosition(global_position, path)
			if distance.length() > 10:		# also need to check rotation!
				collided = move(delta, path, 0.2)
			else:
				turn(path, 0.2)
				if bombTimer.time_left == 0:
					bombTimer.start()
			
	# Zombie death animation
	if health < max_health/3 && max_health/5 > health:
		modulate = Color(0.4, 0, 0)
	if health < max_health/5:
		modulate = Color(0.2, 0, 0)
	

func _on_Vision_body_entered(body):
	if body.name == "Player":
		state = CHASE
		$VisionBuffer/ChaseCollision.set_deferred("disabled", false)
		$Vision/WanderCollision.set_deferred("disabled", true)

func _on_VisionBuffer_body_exited(body):
	if body.name == "Player":
		state = IDLE
		$VisionBuffer/ChaseCollision.set_deferred("disabled", true)
		$Vision/WanderCollision.set_deferred("disabled", false)

func take_damage(amount):
	.take_damage(amount)
	if state != CHASE:
		state = CHASE
		$VisionBuffer/ChaseCollision.set_deferred("disabled", true)
		$Vision/WanderCollision.set_deferred("disabled", true)

func _on_bombTimer_timeout():
	explode()

func explode():
	var bomb = Bomb.instance()
	bomb.init(self.position, self.position, self.rotation)
	bomb.transform =  self.global_transform 
	self.owner.add_child(bomb)
	queue_free()
	
# Not blinking ATM, just changing color
func modulation(player):
	# 350 is literal random choice...
	modulate = Color(max(0.2,(self.position - player.global_position).length()/350), 0, 0)
	self.MAX_SPEED == 120 + (340-(self.position - player.global_position).length())
