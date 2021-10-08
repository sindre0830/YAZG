extends "res://Guns/Guns.gd"
onready var damage = 8
var rng  = RandomNumberGenerator.new()
var spray = 0.1

func _init().(1000) -> void:
	pass
	
func shoot(muzzle: Position2D, player: Node):
	var bullet = Bullet.instance()
	rng.randomize()
	bullet.init(speed, damage)
	var random_number = rng.randf_range(0, spray)
	bullet.transform =  muzzle.global_transform *  bullet.transform.rotated((PI/5.0*random_number - PI/random_number*(random_number/2))/10).orthonormalized()
	player.owner.add_child(bullet)
	$Timer.start()
