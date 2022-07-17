extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Player_Score


# Called when the node enters the scene tree for the first time.
func _ready():
	Player_Score = 0


func get_score():
	return Player_Score
	
func set_score(score):
	Player_Score += 1
	
func reset_score():
	Player_Score = 0
