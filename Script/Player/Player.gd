extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 250
const JUMP_HEIGHT = -600
var life_max = 10
var life = 10
var lifebar
var motion = Vector2()
var abrirBau = false
var abrirPorta = false
var keys = 0

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : get_node(".").position.x,
		"pos_y" : get_node(".").position.y,
		"current_health" : get_node(".").life,
		"max_health" : get_node(".").life_max
	}
	return save_dict

func _ready():
	lifebar = get_tree().get_nodes_in_group("hp")[0]
	pass
	
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
		0:
			get_tree().change_scene("res://Scenes/Others/Morte.tscn")

func _physics_process(delta):

	lifebar_refresh()

	# gravidade
	motion.y += GRAVITY

	# movimento
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("Run_darker1")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("Run_darker1")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Stand_darker1")

	#pulo
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play("Jump_darker1")

	motion = move_and_slide(motion, UP)

# morte spikes
func _on_Pes_body_entered(body):
	life -= 1
	$".".position = Vector2(90, 630)
