extends Node2D



func _on_Respawn_pressed():
	# TODO: Load game state
	# Switch scene back to the game
	assert(get_tree().change_scene("res://World/World.tscn") == OK)
	



func _on_RTMainMenu_pressed():
	# Switch scene back to main menu
	assert(get_tree().change_scene("res://Menu/MainMenu.tscn") == OK)
