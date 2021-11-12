extends Node2D

onready var timer # Todo: make timer global

onready var label = "Label"

func _ready():
	# Code for displaying time TODO
	print(get_node(label).get_name())
	get_node(label).set_text(get_node("Label").get_text() + " with time: " + str(PlayerValues.time_end))


func _on_Respawn_pressed():
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


func _on_RTMainMenu_pressed():
	# Switch scene back to main menu
	assert(get_tree().change_scene("res://Menu/MainMenu.tscn") == OK)
