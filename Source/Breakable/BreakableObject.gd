extends StaticBody2D

var broken_object
var max_health
var health

func destroy_object():
	get_node("Sprite").set_texture(broken_object)
	$CollisionShape2D.set_deferred("disabled", true)

func take_damage(amount):
	# Reduce health by given amount
	health = clamp(health - amount, 0, max_health)
	
	#Destroys the box
	if health == 0:
		destroy_object()
		
# Checks if the box is already broken
func is_broken():
	if $CollisionShape2D.disabled == true:
		return true
	return false
