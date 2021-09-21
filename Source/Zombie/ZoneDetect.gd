extends Area2D
# Source: https://www.youtube.com/watch?v=R0XvL3_t840

var player = null

func can_see_player():
	return player != null

func _on_ZoneDetect_body_entered(body):
	player = body

func _on_ZoneDetect_body_exited(body):
	player = null
