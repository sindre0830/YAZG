extends Node

var path_from = "res://World//World3.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(PreviousWorld.previous_name == path_from):
		move_to_position()
	pass # Replace with function body.

func move_to_position():
	get_node("Player").position = get_node("Fence1/Position2D").global_position
	get_node("Player").velocity = Vector2.ZERO
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
