extends Node2D

onready var timer # Todo: make timer global

onready var label = "Label"

func _ready():
	# Code for displaying time TODO
	timer = 20.08
	print(get_node(label).get_name())
	get_node(label).set_text(get_node("Label").get_text() + " with time: " + str(timer))

func _on_Respawn_pressed():
	# TODO: Load game state
	# Switch scene back to the game
	assert(get_tree().change_scene("res://World/World.tscn") == OK)
	



func _on_RTMainMenu_pressed():
	# Switch scene back to main menu
	assert(get_tree().change_scene("res://Menu/MainMenu.tscn") == OK)
