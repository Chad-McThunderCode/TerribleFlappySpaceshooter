extends Node2D

var seg = preload("res://segment.tscn")

var next_segment = null
var last_position
# Called when the node enters the scene tree for the first time.
func _ready():
	last_position = global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("in process", global_position)

func follow(pos):
	last_position = global_position
	global_position.y = pos.y
	#print("now I'm at ", global_position)
	if(next_segment):
		next_segment.follow(last_position)

func pseudoConstructor(pos, n, p):
	global_position = pos + Vector2(60, 0)
	print("I'm at ", pos)
	if(n > 0):
		next_segment = seg.instantiate()
		next_segment.pseudoConstructor(global_position, n-1, p)
		p.add_child(next_segment)
