extends Node2D

var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
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

