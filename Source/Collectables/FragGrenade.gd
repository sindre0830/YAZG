extends "Collectable.gd"

func _on_FragGrenade_body_entered(body):
	# Pick up the FragGrenade if the player steps on it and
	# delete the Collectable
	if body.get_name() == "Player":
		if PlayerValues.toolbar.size() < 3:
			PlayerValues.toolbar.push_back(3)
		else:
			PlayerValues.toolbar[2] = 3
		
		# Change the displayed Grenade in the UI
		body.get_node("UI").get_node("Inventory").set_inventory()
		queue_free()
