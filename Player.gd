# Player.gd
extends Node2D

var speed = 4
var tween
var dog
var property = "transform/position"

func _ready():
	tween = get_node("Tween")
	dog = get_node("Sprite")

func _process(delta):
	handleInput()

func handleInput():
	mouseClick()
	# KeyBoardControls
	if Input.is_action_pressed("right"):
		move("right")
		if get_node("Sprite").flip_h:
			get_node("Sprite").flip_h = false
	if Input.is_action_pressed("left"):
		move("left")
		if !get_node("Sprite").flip_h:
			get_node("Sprite").flip_h = true
	if Input.is_action_pressed("up"):
		move("up")
	if Input.is_action_pressed("down"):
		move("down")

func mouseClick():
	if Input.is_mouse_button_pressed(1):
		move_ball_to(get_local_mouse_position())
	


func move(word):
	match word:
		"right":
			position.x += floor(1 * speed);
		"left":
			position.x -= floor(1 * speed);
		"up":
			position.y -= floor(1 * speed);
		"down":
			position.y += floor(1 * speed);


func move_ball_to(target_pos):
	var start = dog.position
	var end = target_pos
	var distance = start.distance_to(end)
	var direction = start - end;
	if direction.x < 0:
		dog.flip_h = false
	else:
		dog.flip_h = true
	var time = distance / 40
	
	if time <= 0: return
	
	tween.interpolate_property(dog, "position",
        start, end, time,
        Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()

