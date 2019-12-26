extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Dog_got_gift(gift):
	var main = get_node("/root/Main")
	main.score = main.score + gift.value;
	text = "%d" % main.score
	pass # Replace with function body.
