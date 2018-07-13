extends Control

func _ready():
	$AnimationPlayer.play("fade_in_out_if")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Loading/SplashScreen2.tscn")
