extends "res://Actor/Actor.gd"

var velocity = Vector2.ZERO

onready var TweenNode = get_node("Tween")

func _physics_process(delta):
	var player = get_parent().get_node("Player")
	turn(player)
	velocity = Vector2(1, 0).rotated(rotation)
	move_and_collide(velocity * MAX_SPEED * delta)

func _set_rotation(new_trans):
	self.transform.x = new_trans
	self.transform = self.transform.orthonormalized()

func turn(player):
	var start = self.transform.x
	var dir = (player.global_position - global_position).normalized()
	TweenNode.interpolate_method(self, '_set_rotation', start, dir, 0.4, Tween.TRANS_LINEAR, Tween.EASE_IN)
	TweenNode.start()
