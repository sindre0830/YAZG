extends Control

func _on_Play_pressed():
	# Start the game by switching to the World scene
	var dir = Directory.new()
	dir.open("res://Temp")
	dir.list_dir_begin(true)
	while(true):
		var path = dir.get_next()
		print(path)
		if path != ".gitignore":
			if(path == ""):
				break
			dir.remove(path)
	assert(get_tree().change_scene("res://World/MVP_World/1_1.tscn") == OK)

func _on_ExitGame_pressed():
	# Quit the game
	get_tree().quit(0)
