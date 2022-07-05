extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var design = """
The player paddle spawns on the bottom of the screen

the player paddle can move left or right based on the:
	keyboard
	finger position
	
the player paddle is clamped to the screen


"""

var screensize
var touch_zone
var x_axis_origin_offset


func _ready():
	init_screensize()
	init_touch_zone()
	init_x_axis_origin_offset()

func _input(event):
	if event is InputEventScreenDrag:
		if event.position.y >= touch_zone:
			position.x = clamp(event.position.x, 0 + x_axis_origin_offset, screensize.x - x_axis_origin_offset )
			
func init_screensize():
	screensize = get_viewport_rect().size

func init_touch_zone():
	touch_zone = 500
	
func init_x_axis_origin_offset():
	var sprite_width = $Sprite.get_texture().get_width()
	x_axis_origin_offset = sprite_width / 2
