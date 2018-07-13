extends Control

func _ready():
	$AnimationPlayer.play("start")

func _on_Play_pressed():
	#get_tree().change_scene("res://Scenes/Intro/Pt1.tscn")
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")

func _on_Controles_pressed():
	get_tree().change_scene("res://Scenes/Others/Controles.tscn")

func _on_Creditos_pressed():
	get_tree().change_scene("res://Scenes/Others/Creditos.tscn")

func _on_Sair_pressed():
	get_tree().quit()
