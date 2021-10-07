extends Area2D

export var next_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node) -> void:
	get_tree().change_scene_to(next_scene)
