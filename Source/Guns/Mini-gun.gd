extends "res://Guns/Guns.gd"
onready var damage = 8
var rng  = RandomNumberGenerator.new()
var spray = 0.2
var sound_playing = false

func _init().(1000, 30, 1.0, 0.05) -> void:
	pass
	
func shoot(muzzle: Position2D, player: Node):
	if shoot_timer.is_stopped() and clip != 0:
		var globals = get_node("/root/Globals")
		globals.play_sound("Rifle_shot", false, muzzle.global_position)
		sound_playing = true
		var bullet = Bullet.instance()
		rng.randomize()
		bullet.init(speed, damage)
		var random_number = rng.randf_range(-PI/4*spray, PI/4*spray)
		bullet.transform =  muzzle.global_transform * bullet.transform.rotated(random_number).orthonormalized()
		player.owner.add_child(bullet)
		clip -= 1
		shoot_timer.start()
	elif clip == 0:
		.reload()
