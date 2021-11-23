# Acid floor - does little damage, but severely slows player
extends "HazardousArea.gd"

var dps = 5


func _physics_process(delta):
	# Deal damage to bodies inside the acid pool area
	for body in bodies_in_area:
		if body.name == "Player":
			if body.hazard < dps:
				body.hazard = dps
			#body.take_damage(delta * dps)

func _on_Timer_timeout():
	# Delete the acid floor
	queue_free()

func _on_HazardousArea_body_entered(body):
	# Add bodies when they enter the area and slow player
	bodies_in_area.append(body)
	if body.name == "Player" && body.MAX_SPEED >= 50:
		body.MAX_SPEED = body.ORIG_SPEED * 0.4
			
func _on_HazardousArea_body_exited(body):
	# Remove bodies when they leave the area and reset speed
	if body.name == "Player":
		body.MAX_SPEED = body.ORIG_SPEED
		body.hazard = 0
	bodies_in_area.erase(body)
