extends Node2D

var screensize
var ball_position
var starting_hearts
var hearts_in_play
var should_delete_heart

func init_screensize():
	screensize = get_viewport_rect().size
	
func get_first_ball_position():
	var children_in_scene = $BallManager.get_children()
	for each_child in children_in_scene:
		if each_child.is_in_group("balls"):
			ball_position = each_child.position
			return

	
func init_hearts():
	starting_hearts = 5
	hearts_in_play = starting_hearts
	for i in range(starting_hearts):
		$HeartManager.add_heart()
	

func _ready():
	$"/root/ScoreModel".reset_score()
	should_delete_heart = false
	init_screensize()
	init_hearts()
	ball_position = Vector2(screensize.x / 2, screensize.y / 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if should_delete_heart:
		$damage.play()
		delete_last_heart()
		
	get_first_ball_position()
	$OpponentPaddle.set_ball_position(ball_position)
	check_end_game()

func check_end_game():
	if hearts_in_play <= 0:
		get_tree().change_scene("res://game_scenes/EndScreen.tscn")

func _on_BallManager_alert_level_player_lose():
	should_delete_heart = true
	

func _on_alert_player_scored():
	$"/root/ScoreModel".set_score(1)
	print("player score: ", $"/root/ScoreModel".get_score())
		
func delete_last_heart():
	var hearts = get_tree().get_nodes_in_group("hearts")
	var last_heart = len(hearts) - 1
	var counter = 0
	for eachHeart in hearts:
		if counter == last_heart:
			eachHeart.queue_free()
			hearts_in_play -= 1
			should_delete_heart = false
		counter += 1


func _on_BallManager_update_score_ui():
	var score = $"/root/ScoreModel".get_score()
	var label = "Score: " + str(score)
	$ScoreLabel.text = label
