extends "../BaseWorld.gd"

var path_from1 = "res://World/MVP_Suburb/2_2.tscn"
var path_from2 = "res://World/MVP_Suburb/1_3.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Spawn zombies/crates if not spawned yet
	if not WorldFlags.entities_spawned_suburb_1_2:
		spawn_zombies(4)
		spawn_crates(1)
		WorldFlags.entities_spawned_suburb_1_2 = true
	move_to_position()

func move_to_position(path = ""):
	if(PreviousWorld.previous_name == path_from1 || path == path_from1):
		get_node("Player").position = get_node("Fence1/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
	if(PreviousWorld.previous_name == path_from2 || path == path_from2):
		get_node("Player").position = get_node("Fence2/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
