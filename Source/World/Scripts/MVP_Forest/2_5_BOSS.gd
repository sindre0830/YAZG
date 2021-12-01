extends Node

var path_from1 = "res://World/MVP_Forest/2_4.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	move_to_position()

func move_to_position(path = ""):
	if(PreviousWorld.previous_name == path_from1 || path == path_from1):
		get_node("Player").position = get_node("Fence1/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
