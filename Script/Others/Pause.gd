extends Control

func _ready():
	$Menu.hide()

func _on_Pause_pressed():
	$Menu.show()
	get_tree().paused = true

func _on_Continuar_pressed():
	$Menu.hide()
	get_tree().paused = false

func _on_Sair_pressed():
	get_tree().quit()
