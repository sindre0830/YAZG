extends "HazardousArea.gd"


var dps = 25


func _physics_process(delta):
	# Deal damage to bodies inside the burning area
	for body in bodies_in_area:
		if body.has_method("take_damage"):
			body.take_damage(delta * dps)


func _on_Timer_timeout():
	# Delete the burning floor
	queue_free()
