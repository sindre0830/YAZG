extends Area2D

export var path: String 
export var destination_position: Vector2

var directory = Directory.new();
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node) -> void:	
	print("destination: " + path)
	print("current path: " + get_tree().current_scene.filename)
	print("temp path: " + "res://Temp/temp_" + get_tree().current_scene.filename.split("/")[3])
	save_current_world()
	if(directory.file_exists("res://Temp/temp_" + path.split("/")[3])):
		print("loading previous")
		get_tree().change_scene("res://Temp/temp_" + path.split("/")[3])
	else:
		print("new saved")
		get_tree().change_scene(path)
	print("do i get here?")
	print(body)
	print(get_owner().get_node("Player"))
	
	
func save_current_world()-> void:
	var file_path = "res://Temp/temp_" + get_tree().current_scene.filename.split("/")[3]
	var scene = PackedScene.new()
	scene.pack(get_tree().current_scene)
	ResourceSaver.save(file_path,scene)
