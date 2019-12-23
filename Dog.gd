# Dog.gd
extends Node2D
var onFire = false
onready var fireEmit = preload("res://FireEmitter.tscn")

var timer:Timer;

func _ready():
	timer = get_node("Timer")
	timer.connect("timeout",self,"timeoutFun")

func timeoutFun():
	timer.stop()
	if (onFire):
		var s = get_node("Sprite")
		s.modulate = "#fff"
		onFire = false
		if has_node("FireEmitter"):
			var f = get_node("FireEmitter")
			remove_child(f)

func _on_Main_dog_entered_fire():
	timer.stop()
	timer.start()
	if !onFire:
		var s = get_node("Sprite")
		s.modulate = "#e7482b"
		var f = fireEmit.instance();
		f.scale.x = 3
		f.scale.y = 3;
		f.local_coords = false;
		self.add_child(f);
		onFire = true;
