extends Node2D

onready var giftFab = preload("res://Gift.tscn")
var timer:Timer

var giftCount = 0;

func _ready():
	timer = get_node("Timer")
#	print(timer)

func _on_Timer_timeout():
	if (giftCount < 10):
		giftCount+=1;
		var gift = giftFab.instance();
		var dog = get_node("/root/Main/Dog")
		gift.connect("gift_touched", dog, "_on_gift_touched")
		gift.position = Vector2(rand_range(32,224), rand_range(32,160))
		add_child(gift)
		pass # Replace with function body.
