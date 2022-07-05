extends Area2D


var ball_position
var speed
var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2()
	# ball_position = get_parent().get_node("Ball").position
	ball_position = Vector2(100, 100)
	
	if ball_position.x < position.x:
		velocity = Vector2.LEFT
		
	if ball_position.x > position.x:
		velocity = Vector2.RIGHT
		
	position += velocity * speed * delta
