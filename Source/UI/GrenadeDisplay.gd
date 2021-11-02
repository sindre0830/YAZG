extends ReferenceRect

func setGrenadeDisplayed(type):
	# Change the visibility of the sprites depending on the grenade being equipped
	if type == PlayerValues.NO_GRENADE:
		self.get_node("MolotovSprite").visible = false
		self.get_node("FragGrenadeSprite").visible = false
		
	elif type == PlayerValues.FRAG_GRENADE:
		self.get_node("MolotovSprite").visible = false
		self.get_node("FragGrenadeSprite").visible = true
		
	elif type == PlayerValues.MOLOTOV_COCKTAIL:
		self.get_node("MolotovSprite").visible = true
		self.get_node("FragGrenadeSprite").visible = false
