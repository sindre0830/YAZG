extends Node

enum {
	PRIMARY_GUN,
	SECONDARY_GUN,
	THROWABLE
}

enum {
	MINI_GUN,
	PISTOL,
	MOLOTOV_COCKTAIL,
	FRAG_GRENADE, 
	NO_GRENADE
}

var current_health = 100
var current_difficulty = 1
var XP = 0
var time_end
var toolbar = [MINI_GUN, PISTOL]
var inventory = [FRAG_GRENADE, FRAG_GRENADE, FRAG_GRENADE, FRAG_GRENADE, FRAG_GRENADE, FRAG_GRENADE]
var flagPaused = false

var score = 0

var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file
var save_data = {"highscore": score} #variable to store data

func _ready():
	if not PlayerValues.savegame.file_exists(PlayerValues.save_path):
		create_save()
	
func create_save():
	savegame.open(save_path, File.WRITE)
	savegame.store_var(save_data)
	savegame.close()
	
func read_savegame():
	savegame.open(save_path, File.READ) #open the file
	save_data = savegame.get_var() #get the value
	savegame.close() #close the file
	if save_data["highscore"]:
		return save_data["highscore"] #return the value
	else:
		return "No high score registered"
