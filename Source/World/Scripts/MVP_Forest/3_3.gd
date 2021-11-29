extends "../BaseWorld.gd"

var path_from1 = "res://World/MVP_Forest/3_2.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Spawn zombies/crates if not spawned yet
	if not WorldFlags.entities_spawned_forest_3_3:
		spawn_zombies(5, 2, 1, 1)
		spawn_crates(1)
		WorldFlags.entities_spawned_forest_3_3 = true
	move_to_position()

func move_to_position(path = ""):
	if(PreviousWorld.previous_name == path_from1 || path == path_from1):
		get_node("Player").position = get_node("Fence1/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
