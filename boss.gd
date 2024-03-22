extends Node2D

var seg = preload("res://segment.tscn")
var shot=preload("res://shot_scene.tscn")
var direction = Vector2(0, 1)
var next_segment
var segments = []
var debugBS = true
# Called when the node enters the scene tree for the first time.
func _ready():
	print("BOSS READY with parent", get_parent(), "at pos", global_position)
	if(randf() < 0.5):
		direction.y *= -1
	#print(seg)
	next_segment = seg.instantiate()
	next_segment.pseudoConstructor(global_position, 15, self, self)
	#print(segments)


func addSegment(s):
	segments.append(s)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(debugBS):
		debugBS=false
		for i in segments:
			get_parent().add_child(i)
	if(2*randf()<delta):
		direction.y *= -1
	var before=global_position
	global_position+=300*direction*delta
	if(global_position.y < 0 or global_position.y > 600):
		global_position.y = 0
		direction.y *= -1
		global_position = before
	if(global_position.x > 700):
		global_position.x -= 250*delta
	if(next_segment):
		next_segment.follow(global_position)
	else:
		get_parent().get_node("ship").get_node("Sprite2D").frame = 1
		var file = FileAccess.open("user://easter.dat", FileAccess.WRITE)
		file.store_string("yau")
		OS.delay_msec(1500)
		get_tree().reload_current_scene()
	if(1.5*randf() < delta):
		var pew = shot.instantiate()
		pew.rotation = PI
		pew.global_position = global_position-Vector2(120, 0)
		get_parent().add_child(pew)
