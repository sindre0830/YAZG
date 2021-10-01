extends Control

func switchGunDisplayed():
	var bufferLabel = $Secondary/Label.text
	var bufferIcon = $Secondary/SecondaryIcon.texture
	$Secondary/Label.text = $Main/Label.text
	$Secondary/SecondaryIcon.texture = $Main/MainIcon.texture
	$Main/Label.text = bufferLabel
	$Main/MainIcon.texture = bufferIcon
