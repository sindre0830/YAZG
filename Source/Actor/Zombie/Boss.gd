extends "res://Actor/Actor.gd"


var velocity = Vector2.ZERO
var path
onready var player = get_parent().get_node("Player")
onready var navigation = get_parent().get_node("Navigation2D")

func _physics_process(delta) -> void:
	var new_path = navigation.get_simple_path(global_position, player.global_position, false)
	#new_path.remove(0)
	if new_path.size() > 1:
		path = new_path

		var distance = path[1] - global_position
		var direction = distance.normalized()
		#print(direction)
		velocity = move_and_collide(direction * MAX_SPEED * delta)
