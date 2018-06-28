tool

extends Node2D

export var width = 50 setget set_width
export var height = 50 setget set_height

onready var tween = get_node("Tween")

func _ready():
	get_node("Abrir").hide()
	pass

func _draw():
	get_node("Abrir").width = width
	get_node("Abrir").height = height

func set_width(val):
	width = val
	update()

func set_height(val):
	height = val
	update()

func _on_Abrir_bau_body_entered(body):
	tween.interpolate_method(self, "resize", 0, 1, 1.0, Tween.TRANS_BOUNCE, Tween.EASE_OUT, 0)
	tween.start()

func _on_Abrir_bau_body_exited(body):
	tween.interpolate_method(self, "resize", 1, 0, 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT, 0)
	tween.start()

func resize(val):
	if val > .1:
		get_node("Abrir").show()
	else:
		get_node("Abrir").hide()
	get_node("Abrir").width = width * val
	get_node("Abrir").height = height * val