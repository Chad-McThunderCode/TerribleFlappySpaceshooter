extends AnimatedSprite2D

var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = Vector2(randf()*1200, randf()*900)
	remix()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x -= 30*delta*speed
	if(global_position.x < -100):
		global_position = Vector2(1300, randf()*900)
		remix()
		
func remix():
	speed=randf()*4+1
	if(randf()<0.95):
		if(randf() < 0.1):
			frame = 0
		else:
			frame = 1
	else:
		if(randf() < 0.8):
			if(randf() < 0.5):
				frame = 2
			else:
				frame = 3
		else:
			frame = 4
