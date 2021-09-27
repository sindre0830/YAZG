class_name gun
var speed = null

export var Bullet = preload("res://Projectiles/Bullet.tscn")

func _init(new_speed: int) -> void:
	speed = new_speed
	
func _on_click(muzzle: Position2D, CD: Timer, player: Node):
	var bullet = Bullet.instance()
	bullet.init(speed)
	bullet.transform = muzzle.global_transform
	player.owner.add_child(bullet)
	CD.start()

