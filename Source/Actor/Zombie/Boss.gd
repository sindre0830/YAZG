extends "res://Actor/Enemy.gd"

var collided = false
const CHASE_TOLERANCE = 50.0
var mode = NORMAL

enum {
	NORMAL,
	INSANE,
	SPRINT
}

func _ready():
	timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	add_child(timer)	
	timer.connect("timeout", self, "_on_timer_timeout")
	#change stats
	max_health = get_node("Stats").max_health
	health = get_node("Stats").max_health
	self.get_node("CanvasLayer/ProgressBar").max_value = max_health
	self.get_node("CanvasLayer/ProgressBar").value = health

func _physics_process(delta) -> void:
	var path = player.global_position
	match mode:
		NORMAL:
			damage = 15
			MAX_SPEED = 200
			modulate = Color(0, 0, 0)
		INSANE:
			damage = 30
			MAX_SPEED = 250
			modulate = Color(0.1, 0, 0)
		SPRINT:
			damage = 10
			MAX_SPEED = 350
			modulate = Color(0, 0, 0.3)
	if (collided && collided.collider != null) && !("Zombie" in collided.collider.name || "Boss" in collided.collider.name) && (path - global_position).length() > CHASE_TOLERANCE:
		path = getNextPosition(global_position, path)
	collided = move(delta, path, 0.2)
	if health < max_health / 2:
		mode = INSANE
	# Boss death animation
	if health < max_health/3 && max_health/5 > health:
		modulate = Color(0.4, 0, 0)
	if health < max_health/5:
		modulate = Color(0.2, 0, 0)
	

func take_damage(amount):
	.take_damage(amount)
	self.get_node("CanvasLayer/ProgressBar").value = health


func _on_modeSwitchTimer_timeout():
	if mode != SPRINT:
		mode = SPRINT
		$modeSwitchTimer.wait_time = 4
		$modeSwitchTimer.start()
	else:
		mode = NORMAL
		$modeSwitchTimer.wait_time = 8
		$modeSwitchTimer.start()
