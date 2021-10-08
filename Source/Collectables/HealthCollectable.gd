extends "res://Collectables/Collectable.gd"

var heal_value

func init(heal_amount):
	heal_value = -heal_amount
	

func _on_HealthCollectable_body_entered(body):
	# Heal the player if they step on it and
	# delete the HealthCollectable
	if body.get_name() == "Player":
		body.take_damage(heal_value)
		queue_free()
