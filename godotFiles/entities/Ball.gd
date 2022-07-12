extends Area2D

signal despawn_ball
signal player_lose

var screensize
var direction
var speed
var x_axis_origin_offset
var rng
var shouldWait1Second


func _ready():
	init_sleep()
	init_random_number_generator()
	init_screensize()
	init_position()
	set_random_direction()
	init_speed()
	init_x_axis_origin_offset()
	
func init_sleep():
	shouldWait1Second = true

func _process(delta):
	if shouldWait1Second == true:
		return
		
	change_x_dir_if_off_screen()
	# ToDo: call queue_free
	if position.y < 0 :
		emit_signal("despawn_ball")
		queue_free()
		
	if position.y > screensize.y:
		emit_signal("player_lose")
		queue_free()
		
	position += direction.normalized() * delta * speed

func init_x_axis_origin_offset():
	var sprite_width = $Sprite.get_texture().get_width()
	x_axis_origin_offset = sprite_width / 2

func init_random_number_generator():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	
func init_screensize():
	screensize = get_viewport_rect().size
	
func init_position():
	var xPos = rng.randi_range(screensize.x / 2 - 8, screensize.x / 2 + 8)
	var yPos = 128
	position = Vector2(xPos, yPos)
	
func init_speed():
	speed = rand_range(250, 350)

func set_random_direction():
	var x_dir = rand_range(0.2, 0.8)
	var y_dir = 0
	y_dir = Vector2.DOWN.y
		
	var left_or_right = rng.randi_range(0, 1)
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

func change_horizontal_direction():
	direction.x *= -1

func change_y_direction():
	direction.y *= -1
	
func increase_speed():
	speed += 50

func _on_Ball_area_entered(area):
	if area.is_in_group("paddles"):
		change_y_direction()
		increase_speed()

func _on_Timer_timeout():
	shouldWait1Second = false
