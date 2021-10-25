extends "res://Actor/Enemy.gd"
# Source: https://www.youtube.com/watch?v=R0XvL3_t840

onready var navigation = get_parent().get_node("Navigation2D")
onready var zoneDetect = $ZoneDetect

var target_position = Vector2.ZERO
const TOLERANCE = 8.0
const WANDER_RADIUS = 16

func _init():
	state = IDLE
	pass
	
func _ready():
	timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	add_child(timer)	
	timer.connect("timeout", self, "_on_timer_timeout")

func _physics_process(delta):
	match state:
		IDLE:
			MAX_SPEED = 5
			state = WANDER
			var target_vector = Vector2(rand_range(-WANDER_RADIUS, WANDER_RADIUS), rand_range(-WANDER_RADIUS, WANDER_RADIUS))
			target_position = global_position + target_vector
		WANDER:
			move_to_target(delta, global_position, target_position, navigation)
			if (target_position - global_position).length() < TOLERANCE:
				state = IDLE
		CHASE:
			MAX_SPEED = 50
			move(delta, global_position, navigation)

func _on_Vision_body_entered(body):
	if body.name == "Player":
		state = CHASE
		get_node("ChaseTimer").stop()

func _on_Vision_body_exited(body):
	if body.name == "Player":
		get_node("ChaseTimer").start(5)

func _on_ChaseTimer_timeout():
	state = IDLE

func take_damage(amount):
	.take_damage(amount)
	if state != CHASE:
		state = CHASE
		get_node("ChaseTimer").start(5)
