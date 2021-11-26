extends Node

var shopping = false

func _on_ShoppingArea_body_entered(body):
	if body.get_name() == "Player":
		shopping = true

func _on_ShoppingArea_body_exited(body):
	if body.get_name() == "Player":
		shopping = false

func _physics_process(delta):
	if shopping:
		if Input.is_action_pressed("ui_interact"):
			$CanvasLayer/Shop.visible = true

