extends Area2D

export var path: String 
export var destination_position: Vector2


var directory = Directory.new();
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node) -> void:	
	save_current_world()
	PreviousWorld.previous_name = get_tree().current_scene.filename
	print(PreviousWorld.previous_name)
	if(directory.file_exists("res://Temp/temp_" + path.split("/")[3])):
		get_tree().change_scene("res://Temp/temp_" + path.split("/")[3])
	else:
		get_tree().change_scene(path)
	
	
func save_current_world()-> void:
	get_parent().move_to_position()
	var file_path: String
	if(get_tree().current_scene.filename.split("/")[2] == "Temp"):
		file_path = get_tree().current_scene.filename
	else:
		file_path = "res://Temp/temp_" + get_tree().current_scene.filename.split("/")[3]
	var scene = PackedScene.new()
	scene.pack(get_tree().current_scene)
	ResourceSaver.save(file_path,scene)
