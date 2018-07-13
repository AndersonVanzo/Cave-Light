extends Node2D

var abrir = false

var keys = 0

export (PackedScene) var scene

func _ready():
	scene = scene.instance()

func _physics_process(delta):
	if Input.is_action_pressed("ui_enter"):
		if abrir == true:
			queue_free()
			get_tree().change_scene("res://Scenes/Others/MainMenu.tscn")

func _on_Body_body_entered(body):
	abrir = true
func _on_Body_body_exited(body):
	abrir = false
