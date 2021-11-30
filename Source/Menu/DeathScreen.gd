extends Node2D

onready var timer # Todo: make timer global

onready var label = "Label"
onready var score = 0
func _ready():
	if PlayerValues.current_XP == 0:
		PlayerValues.current_XP = 20
	else:
		score = PlayerValues.current_XP /  PlayerValues.time_end
	get_node(label).set_text(get_node("Label").get_text() + " with points: " + str(score))
	if score > PlayerValues.read_savegame():
		save(score)



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
	assert(get_tree().change_scene("res://World/TutorialScene.tscn") == OK)


func _on_RTMainMenu_pressed():
	# Switch scene back to main menu
	assert(get_tree().change_scene("res://Menu/MainMenu.tscn") == OK)

	
func save(high_score):     # Saves he high score
   PlayerValues.save_data["highscore"] = high_score #data to save
   PlayerValues.savegame.open(PlayerValues.save_path, File.WRITE) #open file to write
   PlayerValues.savegame.store_var(PlayerValues.save_data) #store the data
   PlayerValues.savegame.close() # close the file
