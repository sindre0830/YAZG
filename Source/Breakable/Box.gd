extends "res://Breakable/BreakableObject.gd"

var hp_collectable = preload("res://Collectables/HealthCollectable.tscn")
var frag_grenade = preload("res://Collectables/FragGrenade.tscn")
var molly = preload("res://Collectables/MolotovCocktail.tscn")

var items = [hp_collectable, frag_grenade, molly]

var rng = RandomNumberGenerator.new()

func _init():
	broken_object = preload("res://Assets/Spritesheet/BreakableObj/broken_box.png")
	max_health = 100
	health = max_health
	
func init(transform, pos):
	self.transform = transform
	self.position = pos


func destroy_object():
	# Randomly drop an item
	self.rng.randomize()
	var rand = self.rng.randi_range(0, 2)
	
	var dropped_item = items[rand].instance()
	
	if rand == 0:
		dropped_item.init(25)
	
	.add_child(dropped_item)
	.destroy_object()

