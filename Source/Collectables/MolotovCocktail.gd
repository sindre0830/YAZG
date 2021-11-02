extends "Collectable.gd"

func _on_MolotovCocktail_body_entered(body):
	# Pick up the MolotovCocktail if the player steps on it and
	# delete the Collectable
	if body.get_name() == "Player":
		if PlayerValues.toolbar.size() < 3:
			PlayerValues.toolbar.push_back(2)
		else:
			PlayerValues.toolbar[2] = 2
		
		# Change the displayed Grenade in the UI
		body.get_node("UI").get_node("Inventory").set_inventory()
		queue_free()
