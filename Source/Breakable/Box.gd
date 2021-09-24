extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_Player_body_entered(body):
	queue_free()
	

func _on_Bullet_body_entered(body):
	queue_free()

func _on_Bullet_area_entered(area):
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
