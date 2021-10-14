extends "res://Actor/Enemy.gd"

onready var navigation = get_parent().get_node("Navigation2D")
	
func _ready():
	timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	add_child(timer)	
	timer.connect("timeout", self, "_on_timer_timeout")

func _physics_process(delta) -> void:
	move(delta, global_position, navigation)
