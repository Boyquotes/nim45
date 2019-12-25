# Dog.gd
extends Node2D
var onFire = false
onready var fireEmit = preload("res://FireEmitter.tscn")
onready var giftPoof = preload("res://GiftPoof.tscn")

var timer:Timer;
var score  = 0;

func _ready():
	timer = get_node("Timer")
	timer.connect("timeout",self,"timeoutFun")

func timeoutFun():
	timer.stop()
	if (onFire):
		var s = get_node("Sprite")
		onFire = false
		if has_node("FireEmitter"):
			var f = get_node("FireEmitter")
			remove_child(f)

func _on_Main_dog_entered_fire():
	timer.stop()
	timer.start()
	if !onFire:
		var s = get_node("Sprite")
		var f = fireEmit.instance();
		f.scale_amount = 6;
		f.scale.x = 3;
		f.z_index = z_index+1
		f.local_coords = false;
		self.add_child(f);
		onFire = true;

func _on_gift_touched(gift):
	var label = get_node("/root/Main/Label")
	var g = giftPoof.instance()
	g.position = gift.global_position
	g.set_emitting(true)
	get_node("/root/Main").add_child(g)
	score = score + gift.value;
	label.text = "%d" % score
	get_node("/root/Main/gifts").giftCount -= 1
#	print("touched gift! score is %d" % score)
	pass
