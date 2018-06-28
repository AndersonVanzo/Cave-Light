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
	if life == 10:
		lifebar.play("10")
	elif life == 9:
		lifebar.play("09")
	elif life == 8:
		lifebar.play("08")
	elif life == 7:
		lifebar.play("07")
	elif life == 6:
		lifebar.play("06")
	elif life == 5:
		lifebar.play("05")
	elif life == 4:
		lifebar.play("04")
	elif life == 3:
		lifebar.play("03")
	elif life == 2:
		lifebar.play("02")
	elif life == 1:
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