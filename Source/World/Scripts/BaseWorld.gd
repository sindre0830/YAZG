extends Node

var rng = RandomNumberGenerator.new()

var Zombie = preload("res://Actor/Zombie/Zombie.tscn")
var Bomber = preload("res://Actor/Zombie/Bomber.tscn")
var Spitter = preload("res://Actor/Zombie/Spitter.tscn")
var Acid = preload("res://Actor/Zombie/Acid.tscn")
var Box = preload("res://Breakable/Box.tscn")

func _ready():
	# Make sure the zombies/crates have a certain distance when being spawned
	$CrateSpawn.curve.bake_interval = 50
	$EnemySpawn.curve.bake_interval = 50

func spawn_zombies(num_zombies, num_bombers, num_spitters, num_acids):
	randomize()
	var zombie_spawn_location = get_node("EnemySpawn/ZombieSpawnLocations")
	
	for i in range(num_zombies + num_bombers + num_spitters + num_acids):
		# Spawn zombie on random position on the Path2D
		zombie_spawn_location.offset = randi()
		
		var zombie
		if i < num_zombies:
			zombie = self.Zombie.instance()
		elif i < num_zombies + num_bombers:
			zombie = self.Bomber.instance()
		elif i < num_zombies + num_bombers + num_spitters:
			zombie = self.Spitter.instance()
		else:
			zombie = self.Acid.instance()

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
