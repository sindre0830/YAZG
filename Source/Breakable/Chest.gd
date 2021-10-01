extends Area2D

var open_chest = preload("res://Assets/Spritesheet/BreakableObj/open_chest.png")
export (float) var max_health = 100
onready var health = max_health

func destroybox():
	get_node("Sprite").set_texture(open_chest)
	$CollisionShape2D.set_deferred("disabled", true)


func take_damage(amount):
	# Reduce health by given amount
	health = clamp(health - amount, 0, max_health)
	
	#Destroys the box
	if health == 0:
		destroybox()
		trigger_loot()
		
# Checks if the box is already broken
func is_broken():
	if $CollisionShape2D.disabled == true:
		return true
	return false

func trigger_loot():
	
	
	
