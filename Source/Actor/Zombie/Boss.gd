extends "res://Actor/Enemy.gd"

onready var navigation = get_parent().get_node("Navigation2D")
var flagDamageModified = false

func _ready():
	timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	add_child(timer)	
	timer.connect("timeout", self, "_on_timer_timeout")
	#change stats
	damage = 20
	#health = 1000 #doesn't work atm

func _physics_process(delta) -> void:
	move(delta, global_position, navigation)
	if !flagDamageModified && health < max_health / 2:
		damage = 30
