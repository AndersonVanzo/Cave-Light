extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 250
const JUMP_HEIGHT = -600
var motion = Vector2()
export var life_max = 10
export var life = 10
var lifebar

func _ready():
	lifebar = get_tree().get_nodes_in_group("hp")[0]

func lifebar_refresh():
	match life:
		10:
			lifebar.play("10")
		9:
			lifebar.play("09")
		8:
			lifebar.play("08")
		7:
			lifebar.play("07")
		6:
			lifebar.play("06")
		5:
			lifebar.play("05")
		4:
			lifebar.play("04")
		3:
			lifebar.play("03")
		2:
			lifebar.play("02")
		1:
			lifebar.play("01")

# movimento
func _physics_process(delta):

	lifebar_refresh()
	
	if life == 0:
		get_tree().change_scene("res://scenes/Morte.tscn")

	motion.y += GRAVITY

	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	else:
		motion.x = 0
		$AnimatedSprite.play("stand")

	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		$AnimatedSprite.play("jump")

	motion = move_and_slide(motion, UP)
	
# morte
func _on_pes_body_entered(body):
	life = life - 1
	$".".position = Vector2(5,0)

func _on_abrir_area_entered(area):
	if Input.is_action_pressed("ui_enter"):
		get_tree().change_scene("res://scenes/MainMenu.tscn")
