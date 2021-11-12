extends "res://Guns/Guns.gd"
onready var damage = 8
var rng  = RandomNumberGenerator.new()
var spray = 0.2
var sound_playing = false

func _init().(1000) -> void:
	pass
	
func shoot(muzzle: Position2D, player: Node):
	var globals = get_node("/root/Globals")
	globals.play_sound("Rifle_shot", false, muzzle.global_position)
	sound_playing = true
	var bullet = Bullet.instance()
	rng.randomize()
	bullet.init(speed, damage)
	var random_number = rng.randf_range(-PI/4*spray, PI/4*spray)
	bullet.transform =  muzzle.global_transform * bullet.transform.rotated(random_number).orthonormalized()
	player.owner.add_child(bullet)
	$Timer.start()
	
