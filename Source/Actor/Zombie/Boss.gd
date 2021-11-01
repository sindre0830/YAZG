extends "res://Actor/Enemy.gd"

var flagDamageModified = false
var collided = false
const CHASE_TOLERANCE = 50.0

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
	var path = player.global_position
	if (collided && collided.collider != null) && !("Zombie" in collided.collider.name || "Boss" in collided.collider.name) && (path - global_position).length() > CHASE_TOLERANCE:
		path = getNextPosition(global_position, path)
	collided = move(delta, path, 0.2)
	if !flagDamageModified && health < max_health / 2:
		damage = 30
		flagDamageModified = true

func take_damage(amount):
	.take_damage(amount)
	self.get_node("CanvasLayer/ProgressBar").value = health
