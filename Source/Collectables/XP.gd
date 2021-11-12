extends "res://Collectables/Collectable.gd"


onready var amount = 20
var rng = RandomNumberGenerator.new()
var deltatime = 0.0
var XP_instance = []

func _on_HP_body_entered(body):
	# Heal the player if they step on it and
	# delete the HealthCollectable
	if body.get_name() == "Player":
		body.take_xp(amount)
		
		queue_free()



func get_rand_pos():
	rng.randomize()
	var x_rand = rng.randf_range(-100.0, 100.0)
	var y_rand = rng.randf_range(-100.0, 100.0)
	return Vector2(x_rand, y_rand)
	
func _physics_process(delta):
	deltatime += delta
	if deltatime <= 0.1:
		position = lerp(position, (position - get_rand_pos()), 0.05)
