# Acid - should drop globs of acid at the floor
# Need acid resource for hazardous area
# Besides splitting out the scene from throwable/grenade to acid, this works

extends "res://Actor/Enemy.gd"

var collided
var target_position = Vector2.ZERO
const WANDER_TOLERANCE = 8.0
const WANDER_RADIUS = 16
const CHASE_TOLERANCE = 50.0

var acidTimer
var Spit = preload("res://Throwables/AcidSpit.tscn")

func _init():
	# change to wander after main merge
	state = CHASE
	MAX_SPEED = 50
	pass
	
func _ready():
	timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	add_child(timer)	
	timer.connect("timeout", self, "_on_timer_timeout")
	velocity = Vector2.ZERO
	
	acidTimer = Timer.new()
	acidTimer.set_wait_time(2.0)		# change
	acidTimer.set_one_shot(false)
	add_child(acidTimer)	
	acidTimer.connect("timeout", self, "_on_acidTimer_timeout")
	velocity = Vector2.ZERO
	# have to add acid as a new resource for this to work good
	acidTimer.start()
	
	
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
			collided = move(delta, path, 0.2)
			
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

func _on_acidTimer_timeout():
	throw_grenade(player)

func throw_grenade(target):
	var spit = Spit.instance()
	spit.init(self.position, self.global_position, self.rotation)
	spit.transform =  self.global_transform 
	self.owner.add_child(spit)
