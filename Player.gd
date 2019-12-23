# Player.gd
extends Node2D

var mouseOver = false;
var speed = 4
var tween:Tween;
var dog:Sprite
var property = "transform/position"

signal dog_entered_fire

var start:Vector2
var end:Vector2

func _ready():
	tween = get_node("Dog/Tween")
	dog = get_node("Dog")

func move_dog_to(target_pos, time):
	start = dog.position
	end = target_pos
	var direction = start - end;
	var dist = start.distance_to(end)
	if direction.x < 0:
		dog.get_node("Sprite").flip_h = false
	else:
		dog.get_node("Sprite").flip_h = true
	
	var t = dist / 120;
	tween.interpolate_property(dog, "position",
        start, end, t,
        Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()

#func _input(event):
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#		if event.is_pressed():
#			move_dog_to(get_local_mouse_position(),0.75)
#			self.on_click()

func on_click():
    print("Click")

var onFire = false;

func _on_Obstacles_area_shape_entered(area_id, area, area_shape, self_shape):
	tween.remove_all()
	print("Body Enter")

func _on_Clickable_Area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			move_dog_to(get_local_mouse_position(),0.75)
			self.on_click()

func _on_Fire_area_shape_entered(area_id, area, area_shape, self_shape):
	emit_signal("dog_entered_fire")
