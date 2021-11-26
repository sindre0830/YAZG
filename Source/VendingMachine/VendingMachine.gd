extends Node

var hp_collectable = preload("res://Collectables/HealthCollectable.tscn")
var frag_grenade = preload("res://Collectables/FragGrenade.tscn")
var molly = preload("res://Collectables/MolotovCocktail.tscn")
var shopping = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		shopping = true

func _on_Area2D_body_exited(body):
	shopping = false

func _physics_process(delta):
	if shopping:
		if Input.is_action_pressed("ui_interact"):
			$CanvasLayer/Shop.visible = true
			print ("heu")

func _on_exit_pressed():
	self.visible = false
	

func init(transform, pos):
	self.transform = transform
	self.position = pos

func _on_spawnGranade_selected():
	var dropped_item = frag_grenade.instance()
	.add_child(dropped_item)
	
func _on_spawnMolly_selected():
	var dropped_item = molly.instance()
	.add_child(dropped_item)

func _on_spawnHealth_selected():
	var dropped_item = hp_collectable.instance()
	dropped_item.init(25)



