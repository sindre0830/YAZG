extends "Collectable.gd"

var FragGrenade = preload("res://Throwables/FragGrenade.tscn")

func _on_FragGrenade_body_entered(body):
	# Pick up the FragGrenade if the player steps on it and
	# delete the Collectable
	if body.get_name() == "Player":
		body.Grenade = FragGrenade
		queue_free()
