extends Control


func _on_ItemList_item_selected(index):
	$Icon.texture = $ItemList.get_item_icon(index)
	$Header.text = $ItemList.get_item_text(index)
