# Dog.gd
extends Node2D
var onFire = false
onready var fireEmit = preload("res://FireEmitter.tscn")
onready var giftPoof = preload("res://GiftPoof.tscn")
onready var giftScore = preload("res://scoreLabel.tscn")

signal got_gift(gift);
var timer:Timer;

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
		f.scale_amount = 7;
		var cam = get_node("/root/Main/Camera2D")
		cam.shake(timer.wait_time,15,6)
		f.z_index = z_index+1
		f.local_coords = false;
		self.add_child(f);
		onFire = true;

func _on_gift_touched(gift):
	emit_signal("got_gift", gift);
	var g = giftPoof.instance()
	g.position = gift.global_position
	g.set_emitting(true)
	get_node("/root/Main").add_child(g)
	get_node("/root/Main/gifts").giftCount -= 1
	var cam = get_node("/root/Main/Camera2D")
	cam.shake(0.2,12,6)
	
	var templabel = giftScore.instance()
	
	get_node("/root/Main").add_child(templabel)
	var labelposition = self.global_position + Vector2(-8, -20)
	templabel.run(labelposition)
#	print("touched gift! score is %d" % score)
	pass


func _on_Dog_got_gift(gift):
	
	pass # Replace with function body.
