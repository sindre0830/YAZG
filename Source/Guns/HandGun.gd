extends "res://Guns/Guns.gd"
onready var damage = 24

func _init().(700) -> void:
	pass
	
func shoot(muzzle: Position2D, player: Node):
	var bullet = Bullet.instance()
	bullet.init(speed, damage)
	bullet.transform =  muzzle.global_transform 
	player.owner.add_child(bullet)
	$Timer.start()
