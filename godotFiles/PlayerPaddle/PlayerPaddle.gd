extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screensize
var touch_zone

# Called when the node enters the scene tree for the first time.
func _ready():
	touch_zone = 400
	screensize = Vector2(360,640)

func _input(event):
	if event is InputEventScreenDrag:
		if event.position.y >= 500:
			position.x = clamp(event.position.x, 0, screensize.x )

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
