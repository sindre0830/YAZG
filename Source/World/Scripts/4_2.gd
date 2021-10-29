extends Node

var path_from1 = "res://World/MVP_World/5_2_BOSS.tscn"
var path_from2 = "res://World/MVP_World/3_2.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	move_to_position()
	pass # Replace with function body.

func move_to_position(path = ""):
	print(path)
	if(PreviousWorld.previous_name == path_from1 || path == path_from1):
		get_node("Player").position = get_node("Fence1/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
	elif(PreviousWorld.previous_name == path_from2 || path == path_from1):
		get_node("Player").position = get_node("Fence2/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
