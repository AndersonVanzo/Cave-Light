extends Control

func _ready():
	$Control.hide()
	$Control2.hide()
	$AnimationPlayer.play("start")

func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/Intro/Pt1.tscn")

func _on_Controles_pressed():
	$Control2.show()

func _on_Creditos_pressed():
	$Control.show()

func _on_Sair_pressed():
	get_tree().quit()
