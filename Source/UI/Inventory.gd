extends Control

var item_class = load("res://UI/inventoryItem.gd")
var itemDict = {
	PlayerValues.MINI_GUN: item_class.new(
		"Mini gun", 
		"Can shoot a lot of bullets quickly, but each projectile deals low damage and the spray is hard to control.", 
		load("res://Assets/Guns/PNG/Assault_rifle_V1.01.png")
	),
	PlayerValues.PISTOL: item_class.new(
		"Pistol", 
		"Slow, but reliable.", 
		load("res://Assets/Guns/PNG/GUN_01_[square_frame]_01_V1.00.png")
	),
	PlayerValues.MOLOTOV_COCKTAIL: item_class.new(
		"Molotov", 
		"Spreads fire at impact, deals damage over time.", 
		load("res://icon.png")
	),
	PlayerValues.FRAG_GRENADE: item_class.new(
		"Grenade", 
		"Explodes on timeout, deals a lot of damage.", 
		load("res://icon.png")
	),
}


func set_inventory():
	# set toolbar
	$Toolbar.clear()
	for key in PlayerValues.toolbar:
		$Toolbar.add_item(itemDict[key].title, itemDict[key].image)
	# set inventory
	$ItemList.clear()
	for key in PlayerValues.inventory:
		$ItemList.add_item(itemDict[key].title, itemDict[key].image)
	# set grenade
	if PlayerValues.toolbar.size() >= 3:
		get_parent().get_node("GrenadeDisplay").setGrenadeDisplayed(PlayerValues.toolbar[PlayerValues.THROWABLE])
	else:
		get_parent().get_node("GrenadeDisplay").setGrenadeDisplayed(PlayerValues.NO_GRENADE)


func _on_ItemList_item_selected(index):
	var key = PlayerValues.inventory[index]
	$Header.text = itemDict[key].title
	$Label.text = itemDict[key].description
	$Icon.texture = itemDict[key].image


func _on_Toolbar_item_selected(index):
	var key = PlayerValues.toolbar[index]
	$Header.text = itemDict[key].title
	$Label.text = itemDict[key].description
	$Icon.texture = itemDict[key].image


func _on_Toolbar_focus_exited():
	$Toolbar.unselect_all()


func _on_ItemList_focus_exited():
	$ItemList.unselect_all()


func _on_RTMainMenu_pressed():
	get_tree().paused = false
	PlayerValues.flagPaused = false
	# Switch scene back to main menu
	assert(get_tree().change_scene("res://Menu/MainMenu.tscn") == OK)


func _on_ExitGame_pressed():
	# Quit the game
	get_tree().quit(0)
