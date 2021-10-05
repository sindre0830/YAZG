extends Area2D

onready var damage = 24

var speed

func init(var new_speed) -> void:
	speed = new_speed
	
func _physics_process(delta):
	global_position += transform.x * speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	# Deal damage to body if it has "take_damage" method
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()
