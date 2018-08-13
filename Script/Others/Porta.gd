extends Node2D

var abrir = false
var playerscript = load("res://Scenes/Player/Player.tscn")
var player = playerscript.instance()

var keys = player.keys

func _physics_process(delta):
	if Input.is_action_pressed("ui_enter"):
		if abrir == true:
			queue_free()
			get_tree().change_scene("res://Scenes/Others/MainMenu.tscn")

func _on_Body_body_entered(body):
	abrir = true
func _on_Body_body_exited(body):
	abrir = false
