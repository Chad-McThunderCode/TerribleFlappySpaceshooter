extends Node2D

var seg = preload("res://segment.tscn")

var isded = false
var next_segment = null
var last_segment = null
var last_position
# Called when the node enters the scene tree for the first time.
func _ready():
	last_position = global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(isded):
		last_segment.next_segment = next_segment
		if(next_segment):
			next_segment.last_segment = last_segment
		global_position = Vector2(2000, 0)
		#queue_free()

func follow(pos):
	last_position = global_position
	global_position.y = lerpf(pos.y, global_position.y, 0.8)
	global_position.x = pos.x+30
	#print("now I'm at ", global_position)
	if(next_segment):
		next_segment.follow(last_position)

func pseudoConstructor(pos, n, p, l):
	p.addSegment(self)
	last_segment = l
	global_position = pos + Vector2(30, 0)
	#print("I'm at ", pos)
	if(n > 0):
		next_segment = seg.instantiate()
		next_segment.pseudoConstructor(global_position, n-1, p, self)


func _on_area_2d_area_entered(area):
	isded = true
