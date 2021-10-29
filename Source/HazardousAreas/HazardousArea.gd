extends Area2D

# List containing all bodies that are currently inside the HazardousArea
var bodies_in_area = []


func _on_HazardousArea_body_entered(body):
	# Add bodies when they enter the area
	bodies_in_area.append(body)


func _on_HazardousArea_body_exited(body):
	# Remove bodies when they leave the area
	bodies_in_area.erase(body)
