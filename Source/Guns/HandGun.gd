extends "res://Guns/Guns.gd"
onready var damage = 24

func _init().(700, 7, 1.0) -> void:
	pass
	
func shoot(muzzle: Position2D, player: Node):
	if $Timer.is_stopped() and clip != 0:
		var globals = get_node("/root/Globals")
		globals.play_sound("Pistol_shot", false, muzzle.global_position)
		var bullet = Bullet.instance()
		bullet.init(speed, damage)
		bullet.transform =  muzzle.global_transform 
		player.owner.add_child(bullet)
		clip -= 1
		$Timer.start()
	elif clip == 0:
		.reload()
