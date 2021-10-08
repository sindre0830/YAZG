extends "res://Actor/Actor.gd"

onready var player = get_parent().get_node("Player")

onready var tween = get_node("Tween")
var path
var damage = 10
var reachPlayer = false
var timer

var state
enum {
	DAZE,
	CHASE	
}

func _set_rotation(new_trans):
	self.transform.x = new_trans
	self.transform = self.transform.orthonormalized()
	
func move(delta, position, navigation):
	var arrPaths = navigation.get_simple_path(position, player.global_position, false)
	if arrPaths.size() > 1:
		path = arrPaths[1]
	
		var distance = path - global_position
		var direction = distance.normalized()

		var start = self.transform.x
		tween.interpolate_method(self, '_set_rotation', start, direction, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.start()

		velocity = Vector2(1, 0).rotated(rotation)

		velocity = move_and_collide(velocity * MAX_SPEED * delta)
		

func seek_player(zoneDetect):
	if zoneDetect.can_see_player():
		state = CHASE


func _on_timer_timeout():
	if player.has_method("take_damage") && reachPlayer:
		player.take_damage(damage)
