extends Area2D

export var path: String 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node) -> void:	
	var scene = PackedScene.new()
	print(PreviousWorld.previous_name)
	print(path)
	print("current path:" + get_tree().current_scene.filename)
	if(PreviousWorld.previous_name != path):
		print("new saved")
		scene.pack(get_tree().get_root())
		PreviousWorld.previous_world = scene
		PreviousWorld.previous_name = get_tree().current_scene.filename
		get_tree().change_scene(path)
	else:
		print("loading previous")
		var new_scene = PreviousWorld.previous_world.instance()
		new_scene.owner = get_tree().get_root()
		scene.pack(get_tree().get_root())
		PreviousWorld.previous_world = scene
		PreviousWorld.previous_name = get_tree().current_scene.filename
		get_tree().change_scene_to(new_scene)
	
