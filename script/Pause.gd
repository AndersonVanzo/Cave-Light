extends Control

func _ready():
	$menu.hide()

func _on_pause_pressed():
	$menu.show()
	get_tree().paused = true


func _on_resume_pressed():
	$menu.hide()
	get_tree().paused = false


func _on_sair_pressed():
	get_tree().quit()
