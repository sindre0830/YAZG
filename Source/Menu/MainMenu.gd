extends Control

func _on_Play_pressed():
	# Start the game by switching to the World scene
	assert(get_tree().change_scene("res://World/MasterScene1.tscn") == OK)

func _on_ExitGame_pressed():
	# Quit the game
	get_tree().quit(0)
