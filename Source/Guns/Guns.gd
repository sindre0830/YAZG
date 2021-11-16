extends Node

var speed = null
var clip_size = null
var clip = null
var reload_timer : Timer
export var Bullet = preload("res://Projectiles/Bullet.tscn")

func _init(new_speed: int, new_clip_size: int, new_reload_time: float) -> void:
	speed = new_speed
	clip_size = new_clip_size
	clip = new_clip_size
	reload_timer = Timer.new()
	reload_timer.set_wait_time(new_reload_time)
	reload_timer.set_one_shot(true)
	add_child(reload_timer)	
	reload_timer.connect("timeout", self, "_on_timer_timeout")
	
func shoot(muzzle: Position2D, player: Node):
	pass

func reload():
	var globals = get_node("/root/Globals")
	globals.play_sound("Reload", false)
	reload_timer.start()
	
func _on_timer_timeout():
	print("timeout")
	print(clip_size)
	clip = clip_size
	print(clip)
