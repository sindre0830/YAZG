extends Node

var whole_box = preload("res://Assets/Spritesheet/BreakableObj/broken_box.png")

func destroybox():
	get_node("Sprite").set_texture(whole_box)
	get_node("CollisionShape2D").disabled = true
	print("Destroybox")
				
			
			
			
	

