extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("right"):
		move("right")
	if Input.is_action_pressed("left"):
		move("left")
	if Input.is_action_pressed("up"):
		move("up")
	if Input.is_action_pressed("down"):
		move("down")

func move(word):
	match word:
		"right":
			position.x += 1
		"left":
			position.x -= 1
		"up":
			position.y -= 1
		"down":
			position.y += 1

