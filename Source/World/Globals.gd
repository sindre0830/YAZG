extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var audio_clips = {
	"Pistol_shot": preload("res://Audio/pistol.mp3"), #preload("res://path_to_your_audio_here!")
	"Rifle_shot": preload("res://Audio/Assault_rifle.mp3"), #preload("res://path_to_your_audio_here!")
	"ShotGun_shot": preload("res://Audio/Shotgun.mp3"),
	"Menu_background": preload("res://Audio/Main_menu.mp3"), #preload("res://path_to_your_audio_here!")
}

const SIMPLE_AUDIO_PLAYER_SCENE = preload("res://Audio/Simple_Audio_Player.tscn")
var created_audio = []

func play_sound(sound_name, loop_sound=false, sound_position=null):
	if audio_clips.has(sound_name):
		var new_audio = SIMPLE_AUDIO_PLAYER_SCENE.instance()
		new_audio.should_loop = loop_sound

		add_child(new_audio)
		created_audio.append(new_audio)

		new_audio.play_sound(audio_clips[sound_name], sound_position)

	else:
		print ("ERROR: cannot play sound that does not exist in audio_clips!")

func stop_sounds():
	if (created_audio.size() != 0):
		for player in created_audio:
			player.stop()
