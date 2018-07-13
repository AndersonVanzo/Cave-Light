extends Node2D

var abrir = false

func _physics_process(delta):
	if Input.is_action_pressed("ui_enter"):
		if abrir == true:
			get_tree().change_scene("res://Scenes/Others/Creditos.tscn")

func _on_Body_body_entered(body):
	abrir = true
func _on_Body_body_exited(body):
	abrir = false
