extends Node

var rng = RandomNumberGenerator.new()

var Zombie = preload("res://Actor/Zombie/Zombie.tscn")
var Box = preload("res://Breakable/Box.tscn")

func _ready():
	# Make sure the zombies/crates have a certain distance when being spawned
	$CrateSpawn.curve.bake_interval = 50
	$ZombieSpawn.curve.bake_interval = 50

func spawn_zombies(num_zombies):
	randomize()
	var zombie_spawn_location = get_node("ZombieSpawn/ZombieSpawnLocations")
	
	for _i in range(num_zombies):
		# Spawn zombie on random position on the Path2D
		zombie_spawn_location.offset = randi()
		var zombie = self.Zombie.instance()
		zombie.init(self.global_transform , zombie_spawn_location.position)
		self.add_child(zombie)
		
func spawn_crates(num_crates):
	randomize()
	var crate_spawn_location = get_node("CrateSpawn/CrateSpawnLocations")
	
	for _i in range(num_crates):
		# Spawn crate on random position on the Path2D
		crate_spawn_location.offset = randi()
		var chest = self.Box.instance()
		chest.init(self.global_transform , crate_spawn_location.position)
		self.add_child(chest)
