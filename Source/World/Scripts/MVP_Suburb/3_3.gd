extends "../BaseWorld.gd"

var path_from1 = "res://World/MVP_Suburb/2_3.tscn"
var path_from2 = "res://World/MVP_Forest/2_1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Spawn zombies/crates if not spawned yet
	if not WorldFlags.entities_spawned_suburb_3_3:
		spawn_zombies(4, 2, 1, 0)
		WorldFlags.entities_spawned_suburb_3_3 = true
	move_to_position()

func move_to_position(path = ""):
	if(PreviousWorld.previous_name == path_from1 || path == path_from1):
		get_node("Player").position = get_node("Fence1/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
	if(PreviousWorld.previous_name == path_from2 || path == path_from2):
		get_node("Player").position = get_node("Fence2/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
