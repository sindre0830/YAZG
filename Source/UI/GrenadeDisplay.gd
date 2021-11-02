extends ReferenceRect

enum {NO_GRENADE, FRAG_GRENADE, MOLOTOV_COCKTAIL}

func setGrenadeDisplayed(type):
	# Change the visibility of the sprites depending on the grenade being equipped
	if type == NO_GRENADE:
		self.get_node("MolotovSprite").visible = false
		self.get_node("FragGrenadeSprite").visible = false
		
	elif type == FRAG_GRENADE:
		self.get_node("MolotovSprite").visible = false
		self.get_node("FragGrenadeSprite").visible = true
		
	elif type == MOLOTOV_COCKTAIL:
		self.get_node("MolotovSprite").visible = true
		self.get_node("FragGrenadeSprite").visible = false
