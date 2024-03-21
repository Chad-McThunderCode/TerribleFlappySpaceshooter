extends Node2D

var seg = preload("res://segment.tscn")
var direction = Vector2(0, 1)
var segment
# Called when the node enters the scene tree for the first time.
func _ready():
	if(randf() < 0.5):
		direction.y *= -1
	print(seg)
	segment = seg.instantiate()
	segment.pseudoConstructor(global_position, 10, get_parent())
	get_parent().add_child(segment)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(2*randf()<delta):
		direction.y *= -1
	var before=global_position
	global_position+=300*direction*delta
	if(global_position.y < 0 or global_position.y > 600):
		global_position.y = 0
		direction.y *= -1
		global_position = before
	segment.follow(global_position)
