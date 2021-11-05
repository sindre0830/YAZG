extends "res://Guns/Guns.gd"
onready var damage = 12
onready var n_bullets = 3

func _init().(500) -> void:
	pass
	
func shoot(muzzle: Position2D, player: Node):
	var globals = get_node("/root/Globals")
	globals.play_sound("ShotGun_shot", false, muzzle.global_position)
	for n in n_bullets:
		var bullet = Bullet.instance()
		bullet.init(speed, damage)
		bullet.transform =  muzzle.global_transform *  bullet.transform.rotated((PI/n_bullets*n - PI/n_bullets*(n_bullets/2))/3).orthonormalized()
		player.owner.add_child(bullet)
	$Timer.start()
