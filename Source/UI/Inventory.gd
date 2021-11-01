extends Control

var item_class = load("res://UI/inventoryItem.gd")
var itemDict = {
	0: item_class.new(
		"Mini gun", 
		"Can shoot a lot of bullets quickly, but each projectile deals low damage and the spray is hard to control.", 
		load("res://Assets/Guns/PNG/Assault_rifle_V1.01.png")
	),
	1: item_class.new(
		"Pistol", 
		"Slow, but reliable.", 
		load("res://Assets/Guns/PNG/GUN_01_[square_frame]_01_V1.00.png")
	),
	2: item_class.new(
		"Molotov", 
		"Spreads fire at impact, deals damage over time.", 
		load("res://icon.png")
	),
	3: item_class.new(
		"Grenade", 
		"Explodes on timeout, deals a lot of damage.", 
		load("res://icon.png")
	),
}


func _on_ItemList_item_selected(index):
	$Icon.texture = $ItemList.get_item_icon(index)
	$Header.text = $ItemList.get_item_text(index)


func set_inventory():
	$ItemList.clear()
	for key in PlayerValues.inventory:
		print(key)
		$ItemList.add_item(itemDict[key].title, itemDict[key].image)
