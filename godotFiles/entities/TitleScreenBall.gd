extends Area2D

var screensize
var direction
var speed
var x_axis_origin_offset
var y_axis_origin_offset


func _ready():
	init_screensize()
	set_random_direction()
	init_speed()
	init_x_axis_origin_offset()
	init_y_axis_origin_offset()
		


func _process(delta):		
	change_x_dir_if_off_screen()
	change_y_dir_if_off_screen()
	position += direction.normalized() * delta * speed

func init_x_axis_origin_offset():
	var sprite_width = 32
	x_axis_origin_offset = sprite_width / 2
	
func init_y_axis_origin_offset():
	var sprite_height = 32
	y_axis_origin_offset = sprite_height / 2

	
func init_screensize():
	screensize = get_viewport_rect().size
	
func init_speed():
	speed = 250

func set_random_direction():
	var x_dir = rand_range(0.2, 0.8)
	var y_dir = 0
	y_dir = Vector2.DOWN.y
		
	var left_or_right = rand_range(0, 1)
	if left_or_right == 0:
		x_dir *= Vector2.LEFT.x
	else:
		x_dir *= Vector2.RIGHT.x

	direction = Vector2(x_dir, y_dir)
	
func change_x_dir_if_off_screen():
	if position.x - x_axis_origin_offset <= 0:
		change_horizontal_direction()
	if position.x + x_axis_origin_offset >= screensize.x:
		change_horizontal_direction()
		
func change_y_dir_if_off_screen():
	if position.y - y_axis_origin_offset <= 0:
		change_y_direction()
	if position.y + y_axis_origin_offset >= screensize.y:
		change_y_direction()

func change_horizontal_direction():
	direction.x *= -1

func change_y_direction():
	direction.y *= -1
