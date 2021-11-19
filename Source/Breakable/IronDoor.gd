extends "res://Breakable/BreakableObject.gd"

func _init():
	max_health = 0
	health = max_health


func destroy_object():		
		queue_free()
