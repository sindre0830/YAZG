extends Node

var speed = null
export var Bullet = preload("res://Projectiles/Bullet.tscn")

func _init(new_speed: int) -> void:
	speed = new_speed
		
	
func shoot(muzzle: Position2D, player: Node):
	pass
