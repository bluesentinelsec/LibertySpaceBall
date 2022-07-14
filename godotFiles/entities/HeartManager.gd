extends Node2D


export (PackedScene) var HeartScene

var heart_starting_position
var number_of_hearts
var position_offset


func add_heart():
		
	var aHeart = HeartScene.instance()
	add_child(aHeart)
	aHeart.position = heart_starting_position + Vector2(24 * number_of_hearts, 0)
	number_of_hearts += 1
	
func remove_heart(theHeart):
	theHeart.queue_free()
	
	
func _ready():
	heart_starting_position = Vector2(32, 32)
	number_of_hearts = 0
	position_offset = Vector2(0, 0)


func _process(delta):
	pass
