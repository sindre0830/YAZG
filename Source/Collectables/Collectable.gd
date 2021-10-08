extends Area2D

func _on_Timer_timeout():
	# Delete collectable Item after timer timeouts
	queue_free()
