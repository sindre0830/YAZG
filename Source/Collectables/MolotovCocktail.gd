extends "Collectable.gd"

var MolotovCocktail = preload("res://Throwables/MolotovCocktail.tscn")


func _on_MolotovCocktail_body_entered(body):
	# Pick up the MolotovCocktail if the player steps on it and
	# delete the Collectable
	if body.get_name() == "Player":
		body.Grenade = MolotovCocktail
		
		# Change the displayed Grenade in the UI
		var ui_node = body.get_node("UI/GrenadeDisplay")
		ui_node.setGrenadeDisplayed(ui_node.MOLOTOV_COCKTAIL)
		queue_free()
