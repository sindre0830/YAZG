extends "res://Breakable/BreakableObject.gd"

var hp_collectable = preload("res://Collectables/HealthCollectable.tscn")

func _init():
	broken_object = preload("res://Assets/Spritesheet/BreakableObj/broken_box.png")
	max_health = 100
	health = max_health


func destroy_object():
	var dropped_item = hp_collectable.instance()
	dropped_item.init(25)
	.add_child(dropped_item)
	.destroy_object()

