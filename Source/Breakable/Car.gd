extends StaticBody2D

export (float) var max_health = 100
onready var health = max_health


func destroybox():
	queue_free()


func take_damage(amount):
	# Reduce health by given amount
	health = clamp(health - amount, 0, max_health)
	
	#Destroys the box
	if health == 0:
		destroybox()
