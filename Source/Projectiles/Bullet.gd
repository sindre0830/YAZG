extends Area2D
var damage
var speed

func init(var new_speed, new_damage: int = 24) -> void:
	speed = new_speed
	damage = new_damage
	
func _physics_process(delta):
	global_position += transform.x.normalized() * speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	# Deal damage to body if it has "take_damage" method
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()

func _on_Bullet_area_entered(area):
	if area.has_method("take_damage") && area.is_broken() == false:
		area.take_damage(damage)
	queue_free()
