extends Area2D

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
