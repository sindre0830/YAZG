extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node) -> void:
	get_tree().change_scene("res://World//MVP_World//1_2.tscn")
