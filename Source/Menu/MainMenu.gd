extends Control

func _ready():
	var globals = get_node("/root/Globals")
	globals.play_sound("Menu_background", false)
	$TextEdit.text = "Highscore: " + str(PlayerValues.read_savegame())
	
func _on_Play_pressed():
	# Start the game by switching to the World scene
	var globals = get_node("/root/Globals")
	var dir = Directory.new()
	dir.open("res://Temp")
	dir.list_dir_begin(true)
	while(true):
		var path = dir.get_next()
		if path != ".gitignore":
			if(path == ""):
				break
			dir.remove(path)
	globals.stop_sounds()
	assert(get_tree().change_scene("res://World/TutorialScene.tscn") == OK)

func _on_ExitGame_pressed():
	# Quit the game
	get_tree().quit(0)


func _on_Options_pressed():
	$Options.visible = true 


func _on_SaveOptions_pressed():
	$Options.visible = false


func _on_Volume_value_changed(value):
	if value == 0:
		print("mute")
		AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value-50)
	
