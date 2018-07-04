extends TextureRect

func _on_Play_pressed():
	get_tree().change_scene("res://scenes/Tutorial1.tscn")


func _on_Controles_pressed():
	get_tree().change_scene("res://scenes/Control.tscn")


func _on_Creditos_pressed():
	get_tree().change_scene("res://scenes/Créditos.tscn")


func _on_TextureButton_pressed():
	get_tree().quit()
