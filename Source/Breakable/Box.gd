extends StaticBody2D

var whole_box = preload("res://Assets/Spritesheet/BreakableObj/broken_box.png")
export (float) var max_health = 100
onready var health = max_health


func destroybox():
	get_node("Sprite").set_texture(whole_box)
	$CollisionShape2D.set_deferred("disabled", true)


func take_damage(amount):
	# Reduce health by given amount
	health = clamp(health - amount, 0, max_health)
	
	#Destroys the box
	if health == 0:
		destroybox()
