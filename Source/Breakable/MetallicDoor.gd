extends "res://Breakable/BreakableObject.gd"

func _init():
	max_health = 200
	health = max_health


func destroy_object():
	# Remove car
	queue_free()
