extends Area2D


var ball_position
var speed
var velocity
var screensize


func set_speed(the_speed):
	speed = the_speed

func init_screensize():
	screensize = get_viewport_rect().size

func set_ball_position(the_position):
	ball_position = the_position
	
func get_default_ball_position():
	var default_position = Vector2(screensize.x / 2, screensize.y / 2)
	return default_position

func _ready():
	set_speed(150)
	init_screensize()
	set_ball_position(get_default_ball_position())


func _process(delta):
	velocity = Vector2()
	
	if ball_position.x < position.x:
		velocity = Vector2.LEFT
		
	if ball_position.x > position.x:
		velocity = Vector2.RIGHT
		
	position += velocity * speed * delta
