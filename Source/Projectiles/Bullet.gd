extends Area2D

var speed = 700

func _physics_process(delta):
	global_position += transform.x * speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	queue_free()

func _on_Bullet_area_entered(area):
	queue_free()
