extends Node2D

var tween:Tween;
var label:Label
var property = "position"

# Called when the node enters the scene tree for the first time.
func _ready():
	tween = get_node("Tween")
	label = get_node("Label")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !tween.is_active():
		queue_free()
	pass

func run(startPos):
	var start = startPos;
	var end = start + Vector2(0,-20);
	var t = 1.25;
	
	tween.interpolate_property(self, property,
        start, end, t,
        Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()
	pass
