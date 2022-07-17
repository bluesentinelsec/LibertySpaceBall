extends Node2D

signal alert_level_player_lose
signal update_score_ui

export (PackedScene) var Ball
var starting_ball_count
var ball_count
var ball_position

func spawn_balls(number):
	var delay = 0.5
	var cycle_color = 0
	for i in range(number):
		var aBall = Ball.instance()
		aBall.connect("despawn_ball", self, "_on_despawn_ball")
		aBall.connect("player_lose", self, "_on_player_lose")
		aBall.connect("player_scored", self, "_on_player_scored")
		add_child(aBall)
		aBall.change_color(cycle_color)
		yield(get_tree().create_timer(delay), "timeout")
		
		delay = rand_range(0.5, 1.5)

		if cycle_color >= 3:
			cycle_color = 0
		else:
			cycle_color += 1


func _on_despawn_ball():
	ball_count -= 1
	
func _on_player_lose():
	ball_count -= 1
	emit_signal("alert_level_player_lose")
	
func _on_player_scored():
	$"/root/ScoreModel".set_score(1)
	emit_signal("update_score_ui")

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
