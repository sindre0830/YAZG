extends "res://Breakable/BreakableObject.gd"

func _init():
	max_health = 100
	health = max_health


func destroy_object():
	# Remove car
	queue_free()
