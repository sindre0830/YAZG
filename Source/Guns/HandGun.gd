extends "res://Guns/Guns.gd"
onready var damage = 24

func _init().(700) -> void:
	pass
	
func shoot(muzzle: Position2D, player: Node):
	var globals = get_node("/root/Globals")
	globals.play_sound("Pistol_shot", false, muzzle.global_position)
	var bullet = Bullet.instance()
	bullet.init(speed, damage)
	bullet.transform =  muzzle.global_transform 
	player.owner.add_child(bullet)
	$Timer.start()
