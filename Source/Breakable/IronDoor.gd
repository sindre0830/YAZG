extends "res://Breakable/BreakableObject.gd"

func _init():
	max_health = 0
	health = max_health


func destroy_object():
	# Remove car
	var isZombie = get_owner().get_children()
	var zombiecount = 0
	for i in isZombie:
		if "Zombie" in i.get_name():
			zombiecount += zombiecount + 1
	if zombiecount == 0: 
		
		queue_free()
