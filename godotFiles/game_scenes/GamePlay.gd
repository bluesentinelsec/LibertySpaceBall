extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var design = """
on game start:
	create ball
	
if player scores:
	increment number of balls in play
	restart match
	
if opponent scores:
	decrement life
	restart match

if restart match:
	reset player and opponent positions
	while number of balls created < balls in play
		create ball
	
if player lives equals 0
	go to end screen
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
