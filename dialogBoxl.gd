# dialoGbox.gd
extends RichTextLabel

var dialog = [
	"Where's my bone?",
	"Oh, there it is!"
]
var page = 0;

var showText;
onready var bone = preload("res://Bone.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	showText = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventKey and event.scancode == KEY_SPACE:
		if showText:
			if visible_characters > get_total_character_count():
				if page == 0 and page < dialog.size()-1:
					page += 1
					bbcode_text = dialog[page]
					visible_characters = 0
					var b = bone.instance()
					b.position.x = 16
					b.position.y = 32
					get_tree().get_root().add_child(b)
					
		else:
			showText = !showText
			bbcode_text = dialog[page]
			visible_characters = 0

func _on_Timer_timeout():
	visible_characters = visible_characters+1;
