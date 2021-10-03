extends "res://Actor/Enemy.gd"

onready var navigation = get_parent().get_node("Navigation2D")

func _physics_process(delta) -> void:
	move(delta, global_position, navigation)
