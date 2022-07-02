extends Area2D

var velocity = Vector2.DOWN
var speed = 300
var screensize = Vector2()
var deltatime

func _ready():
	velocity += Vector2.LEFT
	screensize = get_viewport_rect().size
	
func _process(delta):
	set_delta_time(delta)
	change_x_dir_if_off_screen()
	update_position()

func change_x_dir_if_off_screen():
	if position.x < 0:
		change_horizontal_direction()
	if position.x > screensize.x:
		change_horizontal_direction()

func change_horizontal_direction():
	velocity.x *= -1
	
func change_y_direction():
	velocity.y *= -1



func _on_Ball_area_entered(area):
	print("Collision DETECTED")
	if area.is_in_group("paddles"):
		change_y_direction()

func set_delta_time(delta):
	deltatime = delta

func update_position():
	position += velocity.normalized() * deltatime * speed
