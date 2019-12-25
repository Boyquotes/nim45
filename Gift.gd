extends Node2D
signal gift_touched(typeOfGift);

var value = 200;

func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(gift):
	emit_signal("gift_touched", self)	
	get_parent().remove_child(self)

