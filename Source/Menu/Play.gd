extends Button

func _on_Play_pressed():
	# Start the game by switching to the World scene
	assert(get_tree().change_scene("res://World/World.tscn") == OK)
