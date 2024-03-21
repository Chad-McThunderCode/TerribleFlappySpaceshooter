extends Node2D

var press_multiplier = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	print("loaded in:", self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	press_multiplier-=5*delta
	if(press_multiplier < 1):
		press_multiplier = 1
	elif(press_multiplier > 5):
		press_multiplier = 5
	if(rotation < 0.5*PI):
		rotation+=0.4*PI*delta
	if(Input.is_action_just_released("ui_up") and rotation > -0.3*PI):
		rotation-=8*PI*delta*press_multiplier
		if(rotation < -0.3*PI):
			rotation = -0.3*PI
		press_multiplier+=50*delta
	#print("delta:", delta)
	print(press_multiplier)
	if(randf() < delta):
		print("PEW")
