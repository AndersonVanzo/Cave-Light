extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_enter"):
		print("apertou")
		get_tree().change_scene("res://scenes/Menu.tscn")
