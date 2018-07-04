extends Control

func _on_resume_pressed():
	get_tree().paused = false

func _on_sair_pressed():
	get_tree().quit()
