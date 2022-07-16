extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(3), "timeout")

func _input(event):
	if event is InputEventScreenTouch && event.is_pressed():
		get_tree().change_scene("res://game_scenes/TitleScreen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
