extends "HazardousArea.gd"

var dps = 25
var audio

func _physics_process(delta):
	# Deal damage to bodies inside the burning area
	for body in bodies_in_area:
		if body.has_method("take_damage"):
			body.take_damage(delta * dps)

func start_burn_audio():
	# Play molotov sound
	var globals = get_node("/root/Globals")
	self.audio = globals.play_sound("molotov_explosion", false, self.global_position)

func _on_Timer_timeout():
	self.audio.stop()
	# Delete the burning floor
	queue_free()
