extends "res://Guns/Guns.gd"

var n_bullets = 3

func _init().(500) -> void:
	pass
	
func shoot(muzzle: Position2D, player: Node):
	for n in n_bullets:
		var bullet = Bullet.instance()
		bullet.init(speed)
		bullet.transform =  muzzle.global_transform *  bullet.transform.rotated((PI/n_bullets*n - PI/n_bullets*(n_bullets/2))/3).orthonormalized()
		player.owner.add_child(bullet)
	$Timer.start()
