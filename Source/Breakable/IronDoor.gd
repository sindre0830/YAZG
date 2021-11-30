extends Node2D

func _process(delta):
		# Remove car
	var isZombie = get_parent().get_children()
	var zombiecount = 0
	for i in isZombie:
		if ("Zombie" in i.get_name() || "Spitter" in i.get_name() 
		|| "Acid" in i.get_name()    || "Bomber"  in i.get_name() 
		|| "Boss" in i.get_name()):
			zombiecount += zombiecount + 1
	if zombiecount == 0: 
		queue_free()
