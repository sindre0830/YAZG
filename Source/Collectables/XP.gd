extends "res://Collectables/Collectable.gd"

onready var player = get_parent().get_node("Player")
onready var amount = 20
var rng = RandomNumberGenerator.new()
var deltatime = 0.0
var XP_instance = []
var lerp_time = 0
var move_to_player = false
var move_time = 0.5
var body_pos
 
# returns a two random points between -100 and 100
func get_rand_pos():
	rng.randomize()
	var x_rand = rng.randf_range(-100.0, 100.0)
	var y_rand = rng.randf_range(-100.0, 100.0)
	return Vector2(x_rand, y_rand)

# Handles the movement of the xp when its created and when the player is close.
func _physics_process(delta):
	deltatime += delta
	if deltatime <= 0.1:
		position = lerp(position, (position - get_rand_pos()), 0.05)
		# making sure lerp time always is zero before entering the movement process
	if(!move_to_player):
		lerp_time = 0.0
	if(move_to_player):
		lerp_time += delta
		# Interpolates in the as fast as the move_time variable
		position = position.linear_interpolate(player.position, lerp_time / move_time)
		# Resets when the movement is done
		if (lerp_time >= move_time || position == player.position):
			move_to_player = false
			queue_free()


# Function lets the script know that the player is inside the area and calls
# the take_amount in the actor player script
func _on_XP_body_entered(body):
	if body.get_name() == "Player":
		move_to_player = true
		body.take_xp(amount)
		
	#	queue_free()
