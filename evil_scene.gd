extends Node2D

var shot=preload("res://shot_scene.tscn")
var direction=Vector2(0, 1)
var deaths=0

# Called when the node enters the scene tree for the first time.
func _ready():
	if(randf() < 0.5):
		direction.y*=-1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var before=global_position
	global_position+=200*direction*delta
	if(global_position.y < 0 or global_position.y > 600):
		global_position.y = 0
		direction.y *= -1
		global_position = before
	if(global_position.x > 1000):
		global_position.x -= 250*delta
	if(1.5*randf() < delta):
		var pew = shot.instantiate()
		pew.rotation = PI
		pew.global_position = global_position-Vector2(120, 0)
		get_parent().add_child(pew)
		


func _on_area_2d_area_entered(area):
	global_position = Vector2(1500, randf()*600)
	deaths+=1
	if(deaths > 9):
		print("SPAWNING BOSS")
		queue_free()
