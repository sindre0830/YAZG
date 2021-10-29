extends "res://Actor/Actor.gd"

onready var navigation = get_parent().get_node("Navigation2D")
onready var player = get_parent().get_node("Player")
onready var tween = get_node("Tween")
var damage = 10
var reachPlayer = false
var timer

var state
enum {
	IDLE,
	WANDER,
	CHASE	
}

func _set_rotation(new_trans):
	self.transform.x = new_trans
	self.transform = self.transform.orthonormalized()

func move(delta, path, turningSpeed):
	# get initial value
	var start = self.transform.x
	# get final value
	var distance = path - position
	var finish = distance.normalized()
	# start tweening animation and get rotation value
	tween.interpolate_method(self, '_set_rotation', start, finish, turningSpeed, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	# set velocity
	velocity = Vector2(1, 0).rotated(rotation)
	# move
	return move_and_collide(velocity * MAX_SPEED * delta)

func getNextPosition(position, target):
	# get list of paths to get from A to B
	var arrPaths = navigation.get_simple_path(position, target, false)
	# return next position
	return arrPaths[1]
 
func seek_player(zoneDetect):
	if zoneDetect.can_see_player():
		state = CHASE


func _on_timer_timeout():
	if player != null:
		if player.has_method("take_damage") && reachPlayer:
			player.take_damage(damage)

func _on_Hurtbox_body_entered(body):
	if body.name == "Player":
		reachPlayer = true
		player.take_damage(getDamageValue())
		timer.start()
	
func _on_Hurtbox_body_exited(body):
	if body.name == "Player":
		reachPlayer = false

func getDamageValue():
	var diff = PlayerValues.current_difficulty
	diff -= 1
	diff /= 10
	diff += 1
	return damage * (diff)
