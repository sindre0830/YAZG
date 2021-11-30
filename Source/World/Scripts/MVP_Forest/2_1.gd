extends "../BaseWorld.gd"

var path_from1 = "res://World/MVP_Forest/1_1.tscn"
var path_from2 = "res://World/MVP_Suburb/3_3_BOSS.tscn"
var path_from3 = "res://World/MVP_Forest/3_1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Spawn zombies/crates if not spawned yet
	if not WorldFlags.entities_spawned_forest_2_1:
		spawn_zombies(4, 2, 1, 1)
		WorldFlags.entities_spawned_forest_2_1 = true
	move_to_position()

func move_to_position(path = ""):
	if(PreviousWorld.previous_name == path_from1 || path == path_from1):
		get_node("Player").position = get_node("Fence1/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
	if(PreviousWorld.previous_name == path_from2 || path == path_from2):
		get_node("Player").position = get_node("Fence2/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
	if(PreviousWorld.previous_name == path_from3 || path == path_from3):
		get_node("Player").position = get_node("Fence3/Position2D").global_position
		get_node("Player").velocity = Vector2.ZERO
