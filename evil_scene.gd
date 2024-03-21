extends Node2D

var shot=preload("res://shot_scene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(2*randf() < delta):
		var pew = shot.instantiate()
		pew.rotation = PI
		
