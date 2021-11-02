extends "res://Actor/Enemy.gd"

var flagDamageModified = false

func _ready():
	timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	add_child(timer)	
	timer.connect("timeout", self, "_on_timer_timeout")
	#change stats
	damage = 20
	max_health = get_node("Stats").max_health
	health = get_node("Stats").max_health
	MAX_SPEED = 150
	self.get_node("CanvasLayer/ProgressBar").max_value = max_health
	self.get_node("CanvasLayer/ProgressBar").value = health

func _physics_process(delta) -> void:
	var path = getNextPosition(global_position, player.global_position)
	move(delta, path, 0.2)
	if !flagDamageModified && health < max_health / 2:
		damage = 30
	# Boss death animation
	if health < max_health/3 && max_health/5 > health:
		modulate = Color(0.4, 0, 0)
	if health < max_health/5:
		modulate = Color(0.2, 0, 0)
	

func take_damage(amount):
	.take_damage(amount)
	self.get_node("CanvasLayer/ProgressBar").value = health
