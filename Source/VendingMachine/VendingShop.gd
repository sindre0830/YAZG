extends Node

onready var player = get_parent().get_parent().get_parent().get_node("Player")
var XPShow = "UI/XPDisplay/Label"
var hp_collectable = preload("res://Collectables/HealthCollectable.tscn")
var frag_grenade = preload("res://Collectables/FragGrenade.tscn")
var molly = preload("res://Collectables/MolotovCocktail.tscn")

func _on_Health_pressed():
	if (PlayerValues.current_XP >= 200):
		var dropped_item = hp_collectable.instance()
		dropped_item.position = Vector2(0, 100)
		dropped_item.init(25)
		get_parent().get_parent().add_child(dropped_item)
		self.visible = false
		PlayerValues.current_XP -= 200
		player.get_node(XPShow).text = str(PlayerValues.current_XP)

func _on_Frag_pressed():
	if (PlayerValues.current_XP >= 200):	
		var dropped_item = frag_grenade.instance()
		dropped_item.position = Vector2(0, 100)
		get_parent().get_parent().add_child(dropped_item)
		self.visible = false
		PlayerValues.current_XP -= 200
		player.get_node(XPShow).text = str(PlayerValues.current_XP)

func _on_Molly_pressed():
	if (PlayerValues.current_XP >= 200):	
		var dropped_item = molly.instance()
		dropped_item.position = Vector2(0, 100)
		get_parent().get_parent().add_child(dropped_item)
		self.visible = false
		PlayerValues.current_XP -= 200
		player.get_node(XPShow).text = str(PlayerValues.current_XP)

func _on_exit_pressed():
	self.visible = false
