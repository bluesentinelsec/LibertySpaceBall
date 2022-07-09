extends Node2D


export (PackedScene) var Ball
var starting_ball_count
var ball_count
var ball_position

func spawn_balls(number):
	for i in range(number):
		var aBall = Ball.instance()
		aBall.connect("despawn_ball", self, "_on_despawn_ball")
		aBall.connect("player_lose", self, "_on_player_lose")
		add_child(aBall)
		yield(get_tree().create_timer(0.5), "timeout")


func _on_despawn_ball():
	ball_count -= 1
	
func _on_player_lose():
	print("decrement life")
	ball_count -= 1

	
# Called when the node enters the scene tree for the first time.
func _ready():
	starting_ball_count = 1
	ball_count = 1
	spawn_balls(ball_count)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ball_count <= 0:
		starting_ball_count += 1
		ball_count = starting_ball_count
		spawn_balls(starting_ball_count)
