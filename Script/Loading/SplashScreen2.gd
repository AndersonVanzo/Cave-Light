extends Control

func _ready():
	$AnimationPlayer.play("fade_in_out_logo")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Others/MainMenu.tscn")
