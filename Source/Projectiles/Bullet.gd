extends Area2D

var speed = 400

func _physics_process(delta):
	global_position += transform.x * speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	print("be gone, thot")
	queue_free()
