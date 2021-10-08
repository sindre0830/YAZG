extends "res://Actor/Enemy.gd"
# Source: https://www.youtube.com/watch?v=R0XvL3_t840

onready var navigation = get_parent().get_node("Navigation2D")
onready var zoneDetect = $ZoneDetect

func _init():
	state = DAZE
	pass
	
func _ready():
	timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	add_child(timer)	
	timer.connect("timeout", self, "_on_timer_timeout")

func _physics_process(delta):
	match state:
		# Currently just standing still - probably want to make them wander back and forth eventually
		DAZE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player(zoneDetect)
		CHASE:
			var player = zoneDetect.player
			if player != null:
				move(delta, global_position, navigation)

func _on_Hurtbox_body_entered(player):
	if player.name == "Player":
		reachPlayer = true
		player.take_damage(damage)
		timer.start()
	
func _on_Hurtbox_body_exited(body):
	if player.name == "Player":
		reachPlayer = false
