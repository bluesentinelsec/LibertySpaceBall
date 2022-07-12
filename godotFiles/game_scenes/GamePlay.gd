extends Node2D

var screensize
var ball_position

func init_screensize():
	screensize = get_viewport_rect().size
	
func get_first_ball_position():
	var children_in_scene = $BallManager.get_children()
	for each_child in children_in_scene:
		if each_child.is_in_group("balls"):
			ball_position = each_child.position
			return

func _on_player_lose():
	print("decrement heart")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_screensize()
	ball_position = Vector2(screensize.x / 2, screensize.y / 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_first_ball_position()
	$OpponentPaddle.set_ball_position(ball_position)
