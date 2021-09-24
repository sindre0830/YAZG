extends Node2D


onready var box = load("res://Breakable/Box.tscn")
onready var broken = load("res://Breakable/BrokenBox.tscn")
var boxes 
var pos = [200, 200, 500, 600]
var collision
var boxcollision
var image = preload("res://Assets/Spritesheet/BreakableObj/broken_box.png")
var whole_box = preload("res://Assets/Spritesheet/BreakableObj/box.png")

var listboxes = []


# Called when the node enters the scene tree for the first time.
func _ready():
	createboxes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func createboxes():
	for i in 3:
		boxes = box.instance()
		boxes.get_node("Sprite").set_texture(whole_box)
		add_child(boxes)
		print(boxes.name)
		listboxes.push_back(boxes)
		boxes.position = Vector2(pos[i],pos[i+1]) # Just some shit placement code

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_S:
			#tex.create_from_image(image)
			for list in listboxes:
				list.get_node("Sprite").set_texture(image)
				
			
			
			
	


	
	

	
